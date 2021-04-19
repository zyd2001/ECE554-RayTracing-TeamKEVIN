module FALU (
    clk, rst, en
    mode, 
    a,
    b,
    done,
    out);

  input clk;
  input rst;
  input [2:0] mode;
  input [31:0] a, b;
  
  output done;
  output [31:0] out;
  
  wire [31:0] add_result, mul_result, sub_result;
  
  reg [3:0] enable;
  reg [3:0] module_rst;
  reg [31:0] out_r;
  
  assign enable = 1 << mode;
  assign module_rst = rst << mode;

  FPU u0 (
		.clk       (clk),      //   input,   width = 1, s1.clk
		.clk_en    (en),       //   input,   width = 1,   .clk_en
		.dataa     (a),        //   input,  width = 32,   .dataa
		.datab     (b),        //   input,  width = 32,   .datab
		.n         (mode),     //   input,   width = 3,   .n
		.reset     (rst),      //   input,   width = 1,   .reset
		.reset_req (rst),      //   input,   width = 1,   .reset_req
		.start     (start),    //   input,   width = 1,   .start
		.done      (done),     //  output,   width = 1,   .done
		.result    (out)       //  output,  width = 32,   .result
	);

endmodule
 


