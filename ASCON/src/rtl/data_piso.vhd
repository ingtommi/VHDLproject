--------------------------------------------------------------------------------
--! @file       DATA_PISO.vhd
--! @brief      Width converter for NIST LWC API
--!
--! @author     Michael Tempelmeier
--! @copyright  Copyright (c) 2019 Chair of Security in Information Technology     
--!             ECE Department, Technical University of Munich, GERMANY

--! @license    This project is released under the GNU Public License.          
--!             The license and distribution terms for this file may be         
--!             found in the file LICENSE in this distribution or at            
--!             http://www.gnu.org/licenses/gpl-3.0.txt                         
--! @note       This is publicly available encryption source code that falls    
--!             under the License Exception TSU (Technology and software-       
--!             unrestricted)                                                  
--------------------------------------------------------------------------------
--! Description
--! 
--! TODO: Optimize t_state => t_state_16 and t_state_8
--! TODO: Change mux type => std_logic_vector => integer range 1 to 4, range 1 to 2
--! 
--! 
--! 
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.LWC_config_ccw.all;
use work.design_pkg.all;
use work.NIST_LWAPI_pkg.all;

entity DATA_PISO is
    port(
        clk           : in  std_logic;
        rst           : in  std_logic;
        data_size_p   : in  STD_LOGIC_VECTOR(2 downto 0);
        data_size_s   : out STD_LOGIC_VECTOR(2 downto 0);
        data_s        : out STD_LOGIC_VECTOR(PDI_SHARES * CCW - 1 downto 0);
        data_valid_s  : out STD_LOGIC;
        data_ready_s  : in  STD_LOGIC;
        data_p        : in  STD_LOGIC_VECTOR(PDI_SHARES * W - 1 downto 0);
        data_valid_p  : in  STD_LOGIC;
        data_ready_p  : out STD_LOGIC;
        valid_bytes_p : in  STD_LOGIC_VECTOR(W / 8 - 1 downto 0);
        valid_bytes_s : out STD_LOGIC_VECTOR(CCW / 8 - 1 downto 0);
        pad_loc_p     : in  STD_LOGIC_VECTOR(W / 8 - 1 downto 0);
        pad_loc_s     : out STD_LOGIC_VECTOR(CCW / 8 - 1 downto 0);
        eoi_p         : in  std_logic;
        eoi_s         : out std_logic;
        eot_p         : in  std_logic;
        eot_s         : out std_logic
    );

end entity DATA_PISO;

architecture behavioral of DATA_PISO is

    type t_state is (LD_1, LD_2, LD_3, LD_4);
    signal nx_state, state : t_state;
    signal mux             : STD_LOGIC_VECTOR(3 - 1 downto 0);
    signal last            : std_logic;

begin

    assert (CCW = 8) OR (CCW = 16) or (CCW = 32) report "This module only supports CCW={8,16,32}!" severity failure;

    GEN_NONTRIVIAL : if CCW /= W generate
        GEN_proc_SYNC_RST : if (not ASYNC_RSTN) generate
            process(clk)
            begin
                if rising_edge(clk) then
                    if (rst = '1') then
                        state <= LD_1;
                    else
                        state <= nx_state;
                    end if;
                end if;
            end process;
        end generate GEN_proc_SYNC_RST;
        GEN_proc_ASYNC_RSTN : if (ASYNC_RSTN) generate
            process(clk, rst)
            begin
                if (rst = '0') then
                    state <= LD_1;
                elsif rising_edge(clk) then
                    state <= nx_state;
                end if;
            end process;
        end generate GEN_proc_ASYNC_RSTN;

        CCW8 : if CCW = 8 generate

            process(state, data_valid_p, data_ready_s, mux, data_size_p)
            begin
                case state is
                    when LD_1 =>
                        mux <= "001";
                        if (data_ready_s = '1' and data_valid_p = '1') then
                            if data_size_p = mux or data_size_p = "000" then --last word
                                nx_state <= LD_1;
                            else
                                nx_state <= LD_2;
                            end if;
                        else
                            nx_state <= LD_1;
                        end if;

                    when LD_2 =>
                        mux <= "010";
                        if (data_ready_s = '1' and data_valid_p = '1') then
                            if data_size_p = mux then --last word
                                nx_state <= LD_1;
                            else
                                nx_state <= LD_3;
                            end if;
                        else
                            nx_state <= LD_2;
                        end if;

                    when LD_3 =>
                        mux <= "011";
                        if (data_ready_s = '1' and data_valid_p = '1') then
                            if data_size_p = mux then --last word
                                nx_state <= LD_1;
                            else
                                nx_state <= LD_4;
                            end if;
                        else
                            nx_state <= LD_3;
                        end if;

                    when LD_4 =>
                        mux <= "100";
                        if (data_ready_s = '1' and data_valid_p = '1') then
                            if data_size_p = mux then --last word
                                nx_state <= LD_1;
                            else
                                nx_state <= LD_1; --doesn't make a difference
                            end if;
                        else
                            nx_state <= LD_4;
                        end if;

                end case;
            end process;

            -- controll signals are not set in the FSM to avoid circular dependency
            -- data_valid_* should not depend on data_ready_* and vice versa

            last <= '1' when (data_size_p = mux) else '0';

            data_valid_s <= data_valid_p;
            data_ready_p <= data_ready_s when (last = '1' or data_size_p = "000") else '0'; -- if last word or empty word

            data_s <= data_p(31 downto 24) when (mux = "001") else
                      data_p(23 downto 16) when (mux = "010") else
                      data_p(15 downto 8) when (mux = "011") else
                      data_p(7 downto 0);

            valid_bytes_s(0) <= valid_bytes_p(3) when (mux = "001") else -- Can this be reduced to a static one?
                                valid_bytes_p(2) when (mux = "010") else -- We either have a valid byte, or not.
                                valid_bytes_p(1) when (mux = "011") else -- No, for data_size_p valid_bytes = "000"
                                valid_bytes_p(0); -- owever, that is the only case

            pad_loc_s(0) <= pad_loc_p(3) when (mux = "001") else -- Can this be reduced to a static zero?
                            pad_loc_p(2) when (mux = "010") else -- Padding always starts after the last 
                            pad_loc_p(1) when (mux = "011") else -- byte, but only have one byte
                            pad_loc_p(0);

            data_size_s <= "000" when data_size_p = "000" else
                           "001";       --8 bits, bdi_size is always 1 

            eoi_s <= eoi_p AND last;
            eot_s <= eot_p AND last;

        end generate CCW8;

        CCW16 : if CCW = 16 generate

            process(state, data_valid_p, data_ready_s, data_size_p)
            begin
                case state is
                    when LD_1 =>
                        mux <= "001";
                        if (data_ready_s = '1' and data_valid_p = '1') then
                            if (data_size_p = "001" or data_size_p = "010" or data_size_p = "000") then --last word
                                nx_state <= LD_1;
                            else
                                nx_state <= LD_2;
                            end if;
                        else
                            nx_state <= LD_1;
                        end if;

                    when LD_2 =>
                        mux <= "010";
                        if (data_ready_s = '1' and data_valid_p = '1') then
                            if (data_size_p = "011" or data_size_p = "100") then --last word
                                nx_state <= LD_1;
                            else
                                nx_state <= LD_1;
                            end if;
                        else
                            nx_state <= LD_2;
                        end if;

                    when others =>
                        nx_state <= state;
                        mux      <= "---";
                        report "FSM error!" severity failure;

                end case;
            end process;

            -- controll signals are not set in the FSM to avoid circular dependency
            -- data_valid_* should not depend on data_ready_* and vice versa

            last <= '1' when ((data_size_p = "001" or data_size_p = "010") and state = LD_1) OR ((data_size_p = "011" or data_size_p = "100") and state = LD_2) else
                    '0';

            data_ready_p <= data_ready_s when last = '1' or data_size_p = "000" else '0'; -- if last word, or empty word

            data_valid_s <= data_valid_p;

            data_s <= data_p(31 downto 16) when (mux = "001") else
                      data_p(15 downto 0);

            valid_bytes_s <= valid_bytes_p(3 downto 2) when (mux = "001") else valid_bytes_p(1 downto 0);
            pad_loc_s     <= pad_loc_p(3 downto 2) when (mux = "001") else pad_loc_p(1 downto 0);

            eoi_s       <= eoi_p AND last;
            eot_s       <= eot_p AND last;
            data_size_s <= "000" when data_size_p = "000" else
                           "001" when (data_size_p = "001" or (data_size_p = "011" and last = '1')) else
                           "010";

        end generate CCW16;
    end generate GEN_NONTRIVIAL;

    GEN_TRIVIAL : if CCW = W generate
        data_s        <= data_p;
        data_valid_s  <= data_valid_p;
        data_ready_p  <= data_ready_s;
        valid_bytes_s <= valid_bytes_p;
        pad_loc_s     <= pad_loc_p;
        eoi_s         <= eoi_p;
        eot_s         <= eot_p;
        data_size_s   <= data_size_p;
    end generate GEN_TRIVIAL;

end behavioral;
