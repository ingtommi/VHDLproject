--code inspired by https://forum.digikey.com/t/uart-vhdl/12670

library ieee;
use ieee.std_logic_1164.all;

entity uart is
  generic(
    clk_freq  :  integer    := 100_000_000;  --frequency of system clock in hertz
    baud_rate :  integer    := 115_200;      --data link baud rate in bits/second
    os_rate   :  integer    := 16;           --oversampling rate to find center of receive bits (in samples per baud period)
    d_width   :  integer    := 8             --data bus width
  );  
  port(
    clk         :  in   std_logic;                             --system clock
    rx          :  in   std_logic;                             --receive pin
    rx_data     :  out  std_logic_vector(d_width-1 downto 0);  --received msg
    rx_key      :  out  std_logic_vector(d_width-1 downto 0);  --received key
    tx          :  out  std_logic;                             --transmit pin
    tx_data     :  in   std_logic_vector(d_width-1 downto 0);  --msg to transmit
    rx_done     :  out  std_logic := '0';                      --receive done flag
    tx_ena      :  in   std_logic := '0'                       --tx enable flag
  );  
end uart;
    
architecture behavioral of uart is
  type rx_machine is (idle, receive);                                             --receive state machine data type
  type tx_machine is (idle, transmit);                                            --tranmit state machine data type
  signal rx_state     :  rx_machine := idle;                                      --receive state machine
  signal tx_state     :  tx_machine := idle;                                      --transmit state machine
  signal rx_buffer    :  std_logic_vector(d_width downto 0) := (others => '0');   --receiving buffer
  signal tx_buffer    :  std_logic_vector(d_width+1 downto 0) := (others => '1'); --transmission buffer
  signal baud_pulse   :  std_logic := '0';                                        --periodic pulse that occurs at the baud rate
  signal os_pulse     :  std_logic := '0';                                        --periodic pulse that occurs at the oversampling rate

begin
  --generate clock enable pulses at the baud rate and the oversampling rate
  process(clk)
    variable count_baud :  integer range 0 to clk_freq/baud_rate-1 := 0;         --counter to determine baud rate period
    variable count_os   :  integer range 0 to clk_freq/baud_rate/os_rate-1 := 0; --counter to determine oversampling period
  begin
    if rising_edge(clk) then
      --create baud enable pulse
      if(count_baud < clk_freq/baud_rate-1) then        --baud period not reached
        count_baud := count_baud + 1;                     --increment baud period counter
        baud_pulse <= '0';                                --deassert baud rate pulse
      else                                              --baud period reached
        count_baud := 0;                                  --reset baud period counter
        baud_pulse <= '1';                                --assert baud rate pulse
        count_os := 0;                                    --reset oversampling period counter to avoid cumulative error
      end if;
      --create oversampling enable pulse
      if(count_os < clk_freq/baud_rate/os_rate-1) then  --oversampling period not reached
        count_os := count_os + 1;                         --increment oversampling period counter
        os_pulse <= '0';                                  --deassert oversampling rate pulse    
      else                                              --oversampling period reached
        count_os := 0;                                    --reset oversampling period counter
        os_pulse <= '1';                                  --assert oversampling pulse
      end if;
    end if;
  end process;

  --receive state machine
  process(clk)
    variable rx_count  : integer range 0 to d_width+2 := 0; --count the bits received
    variable os_count  : integer range 0 to os_rate-1 := 0; --count the oversampling rate pulses
    variable msg_count : integer                      := 0; --count received messages
  begin
    if(rising_edge(clk)) then                                  
      if(os_pulse = '1') then
        case rx_state is
          when idle =>                                       --idle state 
            if(rx = '0') then                                  --start bit might be present
              if(os_count < os_rate/2) then                      --oversampling pulse counter is not at start bit center
                os_count := os_count + 1;                          --increment oversampling pulse counter
                rx_state <= idle;                                  --remain in idle state
              else                                               --oversampling pulse counter is at bit center
                os_count := 0;                                     --clear oversampling pulse counter
                rx_count := 0;                                     --clear the bits received counter
                rx_done <= '0';                                    --clear done flag
                rx_buffer <= rx & rx_buffer(d_width downto 1);     --shift the start bit into receive buffer							
                rx_state <= receive;                               --advance to receive state
              end if;
            else                                               --start bit not present
              os_count := 0;                                     --clear oversampling pulse counter
              rx_state <= idle;                                  --remain in idle state
            end if;
          when receive =>                                    --receive state
            if(os_count < os_rate-1) then                      --not center of bit
              os_count := os_count + 1;                          --increment oversampling pulse counter
              rx_state <= receive;                               --remain in receive state
            elsif(rx_count < d_width) then                     --center of bit and not all bits received
              os_count := 0;                                     --reset oversampling pulse counter    
              rx_count := rx_count + 1;                          --increment number of bits received counter
              rx_buffer <= rx & rx_buffer(d_width downto 1);     --shift new received bit into receive buffer
              rx_state <= receive;                               --remain in receive state
            else                                               --center of stop bit
	          if(msg_count = 0) then
	            rx_key <= rx_buffer(d_width downto 1);            --assign key
	            msg_count := msg_count + 1;                       --increment msg count
	            rx_state <= idle;                                 --return to idle state
	          else
	            rx_data <= rx_buffer(d_width downto 1);            --assign data
	            msg_count := 0;                                    --clear msg count
	            rx_done <= '1';                                    --assert done flag
                rx_state <= idle;                                  --return to idle state
              end if;
            end if;
        end case;
      end if;
    end if;
  end process;
  
  --transmit state machine
  process(clk)
    variable tx_count :  integer range 0 to d_width+3 := 0;       --count bits transmitted
  begin
    if rising_edge(clk) then
      case tx_state is
        when idle =>                                              --idle state
          if(tx_ena = '1') then                                     --tx is enabled
            tx_buffer(d_width+1 downto 0) <=  tx_data & '0' & '1';    --latch in data for transmission and start/stop bits
            tx_count := 0;                                            --clear transmit bit count
            tx_state <= transmit;                                     --proceed to transmit state
          else
            tx_state <= idle;                                       --tx is not enabled
          end if;
        when transmit =>                                          --transmit state
          if(baud_pulse = '1') then                                 --beginning of bit
            tx_count := tx_count + 1;                                 --increment transmit bit counter
            tx_buffer <= '1' & tx_buffer(d_width+1 downto 1);         --shift transmit buffer to output next bit
          end if;
          if(tx_count < d_width+3) then                             --not all bits transmitted
            tx_state <= transmit;                                     --remain in transmit state
          else                                                      --all bits transmitted
            tx_state <= idle;                                         --return to idle state
          end if;
      end case;
      tx <= tx_buffer(0);                                         --output last bit in transmit transaction buffer
    end if;
  end process;
end behavioral;