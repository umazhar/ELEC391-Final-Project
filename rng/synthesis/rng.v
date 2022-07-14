// rng.v

// Generated using ACDS version 19.1 670

`timescale 1 ps / 1 ps
module rng (
		input  wire        start,          //     call.enable
		input  wire        clock,          //    clock.clk
		output wire [31:0] rand_num_data,  // rand_num.data
		input  wire        rand_num_ready, //         .ready
		output wire        rand_num_valid, //         .valid
		input  wire        resetn          //    reset.reset_n
	);

	rng_rand_gen_0 rand_gen_0 (
		.clock          (clock),          //    clock.clk
		.resetn         (resetn),         //    reset.reset_n
		.rand_num_data  (rand_num_data),  // rand_num.data
		.rand_num_ready (rand_num_ready), //         .ready
		.rand_num_valid (rand_num_valid), //         .valid
		.start          (start),          //     call.enable
		.busy           (),               // (terminated)
		.done           (),               // (terminated)
		.stall          (1'b0)            // (terminated)
	);

endmodule
