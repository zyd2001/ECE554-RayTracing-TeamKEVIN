module FALU (
    clk, rst, en,
    mode, 
    a,
    b,
    done,
    out);

  input clk, rst, en;
  input [2:0] mode;
  input [31:0] a, b;
  
  output done;
  output [31:0] out;
  
  assign module_rst = rst << mode;

  fpoint2_multi u0 (
		.clk       (clk),      //   input,   width = 1, s1.clk
		.clk_en    (en),       //   input,   width = 1,   .clk_en
		.dataa     (a),        //   input,  width = 32,   .dataa
		.datab     (b),        //   input,  width = 32,   .datab
		.n         (mode),     //   input,   width = 3,   .n
		.reset     (rst),      //   input,   width = 1,   .reset
		.reset_req (rst),      //   input,   width = 1,   .reset_req
		.start     (en),    //   input,   width = 1,   .start
		.done      (done),     //  output,   width = 1,   .done
		.result    (out)       //  output,  width = 32,   .result
	);

endmodule
 


