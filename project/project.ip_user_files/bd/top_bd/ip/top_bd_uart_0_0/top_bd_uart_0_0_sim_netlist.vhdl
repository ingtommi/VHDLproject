-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Sat Jun 24 12:34:15 2023
-- Host        : PCTommaso running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Utente/Desktop/test/test.gen/sources_1/bd/top_bd/ip/top_bd_uart_0_0/top_bd_uart_0_0_sim_netlist.vhdl
-- Design      : top_bd_uart_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_bd_uart_0_0_uart is
  port (
    rx_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    tx : out STD_LOGIC;
    rx_busy : out STD_LOGIC;
    tx_busy : out STD_LOGIC;
    rx : in STD_LOGIC;
    clk : in STD_LOGIC;
    tx_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_ena : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of top_bd_uart_0_0_uart : entity is "uart";
end top_bd_uart_0_0_uart;

architecture STRUCTURE of top_bd_uart_0_0_uart is
  signal baud_pulse : STD_LOGIC;
  signal \count_baud[6]_i_2_n_0\ : STD_LOGIC;
  signal \count_baud[9]_i_1_n_0\ : STD_LOGIC;
  signal \count_baud[9]_i_3_n_0\ : STD_LOGIC;
  signal count_baud_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \count_os[5]_i_1_n_0\ : STD_LOGIC;
  signal \count_os[5]_i_3_n_0\ : STD_LOGIC;
  signal \count_os[5]_i_4_n_0\ : STD_LOGIC;
  signal \count_os[5]_i_5_n_0\ : STD_LOGIC;
  signal \count_os[5]_i_6_n_0\ : STD_LOGIC;
  signal \count_os_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_os_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_os_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_os_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_os_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_os_reg_n_0_[5]\ : STD_LOGIC;
  signal os_count : STD_LOGIC;
  signal \os_count[3]_i_1_n_0\ : STD_LOGIC;
  signal os_count_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal os_pulse : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \p_0_in__2\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal rx_buffer : STD_LOGIC;
  signal \rx_buffer[8]_i_2_n_0\ : STD_LOGIC;
  signal \^rx_busy\ : STD_LOGIC;
  signal rx_busy_i_1_n_0 : STD_LOGIC;
  signal rx_busy_i_2_n_0 : STD_LOGIC;
  signal rx_count : STD_LOGIC;
  signal \rx_count[3]_i_1_n_0\ : STD_LOGIC;
  signal rx_count_reg : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \rx_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \rx_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \rx_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \rx_data[7]_i_1_n_0\ : STD_LOGIC;
  signal \rx_data[7]_i_2_n_0\ : STD_LOGIC;
  signal rx_state_i_1_n_0 : STD_LOGIC;
  signal rx_state_reg_n_0 : STD_LOGIC;
  signal \tx_buffer[0]_i_1_n_0\ : STD_LOGIC;
  signal \tx_buffer[1]_i_1_n_0\ : STD_LOGIC;
  signal \tx_buffer[2]_i_1_n_0\ : STD_LOGIC;
  signal \tx_buffer[3]_i_1_n_0\ : STD_LOGIC;
  signal \tx_buffer[4]_i_1_n_0\ : STD_LOGIC;
  signal \tx_buffer[5]_i_1_n_0\ : STD_LOGIC;
  signal \tx_buffer[6]_i_1_n_0\ : STD_LOGIC;
  signal \tx_buffer[7]_i_1_n_0\ : STD_LOGIC;
  signal \tx_buffer[8]_i_1_n_0\ : STD_LOGIC;
  signal \tx_buffer[8]_i_2_n_0\ : STD_LOGIC;
  signal \tx_buffer[9]_i_1_n_0\ : STD_LOGIC;
  signal \tx_buffer_reg_n_0_[0]\ : STD_LOGIC;
  signal \tx_buffer_reg_n_0_[1]\ : STD_LOGIC;
  signal \tx_buffer_reg_n_0_[2]\ : STD_LOGIC;
  signal \tx_buffer_reg_n_0_[3]\ : STD_LOGIC;
  signal \tx_buffer_reg_n_0_[4]\ : STD_LOGIC;
  signal \tx_buffer_reg_n_0_[5]\ : STD_LOGIC;
  signal \tx_buffer_reg_n_0_[6]\ : STD_LOGIC;
  signal \tx_buffer_reg_n_0_[7]\ : STD_LOGIC;
  signal \tx_buffer_reg_n_0_[8]\ : STD_LOGIC;
  signal \tx_buffer_reg_n_0_[9]\ : STD_LOGIC;
  signal \^tx_busy\ : STD_LOGIC;
  signal tx_busy_i_1_n_0 : STD_LOGIC;
  signal tx_count : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \tx_count[3]_i_1_n_0\ : STD_LOGIC;
  signal \tx_count__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal tx_count_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal tx_state : STD_LOGIC;
  signal tx_state_i_1_n_0 : STD_LOGIC;
  signal tx_state_i_2_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_baud[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \count_baud[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \count_baud[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \count_baud[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \count_baud[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \count_baud[6]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \count_baud[8]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count_baud[9]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count_os[0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \count_os[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \count_os[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count_os[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count_os[5]_i_4\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \count_os[5]_i_5\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \os_count[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \os_count[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \os_count[3]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of rx_busy_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \rx_count[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \rx_count[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \rx_count[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \rx_count[3]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \tx_buffer[1]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \tx_buffer[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \tx_buffer[3]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \tx_buffer[4]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \tx_buffer[5]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \tx_buffer[6]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \tx_buffer[7]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \tx_buffer[8]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \tx_count[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \tx_count[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \tx_count[3]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of tx_state_i_2 : label is "soft_lutpair7";
begin
  rx_busy <= \^rx_busy\;
  tx_busy <= \^tx_busy\;
baud_pulse_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \count_baud[9]_i_1_n_0\,
      Q => baud_pulse,
      R => '0'
    );
\count_baud[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_baud_reg(0),
      O => \p_0_in__0\(0)
    );
\count_baud[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => count_baud_reg(0),
      I1 => count_baud_reg(1),
      O => \p_0_in__0\(1)
    );
\count_baud[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => count_baud_reg(0),
      I1 => count_baud_reg(1),
      I2 => count_baud_reg(2),
      O => \p_0_in__0\(2)
    );
\count_baud[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => count_baud_reg(2),
      I1 => count_baud_reg(1),
      I2 => count_baud_reg(0),
      I3 => count_baud_reg(3),
      O => \p_0_in__0\(3)
    );
\count_baud[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => count_baud_reg(0),
      I1 => count_baud_reg(1),
      I2 => count_baud_reg(2),
      I3 => count_baud_reg(3),
      I4 => count_baud_reg(4),
      O => \p_0_in__0\(4)
    );
\count_baud[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => count_baud_reg(4),
      I1 => count_baud_reg(3),
      I2 => count_baud_reg(2),
      I3 => count_baud_reg(1),
      I4 => count_baud_reg(0),
      I5 => count_baud_reg(5),
      O => \p_0_in__0\(5)
    );
\count_baud[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF40000000"
    )
        port map (
      I0 => \count_baud[6]_i_2_n_0\,
      I1 => count_baud_reg(2),
      I2 => count_baud_reg(3),
      I3 => count_baud_reg(4),
      I4 => count_baud_reg(5),
      I5 => count_baud_reg(6),
      O => \p_0_in__0\(6)
    );
\count_baud[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => count_baud_reg(1),
      I1 => count_baud_reg(0),
      O => \count_baud[6]_i_2_n_0\
    );
\count_baud[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => count_baud_reg(6),
      I1 => \count_baud[9]_i_3_n_0\,
      I2 => count_baud_reg(7),
      O => \p_0_in__0\(7)
    );
\count_baud[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => count_baud_reg(7),
      I1 => \count_baud[9]_i_3_n_0\,
      I2 => count_baud_reg(6),
      I3 => count_baud_reg(8),
      O => \p_0_in__0\(8)
    );
\count_baud[9]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_os[5]_i_3_n_0\,
      O => \count_baud[9]_i_1_n_0\
    );
\count_baud[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => count_baud_reg(8),
      I1 => count_baud_reg(6),
      I2 => \count_baud[9]_i_3_n_0\,
      I3 => count_baud_reg(7),
      I4 => count_baud_reg(9),
      O => \p_0_in__0\(9)
    );
\count_baud[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => count_baud_reg(5),
      I1 => count_baud_reg(4),
      I2 => count_baud_reg(3),
      I3 => count_baud_reg(2),
      I4 => count_baud_reg(1),
      I5 => count_baud_reg(0),
      O => \count_baud[9]_i_3_n_0\
    );
\count_baud_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(0),
      Q => count_baud_reg(0),
      R => \count_baud[9]_i_1_n_0\
    );
\count_baud_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(1),
      Q => count_baud_reg(1),
      R => \count_baud[9]_i_1_n_0\
    );
\count_baud_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(2),
      Q => count_baud_reg(2),
      R => \count_baud[9]_i_1_n_0\
    );
\count_baud_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(3),
      Q => count_baud_reg(3),
      R => \count_baud[9]_i_1_n_0\
    );
\count_baud_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(4),
      Q => count_baud_reg(4),
      R => \count_baud[9]_i_1_n_0\
    );
\count_baud_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(5),
      Q => count_baud_reg(5),
      R => \count_baud[9]_i_1_n_0\
    );
\count_baud_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(6),
      Q => count_baud_reg(6),
      R => \count_baud[9]_i_1_n_0\
    );
\count_baud_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(7),
      Q => count_baud_reg(7),
      R => \count_baud[9]_i_1_n_0\
    );
\count_baud_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(8),
      Q => count_baud_reg(8),
      R => \count_baud[9]_i_1_n_0\
    );
\count_baud_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(9),
      Q => count_baud_reg(9),
      R => \count_baud[9]_i_1_n_0\
    );
\count_os[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \count_os[5]_i_3_n_0\,
      I1 => \count_os_reg_n_0_[0]\,
      O => p_1_in(0)
    );
\count_os[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \count_os[5]_i_3_n_0\,
      I1 => \count_os_reg_n_0_[1]\,
      I2 => \count_os_reg_n_0_[0]\,
      O => p_1_in(1)
    );
\count_os[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \count_os[5]_i_3_n_0\,
      I1 => \count_os_reg_n_0_[0]\,
      I2 => \count_os_reg_n_0_[1]\,
      I3 => \count_os_reg_n_0_[2]\,
      O => p_1_in(2)
    );
\count_os[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"48888888"
    )
        port map (
      I0 => \count_os_reg_n_0_[3]\,
      I1 => \count_os[5]_i_3_n_0\,
      I2 => \count_os_reg_n_0_[2]\,
      I3 => \count_os_reg_n_0_[0]\,
      I4 => \count_os_reg_n_0_[1]\,
      O => p_1_in(3)
    );
\count_os[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"60A0A0A0A0A0A0A0"
    )
        port map (
      I0 => \count_os_reg_n_0_[4]\,
      I1 => \count_os_reg_n_0_[3]\,
      I2 => \count_os[5]_i_3_n_0\,
      I3 => \count_os_reg_n_0_[1]\,
      I4 => \count_os_reg_n_0_[0]\,
      I5 => \count_os_reg_n_0_[2]\,
      O => p_1_in(4)
    );
\count_os[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \count_os_reg_n_0_[4]\,
      I1 => \count_os[5]_i_3_n_0\,
      I2 => \count_os_reg_n_0_[5]\,
      I3 => \count_os[5]_i_4_n_0\,
      O => \count_os[5]_i_1_n_0\
    );
\count_os[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D0F0F0F020000000"
    )
        port map (
      I0 => \count_os_reg_n_0_[2]\,
      I1 => \count_os[5]_i_5_n_0\,
      I2 => \count_os[5]_i_3_n_0\,
      I3 => \count_os_reg_n_0_[3]\,
      I4 => \count_os_reg_n_0_[4]\,
      I5 => \count_os_reg_n_0_[5]\,
      O => p_1_in(5)
    );
\count_os[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBFBFFFBFFFBFFF"
    )
        port map (
      I0 => \count_os[5]_i_6_n_0\,
      I1 => count_baud_reg(8),
      I2 => count_baud_reg(9),
      I3 => count_baud_reg(7),
      I4 => count_baud_reg(6),
      I5 => count_baud_reg(5),
      O => \count_os[5]_i_3_n_0\
    );
\count_os[5]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFA8"
    )
        port map (
      I0 => \count_os_reg_n_0_[2]\,
      I1 => \count_os_reg_n_0_[1]\,
      I2 => \count_os_reg_n_0_[0]\,
      I3 => \count_os_reg_n_0_[3]\,
      O => \count_os[5]_i_4_n_0\
    );
\count_os[5]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \count_os_reg_n_0_[1]\,
      I1 => \count_os_reg_n_0_[0]\,
      O => \count_os[5]_i_5_n_0\
    );
\count_os[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100010001"
    )
        port map (
      I0 => count_baud_reg(3),
      I1 => count_baud_reg(4),
      I2 => count_baud_reg(7),
      I3 => count_baud_reg(2),
      I4 => count_baud_reg(0),
      I5 => count_baud_reg(1),
      O => \count_os[5]_i_6_n_0\
    );
\count_os_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_1_in(0),
      Q => \count_os_reg_n_0_[0]\,
      R => \count_os[5]_i_1_n_0\
    );
\count_os_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_1_in(1),
      Q => \count_os_reg_n_0_[1]\,
      R => \count_os[5]_i_1_n_0\
    );
\count_os_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_1_in(2),
      Q => \count_os_reg_n_0_[2]\,
      R => \count_os[5]_i_1_n_0\
    );
\count_os_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_1_in(3),
      Q => \count_os_reg_n_0_[3]\,
      R => \count_os[5]_i_1_n_0\
    );
\count_os_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_1_in(4),
      Q => \count_os_reg_n_0_[4]\,
      R => \count_os[5]_i_1_n_0\
    );
\count_os_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_1_in(5),
      Q => \count_os_reg_n_0_[5]\,
      R => \count_os[5]_i_1_n_0\
    );
\os_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => os_count_reg(0),
      O => \p_0_in__1\(0)
    );
\os_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => os_count_reg(0),
      I1 => os_count_reg(1),
      O => \p_0_in__1\(1)
    );
\os_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => os_count_reg(1),
      I1 => os_count_reg(0),
      I2 => os_count_reg(2),
      O => \p_0_in__1\(2)
    );
\os_count[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F222F222F222222"
    )
        port map (
      I0 => \rx_data[7]_i_2_n_0\,
      I1 => rx_count_reg(3),
      I2 => rx_state_reg_n_0,
      I3 => os_pulse,
      I4 => os_count_reg(3),
      I5 => rx,
      O => \os_count[3]_i_1_n_0\
    );
\os_count[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rx_state_reg_n_0,
      I1 => os_count_reg(2),
      I2 => os_count_reg(0),
      I3 => os_count_reg(1),
      I4 => os_count_reg(3),
      I5 => os_pulse,
      O => os_count
    );
\os_count[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => os_count_reg(2),
      I1 => os_count_reg(0),
      I2 => os_count_reg(1),
      I3 => os_count_reg(3),
      O => \p_0_in__1\(3)
    );
\os_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => os_count,
      D => \p_0_in__1\(0),
      Q => os_count_reg(0),
      R => \os_count[3]_i_1_n_0\
    );
\os_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => os_count,
      D => \p_0_in__1\(1),
      Q => os_count_reg(1),
      R => \os_count[3]_i_1_n_0\
    );
\os_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => os_count,
      D => \p_0_in__1\(2),
      Q => os_count_reg(2),
      R => \os_count[3]_i_1_n_0\
    );
\os_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => os_count,
      D => \p_0_in__1\(3),
      Q => os_count_reg(3),
      R => \os_count[3]_i_1_n_0\
    );
os_pulse_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \count_os[5]_i_1_n_0\,
      Q => os_pulse,
      R => '0'
    );
\rx_buffer[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222222222F22222"
    )
        port map (
      I0 => \rx_data[7]_i_2_n_0\,
      I1 => rx_count_reg(3),
      I2 => os_pulse,
      I3 => rx_state_reg_n_0,
      I4 => os_count_reg(3),
      I5 => rx,
      O => rx_buffer
    );
\rx_buffer[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => rx_state_reg_n_0,
      I1 => rx,
      O => \rx_buffer[8]_i_2_n_0\
    );
\rx_buffer_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rx_buffer,
      D => p_0_in(1),
      Q => p_0_in(0),
      R => '0'
    );
\rx_buffer_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rx_buffer,
      D => p_0_in(2),
      Q => p_0_in(1),
      R => '0'
    );
\rx_buffer_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rx_buffer,
      D => p_0_in(3),
      Q => p_0_in(2),
      R => '0'
    );
\rx_buffer_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rx_buffer,
      D => p_0_in(4),
      Q => p_0_in(3),
      R => '0'
    );
\rx_buffer_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rx_buffer,
      D => p_0_in(5),
      Q => p_0_in(4),
      R => '0'
    );
\rx_buffer_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rx_buffer,
      D => p_0_in(6),
      Q => p_0_in(5),
      R => '0'
    );
\rx_buffer_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rx_buffer,
      D => p_0_in(7),
      Q => p_0_in(6),
      R => '0'
    );
\rx_buffer_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rx_buffer,
      D => \rx_buffer[8]_i_2_n_0\,
      Q => p_0_in(7),
      R => '0'
    );
rx_busy_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F044FFFF00440000"
    )
        port map (
      I0 => rx,
      I1 => os_count_reg(3),
      I2 => rx_busy_i_2_n_0,
      I3 => rx_state_reg_n_0,
      I4 => os_pulse,
      I5 => \^rx_busy\,
      O => rx_busy_i_1_n_0
    );
rx_busy_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => os_count_reg(3),
      I1 => os_count_reg(1),
      I2 => os_count_reg(0),
      I3 => os_count_reg(2),
      I4 => rx_count_reg(3),
      O => rx_busy_i_2_n_0
    );
rx_busy_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rx_busy_i_1_n_0,
      Q => \^rx_busy\,
      R => '0'
    );
\rx_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \rx_count_reg_n_0_[0]\,
      O => \p_0_in__2\(0)
    );
\rx_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rx_count_reg_n_0_[0]\,
      I1 => \rx_count_reg_n_0_[1]\,
      O => \p_0_in__2\(1)
    );
\rx_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \rx_count_reg_n_0_[0]\,
      I1 => \rx_count_reg_n_0_[1]\,
      I2 => \rx_count_reg_n_0_[2]\,
      O => \p_0_in__2\(2)
    );
\rx_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => rx,
      I1 => os_count_reg(3),
      I2 => rx_state_reg_n_0,
      I3 => os_pulse,
      O => \rx_count[3]_i_1_n_0\
    );
\rx_count[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rx_data[7]_i_2_n_0\,
      I1 => rx_count_reg(3),
      O => rx_count
    );
\rx_count[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \rx_count_reg_n_0_[2]\,
      I1 => \rx_count_reg_n_0_[1]\,
      I2 => \rx_count_reg_n_0_[0]\,
      O => \p_0_in__2\(3)
    );
\rx_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rx_count,
      D => \p_0_in__2\(0),
      Q => \rx_count_reg_n_0_[0]\,
      R => \rx_count[3]_i_1_n_0\
    );
\rx_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rx_count,
      D => \p_0_in__2\(1),
      Q => \rx_count_reg_n_0_[1]\,
      R => \rx_count[3]_i_1_n_0\
    );
\rx_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rx_count,
      D => \p_0_in__2\(2),
      Q => \rx_count_reg_n_0_[2]\,
      R => \rx_count[3]_i_1_n_0\
    );
\rx_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rx_count,
      D => \p_0_in__2\(3),
      Q => rx_count_reg(3),
      R => \rx_count[3]_i_1_n_0\
    );
\rx_data[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \rx_data[7]_i_2_n_0\,
      I1 => rx_count_reg(3),
      O => \rx_data[7]_i_1_n_0\
    );
\rx_data[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => os_pulse,
      I1 => rx_state_reg_n_0,
      I2 => os_count_reg(2),
      I3 => os_count_reg(0),
      I4 => os_count_reg(1),
      I5 => os_count_reg(3),
      O => \rx_data[7]_i_2_n_0\
    );
\rx_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rx_data[7]_i_1_n_0\,
      D => p_0_in(0),
      Q => rx_data(0),
      R => '0'
    );
\rx_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rx_data[7]_i_1_n_0\,
      D => p_0_in(1),
      Q => rx_data(1),
      R => '0'
    );
\rx_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rx_data[7]_i_1_n_0\,
      D => p_0_in(2),
      Q => rx_data(2),
      R => '0'
    );
\rx_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rx_data[7]_i_1_n_0\,
      D => p_0_in(3),
      Q => rx_data(3),
      R => '0'
    );
\rx_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rx_data[7]_i_1_n_0\,
      D => p_0_in(4),
      Q => rx_data(4),
      R => '0'
    );
\rx_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rx_data[7]_i_1_n_0\,
      D => p_0_in(5),
      Q => rx_data(5),
      R => '0'
    );
\rx_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rx_data[7]_i_1_n_0\,
      D => p_0_in(6),
      Q => rx_data(6),
      R => '0'
    );
\rx_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rx_data[7]_i_1_n_0\,
      D => p_0_in(7),
      Q => rx_data(7),
      R => '0'
    );
rx_state_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAFF0C00"
    )
        port map (
      I0 => rx_busy_i_2_n_0,
      I1 => os_count_reg(3),
      I2 => rx,
      I3 => os_pulse,
      I4 => rx_state_reg_n_0,
      O => rx_state_i_1_n_0
    );
rx_state_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => rx_state_i_1_n_0,
      Q => rx_state_reg_n_0,
      R => '0'
    );
\tx_buffer[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFAFCAAA"
    )
        port map (
      I0 => \tx_buffer_reg_n_0_[0]\,
      I1 => \tx_buffer_reg_n_0_[1]\,
      I2 => tx_state,
      I3 => baud_pulse,
      I4 => tx_ena,
      O => \tx_buffer[0]_i_1_n_0\
    );
\tx_buffer[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => tx_state,
      I1 => \tx_buffer_reg_n_0_[2]\,
      O => \tx_buffer[1]_i_1_n_0\
    );
\tx_buffer[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \tx_buffer_reg_n_0_[3]\,
      I1 => tx_state,
      I2 => tx_data(0),
      O => \tx_buffer[2]_i_1_n_0\
    );
\tx_buffer[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \tx_buffer_reg_n_0_[4]\,
      I1 => tx_state,
      I2 => tx_data(1),
      O => \tx_buffer[3]_i_1_n_0\
    );
\tx_buffer[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \tx_buffer_reg_n_0_[5]\,
      I1 => tx_state,
      I2 => tx_data(2),
      O => \tx_buffer[4]_i_1_n_0\
    );
\tx_buffer[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \tx_buffer_reg_n_0_[6]\,
      I1 => tx_state,
      I2 => tx_data(3),
      O => \tx_buffer[5]_i_1_n_0\
    );
\tx_buffer[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \tx_buffer_reg_n_0_[7]\,
      I1 => tx_state,
      I2 => tx_data(4),
      O => \tx_buffer[6]_i_1_n_0\
    );
\tx_buffer[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \tx_buffer_reg_n_0_[8]\,
      I1 => tx_state,
      I2 => tx_data(5),
      O => \tx_buffer[7]_i_1_n_0\
    );
\tx_buffer[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => baud_pulse,
      I1 => tx_state,
      I2 => tx_ena,
      O => \tx_buffer[8]_i_1_n_0\
    );
\tx_buffer[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \tx_buffer_reg_n_0_[9]\,
      I1 => tx_state,
      I2 => tx_data(6),
      O => \tx_buffer[8]_i_2_n_0\
    );
\tx_buffer[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FACCFAAA"
    )
        port map (
      I0 => \tx_buffer_reg_n_0_[9]\,
      I1 => tx_data(7),
      I2 => baud_pulse,
      I3 => tx_state,
      I4 => tx_ena,
      O => \tx_buffer[9]_i_1_n_0\
    );
\tx_buffer_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \tx_buffer[0]_i_1_n_0\,
      Q => \tx_buffer_reg_n_0_[0]\,
      R => '0'
    );
\tx_buffer_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \tx_buffer[8]_i_1_n_0\,
      D => \tx_buffer[1]_i_1_n_0\,
      Q => \tx_buffer_reg_n_0_[1]\,
      R => '0'
    );
\tx_buffer_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \tx_buffer[8]_i_1_n_0\,
      D => \tx_buffer[2]_i_1_n_0\,
      Q => \tx_buffer_reg_n_0_[2]\,
      R => '0'
    );
\tx_buffer_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \tx_buffer[8]_i_1_n_0\,
      D => \tx_buffer[3]_i_1_n_0\,
      Q => \tx_buffer_reg_n_0_[3]\,
      R => '0'
    );
\tx_buffer_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \tx_buffer[8]_i_1_n_0\,
      D => \tx_buffer[4]_i_1_n_0\,
      Q => \tx_buffer_reg_n_0_[4]\,
      R => '0'
    );
\tx_buffer_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \tx_buffer[8]_i_1_n_0\,
      D => \tx_buffer[5]_i_1_n_0\,
      Q => \tx_buffer_reg_n_0_[5]\,
      R => '0'
    );
\tx_buffer_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \tx_buffer[8]_i_1_n_0\,
      D => \tx_buffer[6]_i_1_n_0\,
      Q => \tx_buffer_reg_n_0_[6]\,
      R => '0'
    );
\tx_buffer_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \tx_buffer[8]_i_1_n_0\,
      D => \tx_buffer[7]_i_1_n_0\,
      Q => \tx_buffer_reg_n_0_[7]\,
      R => '0'
    );
\tx_buffer_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \tx_buffer[8]_i_1_n_0\,
      D => \tx_buffer[8]_i_2_n_0\,
      Q => \tx_buffer_reg_n_0_[8]\,
      R => '0'
    );
\tx_buffer_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \tx_buffer[9]_i_1_n_0\,
      Q => \tx_buffer_reg_n_0_[9]\,
      R => '0'
    );
tx_busy_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^tx_busy\,
      I1 => tx_state,
      I2 => tx_ena,
      O => tx_busy_i_1_n_0
    );
tx_busy_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => tx_busy_i_1_n_0,
      Q => \^tx_busy\,
      R => '0'
    );
\tx_count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tx_count_reg(0),
      I1 => baud_pulse,
      O => \tx_count__0\(0)
    );
\tx_count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => tx_count_reg(0),
      I1 => baud_pulse,
      I2 => tx_count_reg(1),
      O => tx_count(1)
    );
\tx_count[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => baud_pulse,
      I1 => tx_count_reg(0),
      I2 => tx_count_reg(1),
      I3 => tx_count_reg(2),
      O => tx_count(2)
    );
\tx_count[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => tx_ena,
      I1 => tx_state,
      O => \tx_count[3]_i_1_n_0\
    );
\tx_count[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => tx_count_reg(3),
      I1 => tx_count_reg(2),
      I2 => baud_pulse,
      I3 => tx_count_reg(0),
      I4 => tx_count_reg(1),
      O => tx_count(3)
    );
\tx_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => tx_state,
      D => \tx_count__0\(0),
      Q => tx_count_reg(0),
      R => \tx_count[3]_i_1_n_0\
    );
\tx_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => tx_state,
      D => tx_count(1),
      Q => tx_count_reg(1),
      R => \tx_count[3]_i_1_n_0\
    );
\tx_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => tx_state,
      D => tx_count(2),
      Q => tx_count_reg(2),
      R => \tx_count[3]_i_1_n_0\
    );
\tx_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => tx_state,
      D => tx_count(3),
      Q => tx_count_reg(3),
      R => \tx_count[3]_i_1_n_0\
    );
tx_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \tx_buffer_reg_n_0_[0]\,
      Q => tx,
      R => '0'
    );
tx_state_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33F33F33AAAAAAAA"
    )
        port map (
      I0 => tx_ena,
      I1 => tx_count_reg(3),
      I2 => tx_count_reg(1),
      I3 => tx_state_i_2_n_0,
      I4 => tx_count_reg(2),
      I5 => tx_state,
      O => tx_state_i_1_n_0
    );
tx_state_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => baud_pulse,
      I1 => tx_count_reg(0),
      O => tx_state_i_2_n_0
    );
tx_state_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => tx_state_i_1_n_0,
      Q => tx_state,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_bd_uart_0_0 is
  port (
    clk : in STD_LOGIC;
    rx : in STD_LOGIC;
    rx_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    tx : out STD_LOGIC;
    tx_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_ena : in STD_LOGIC;
    rx_busy : out STD_LOGIC;
    tx_busy : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_bd_uart_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of top_bd_uart_0_0 : entity is "top_bd_uart_0_0,uart,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of top_bd_uart_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of top_bd_uart_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of top_bd_uart_0_0 : entity is "uart,Vivado 2023.1";
end top_bd_uart_0_0;

architecture STRUCTURE of top_bd_uart_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
begin
U0: entity work.top_bd_uart_0_0_uart
     port map (
      clk => clk,
      rx => rx,
      rx_busy => rx_busy,
      rx_data(7 downto 0) => rx_data(7 downto 0),
      tx => tx,
      tx_busy => tx_busy,
      tx_data(7 downto 0) => tx_data(7 downto 0),
      tx_ena => tx_ena
    );
end STRUCTURE;
