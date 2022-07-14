// -------------------------------------------------------------
// 
// File Name: hdlsrc_V5\untitled\Subsystem4.v
// Created: 2022-06-11 22:31:21
// 
// Generated by MATLAB 9.12 and HDL Coder 3.20
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Subsystem4
// Source Path: untitled/serial_lpf/Subsystem4
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Subsystem4
          (In1,
           In2,
           In3,
           In4,
           Out1);


  input   signed [15:0] In1;  // sfix16_En10
  input   signed [15:0] In2;  // sfix16_En10
  input   signed [15:0] In3;  // sfix16_En10
  input   signed [34:0] In4;  // sfix35_En20
  output  signed [34:0] Out1;  // sfix35_En20


  wire signed [16:0] a1_add_cast;  // sfix17_En10
  wire signed [16:0] a1_add_cast_1;  // sfix17_En10
  wire signed [16:0] a1_out1;  // sfix17_En10
  wire signed [32:0] m1_out1;  // sfix33_En20
  wire signed [34:0] a7_add_cast;  // sfix35_En20
  wire signed [34:0] a7_out1;  // sfix35_En20


  assign a1_add_cast = {In1[15], In1};
  assign a1_add_cast_1 = {In2[15], In2};
  assign a1_out1 = a1_add_cast + a1_add_cast_1;


  assign m1_out1 = a1_out1 * In3;


  assign a7_add_cast = {{2{m1_out1[32]}}, m1_out1};
  assign a7_out1 = In4 + a7_add_cast;


  assign Out1 = a7_out1;

endmodule  // Subsystem4

