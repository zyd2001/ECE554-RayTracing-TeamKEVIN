module CrossProduct_v2(
  clk, rst,
  vector1, 
  vector2,
  result);
 
  input clk, rst;
  input [95:0] vector1, vector2;
  
  output [95:0] result;

  logic [31:0] Mul1_1_out, Mul1_2_out,
               Mul2_1_out, Mul2_2_out,
               Mul3_1_out, Mul3_2_out;
  
  Float_Mul Mul1_1 (
		.clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),           //   input,   width = 1,     en.en
		.a      (vector1[63:32]),   //   input,  width = 32,      a.a
		.b      (vector2[95:64]),   //   input,  width = 32,      b.b
		.q      (Mul1_1_out)        //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul1_2 (
		.clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),           //   input,   width = 1,     en.en
		.a      (vector1[95:64]),   //   input,  width = 32,      a.a
		.b      (vector2[63:32]),   //   input,  width = 32,      b.b
		.q      (Mul1_2_out)        //  output,  width = 32,      q.q
	);
  
  Float_Add Add1 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),           //   input,   width = 1,     en.en
		.a      (Mul1_1_out),       //   input,  width = 32,      a.a
		.b      (Mul1_2_out),       //   input,  width = 32,      b.b
		.q      (result[31:0]),     //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);

  Float_Mul Mul2_1 (
		.clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),           //   input,   width = 1,     en.en
		.a      (vector1[95:64]),   //   input,  width = 32,      a.a
		.b      (vector2[31:0]),    //   input,  width = 32,      b.b
		.q      (Mul2_1_out)        //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul2_2 (
		.clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),           //   input,   width = 1,     en.en
		.a      (vector1[31:0]),    //   input,  width = 32,      a.a
		.b      (vector2[95:64]),   //   input,  width = 32,      b.b
		.q      (Mul2_2_out)        //  output,  width = 32,      q.q
	);
  
  Float_Add Add2 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),           //   input,   width = 1,     en.en
		.a      (Mul2_1_out),       //   input,  width = 32,      a.a
		.b      (Mul2_2_out),       //   input,  width = 32,      b.b
		.q      (result[63:32]),    //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Mul Mul3_1 (
		.clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),           //   input,   width = 1,     en.en
		.a      (vector1[31:0]),    //   input,  width = 32,      a.a
		.b      (vector2[63:32]),   //   input,  width = 32,      b.b
		.q      (Mul3_1_out)        //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul3_2 (
		.clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),           //   input,   width = 1,     en.en
		.a      (vector1[63:32]),   //   input,  width = 32,      a.a
		.b      (vector2[31:0]),    //   input,  width = 32,      b.b
		.q      (Mul3_2_out)        //  output,  width = 32,      q.q
	);
  
  Float_Add Add3 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),           //   input,   width = 1,     en.en
		.a      (Mul3_1_out),       //   input,  width = 32,      a.a
		.b      (Mul3_2_out),       //   input,  width = 32,      b.b
		.q      (result[95:64]),    //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);

endmodule