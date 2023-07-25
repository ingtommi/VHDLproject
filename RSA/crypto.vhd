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
    msg_in       :  in   std_logic_vector(d_width-1 downto 0);  --received data
    msg_out      :  out  std_logic_vector(d_width-1 downto 0);  --data to transmit
    encrypt      :  in   std_logic;                             --enter enc mode
    decrypt      :  in   std_logic;                             --enter dec mode 
    crypto_ready :  out  std_logic := '0';                      --crypto ready flag 
    crypto_done  :  out  std_logic := '0';                      --crypto done flag
    rx_done      :  in   std_logic := '0'                       --rx done flag
  );
end crypto;
 
architecture Behavioral of crypto is
    signal n            : unsigned(d_width-1 downto 0) := "10111011";  --187
    signal e            : unsigned(d_width-1 downto 0) := "00001101";  --13
    signal d            : unsigned(d_width-1 downto 0) := "00100101";  --37
    signal esp          : unsigned(d_width-1 downto 0);                --e or d
    signal enable       : std_logic := '0'; 
    signal counter_for  : integer := 0;
    signal counter_if   : integer := 0;        
 
begin    
    process(clk)
	variable temp : unsigned(d_width-1 downto 0) := "00000001"; --1
	variable counter_for_var  : integer := 0;
    variable counter_if_var   : integer := 0;
    variable done             : std_logic := '0';
    begin
      if rising_edge(clk) then
        if(rx_done = '1') then                               --data received
          if(done = '0') then                                --check done
            crypto_ready <= '1';                               --assert ready flag
            --mode selection
            if(decrypt = '1' and encrypt = '0') then           --decrypt mode               
              crypto_ready <= '0';                               --clear ready flag
              esp <= d;                                          --assign esponent
              enable <= '1';                                     --assert enable
            elsif(decrypt = '0' and encrypt = '1') then        --encrypt mode
              crypto_ready <= '0';                               --clear ready flag
              esp <= e;                                          --assign esponent
              enable <= '1';                                     --assert enable
            else
              crypto_ready <= '1';
              enable <= '0';
            end if;
            ----------------
            if(enable = '1') then                              --check enable
              for i in 0 to d_width-1 loop                   
                counter_for_var := counter_for_var+1;
                temp := (temp*temp) mod n;                       --square
                if(esp(d_width-1-i) = '1') then                  --check condition
                  counter_if_var := counter_if_var+1;
                  temp := temp*unsigned(msg_in) mod n;             --multiply
                end if;
              end loop;
              msg_out <= std_logic_vector(temp);                 --assign data
              counter_for <= counter_for_var;
              counter_if <= counter_if_var;
              done := '1';                                       --assert done flag
              crypto_done <= '1';                                --assert crypto done flag
            end if;
          end if;
        end if;
      end if;
   end process;
end Behavioral;