// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Tue Jul  4 23:30:49 2023
// Host        : PCTommaso running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Utente/Desktop/test/test.gen/sources_1/bd/top_bd/ip/top_bd_uart_0_1/top_bd_uart_0_1_sim_netlist.v
// Design      : top_bd_uart_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "top_bd_uart_0_1,uart,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "uart,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module top_bd_uart_0_1
   (clk,
    rx,
    rx_data,
    tx,
    tx_data,
    tx_ena,
    tx_ready,
    rx_done,
    crypto_done);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_bd_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  input rx;
  output [7:0]rx_data;
  output tx;
  input [7:0]tx_data;
  input tx_ena;
  output tx_ready;
  output rx_done;
  input crypto_done;

  wire clk;
  wire crypto_done;
  wire rx;
  wire [7:0]rx_data;
  wire rx_done;
  wire tx;
  wire [7:0]tx_data;
  wire tx_ena;
  wire tx_ready;

  top_bd_uart_0_1_uart U0
       (.clk(clk),
        .crypto_done(crypto_done),
        .rx(rx),
        .rx_data(rx_data),
        .rx_done(rx_done),
        .tx(tx),
        .tx_data(tx_data),
        .tx_ena(tx_ena),
        .tx_ready(tx_ready));
endmodule

(* ORIG_REF_NAME = "uart" *) 
module top_bd_uart_0_1_uart
   (rx_data,
    rx_done,
    tx_ready,
    tx,
    clk,
    tx_data,
    crypto_done,
    tx_ena,
    rx);
  output [7:0]rx_data;
  output rx_done;
  output tx_ready;
  output tx;
  input clk;
  input [7:0]tx_data;
  input crypto_done;
  input tx_ena;
  input rx;

  wire baud_pulse;
  wire clk;
  wire \count_baud[2]_i_1_n_0 ;
  wire \count_baud[6]_i_2_n_0 ;
  wire \count_baud[9]_i_1_n_0 ;
  wire \count_baud[9]_i_3_n_0 ;
  wire [9:0]count_baud_reg;
  wire \count_os[5]_i_1_n_0 ;
  wire \count_os[5]_i_3_n_0 ;
  wire \count_os[5]_i_4_n_0 ;
  wire \count_os[5]_i_5_n_0 ;
  wire \count_os[5]_i_6_n_0 ;
  wire \count_os[5]_i_7_n_0 ;
  wire \count_os[5]_i_8_n_0 ;
  wire \count_os_reg_n_0_[0] ;
  wire \count_os_reg_n_0_[1] ;
  wire \count_os_reg_n_0_[2] ;
  wire \count_os_reg_n_0_[3] ;
  wire \count_os_reg_n_0_[4] ;
  wire \count_os_reg_n_0_[5] ;
  wire crypto_done;
  wire \os_count[3]_i_1_n_0 ;
  wire \os_count[3]_i_2_n_0 ;
  wire [3:0]os_count_reg;
  wire os_pulse;
  wire [7:0]p_0_in;
  wire [9:0]p_0_in__0;
  wire [3:0]p_0_in__1;
  wire [3:0]p_0_in__2;
  wire [5:0]p_1_in;
  wire rx;
  wire rx_buffer;
  wire \rx_buffer[8]_i_2_n_0 ;
  wire \rx_buffer[8]_i_3_n_0 ;
  wire rx_count;
  wire [3:3]rx_count_reg;
  wire \rx_count_reg_n_0_[0] ;
  wire \rx_count_reg_n_0_[1] ;
  wire \rx_count_reg_n_0_[2] ;
  wire [7:0]rx_data;
  wire \rx_data[7]_i_1_n_0 ;
  wire \rx_data[7]_i_2_n_0 ;
  wire rx_done;
  wire rx_done0_out;
  wire rx_done_i_1_n_0;
  wire rx_state_i_1_n_0;
  wire rx_state_reg_n_0;
  wire tx;
  wire tx_buffer;
  wire \tx_buffer[0]_i_1_n_0 ;
  wire \tx_buffer[1]_i_1_n_0 ;
  wire \tx_buffer[2]_i_1_n_0 ;
  wire \tx_buffer[3]_i_1_n_0 ;
  wire \tx_buffer[4]_i_1_n_0 ;
  wire \tx_buffer[5]_i_1_n_0 ;
  wire \tx_buffer[6]_i_1_n_0 ;
  wire \tx_buffer[7]_i_1_n_0 ;
  wire \tx_buffer[8]_i_2_n_0 ;
  wire \tx_buffer[9]_i_1_n_0 ;
  wire \tx_buffer_reg_n_0_[0] ;
  wire \tx_buffer_reg_n_0_[1] ;
  wire \tx_buffer_reg_n_0_[2] ;
  wire \tx_buffer_reg_n_0_[3] ;
  wire \tx_buffer_reg_n_0_[4] ;
  wire \tx_buffer_reg_n_0_[5] ;
  wire \tx_buffer_reg_n_0_[6] ;
  wire \tx_buffer_reg_n_0_[7] ;
  wire \tx_buffer_reg_n_0_[8] ;
  wire \tx_buffer_reg_n_0_[9] ;
  wire [3:0]tx_count;
  wire \tx_count[3]_i_2_n_0 ;
  wire [3:0]tx_count_reg;
  wire [7:0]tx_data;
  wire tx_ena;
  wire tx_i_1_n_0;
  wire tx_ready;
  wire tx_ready6_out;
  wire tx_ready_i_1_n_0;
  wire tx_state;
  wire tx_state_i_1_n_0;
  wire tx_state_i_2_n_0;

  FDRE #(
    .INIT(1'b0)) 
    baud_pulse_reg
       (.C(clk),
        .CE(1'b1),
        .D(\count_baud[9]_i_1_n_0 ),
        .Q(baud_pulse),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \count_baud[0]_i_1 
       (.I0(count_baud_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_baud[1]_i_1 
       (.I0(count_baud_reg[0]),
        .I1(count_baud_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_baud[2]_i_1 
       (.I0(count_baud_reg[0]),
        .I1(count_baud_reg[1]),
        .I2(count_baud_reg[2]),
        .O(\count_baud[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_baud[3]_i_1 
       (.I0(count_baud_reg[1]),
        .I1(count_baud_reg[0]),
        .I2(count_baud_reg[2]),
        .I3(count_baud_reg[3]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_baud[4]_i_1 
       (.I0(count_baud_reg[2]),
        .I1(count_baud_reg[0]),
        .I2(count_baud_reg[1]),
        .I3(count_baud_reg[3]),
        .I4(count_baud_reg[4]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_baud[5]_i_1 
       (.I0(count_baud_reg[3]),
        .I1(count_baud_reg[1]),
        .I2(count_baud_reg[0]),
        .I3(count_baud_reg[2]),
        .I4(count_baud_reg[4]),
        .I5(count_baud_reg[5]),
        .O(p_0_in__0[5]));
  LUT6 #(
    .INIT(64'hF7FFFFFF08000000)) 
    \count_baud[6]_i_1 
       (.I0(count_baud_reg[4]),
        .I1(count_baud_reg[2]),
        .I2(\count_baud[6]_i_2_n_0 ),
        .I3(count_baud_reg[3]),
        .I4(count_baud_reg[5]),
        .I5(count_baud_reg[6]),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \count_baud[6]_i_2 
       (.I0(count_baud_reg[1]),
        .I1(count_baud_reg[0]),
        .O(\count_baud[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_baud[7]_i_1 
       (.I0(\count_baud[9]_i_3_n_0 ),
        .I1(count_baud_reg[6]),
        .I2(count_baud_reg[7]),
        .O(p_0_in__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_baud[8]_i_1 
       (.I0(count_baud_reg[6]),
        .I1(\count_baud[9]_i_3_n_0 ),
        .I2(count_baud_reg[7]),
        .I3(count_baud_reg[8]),
        .O(p_0_in__0[8]));
  LUT1 #(
    .INIT(2'h1)) 
    \count_baud[9]_i_1 
       (.I0(\count_os[5]_i_3_n_0 ),
        .O(\count_baud[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_baud[9]_i_2 
       (.I0(count_baud_reg[7]),
        .I1(\count_baud[9]_i_3_n_0 ),
        .I2(count_baud_reg[6]),
        .I3(count_baud_reg[8]),
        .I4(count_baud_reg[9]),
        .O(p_0_in__0[9]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_baud[9]_i_3 
       (.I0(count_baud_reg[5]),
        .I1(count_baud_reg[3]),
        .I2(count_baud_reg[1]),
        .I3(count_baud_reg[0]),
        .I4(count_baud_reg[2]),
        .I5(count_baud_reg[4]),
        .O(\count_baud[9]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_baud_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[0]),
        .Q(count_baud_reg[0]),
        .R(\count_baud[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_baud_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[1]),
        .Q(count_baud_reg[1]),
        .R(\count_baud[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_baud_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_baud[2]_i_1_n_0 ),
        .Q(count_baud_reg[2]),
        .R(\count_baud[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_baud_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[3]),
        .Q(count_baud_reg[3]),
        .R(\count_baud[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_baud_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[4]),
        .Q(count_baud_reg[4]),
        .R(\count_baud[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_baud_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[5]),
        .Q(count_baud_reg[5]),
        .R(\count_baud[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_baud_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[6]),
        .Q(count_baud_reg[6]),
        .R(\count_baud[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_baud_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[7]),
        .Q(count_baud_reg[7]),
        .R(\count_baud[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_baud_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[8]),
        .Q(count_baud_reg[8]),
        .R(\count_baud[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_baud_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[9]),
        .Q(count_baud_reg[9]),
        .R(\count_baud[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \count_os[0]_i_1 
       (.I0(\count_os_reg_n_0_[0] ),
        .I1(\count_os[5]_i_3_n_0 ),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \count_os[1]_i_1 
       (.I0(\count_os_reg_n_0_[0] ),
        .I1(\count_os_reg_n_0_[1] ),
        .I2(\count_os[5]_i_3_n_0 ),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7800)) 
    \count_os[2]_i_1 
       (.I0(\count_os_reg_n_0_[0] ),
        .I1(\count_os_reg_n_0_[1] ),
        .I2(\count_os_reg_n_0_[2] ),
        .I3(\count_os[5]_i_3_n_0 ),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h7F800000)) 
    \count_os[3]_i_1 
       (.I0(\count_os_reg_n_0_[1] ),
        .I1(\count_os_reg_n_0_[0] ),
        .I2(\count_os_reg_n_0_[2] ),
        .I3(\count_os_reg_n_0_[3] ),
        .I4(\count_os[5]_i_3_n_0 ),
        .O(p_1_in[3]));
  LUT6 #(
    .INIT(64'h7FFF800000000000)) 
    \count_os[4]_i_1 
       (.I0(\count_os_reg_n_0_[2] ),
        .I1(\count_os_reg_n_0_[0] ),
        .I2(\count_os_reg_n_0_[1] ),
        .I3(\count_os_reg_n_0_[3] ),
        .I4(\count_os_reg_n_0_[4] ),
        .I5(\count_os[5]_i_3_n_0 ),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'h8000808080008000)) 
    \count_os[5]_i_1 
       (.I0(\count_os_reg_n_0_[5] ),
        .I1(\count_os_reg_n_0_[4] ),
        .I2(\count_os[5]_i_3_n_0 ),
        .I3(\count_os_reg_n_0_[3] ),
        .I4(\count_os[5]_i_4_n_0 ),
        .I5(\count_os_reg_n_0_[2] ),
        .O(\count_os[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF800000000000)) 
    \count_os[5]_i_2 
       (.I0(\count_os_reg_n_0_[3] ),
        .I1(\count_os[5]_i_5_n_0 ),
        .I2(\count_os_reg_n_0_[2] ),
        .I3(\count_os_reg_n_0_[4] ),
        .I4(\count_os_reg_n_0_[5] ),
        .I5(\count_os[5]_i_3_n_0 ),
        .O(p_1_in[5]));
  LUT6 #(
    .INIT(64'h4555FFFFFFFFFFFF)) 
    \count_os[5]_i_3 
       (.I0(count_baud_reg[7]),
        .I1(\count_os[5]_i_6_n_0 ),
        .I2(count_baud_reg[6]),
        .I3(count_baud_reg[5]),
        .I4(count_baud_reg[9]),
        .I5(count_baud_reg[8]),
        .O(\count_os[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF1FFF1F111111111)) 
    \count_os[5]_i_4 
       (.I0(\count_os_reg_n_0_[1] ),
        .I1(\count_os_reg_n_0_[0] ),
        .I2(count_baud_reg[7]),
        .I3(\count_os[5]_i_6_n_0 ),
        .I4(\count_os[5]_i_7_n_0 ),
        .I5(\count_os[5]_i_8_n_0 ),
        .O(\count_os[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0800080888888888)) 
    \count_os[5]_i_5 
       (.I0(\count_os_reg_n_0_[1] ),
        .I1(\count_os_reg_n_0_[0] ),
        .I2(count_baud_reg[7]),
        .I3(\count_os[5]_i_6_n_0 ),
        .I4(\count_os[5]_i_7_n_0 ),
        .I5(\count_os[5]_i_8_n_0 ),
        .O(\count_os[5]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000007)) 
    \count_os[5]_i_6 
       (.I0(count_baud_reg[0]),
        .I1(count_baud_reg[1]),
        .I2(count_baud_reg[3]),
        .I3(count_baud_reg[4]),
        .I4(count_baud_reg[2]),
        .O(\count_os[5]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count_os[5]_i_7 
       (.I0(count_baud_reg[5]),
        .I1(count_baud_reg[6]),
        .O(\count_os[5]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count_os[5]_i_8 
       (.I0(count_baud_reg[8]),
        .I1(count_baud_reg[9]),
        .O(\count_os[5]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_os_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_in[0]),
        .Q(\count_os_reg_n_0_[0] ),
        .R(\count_os[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_os_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_in[1]),
        .Q(\count_os_reg_n_0_[1] ),
        .R(\count_os[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_os_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_in[2]),
        .Q(\count_os_reg_n_0_[2] ),
        .R(\count_os[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_os_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_in[3]),
        .Q(\count_os_reg_n_0_[3] ),
        .R(\count_os[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_os_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_in[4]),
        .Q(\count_os_reg_n_0_[4] ),
        .R(\count_os[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_os_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_in[5]),
        .Q(\count_os_reg_n_0_[5] ),
        .R(\count_os[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \os_count[0]_i_1 
       (.I0(os_count_reg[0]),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \os_count[1]_i_1 
       (.I0(os_count_reg[0]),
        .I1(os_count_reg[1]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \os_count[2]_i_1 
       (.I0(os_count_reg[0]),
        .I1(os_count_reg[1]),
        .I2(os_count_reg[2]),
        .O(p_0_in__1[2]));
  LUT5 #(
    .INIT(32'hAAA800A8)) 
    \os_count[3]_i_1 
       (.I0(os_pulse),
        .I1(os_count_reg[3]),
        .I2(rx),
        .I3(rx_state_reg_n_0),
        .I4(\rx_buffer[8]_i_3_n_0 ),
        .O(\os_count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAAAAAAAAAA)) 
    \os_count[3]_i_2 
       (.I0(os_pulse),
        .I1(rx_state_reg_n_0),
        .I2(os_count_reg[2]),
        .I3(os_count_reg[3]),
        .I4(os_count_reg[1]),
        .I5(os_count_reg[0]),
        .O(\os_count[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \os_count[3]_i_3 
       (.I0(os_count_reg[1]),
        .I1(os_count_reg[0]),
        .I2(os_count_reg[2]),
        .I3(os_count_reg[3]),
        .O(p_0_in__1[3]));
  FDRE #(
    .INIT(1'b0)) 
    \os_count_reg[0] 
       (.C(clk),
        .CE(\os_count[3]_i_2_n_0 ),
        .D(p_0_in__1[0]),
        .Q(os_count_reg[0]),
        .R(\os_count[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \os_count_reg[1] 
       (.C(clk),
        .CE(\os_count[3]_i_2_n_0 ),
        .D(p_0_in__1[1]),
        .Q(os_count_reg[1]),
        .R(\os_count[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \os_count_reg[2] 
       (.C(clk),
        .CE(\os_count[3]_i_2_n_0 ),
        .D(p_0_in__1[2]),
        .Q(os_count_reg[2]),
        .R(\os_count[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \os_count_reg[3] 
       (.C(clk),
        .CE(\os_count[3]_i_2_n_0 ),
        .D(p_0_in__1[3]),
        .Q(os_count_reg[3]),
        .R(\os_count[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    os_pulse_reg
       (.C(clk),
        .CE(1'b1),
        .D(\count_os[5]_i_1_n_0 ),
        .Q(os_pulse),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAA200020)) 
    \rx_buffer[8]_i_1 
       (.I0(os_pulse),
        .I1(rx),
        .I2(os_count_reg[3]),
        .I3(rx_state_reg_n_0),
        .I4(\rx_buffer[8]_i_3_n_0 ),
        .O(rx_buffer));
  LUT2 #(
    .INIT(4'h8)) 
    \rx_buffer[8]_i_2 
       (.I0(rx_state_reg_n_0),
        .I1(rx),
        .O(\rx_buffer[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    \rx_buffer[8]_i_3 
       (.I0(os_count_reg[0]),
        .I1(os_count_reg[1]),
        .I2(os_count_reg[3]),
        .I3(os_count_reg[2]),
        .I4(rx_count_reg),
        .O(\rx_buffer[8]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_buffer_reg[1] 
       (.C(clk),
        .CE(rx_buffer),
        .D(p_0_in[1]),
        .Q(p_0_in[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_buffer_reg[2] 
       (.C(clk),
        .CE(rx_buffer),
        .D(p_0_in[2]),
        .Q(p_0_in[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_buffer_reg[3] 
       (.C(clk),
        .CE(rx_buffer),
        .D(p_0_in[3]),
        .Q(p_0_in[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_buffer_reg[4] 
       (.C(clk),
        .CE(rx_buffer),
        .D(p_0_in[4]),
        .Q(p_0_in[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_buffer_reg[5] 
       (.C(clk),
        .CE(rx_buffer),
        .D(p_0_in[5]),
        .Q(p_0_in[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_buffer_reg[6] 
       (.C(clk),
        .CE(rx_buffer),
        .D(p_0_in[6]),
        .Q(p_0_in[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_buffer_reg[7] 
       (.C(clk),
        .CE(rx_buffer),
        .D(p_0_in[7]),
        .Q(p_0_in[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_buffer_reg[8] 
       (.C(clk),
        .CE(rx_buffer),
        .D(\rx_buffer[8]_i_2_n_0 ),
        .Q(p_0_in[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \rx_count[0]_i_1 
       (.I0(\rx_count_reg_n_0_[0] ),
        .O(p_0_in__2[0]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rx_count[1]_i_1 
       (.I0(\rx_count_reg_n_0_[0] ),
        .I1(\rx_count_reg_n_0_[1] ),
        .O(p_0_in__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \rx_count[2]_i_1 
       (.I0(\rx_count_reg_n_0_[0] ),
        .I1(\rx_count_reg_n_0_[1] ),
        .I2(\rx_count_reg_n_0_[2] ),
        .O(p_0_in__2[2]));
  LUT4 #(
    .INIT(16'h0020)) 
    \rx_count[3]_i_1 
       (.I0(os_pulse),
        .I1(rx_state_reg_n_0),
        .I2(os_count_reg[3]),
        .I3(rx),
        .O(rx_done0_out));
  LUT3 #(
    .INIT(8'h80)) 
    \rx_count[3]_i_2 
       (.I0(os_pulse),
        .I1(\rx_buffer[8]_i_3_n_0 ),
        .I2(rx_state_reg_n_0),
        .O(rx_count));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \rx_count[3]_i_3 
       (.I0(\rx_count_reg_n_0_[1] ),
        .I1(\rx_count_reg_n_0_[0] ),
        .I2(\rx_count_reg_n_0_[2] ),
        .I3(rx_count_reg),
        .O(p_0_in__2[3]));
  FDRE #(
    .INIT(1'b0)) 
    \rx_count_reg[0] 
       (.C(clk),
        .CE(rx_count),
        .D(p_0_in__2[0]),
        .Q(\rx_count_reg_n_0_[0] ),
        .R(rx_done0_out));
  FDRE #(
    .INIT(1'b0)) 
    \rx_count_reg[1] 
       (.C(clk),
        .CE(rx_count),
        .D(p_0_in__2[1]),
        .Q(\rx_count_reg_n_0_[1] ),
        .R(rx_done0_out));
  FDRE #(
    .INIT(1'b0)) 
    \rx_count_reg[2] 
       (.C(clk),
        .CE(rx_count),
        .D(p_0_in__2[2]),
        .Q(\rx_count_reg_n_0_[2] ),
        .R(rx_done0_out));
  FDRE #(
    .INIT(1'b0)) 
    \rx_count_reg[3] 
       (.C(clk),
        .CE(rx_count),
        .D(p_0_in__2[3]),
        .Q(rx_count_reg),
        .R(rx_done0_out));
  LUT4 #(
    .INIT(16'h0800)) 
    \rx_data[7]_i_1 
       (.I0(os_pulse),
        .I1(rx_count_reg),
        .I2(\rx_data[7]_i_2_n_0 ),
        .I3(rx_state_reg_n_0),
        .O(\rx_data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \rx_data[7]_i_2 
       (.I0(os_count_reg[2]),
        .I1(os_count_reg[3]),
        .I2(os_count_reg[1]),
        .I3(os_count_reg[0]),
        .O(\rx_data[7]_i_2_n_0 ));
  FDRE \rx_data_reg[0] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(p_0_in[0]),
        .Q(rx_data[0]),
        .R(1'b0));
  FDRE \rx_data_reg[1] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(p_0_in[1]),
        .Q(rx_data[1]),
        .R(1'b0));
  FDRE \rx_data_reg[2] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(p_0_in[2]),
        .Q(rx_data[2]),
        .R(1'b0));
  FDRE \rx_data_reg[3] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(p_0_in[3]),
        .Q(rx_data[3]),
        .R(1'b0));
  FDRE \rx_data_reg[4] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(p_0_in[4]),
        .Q(rx_data[4]),
        .R(1'b0));
  FDRE \rx_data_reg[5] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(p_0_in[5]),
        .Q(rx_data[5]),
        .R(1'b0));
  FDRE \rx_data_reg[6] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(p_0_in[6]),
        .Q(rx_data[6]),
        .R(1'b0));
  FDRE \rx_data_reg[7] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(p_0_in[7]),
        .Q(rx_data[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hEEEEE0EEEEEEEEEE)) 
    rx_done_i_1
       (.I0(rx_done),
        .I1(\rx_data[7]_i_1_n_0 ),
        .I2(rx),
        .I3(os_count_reg[3]),
        .I4(rx_state_reg_n_0),
        .I5(os_pulse),
        .O(rx_done_i_1_n_0));
  FDRE rx_done_reg
       (.C(clk),
        .CE(1'b1),
        .D(rx_done_i_1_n_0),
        .Q(rx_done),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBBBBFFFF00F00000)) 
    rx_state_i_1
       (.I0(\rx_data[7]_i_2_n_0 ),
        .I1(rx_count_reg),
        .I2(os_count_reg[3]),
        .I3(rx),
        .I4(os_pulse),
        .I5(rx_state_reg_n_0),
        .O(rx_state_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_state_reg
       (.C(clk),
        .CE(1'b1),
        .D(rx_state_i_1_n_0),
        .Q(rx_state_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hCFAACAAAAFAAAAAA)) 
    \tx_buffer[0]_i_1 
       (.I0(\tx_buffer_reg_n_0_[0] ),
        .I1(\tx_buffer_reg_n_0_[1] ),
        .I2(tx_state),
        .I3(crypto_done),
        .I4(tx_ena),
        .I5(baud_pulse),
        .O(\tx_buffer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tx_buffer[1]_i_1 
       (.I0(tx_state),
        .I1(\tx_buffer_reg_n_0_[2] ),
        .O(\tx_buffer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_buffer[2]_i_1 
       (.I0(\tx_buffer_reg_n_0_[3] ),
        .I1(tx_state),
        .I2(tx_data[0]),
        .O(\tx_buffer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_buffer[3]_i_1 
       (.I0(\tx_buffer_reg_n_0_[4] ),
        .I1(tx_state),
        .I2(tx_data[1]),
        .O(\tx_buffer[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_buffer[4]_i_1 
       (.I0(\tx_buffer_reg_n_0_[5] ),
        .I1(tx_state),
        .I2(tx_data[2]),
        .O(\tx_buffer[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_buffer[5]_i_1 
       (.I0(\tx_buffer_reg_n_0_[6] ),
        .I1(tx_state),
        .I2(tx_data[3]),
        .O(\tx_buffer[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_buffer[6]_i_1 
       (.I0(\tx_buffer_reg_n_0_[7] ),
        .I1(tx_state),
        .I2(tx_data[4]),
        .O(\tx_buffer[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_buffer[7]_i_1 
       (.I0(\tx_buffer_reg_n_0_[8] ),
        .I1(tx_state),
        .I2(tx_data[5]),
        .O(\tx_buffer[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hA820)) 
    \tx_buffer[8]_i_1 
       (.I0(crypto_done),
        .I1(tx_state),
        .I2(tx_ena),
        .I3(baud_pulse),
        .O(tx_buffer));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_buffer[8]_i_2 
       (.I0(\tx_buffer_reg_n_0_[9] ),
        .I1(tx_state),
        .I2(tx_data[6]),
        .O(\tx_buffer[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFACAFAAAAACAAAAA)) 
    \tx_buffer[9]_i_1 
       (.I0(\tx_buffer_reg_n_0_[9] ),
        .I1(tx_data[7]),
        .I2(crypto_done),
        .I3(tx_state),
        .I4(tx_ena),
        .I5(baud_pulse),
        .O(\tx_buffer[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \tx_buffer_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\tx_buffer[0]_i_1_n_0 ),
        .Q(\tx_buffer_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \tx_buffer_reg[1] 
       (.C(clk),
        .CE(tx_buffer),
        .D(\tx_buffer[1]_i_1_n_0 ),
        .Q(\tx_buffer_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \tx_buffer_reg[2] 
       (.C(clk),
        .CE(tx_buffer),
        .D(\tx_buffer[2]_i_1_n_0 ),
        .Q(\tx_buffer_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \tx_buffer_reg[3] 
       (.C(clk),
        .CE(tx_buffer),
        .D(\tx_buffer[3]_i_1_n_0 ),
        .Q(\tx_buffer_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \tx_buffer_reg[4] 
       (.C(clk),
        .CE(tx_buffer),
        .D(\tx_buffer[4]_i_1_n_0 ),
        .Q(\tx_buffer_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \tx_buffer_reg[5] 
       (.C(clk),
        .CE(tx_buffer),
        .D(\tx_buffer[5]_i_1_n_0 ),
        .Q(\tx_buffer_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \tx_buffer_reg[6] 
       (.C(clk),
        .CE(tx_buffer),
        .D(\tx_buffer[6]_i_1_n_0 ),
        .Q(\tx_buffer_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \tx_buffer_reg[7] 
       (.C(clk),
        .CE(tx_buffer),
        .D(\tx_buffer[7]_i_1_n_0 ),
        .Q(\tx_buffer_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \tx_buffer_reg[8] 
       (.C(clk),
        .CE(tx_buffer),
        .D(\tx_buffer[8]_i_2_n_0 ),
        .Q(\tx_buffer_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \tx_buffer_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\tx_buffer[9]_i_1_n_0 ),
        .Q(\tx_buffer_reg_n_0_[9] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \tx_count[0]_i_1 
       (.I0(tx_count_reg[0]),
        .I1(baud_pulse),
        .O(tx_count[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \tx_count[1]_i_1 
       (.I0(tx_count_reg[0]),
        .I1(baud_pulse),
        .I2(tx_count_reg[1]),
        .O(tx_count[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \tx_count[2]_i_1 
       (.I0(baud_pulse),
        .I1(tx_count_reg[0]),
        .I2(tx_count_reg[1]),
        .I3(tx_count_reg[2]),
        .O(tx_count[2]));
  LUT3 #(
    .INIT(8'h20)) 
    \tx_count[3]_i_1 
       (.I0(crypto_done),
        .I1(tx_state),
        .I2(tx_ena),
        .O(tx_ready6_out));
  LUT2 #(
    .INIT(4'h8)) 
    \tx_count[3]_i_2 
       (.I0(crypto_done),
        .I1(tx_state),
        .O(\tx_count[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \tx_count[3]_i_3 
       (.I0(tx_count_reg[1]),
        .I1(tx_count_reg[0]),
        .I2(baud_pulse),
        .I3(tx_count_reg[2]),
        .I4(tx_count_reg[3]),
        .O(tx_count[3]));
  FDRE #(
    .INIT(1'b0)) 
    \tx_count_reg[0] 
       (.C(clk),
        .CE(\tx_count[3]_i_2_n_0 ),
        .D(tx_count[0]),
        .Q(tx_count_reg[0]),
        .R(tx_ready6_out));
  FDRE #(
    .INIT(1'b0)) 
    \tx_count_reg[1] 
       (.C(clk),
        .CE(\tx_count[3]_i_2_n_0 ),
        .D(tx_count[1]),
        .Q(tx_count_reg[1]),
        .R(tx_ready6_out));
  FDRE #(
    .INIT(1'b0)) 
    \tx_count_reg[2] 
       (.C(clk),
        .CE(\tx_count[3]_i_2_n_0 ),
        .D(tx_count[2]),
        .Q(tx_count_reg[2]),
        .R(tx_ready6_out));
  FDRE #(
    .INIT(1'b0)) 
    \tx_count_reg[3] 
       (.C(clk),
        .CE(\tx_count[3]_i_2_n_0 ),
        .D(tx_count[3]),
        .Q(tx_count_reg[3]),
        .R(tx_ready6_out));
  LUT3 #(
    .INIT(8'hB8)) 
    tx_i_1
       (.I0(\tx_buffer_reg_n_0_[0] ),
        .I1(crypto_done),
        .I2(tx),
        .O(tx_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hA3AA)) 
    tx_ready_i_1
       (.I0(tx_ready),
        .I1(tx_ena),
        .I2(tx_state),
        .I3(crypto_done),
        .O(tx_ready_i_1_n_0));
  FDRE tx_ready_reg
       (.C(clk),
        .CE(1'b1),
        .D(tx_ready_i_1_n_0),
        .Q(tx_ready),
        .R(1'b0));
  FDRE tx_reg
       (.C(clk),
        .CE(1'b1),
        .D(tx_i_1_n_0),
        .Q(tx),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hAFC0)) 
    tx_state_i_1
       (.I0(tx_state_i_2_n_0),
        .I1(tx_ena),
        .I2(crypto_done),
        .I3(tx_state),
        .O(tx_state_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hD5577777)) 
    tx_state_i_2
       (.I0(tx_count_reg[3]),
        .I1(tx_count_reg[2]),
        .I2(baud_pulse),
        .I3(tx_count_reg[0]),
        .I4(tx_count_reg[1]),
        .O(tx_state_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tx_state_reg
       (.C(clk),
        .CE(1'b1),
        .D(tx_state_i_1_n_0),
        .Q(tx_state),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
