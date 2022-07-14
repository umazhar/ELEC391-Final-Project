// -------------------------------------------------------------
// 
// File Name: hdlsrc\RaisedCosine\RaisedCosine.v
// Created: 2022-06-15 12:03:01
// 
// Generated by MATLAB 9.12 and HDL Coder 3.20
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 2e-08
// Target subsystem base rate: 0.02
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        0.1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// Out1                          ce_out        0.1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: RaisedCosine
// Source Path: RaisedCosine
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module RaisedCosine
          (clk,
           reset,
           clk_enable,
           In1,
           ce_out,
           Out1);


  input   clk;
  input   reset;
  input   clk_enable;
  input   signed [15:0] In1;  // sfix16_En12
  output  ce_out;
  output  signed [15:0] Out1;  // sfix16_En12


  wire enb_1_1000000_1;
  wire enb_1_5000000_1;
  wire signed [15:0] Raised_Cosine_Transmit_Filter_out1;  // sfix16_En12
  wire signed [15:0] Raised_Cosine_Receive_Filter_out1;  // sfix16_En12


  RaisedCosine_tc u_RaisedCosine_tc (.clk(clk),
                                     .reset(reset),
                                     .clk_enable(clk_enable),
                                     .enb_1_1000000_1(enb_1_1000000_1),
                                     .enb_1_5000000_1(enb_1_5000000_1)
                                     );

  Raised_Cosine_Transmit_Filter u_Raised_Cosine_Transmit_Filter (.clk(clk),
                                                                 .reset(reset),
                                                                 .enb_1_1000000_1(enb_1_1000000_1),
                                                                 .In1(In1),  // sfix16_En12
                                                                 .Out1(Raised_Cosine_Transmit_Filter_out1)  // sfix16_En12
                                                                 );

  Raised_Cosine_Receive_Filter u_Raised_Cosine_Receive_Filter (.clk(clk),
                                                               .reset(reset),
                                                               .enb_1_1000000_1(enb_1_1000000_1),
                                                               .In1(Raised_Cosine_Transmit_Filter_out1),  // sfix16_En12
                                                               .Out1(Raised_Cosine_Receive_Filter_out1)  // sfix16_En12
                                                               );

  assign Out1 = Raised_Cosine_Receive_Filter_out1;

  assign ce_out = enb_1_5000000_1;

endmodule  // RaisedCosine

