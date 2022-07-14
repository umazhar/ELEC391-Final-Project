// ------------------------------------------------------------
// 
// File Name: hdlsrc\RaisedCosine\FIR_Interpolation
// Created: 2022-06-15 13:39:51
// Generated by MATLAB 9.12 and HDL Coder 3.20
// 
// ------------------------------------------------------------
// 
// 
// ------------------------------------------------------------
// 
// Module: FIR_Interpolation
// Source Path: /FIR_Interpolation
// 
// ------------------------------------------------------------
// 
// HDL Implementation    : Fully parallel
// Folding Factor        : 1
// Multipliers           : 17



`timescale 1 ns / 1 ns

module FIR_Interpolation
               (
                clk,
                enb_1_25000000_1,
                reset,
                FIR_Interpolation_in,
                FIR_Interpolation_out
                );

  input   clk; 
  input   enb_1_25000000_1; 
  input   reset; 
  input   signed [15:0] FIR_Interpolation_in; //sfix16_En12
  output  signed [15:0] FIR_Interpolation_out; //sfix16_En12

////////////////////////////////////////////////////////////////
//Module Architecture: FIR_Interpolation
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  parameter signed [15:0] coeffphase1_1 = 16'b1111111111010000; //sfix16_En15
  parameter signed [15:0] coeffphase1_2 = 16'b1111111111101101; //sfix16_En15
  parameter signed [15:0] coeffphase1_3 = 16'b0000000010000010; //sfix16_En15
  parameter signed [15:0] coeffphase1_4 = 16'b1111111011101010; //sfix16_En15
  parameter signed [15:0] coeffphase1_5 = 16'b0000000111000000; //sfix16_En15
  parameter signed [15:0] coeffphase1_6 = 16'b1111110110010110; //sfix16_En15
  parameter signed [15:0] coeffphase1_7 = 16'b0000001011111011; //sfix16_En15
  parameter signed [15:0] coeffphase1_8 = 16'b1111110010100011; //sfix16_En15
  parameter signed [15:0] coeffphase1_9 = 16'b0100001110000000; //sfix16_En15
  parameter signed [15:0] coeffphase1_10 = 16'b1111110010100011; //sfix16_En15
  parameter signed [15:0] coeffphase1_11 = 16'b0000001011111011; //sfix16_En15
  parameter signed [15:0] coeffphase1_12 = 16'b1111110110010110; //sfix16_En15
  parameter signed [15:0] coeffphase1_13 = 16'b0000000111000000; //sfix16_En15
  parameter signed [15:0] coeffphase1_14 = 16'b1111111011101010; //sfix16_En15
  parameter signed [15:0] coeffphase1_15 = 16'b0000000010000010; //sfix16_En15
  parameter signed [15:0] coeffphase1_16 = 16'b1111111111101101; //sfix16_En15
  parameter signed [15:0] coeffphase1_17 = 16'b1111111111010000; //sfix16_En15
  parameter signed [15:0] coeffphase2_1 = 16'b0000000000110111; //sfix16_En15
  parameter signed [15:0] coeffphase2_2 = 16'b1111111110001101; //sfix16_En15
  parameter signed [15:0] coeffphase2_3 = 16'b0000000010011010; //sfix16_En15
  parameter signed [15:0] coeffphase2_4 = 16'b1111111101111010; //sfix16_En15
  parameter signed [15:0] coeffphase2_5 = 16'b0000000000000000; //sfix16_En15
  parameter signed [15:0] coeffphase2_6 = 16'b0000000101011100; //sfix16_En15
  parameter signed [15:0] coeffphase2_7 = 16'b1111101101100011; //sfix16_En15
  parameter signed [15:0] coeffphase2_8 = 16'b0001000000100110; //sfix16_En15
  parameter signed [15:0] coeffphase2_9 = 16'b0011101111100000; //sfix16_En15
  parameter signed [15:0] coeffphase2_10 = 16'b1111001100110011; //sfix16_En15
  parameter signed [15:0] coeffphase2_11 = 16'b0000011010100111; //sfix16_En15
  parameter signed [15:0] coeffphase2_12 = 16'b1111110001000110; //sfix16_En15
  parameter signed [15:0] coeffphase2_13 = 16'b0000000111100110; //sfix16_En15
  parameter signed [15:0] coeffphase2_14 = 16'b1111111101001010; //sfix16_En15
  parameter signed [15:0] coeffphase2_15 = 16'b0000000000000000; //sfix16_En15
  parameter signed [15:0] coeffphase2_16 = 16'b0000000001011000; //sfix16_En15
  parameter signed [15:0] coeffphase2_17 = 16'b0000000000000000; //sfix16_En15
  parameter signed [15:0] coeffphase3_1 = 16'b0000000001110111; //sfix16_En15
  parameter signed [15:0] coeffphase3_2 = 16'b1111111110010000; //sfix16_En15
  parameter signed [15:0] coeffphase3_3 = 16'b0000000000010101; //sfix16_En15
  parameter signed [15:0] coeffphase3_4 = 16'b0000000011001000; //sfix16_En15
  parameter signed [15:0] coeffphase3_5 = 16'b1111110110010010; //sfix16_En15
  parameter signed [15:0] coeffphase3_6 = 16'b0000010101101111; //sfix16_En15
  parameter signed [15:0] coeffphase3_7 = 16'b1111010000101101; //sfix16_En15
  parameter signed [15:0] coeffphase3_8 = 16'b0010100000100011; //sfix16_En15
  parameter signed [15:0] coeffphase3_9 = 16'b0010100000100011; //sfix16_En15
  parameter signed [15:0] coeffphase3_10 = 16'b1111010000101101; //sfix16_En15
  parameter signed [15:0] coeffphase3_11 = 16'b0000010101101111; //sfix16_En15
  parameter signed [15:0] coeffphase3_12 = 16'b1111110110010010; //sfix16_En15
  parameter signed [15:0] coeffphase3_13 = 16'b0000000011001000; //sfix16_En15
  parameter signed [15:0] coeffphase3_14 = 16'b0000000000010101; //sfix16_En15
  parameter signed [15:0] coeffphase3_15 = 16'b1111111110010000; //sfix16_En15
  parameter signed [15:0] coeffphase3_16 = 16'b0000000001110111; //sfix16_En15
  parameter signed [15:0] coeffphase3_17 = 16'b0000000000000000; //sfix16_En15
  parameter signed [15:0] coeffphase4_1 = 16'b0000000001011000; //sfix16_En15
  parameter signed [15:0] coeffphase4_2 = 16'b0000000000000000; //sfix16_En15
  parameter signed [15:0] coeffphase4_3 = 16'b1111111101001010; //sfix16_En15
  parameter signed [15:0] coeffphase4_4 = 16'b0000000111100110; //sfix16_En15
  parameter signed [15:0] coeffphase4_5 = 16'b1111110001000110; //sfix16_En15
  parameter signed [15:0] coeffphase4_6 = 16'b0000011010100111; //sfix16_En15
  parameter signed [15:0] coeffphase4_7 = 16'b1111001100110011; //sfix16_En15
  parameter signed [15:0] coeffphase4_8 = 16'b0011101111100000; //sfix16_En15
  parameter signed [15:0] coeffphase4_9 = 16'b0001000000100110; //sfix16_En15
  parameter signed [15:0] coeffphase4_10 = 16'b1111101101100011; //sfix16_En15
  parameter signed [15:0] coeffphase4_11 = 16'b0000000101011100; //sfix16_En15
  parameter signed [15:0] coeffphase4_12 = 16'b0000000000000000; //sfix16_En15
  parameter signed [15:0] coeffphase4_13 = 16'b1111111101111010; //sfix16_En15
  parameter signed [15:0] coeffphase4_14 = 16'b0000000010011010; //sfix16_En15
  parameter signed [15:0] coeffphase4_15 = 16'b1111111110001101; //sfix16_En15
  parameter signed [15:0] coeffphase4_16 = 16'b0000000000110111; //sfix16_En15
  parameter signed [15:0] coeffphase4_17 = 16'b0000000000000000; //sfix16_En15

  // Signals
  reg  [1:0] cur_count; // ufix2
  wire phase_3; // boolean
  reg  signed [15:0] delay_pipeline [0:15] ; // sfix16_En12
  wire signed [31:0] product; // sfix32_En27
  wire signed [15:0] product_mux; // sfix16_En15
  wire signed [31:0] product_1; // sfix32_En27
  wire signed [15:0] product_mux_1; // sfix16_En15
  wire signed [31:0] product_2; // sfix32_En27
  wire signed [15:0] product_mux_2; // sfix16_En15
  wire signed [31:0] product_3; // sfix32_En27
  wire signed [15:0] product_mux_3; // sfix16_En15
  wire signed [31:0] product_4; // sfix32_En27
  wire signed [15:0] product_mux_4; // sfix16_En15
  wire signed [31:0] product_5; // sfix32_En27
  wire signed [15:0] product_mux_5; // sfix16_En15
  wire signed [31:0] product_6; // sfix32_En27
  wire signed [15:0] product_mux_6; // sfix16_En15
  wire signed [31:0] product_7; // sfix32_En27
  wire signed [15:0] product_mux_7; // sfix16_En15
  wire signed [31:0] product_8; // sfix32_En27
  wire signed [15:0] product_mux_8; // sfix16_En15
  wire signed [31:0] product_9; // sfix32_En27
  wire signed [15:0] product_mux_9; // sfix16_En15
  wire signed [31:0] product_10; // sfix32_En27
  wire signed [15:0] product_mux_10; // sfix16_En15
  wire signed [31:0] product_11; // sfix32_En27
  wire signed [15:0] product_mux_11; // sfix16_En15
  wire signed [31:0] product_12; // sfix32_En27
  wire signed [15:0] product_mux_12; // sfix16_En15
  wire signed [31:0] product_13; // sfix32_En27
  wire signed [15:0] product_mux_13; // sfix16_En15
  wire signed [31:0] product_14; // sfix32_En27
  wire signed [15:0] product_mux_14; // sfix16_En15
  wire signed [31:0] product_15; // sfix32_En27
  wire signed [15:0] product_mux_15; // sfix16_En15
  wire signed [31:0] product_16; // sfix32_En27
  wire signed [15:0] product_mux_16; // sfix16_En15
  wire signed [31:0] sum1; // sfix32_En27
  wire signed [31:0] add_cast; // sfix32_En27
  wire signed [31:0] add_cast_1; // sfix32_En27
  wire signed [32:0] add_temp; // sfix33_En27
  wire signed [31:0] sum2; // sfix32_En27
  wire signed [31:0] add_cast_2; // sfix32_En27
  wire signed [31:0] add_cast_3; // sfix32_En27
  wire signed [32:0] add_temp_1; // sfix33_En27
  wire signed [31:0] sum3; // sfix32_En27
  wire signed [31:0] add_cast_4; // sfix32_En27
  wire signed [31:0] add_cast_5; // sfix32_En27
  wire signed [32:0] add_temp_2; // sfix33_En27
  wire signed [31:0] sum4; // sfix32_En27
  wire signed [31:0] add_cast_6; // sfix32_En27
  wire signed [31:0] add_cast_7; // sfix32_En27
  wire signed [32:0] add_temp_3; // sfix33_En27
  wire signed [31:0] sum5; // sfix32_En27
  wire signed [31:0] add_cast_8; // sfix32_En27
  wire signed [31:0] add_cast_9; // sfix32_En27
  wire signed [32:0] add_temp_4; // sfix33_En27
  wire signed [31:0] sum6; // sfix32_En27
  wire signed [31:0] add_cast_10; // sfix32_En27
  wire signed [31:0] add_cast_11; // sfix32_En27
  wire signed [32:0] add_temp_5; // sfix33_En27
  wire signed [31:0] sum7; // sfix32_En27
  wire signed [31:0] add_cast_12; // sfix32_En27
  wire signed [31:0] add_cast_13; // sfix32_En27
  wire signed [32:0] add_temp_6; // sfix33_En27
  wire signed [31:0] sum8; // sfix32_En27
  wire signed [31:0] add_cast_14; // sfix32_En27
  wire signed [31:0] add_cast_15; // sfix32_En27
  wire signed [32:0] add_temp_7; // sfix33_En27
  wire signed [31:0] sum9; // sfix32_En27
  wire signed [31:0] add_cast_16; // sfix32_En27
  wire signed [31:0] add_cast_17; // sfix32_En27
  wire signed [32:0] add_temp_8; // sfix33_En27
  wire signed [31:0] sum10; // sfix32_En27
  wire signed [31:0] add_cast_18; // sfix32_En27
  wire signed [31:0] add_cast_19; // sfix32_En27
  wire signed [32:0] add_temp_9; // sfix33_En27
  wire signed [31:0] sum11; // sfix32_En27
  wire signed [31:0] add_cast_20; // sfix32_En27
  wire signed [31:0] add_cast_21; // sfix32_En27
  wire signed [32:0] add_temp_10; // sfix33_En27
  wire signed [31:0] sum12; // sfix32_En27
  wire signed [31:0] add_cast_22; // sfix32_En27
  wire signed [31:0] add_cast_23; // sfix32_En27
  wire signed [32:0] add_temp_11; // sfix33_En27
  wire signed [31:0] sum13; // sfix32_En27
  wire signed [31:0] add_cast_24; // sfix32_En27
  wire signed [31:0] add_cast_25; // sfix32_En27
  wire signed [32:0] add_temp_12; // sfix33_En27
  wire signed [31:0] sum14; // sfix32_En27
  wire signed [31:0] add_cast_26; // sfix32_En27
  wire signed [31:0] add_cast_27; // sfix32_En27
  wire signed [32:0] add_temp_13; // sfix33_En27
  wire signed [31:0] sum15; // sfix32_En27
  wire signed [31:0] add_cast_28; // sfix32_En27
  wire signed [31:0] add_cast_29; // sfix32_En27
  wire signed [32:0] add_temp_14; // sfix33_En27
  wire signed [31:0] sum16; // sfix32_En27
  wire signed [31:0] add_cast_30; // sfix32_En27
  wire signed [31:0] add_cast_31; // sfix32_En27
  wire signed [32:0] add_temp_15; // sfix33_En27
  wire signed [15:0] output_typeconvert; // sfix16_En12
  reg  signed [15:0] regout; // sfix16_En12
  wire signed [15:0] muxout; // sfix16_En12

  // Block Statements
  always @ (posedge clk or posedge reset)
    begin: ce_output
      if (reset == 1'b1) begin
        cur_count <= 2'b00;
      end
      else begin
        if (enb_1_25000000_1 == 1'b1) begin
          if (cur_count >= 2'b11) begin
            cur_count <= 2'b00;
          end
          else begin
            cur_count <= cur_count + 2'b01;
          end
        end
      end
    end // ce_output

  assign  phase_3 = (cur_count == 2'b11 && enb_1_25000000_1 == 1'b1) ? 1'b1 : 1'b0;

  //   ---------------- Delay Registers ----------------

  always @( posedge clk or posedge reset)
    begin: Delay_Pipeline_process
      if (reset == 1'b1) begin
        delay_pipeline[0] <= 0;
        delay_pipeline[1] <= 0;
        delay_pipeline[2] <= 0;
        delay_pipeline[3] <= 0;
        delay_pipeline[4] <= 0;
        delay_pipeline[5] <= 0;
        delay_pipeline[6] <= 0;
        delay_pipeline[7] <= 0;
        delay_pipeline[8] <= 0;
        delay_pipeline[9] <= 0;
        delay_pipeline[10] <= 0;
        delay_pipeline[11] <= 0;
        delay_pipeline[12] <= 0;
        delay_pipeline[13] <= 0;
        delay_pipeline[14] <= 0;
        delay_pipeline[15] <= 0;
      end
      else begin
        if (phase_3 == 1'b1) begin
          delay_pipeline[0] <= FIR_Interpolation_in;
          delay_pipeline[1] <= delay_pipeline[0];
          delay_pipeline[2] <= delay_pipeline[1];
          delay_pipeline[3] <= delay_pipeline[2];
          delay_pipeline[4] <= delay_pipeline[3];
          delay_pipeline[5] <= delay_pipeline[4];
          delay_pipeline[6] <= delay_pipeline[5];
          delay_pipeline[7] <= delay_pipeline[6];
          delay_pipeline[8] <= delay_pipeline[7];
          delay_pipeline[9] <= delay_pipeline[8];
          delay_pipeline[10] <= delay_pipeline[9];
          delay_pipeline[11] <= delay_pipeline[10];
          delay_pipeline[12] <= delay_pipeline[11];
          delay_pipeline[13] <= delay_pipeline[12];
          delay_pipeline[14] <= delay_pipeline[13];
          delay_pipeline[15] <= delay_pipeline[14];
        end
      end
    end // Delay_Pipeline_process


  assign product_mux = (cur_count == 2'b00) ? coeffphase1_17 :
                      (cur_count == 2'b01) ? coeffphase2_17 :
                      (cur_count == 2'b10) ? coeffphase3_17 :
                      coeffphase4_17;
  assign product = delay_pipeline[15] * product_mux;

  assign product_mux_1 = (cur_count == 2'b00) ? coeffphase1_16 :
                        (cur_count == 2'b01) ? coeffphase2_16 :
                        (cur_count == 2'b10) ? coeffphase3_16 :
                        coeffphase4_16;
  assign product_1 = delay_pipeline[14] * product_mux_1;

  assign product_mux_2 = (cur_count == 2'b00) ? coeffphase1_15 :
                        (cur_count == 2'b01) ? coeffphase2_15 :
                        (cur_count == 2'b10) ? coeffphase3_15 :
                        coeffphase4_15;
  assign product_2 = delay_pipeline[13] * product_mux_2;

  assign product_mux_3 = (cur_count == 2'b00) ? coeffphase1_14 :
                        (cur_count == 2'b01) ? coeffphase2_14 :
                        (cur_count == 2'b10) ? coeffphase3_14 :
                        coeffphase4_14;
  assign product_3 = delay_pipeline[12] * product_mux_3;

  assign product_mux_4 = (cur_count == 2'b00) ? coeffphase1_13 :
                        (cur_count == 2'b01) ? coeffphase2_13 :
                        (cur_count == 2'b10) ? coeffphase3_13 :
                        coeffphase4_13;
  assign product_4 = delay_pipeline[11] * product_mux_4;

  assign product_mux_5 = (cur_count == 2'b00) ? coeffphase1_12 :
                        (cur_count == 2'b01) ? coeffphase2_12 :
                        (cur_count == 2'b10) ? coeffphase3_12 :
                        coeffphase4_12;
  assign product_5 = delay_pipeline[10] * product_mux_5;

  assign product_mux_6 = (cur_count == 2'b00) ? coeffphase1_11 :
                        (cur_count == 2'b01) ? coeffphase2_11 :
                        (cur_count == 2'b10) ? coeffphase3_11 :
                        coeffphase4_11;
  assign product_6 = delay_pipeline[9] * product_mux_6;

  assign product_mux_7 = (cur_count == 2'b00) ? coeffphase1_10 :
                        (cur_count == 2'b01) ? coeffphase2_10 :
                        (cur_count == 2'b10) ? coeffphase3_10 :
                        coeffphase4_10;
  assign product_7 = delay_pipeline[8] * product_mux_7;

  assign product_mux_8 = (cur_count == 2'b00) ? coeffphase1_9 :
                        (cur_count == 2'b01) ? coeffphase2_9 :
                        (cur_count == 2'b10) ? coeffphase3_9 :
                        coeffphase4_9;
  assign product_8 = delay_pipeline[7] * product_mux_8;

  assign product_mux_9 = (cur_count == 2'b00) ? coeffphase1_8 :
                        (cur_count == 2'b01) ? coeffphase2_8 :
                        (cur_count == 2'b10) ? coeffphase3_8 :
                        coeffphase4_8;
  assign product_9 = delay_pipeline[6] * product_mux_9;

  assign product_mux_10 = (cur_count == 2'b00) ? coeffphase1_7 :
                         (cur_count == 2'b01) ? coeffphase2_7 :
                         (cur_count == 2'b10) ? coeffphase3_7 :
                         coeffphase4_7;
  assign product_10 = delay_pipeline[5] * product_mux_10;

  assign product_mux_11 = (cur_count == 2'b00) ? coeffphase1_6 :
                         (cur_count == 2'b01) ? coeffphase2_6 :
                         (cur_count == 2'b10) ? coeffphase3_6 :
                         coeffphase4_6;
  assign product_11 = delay_pipeline[4] * product_mux_11;

  assign product_mux_12 = (cur_count == 2'b00) ? coeffphase1_5 :
                         (cur_count == 2'b01) ? coeffphase2_5 :
                         (cur_count == 2'b10) ? coeffphase3_5 :
                         coeffphase4_5;
  assign product_12 = delay_pipeline[3] * product_mux_12;

  assign product_mux_13 = (cur_count == 2'b00) ? coeffphase1_4 :
                         (cur_count == 2'b01) ? coeffphase2_4 :
                         (cur_count == 2'b10) ? coeffphase3_4 :
                         coeffphase4_4;
  assign product_13 = delay_pipeline[2] * product_mux_13;

  assign product_mux_14 = (cur_count == 2'b00) ? coeffphase1_3 :
                         (cur_count == 2'b01) ? coeffphase2_3 :
                         (cur_count == 2'b10) ? coeffphase3_3 :
                         coeffphase4_3;
  assign product_14 = delay_pipeline[1] * product_mux_14;

  assign product_mux_15 = (cur_count == 2'b00) ? coeffphase1_2 :
                         (cur_count == 2'b01) ? coeffphase2_2 :
                         (cur_count == 2'b10) ? coeffphase3_2 :
                         coeffphase4_2;
  assign product_15 = delay_pipeline[0] * product_mux_15;

  assign product_mux_16 = (cur_count == 2'b00) ? coeffphase1_1 :
                         (cur_count == 2'b01) ? coeffphase2_1 :
                         (cur_count == 2'b10) ? coeffphase3_1 :
                         coeffphase4_1;
  assign product_16 = FIR_Interpolation_in * product_mux_16;

  assign add_cast = product_16;
  assign add_cast_1 = product_15;
  assign add_temp = add_cast + add_cast_1;
  assign sum1 = add_temp[31:0];

  assign add_cast_2 = sum1;
  assign add_cast_3 = product_14;
  assign add_temp_1 = add_cast_2 + add_cast_3;
  assign sum2 = add_temp_1[31:0];

  assign add_cast_4 = sum2;
  assign add_cast_5 = product_13;
  assign add_temp_2 = add_cast_4 + add_cast_5;
  assign sum3 = add_temp_2[31:0];

  assign add_cast_6 = sum3;
  assign add_cast_7 = product_12;
  assign add_temp_3 = add_cast_6 + add_cast_7;
  assign sum4 = add_temp_3[31:0];

  assign add_cast_8 = sum4;
  assign add_cast_9 = product_11;
  assign add_temp_4 = add_cast_8 + add_cast_9;
  assign sum5 = add_temp_4[31:0];

  assign add_cast_10 = sum5;
  assign add_cast_11 = product_10;
  assign add_temp_5 = add_cast_10 + add_cast_11;
  assign sum6 = add_temp_5[31:0];

  assign add_cast_12 = sum6;
  assign add_cast_13 = product_9;
  assign add_temp_6 = add_cast_12 + add_cast_13;
  assign sum7 = add_temp_6[31:0];

  assign add_cast_14 = sum7;
  assign add_cast_15 = product_8;
  assign add_temp_7 = add_cast_14 + add_cast_15;
  assign sum8 = add_temp_7[31:0];

  assign add_cast_16 = sum8;
  assign add_cast_17 = product_7;
  assign add_temp_8 = add_cast_16 + add_cast_17;
  assign sum9 = add_temp_8[31:0];

  assign add_cast_18 = sum9;
  assign add_cast_19 = product_6;
  assign add_temp_9 = add_cast_18 + add_cast_19;
  assign sum10 = add_temp_9[31:0];

  assign add_cast_20 = sum10;
  assign add_cast_21 = product_5;
  assign add_temp_10 = add_cast_20 + add_cast_21;
  assign sum11 = add_temp_10[31:0];

  assign add_cast_22 = sum11;
  assign add_cast_23 = product_4;
  assign add_temp_11 = add_cast_22 + add_cast_23;
  assign sum12 = add_temp_11[31:0];

  assign add_cast_24 = sum12;
  assign add_cast_25 = product_3;
  assign add_temp_12 = add_cast_24 + add_cast_25;
  assign sum13 = add_temp_12[31:0];

  assign add_cast_26 = sum13;
  assign add_cast_27 = product_2;
  assign add_temp_13 = add_cast_26 + add_cast_27;
  assign sum14 = add_temp_13[31:0];

  assign add_cast_28 = sum14;
  assign add_cast_29 = product_1;
  assign add_temp_14 = add_cast_28 + add_cast_29;
  assign sum15 = add_temp_14[31:0];

  assign add_cast_30 = sum15;
  assign add_cast_31 = product;
  assign add_temp_15 = add_cast_30 + add_cast_31;
  assign sum16 = add_temp_15[31:0];

  assign output_typeconvert = sum16[30:15];

  always @ (posedge clk or posedge reset)
    begin: DataHoldRegister_process
      if (reset == 1'b1) begin
        regout <= 0;
      end
      else begin
        if (enb_1_25000000_1 == 1'b1) begin
          regout <= output_typeconvert;
        end
      end
    end // DataHoldRegister_process

  assign muxout = (enb_1_25000000_1 == 1'b1) ? output_typeconvert :
            regout;
  // Assignment Statements
  assign FIR_Interpolation_out = muxout;
endmodule  // FIR_Interpolation