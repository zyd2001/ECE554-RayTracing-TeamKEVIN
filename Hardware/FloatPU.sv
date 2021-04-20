module FloatPU (
  clk, rst,
  mode,
  a,
  b,
  result);
  
  input clk, rst;
  input [2:0] mode;
  input [31:0] a, b;
  
  output [31:0] result;
  
  logic Adder_en, Multiplier_en, Divider_en, Sqrter_en;
  logic Adder_rst, Multiplier_rst, Divider_rst, Sqrter_rst;
  logic [31:0] Divider_result, Sqrter_result;
  logic [32:0] Adder_result;
  logic [63:0] Multiplier_result;
  
  assign Adder_en = (mode[2:1] == 2'b00) ? 1'b1 : 1'b0;
  assign Multiplier_en = (mode == 3'b010) ? 1'b1 : 1'b0;
  assign Divider_en = (mode == 3'b011) ? 1'b1 : 1'b0;
  assign Sqrter_en = (mode[2] == 1'b1) ? 1'b1 : 1'b0;
  
  assign Adder_rst = rst && Adder_en;
  assign Multiplier_rst = rst && Multiplier_en;
  assign Divider_rst = rst && Divider_en;
  assign Sqrter_rst = rst && Sqrter_en;
  
  assign result = (mode == 3'b010) ? Multiplier_result :
                (mode == 3'b011) ? Divider_result :
                (mode[2] == 1'b1) ? Sqrter_result : Adder_result;
  
  Float_Add Adder (
		.clk    (clk),               //   input,   width = 1,    clk.clk
		.areset (Adder_rst),         //   input,   width = 1, areset.reset
		.en     (Adder_en),          //   input,   width = 1,     en.en
		.a      (a),                 //   input,  width = 32,      a.a
		.b      (b),                 //   input,  width = 32,      b.b
		.q      (Adder_result),      //  output,  width = 32,      q.q
		.opSel  (mode[0])            //   input,   width = 1,  opSel.opSel
	);

	Float_Mul Multiplier (
		.clk    (clk),                    //   input,   width = 1,    clk.clk
		.areset (Multiplier_rst),         //   input,   width = 1, areset.reset
		.en     (Multiplier_en),          //   input,   width = 1,     en.en
		.a      (a),                      //   input,  width = 32,      a.a
		.b      (b),                      //   input,  width = 32,      b.b
		.q      (Multiplier_result)       //  output,  width = 32,      q.q
	);

	Float_Div Divider (
		.clk    (clk),                 //   input,   width = 1,    clk.clk
		.areset (Divider_rst),         //   input,   width = 1, areset.reset
		.en     (Divider_en),          //   input,   width = 1,     en.en
		.a      (a),                   //   input,  width = 32,      a.a
		.b      (b),                   //   input,  width = 32,      b.b
		.q      (Divider_result)       //  output,  width = 32,      q.q
	);

	Float_Sqrt Sqrter (
		.clk    (clk),                //   input,   width = 1,    clk.clk
		.areset (Sqrter_rst),         //   input,   width = 1, areset.reset
		.en     (Sqrter_en),          //   input,   width = 1,     en.en
		.a      (a),                  //   input,  width = 32,      a.a
		.q      (Sqrter_result)       //  output,  width = 32,      q.q
	);

endmodule