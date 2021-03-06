`timescale 1ps/1ps
module bpsk_mod_tb();
reg clk;
reg rst;
reg[15:0] input_data;
wire[15:0] bpsk_mod_out_re, bpsk_mod_out_im;

BPSK_Modulator_Baseband bpsk_mod(input_data, bpsk_mod_out_re, bpsk_mod_out_im);

initial begin
    rst = 1;
    rst = 0;
    clk = 1; #20;
    forever begin
        clk = ~clk; #20;
    end
end
initial begin
    forever begin
        input_data = 1; #20
	input_data = 0; #20;
   end
end

endmodule