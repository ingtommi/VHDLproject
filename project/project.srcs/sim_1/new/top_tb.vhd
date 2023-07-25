library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb is
end top_tb;

architecture Behavioral of top_tb is 

  constant clk_freq    :  integer    := 100_000_000; 
  constant baud_rate   :  integer    := 115_200;  
  constant os_rate     :  integer    := 16;       
  constant d_width     :  integer    := 8;
  constant clock       :  time := 10ns;      --clock = 1/clk_freq = 1/100MHz
  constant bit_period  :  time := 8.681us;   --bit_period = 1/baud_rate = 1/152000      

  signal clk           :   std_logic;                                        
  signal rx            :   std_logic := '1';
  signal tx            :   std_logic := '1';
  signal rx_data       :   std_logic_vector(d_width-1 downto 0);
  signal rx_key        :   std_logic_vector(d_width-1 downto 0);
  signal tx_data       :   std_logic_vector(d_width-1 downto 0);
  signal rx_done       :   std_logic := '0';
  signal tx_ena        :   std_logic := '0';
  
  signal msg_in        :   std_logic_vector(d_width-1 downto 0);
  signal key           :   std_logic_vector(d_width-1 downto 0);
  signal msg_out       :   std_logic_vector(d_width-1 downto 0);
  signal enable        :   std_logic := '0';
  signal crypto_ready  :   std_logic;
  signal crypto_done   :   std_logic;
  
begin
  uut1: entity work.uart
    generic map(
      clk_freq => clk_freq,
      baud_rate => baud_rate,
      os_rate => os_rate,
      d_width => d_width
    )
    port map(
      clk => clk,
      rx => rx,
      tx => tx,
      rx_data => rx_data,
      rx_key => rx_key,
      tx_data => tx_data,
      rx_done => rx_done,
      tx_ena => tx_ena
    );
    
   uut2: entity work.crypto
     generic map(
       d_width => d_width
     )
     port map(
      clk => clk,
      msg_in => msg_in,
      key => key,
      msg_out => msg_out,
      enable => enable,
      crypto_ready => crypto_ready,
      crypto_done => crypto_done,
      rx_done => rx_done
    );
       
   clock_process : process
    begin
        clk <= '0';
        wait for clock/2;
        clk <= '1';
        wait for clock/2;
    end process;
    
    stimulus_process: process
    begin
      wait for 10us;
      --KEY
      --start bit
      rx <= '0'; 
      wait for bit_period;
      --1st bit
      rx <= '1';
      wait for bit_period;
      --2nd data bit
      rx <= '1';
      wait for bit_period;
      --3rd data bit
      rx <= '1';
      wait for bit_period;
      --4th data bit
      rx <= '1';
      wait for bit_period;
      --5th data bit
      rx <= '1';
      wait for bit_period;
      --6th data bit
      rx <= '1';
      wait for bit_period;
      --7th data bit
      rx <= '1';
      wait for bit_period;
      --8th data bit
      rx <= '1';
      wait for bit_period;
      --stop bit
      rx <= '1'; 
      wait for 10us;
      key <= rx_key;
      wait for 10us;
      ---MSG
      --start bit
      rx <= '0'; 
      wait for bit_period;
      --1st bit
      rx <= '1';
      wait for bit_period;
      --2nd data bit
      rx <= '0';
      wait for bit_period;
      --3rd data bit
      rx <= '1';
      wait for bit_period;
      --4th data bit
      rx <= '0';
      wait for bit_period;
      --5th data bit
      rx <= '1';
      wait for bit_period;
      --6th data bit
      rx <= '0';
      wait for bit_period;
      --7th data bit
      rx <= '1';
      wait for bit_period;
      --8th data bit
      rx <= '0';
      wait for bit_period;
      --stop bit
      rx <= '1'; 
      wait for 10us;
      msg_in <= rx_data;
      wait for 10us;
      --start operation
      enable <= '1';
      wait for 10us;
      --prepare data
      tx_data <= msg_out;
      wait for 10us;
      --start transmission
      tx_ena <= '1';
      wait for 10us;
      tx_ena <= '0';
      wait;
    end process;
end Behavioral;