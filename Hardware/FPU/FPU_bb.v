module FPU (
		input  wire        clk,       // s1.clk
		input  wire        clk_en,    //   .clk_en
		input  wire [31:0] dataa,     //   .dataa
		input  wire [31:0] datab,     //   .datab
		input  wire [2:0]  n,         //   .n
		input  wire        reset,     //   .reset
		input  wire        reset_req, //   .reset_req
		input  wire        start,     //   .start
		output wire        done,      //   .done
		output wire [31:0] result     //   .result
	);
endmodule

