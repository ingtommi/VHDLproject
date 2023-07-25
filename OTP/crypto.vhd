--OTP cipher implementation

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
 
entity crypto is
generic(
    d_width      :  integer := 8                                --data bus width
  );
port(
    clk          :  in   std_logic;                             --system clock
    msg_in       :  in   std_logic_vector(d_width-1 downto 0);  --received msg
    key          :  in   std_logic_vector(d_width-1 downto 0);  --received key
    msg_out      :  out  std_logic_vector(d_width-1 downto 0);  --msg to transmit
    enable       :  in   std_logic;                             --enable
    crypto_ready :  out  std_logic := '0';                      --crypto ready flag 
    crypto_done  :  out  std_logic := '0';                      --crypto done flag
    rx_done      :  in   std_logic := '0'                       --rx done flag
  );
end crypto;
 
architecture Behavioral of crypto is
begin    
    process(clk)
    begin
      if rising_edge(clk) then
        if(rx_done = '1') then                               --data received
          crypto_ready <= '1';                               --assert ready flag
          if(enable = '1') then                              --check enable
            crypto_ready <= '0';
            msg_out <= msg_in xor key;                         --assign data
            crypto_done <= '1';                                --assert crypto_done flag
          end if;
        end if;
      end if;
   end process;
end Behavioral;