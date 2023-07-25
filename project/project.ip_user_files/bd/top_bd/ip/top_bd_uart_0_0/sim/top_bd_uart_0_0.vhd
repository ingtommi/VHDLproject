-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2023 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:uart:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY top_bd_uart_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    rx : IN STD_LOGIC;
    rx_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    tx : OUT STD_LOGIC;
    tx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    tx_ena : IN STD_LOGIC;
    rx_busy : OUT STD_LOGIC;
    tx_busy : OUT STD_LOGIC
  );
END top_bd_uart_0_0;

ARCHITECTURE top_bd_uart_0_0_arch OF top_bd_uart_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF top_bd_uart_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT uart IS
    GENERIC (
      clk_freq : INTEGER;
      baud_rate : INTEGER;
      os_rate : INTEGER;
      d_width : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      rx : IN STD_LOGIC;
      rx_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      tx : OUT STD_LOGIC;
      tx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      tx_ena : IN STD_LOGIC;
      rx_busy : OUT STD_LOGIC;
      tx_busy : OUT STD_LOGIC
    );
  END COMPONENT uart;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : uart
    GENERIC MAP (
      clk_freq => 100000000,
      baud_rate => 115200,
      os_rate => 16,
      d_width => 8
    )
    PORT MAP (
      clk => clk,
      rx => rx,
      rx_data => rx_data,
      tx => tx,
      tx_data => tx_data,
      tx_ena => tx_ena,
      rx_busy => rx_busy,
      tx_busy => tx_busy
    );
END top_bd_uart_0_0_arch;
