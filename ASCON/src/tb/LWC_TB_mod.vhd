--===============================================================================================--
--! @file       LWC_TB_mod.vhd
--! @author     Tommaso Fava
--! @note       Simplified version of LWC_TB.vhd
--===============================================================================================--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.NIST_LWAPI_pkg.all;

entity LWC_TB IS
    generic(
        G_CLK_PERIOD_PS    : positive := 10_000; --! Simulation clock period in picoseconds
        G_FNAME_PDI        : string   := "C:\Users\Utente\Desktop\ascon\CODE\simplerKAT\pdi.txt";
        G_FNAME_SDI        : string   := "C:\Users\Utente\Desktop\ascon\CODE\simplerKAT\sdi.txt"; 
        G_FNAME_DO         : string   := "C:\Users\Utente\Desktop\ascon\CODE\simplerKAT\do.txt";
        G_FNAME_LOG        : string   := "log.txt"; --! Path to the generated log file
        G_FNAME_FAILED_TVS : string   := "failed_testvectors.txt"; --! Path to the generated log of failed testvector words
        G_FNAME_RESULT     : string   := "result.txt"; --! Path to the generated result file containing 0 or 1  -- REDUNDANT / NOT USED
        G_VERBOSE_LEVEL    : integer  := 0 --! Verbosity level
    );
end LWC_TB;

architecture TB of LWC_TB is
    --================================================== Constants ==================================================--
    constant clk_period  : TIME           := G_CLK_PERIOD_PS * ps;
    constant TB_HEAD     : string(1 to 6) := "# TB :";
    constant INS_HEAD    : string(1 to 6) := "INS = ";
    constant HDR_HEAD    : string(1 to 6) := "HDR = ";
    constant DAT_HEAD    : string(1 to 6) := "DAT = ";
    constant STT_HEAD    : string(1 to 6) := "STT = ";
    -- if placed anywhere in do.txt, subsequent testcases are skipped
    constant EOF_HEAD    : string(1 to 6) := "###EOF";

    --=================================================== Signals ===================================================--
    --! stop clock generation
    signal stop_clock          : boolean                             := False;
    --! initial reset of UUT is complete
    signal reset_done          : boolean                             := False;
    --=================================================== Wirings ===================================================--
    signal clk                 : std_logic                           := '0';
    signal rst                 : std_logic                           := '0';
    --! PDI
    signal pdi_data            : std_logic_vector(W - 1 downto 0)  := (others => '0');
    signal pdi_valid           : std_logic                           := '0';
    signal pdi_ready           : std_logic;
    --! SDI
    signal sdi_data            : std_logic_vector(SW - 1 downto 0) := (others => '0');
    signal sdi_valid           : std_logic                           := '0';
    signal sdi_ready           : std_logic;
    --! DO
    signal do_data             : std_logic_vector(W - 1 downto 0);
    signal do_valid            : std_logic;
    signal do_last             : std_logic;
    signal do_ready            : std_logic                           := '0';
    -- Counters
    signal pdi_operation_count : integer                             := 0;
    signal cycle_counter       : natural                             := 0;
    --================================================== I/O files ==================================================--
    -- cryptotvgen KAT files
    file pdi_file      : TEXT open READ_MODE is G_FNAME_PDI;
    file sdi_file      : TEXT open READ_MODE is G_FNAME_SDI;
    file do_file       : TEXT open READ_MODE is G_FNAME_DO;
    -- output files
    file log_file      : TEXT;
    file result_file   : TEXT open WRITE_MODE is G_FNAME_RESULT;
    file failures_file : TEXT open WRITE_MODE is G_FNAME_FAILED_TVS;

    --================================================== functions ==================================================--
    -- compare received word against expected word
    -- returns true if they match or if the unmatched bit was a don't-care
    function words_match(actual, expected : std_logic_vector) return boolean is
    begin
        for i in expected'range loop
            if actual(i) /= expected(i) and expected(i) /= 'X' and expected(i) /= '-' then
                return False;
            end if;
        end loop;
        return True;
    end function;
    
begin
    --===========================================================================================--
    -- generate clock
    Clock_PROCESS : process
    begin
        if not stop_clock then
            clk <= '1';
            wait for clk_period / 2;
            clk <= '0';
            wait for clk_period / 2;
        else
            wait;
        end if;
    end process;

    -- generate reset
    Reset_PROCESS : process
    begin
        if ASYNC_RSTN then
            rst <= '0';
            wait for 2 * clk_period;
            rst <= '1';
        else
            rst <= '1';
            wait for 2 * clk_period;
            rst <= '0';
        end if;
        wait until rising_edge(clk);
        wait for clk_period;            -- optional
        reset_done <= True;
        wait;
    end process;

    Cycle_Counter_PROCESS : process(clk)
    begin
        if reset_done and rising_edge(clk) then
            cycle_counter <= cycle_counter + 1;
        end if;
    end process;

    --===========================================================================================--
    -- LWC is instantiated as a component to enable mixed language simulation
    uut : LWC
        port map(
            clk       => clk,
            rst       => rst,
            pdi_data  => pdi_data,
            pdi_valid => pdi_valid,
            pdi_ready => pdi_ready,
            sdi_data  => sdi_data,
            sdi_valid => sdi_valid,
            sdi_ready => sdi_ready,
            do_data   => do_data,
            do_last   => do_last,
            do_valid  => do_valid,
            do_ready  => do_ready
        );
        
    --====================================== PDI Stimulus =======================================--
    tb_read_pdi : process
        variable line_data  : LINE;
        variable word_block : std_logic_vector(W - 1 downto 0) := (others => '0');
        variable read_ok    : boolean;
        variable line_head  : string(1 to 6);
        variable actkey_ins : boolean;
        
    begin
        -- wait for the clock edge after reset is complete
        wait until reset_done;
        wait until rising_edge(clk);
        --
        while not endfile(pdi_file) loop
            readline(pdi_file, line_data);
            read(line_data, line_head, read_ok); --! read line header
            if read_ok and (line_head = INS_HEAD) then
                pdi_operation_count <= pdi_operation_count + 1;
            end if;
            if read_ok and (line_head = INS_HEAD or line_head = HDR_HEAD or line_head = DAT_HEAD) then
                loop
                    lwc_hread(line_data, word_block, read_ok);
                    if not read_ok then
                        exit;
                    end if;
                    actkey_ins := (line_head = INS_HEAD) and (word_block(W - 1 downto W - 4) = INST_ACTKEY);
                    pdi_valid <= '1';
                    pdi_data  <= word_block;
                    wait until rising_edge(clk) and pdi_ready = '1';
                end loop;
            end if;
        end loop;
        pdi_valid <= '0';
        wait;                           -- until simulation ends
    end process;

    --===========================================================================================--
    --====================================== SDI Stimulus =======================================--
    tb_read_sdi : process
        variable line_data  : LINE;
        variable word_block : std_logic_vector(SW - 1 downto 0);
        variable read_ok    : boolean;
        variable line_head  : string(1 to 6);
    begin
        -- wait for the clock edge after reset is complete
        wait until reset_done;
        wait until rising_edge(clk);
        --
        while not endfile(sdi_file) loop
            readline(sdi_file, line_data);
            read(line_data, line_head, read_ok);
            if read_ok and (line_head = INS_HEAD or line_head = HDR_HEAD or line_head = DAT_HEAD) then
                loop
                    lwc_hread(line_data, word_block, read_ok);
                    if not read_ok then
                        exit;
                    end if;
                    sdi_valid <= '1';
                    sdi_data  <= word_block;
                    wait until rising_edge(clk) and sdi_ready = '1';
                end loop;
            end if;
        end loop;
        sdi_valid <= '0';
        wait;                           -- until simulation ends
    end process;

    --===========================================================================================--
    --=================================== DO Verification =======================================--
    tb_verify_do : process
        variable line_no      : integer := 0;
        variable line_data    : LINE;
        variable logMsg       : LINE;
        variable logMsg2      : LINE;
        variable failMsg      : LINE;
        variable tb_block     : std_logic_vector(20 - 1 downto 0);
        variable golden_word  : std_logic_vector(W - 1 downto 0);
        variable read_ok      : boolean;
        variable preamble     : string(1 to 6);
        variable word_count   : integer := 1;
        variable force_exit   : boolean := FALSE;
        variable msgid        : integer;
        variable keyid        : integer;
        variable opcode       : std_logic_vector(3 downto 0);
        variable num_failures : integer := 0;
        variable current_fail : boolean := FALSE;
        variable testcase     : integer := 0;
        variable end_cycle    : natural;
        variable end_time     : TIME;
    begin
        wait until reset_done;
        wait until rising_edge(clk);
        file_open(log_file, G_FNAME_LOG, WRITE_MODE);
        while not endfile(do_file) and not force_exit loop
            loop
                if endfile(do_file) then
                    report "Reached the end of " & G_FNAME_DO;
                    read_ok := False;
                    exit;
                end if;
                readline(do_file, line_data);
                line_no := line_no + 1;
                if line_data'length > 0 then
                    read(line_data, preamble, read_ok);
                    if read_ok then
                        exit;
                    end if;
                end if;
            end loop;
            if not read_ok then
                exit;
            end if;
            if preamble = EOF_HEAD then
                report "Reached EOF marker in " & G_FNAME_DO severity note;
                force_exit := True;
                exit;
            elsif preamble = HDR_HEAD or preamble = DAT_HEAD or preamble = STT_HEAD then -- header, data, or status lines
                loop                    -- processing single line
                    lwc_hread(line_data, golden_word, read_ok); -- read the rest of the line to word_block
                    word_count := 1;
                    if not read_ok then
                        exit;
                    end if;
                    do_ready   <= '1';
                    wait until rising_edge(clk) and do_valid = '1';
                    assert preamble /= STT_HEAD or do_last = '1' report "Status word received, but do_last was not '1'" severity error;
                    if not words_match(do_data, golden_word) then
                        write(failMsg, string'("Test #") & integer'image(testcase) & " MsgID: " & integer'image(msgid) & " Line: " & integer'image(line_no) & " Word: " & integer'image(word_count));
                        write(failMsg, string'(" Expected: ") & lwc_to_hstring(golden_word) & "   Received: " & lwc_to_hstring(do_data));
                        write(logMsg, string'("[Error] ") & failMsg.all);
                        report LF & logMsg.all & LF severity error;
                        writeline(log_file, logMsg);
                        writeline(failures_file, failMsg);
                        num_failures := num_failures + 1;
                        current_fail := True;
                    else
                        write(logMsg, string'("[Log]     Expected: ") & lwc_to_hstring(golden_word) & string'(" Received: ") & lwc_to_hstring(do_data) & string'(" Matched!"));
                        writeline(log_file, logMsg);
                    end if;
                    word_count := word_count + 1;
                    if preamble = STT_HEAD then -- last line of this testcase
                        if current_fail then
                            report " [FAILED] Testcase #" & integer'image(testcase) & " failed!" severity error;
                            current_fail := False;
                        elsif G_VERBOSE_LEVEL > 0 then
                            report " [OK]" severity note;
                        end if;
                    end if;
                end loop;               -- end of this line
            elsif preamble = TB_HEAD then
                current_fail := False;
                testcase     := testcase + 1;
                lwc_hread(line_data, tb_block, read_ok);
                if not read_ok then
                    exit;
                end if;
                opcode       := tb_block(19 downto 16);
                msgid        := to_integer(unsigned(tb_block(7 downto 0)));
                write(logMsg, "Testcase #" & integer'image(testcase) & " MsgID:" & integer'image(testcase) & " Op:");
                if (opcode = INST_HASH) then
                    write(logMsg, string'("HASH"));
                else
                    if opcode = INST_ENC then
                        write(logMsg, string'("ENC"));
                    elsif opcode = INST_DEC then
                        write(logMsg, string'("DEC"));
                    else
                        write(logMsg, string'("UNKNOWN opcode=") & lwc_to_hstring(opcode));
                    end if;
                    keyid := to_integer(unsigned(tb_block(15 downto 8)));
                    write(logMsg, string'(" KeyID:") & integer'image(keyid));
                end if;
                report logMsg.all severity note;
                writeline(log_file, logMsg);
            end if;
        end loop;
        --
        end_cycle  := cycle_counter;
        end_time   := now;
        do_ready   <= '0';
        wait until rising_edge(clk);
        --
        if num_failures > 0 then
            write(logMsg, string'("[FAIL] "));
        else
            write(logMsg, string'("[PASS] "));
        end if;
        file_close(do_file);
        write(logMsg, string'("Simulation completed in ") & integer'image(end_cycle) & " cycles.");
        write(logMsg2, string'(" Simulation time: ") & time'image(end_time));
        writeline(log_file, logMsg2);
        file_close(log_file);
        --
        if num_failures > 0 then
            write(result_file, "1");
            report LF & LF & logMsg.all & LF severity failure;
        else
            write(result_file, "0");
            report LF & LF & logMsg.all & LF severity note;
        end if;
        file_close(result_file);
        --
        stop_clock <= True;
        wait;
    end process;

end architecture;