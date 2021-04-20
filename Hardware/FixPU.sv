module FixPU (
  clk, rst,
  mode,
  a,
  b,
  result);
  
  input clk, rst;
  input [2:0] mode;
  input [31:0] a, b;
  
  output [63:0] result;
  
  logic Adder_en, Multiplier_en, Divider_en, Sqrter_en;
  logic Adder_rst, Multiplier_rst, Divider_rst, Sqrter_rst;
 
  logic [31:0] Adder_b;
  
  logic [31:0] Divider_result_in, Sqrter_result_in;
  logic [32:0] Adder_result_in;
  logic [63:0] Multiplier_result_in;

  logic [63:0] Adder_result, Multiplier_result, Divider_result, Sqrter_result;
  
  assign Adder_en = (mode[2:1] == 2'b00) ? 1'b1 : 1'b0;
  assign Multiplier_en = (mode == 3'b010) ? 1'b1 : 1'b0;
  assign Divider_en = (mode == 3'b011) ? 1'b1 : 1'b0;
  assign Sqrter_en = (mode[2] == 1'b1) ? 1'b1 : 1'b0;
  
  assign Adder_rst = rst && Adder_en;
  assign Multiplier_rst = rst && Multiplier_en;
  assign Divider_rst = rst && Divider_en;
  assign Sqrter_rst = rst && Sqrter_en;
  
  assign Adder_b = mode[0] ? (~b + 1) : b;
  
  assign result = (mode == 3'b010) ? Multiplier_result :
                  (mode == 3'b011) ? Divider_result :
                  (mode[2] == 1'b1) ? Sqrter_result : Adder_result;
                  
  always@(posedge clk or posedge rst) begin
    if (rst) begin
      Adder_result <= '0;
      Multiplier_result <= '0;
      Divider_result <= '0;
      Sqrter_result <= '0;
    end
    else begin
      Adder_result <= {31'h0, Adder_result_in};
      Multiplier_result <= Multiplier_result_in;
      Divider_result <= {32'h0, Divider_result_in};
      Sqrter_result <= {32'h0, Sqrter_result_in};
    end
  end  
  
  
  Fix_Add Adder (
		.clk    (clk),          //   input,   width = 1,    clk.clk
		.rst    (Adder_rst),    //   input,   width = 1,    rst.reset
		.en     (Adder_en),     //   input,   width = 1,     en.en
		.a0     (a),            //   input,  width = 32,     a0.a0
		.a1     (Adder_b),      //   input,  width = 32,     a1.a1
		.result (Adder_result_in)  //  output,  width = 33, result.result
	);

	Fix_Mul Multiplier (
		.clk    (clk),               //   input,   width = 1,    clk.clk
		.rst    (Multiplier_rst),    //   input,   width = 1,    rst.reset
		.en     (Multiplier_en),     //   input,   width = 1,     en.en
		.a      (a),                 //   input,  width = 32,      a.a
		.b      (b),                 //   input,  width = 32,      b.b
		.result (Multiplier_result_in)  //  output,  width = 64, result.result
	);

	Fix_Div Divider (
		.clk         (clk),                 //   input,   width = 1,         clk.clk
		.rst         (Divider_rst),         //   input,   width = 1,         rst.reset
		.en          (Divider_en),          //   input,   width = 1,          en.en
		.numerator   (a),                   //   input,  width = 32,   numerator.numerator
		.denominator (b),                   //   input,  width = 32, denominator.denominator
		.result      (Divider_result_in)       //  output,  width = 32,      result.result
	);
  
	Fix_Sqrt Sqrter (
		.clk     (clk),            //   input,   width = 1,     clk.clk
		.rst     (Sqrter_rst),     //   input,   width = 1,     rst.reset
		.en      (Sqrter_en),      //   input,   width = 1,      en.en
		.radical (a),              //   input,  width = 32, radical.radical
		.result  (Sqrter_result_in)   //  output,  width = 32,  result.result
	);

endmodule