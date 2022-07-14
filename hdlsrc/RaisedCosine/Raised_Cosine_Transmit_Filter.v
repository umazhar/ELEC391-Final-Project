// -------------------------------------------------------------
// 
// File Name: hdlsrc\RaisedCosine\Raised_Cosine_Transmit_Filter.v
// Created: 2022-06-15 13:39:56
// 
// Generated by MATLAB 9.12 and HDL Coder 3.20
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Raised_Cosine_Transmit_Filter
// Source Path: RaisedCosine/Raised Cosine Transmit Filter
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Raised_Cosine_Transmit_Filter
          (clk,
           reset,
           enb_1_25000000_1,
           In1,
           Out1);


  input   clk;
  input   reset;
  input   enb_1_25000000_1;
  input   signed [15:0] In1;  // sfix16_En12
  output  signed [15:0] Out1;  // sfix16_En12


  wire signed [15:0] FIR_Interpolation_out1;  // sfix16_En12


  FIR_Interpolation u_FIR_Interpolation (.clk(clk),
                                         .enb_1_25000000_1(enb_1_25000000_1),
                                         .reset(reset),
                                         .FIR_Interpolation_in(In1),  // sfix16_En12
                                         .FIR_Interpolation_out(FIR_Interpolation_out1)  // sfix16_En12
                                         );

  assign Out1 = FIR_Interpolation_out1;

endmodule  // Raised_Cosine_Transmit_Filter

