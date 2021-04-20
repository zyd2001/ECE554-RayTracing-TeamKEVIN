module Converter (
  clk, rst,
  mode,
  data_in,
  data_out);

  input clk, rst;
  input mode;
  input [31:0] data_in;
  
  output [31:0] data_out;

  logic FtoI_en, ItoF_en;
  logic FtoI_rst, ItoF_rst;
  logic [31:0] FtoI_out, ItoF_out;
  
  assign FtoI_en = mode ? 1'b1 : 1'b0;
  assign ItoF_en = mode ? 1'b0 : 1'b1; 

  assign FtoI_rst = rst && FtoI_en;
  assign ItoF_rst = rst && ItoF_en; 

  assign data_out = mode ? FtoI_out : ItoF_out;
  
	FtoI F2I (
		.clk    (clk),          //   input,   width = 1,    clk.clk
		.areset (FtoI_rst),     //   input,   width = 1, areset.reset
		.en     (FtoI_en),      //   input,   width = 1,     en.en
		.a      (data_in),      //   input,  width = 32,      a.a
		.q      (FtoI_out)      //  output,  width = 32,      q.q
	);

	ItoF I2F (
		.clk    (clk),          //   input,   width = 1,    clk.clk
		.areset (ItoF_rst),     //   input,   width = 1, areset.reset
		.en     (ItoF_en),      //   input,   width = 1,     en.en
		.a      (data_in),      //   input,  width = 32,      a.a
		.q      (ItoF_out)      //  output,  width = 32,      q.q
	);

endmodule