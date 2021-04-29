// Float_Cmpr.v

// Generated using ACDS version 19.2 57

`timescale 1 ps / 1 ps
module Float_Cmpr (
		input  wire        clk,    //    clk.clk
		input  wire        areset, // areset.reset
		input  wire [31:0] a,      //      a.a
		input  wire [31:0] b,      //      b.b
		output wire [0:0]  q       //      q.q
	);

	Float_Cmpr_altera_fp_functions_191_zqh2ixy fp_functions_0 (
		.clk    (clk),    //   input,   width = 1,    clk.clk
		.areset (areset), //   input,   width = 1, areset.reset
		.a      (a),      //   input,  width = 32,      a.a
		.b      (b),      //   input,  width = 32,      b.b
		.q      (q)       //  output,   width = 1,      q.q
	);

endmodule
