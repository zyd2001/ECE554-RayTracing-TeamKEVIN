module FPU (
    clk, rst,
    mode, 
    a,
    b,
    out);

  input clk;
  input rst;
  input [1:0] mode;
  input [31:0] a, b;
  
  output [31:0] out;
  
  wire [31:0] add_result, mul_result, sub_result;
  
  reg [3:0] enable;
  reg [3:0] module_rst;
  reg [31:0] out_r;
  
  assign enable = 1 << mode;
  assign module_rst = rst << mode;

  Float_Add Adder (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (enable[0]),    //   input,   width = 1,    ena.ena
		.clr0   (module_rst[0]),   //   input,   width = 1,   clr0.reset
		.clr1   (module_rst[0]),   //   input,   width = 1,   clr1.reset
		.result (add_result), //  output,  width = 32, result.result
		.ax     (a),     //   input,  width = 32,     ax.ax
		.ay     (b)      //   input,  width = 32,     ay.ay
	);
  
  Float_Sub subtractor (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (enable[1]),    //   input,   width = 1,    ena.ena
		.clr0   (module_rst[1]),   //   input,   width = 1,   clr0.reset
		.clr1   (module_rst[1]),   //   input,   width = 1,   clr1.reset
		.result (sub_result), //  output,  width = 32, result.result
		.ax     (a),     //   input,  width = 32,     ax.ax
		.ay     (b)      //   input,  width = 32,     ay.ay
	);
  
  Float_Mul Multiplier (
		.clk0   (clk),   //   input,   width = 1,   clk0.clk
		.ena    (enable[2]),    //   input,   width = 1,    ena.ena
		.clr0   (module_rst[2]),   //   input,   width = 1,   clr0.reset
		.clr1   (module_rst[2]),   //   input,   width = 1,   clr1.reset
		.result (mul_result), //  output,  width = 32, result.result
		.ay     (a),     //   input,  width = 32,     ay.ay
		.az     (b)      //   input,  width = 32,     az.az
	);

  Float_Div Divider (
		.clk    (clk),   
		.en     (enable[3]),    
		.rst    (module_rst[3]),  
		.result (div_result),
		.a      (a),  
		.b      (b)     
	);
  
  always @ * begin
    case(mode)
      2'b00: out_r = add_result;
      2'b01: out_r = sub_result;
      2'b10: out_r = mul_result;
      2'b11: out_r = div_result;
      default: out_r = 32'h0;
    endcase
  end
  
  assign out = out_r;

endmodule
 


