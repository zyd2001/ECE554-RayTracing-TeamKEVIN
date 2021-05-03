module ContactPoint_v2(
  clk, rst,
  t, orig, dir, 
  result);
  
  input clk, rst;
  input [31:0] t;
  input [95:0] orig, dir;
  
  output [95:0] result;

  logic [31:0] Mul1_out, Mul2_out, Mul3_out;
  
  Float_Mul Mul1 (
		.clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'b1),          //   input,   width = 1,     en.en
		.a      (t),   //   input,  width = 32,      a.a
		.b      (dir[31:0]),   //   input,  width = 32,      b.b
		.q      (Mul1_out)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul2 (
		.clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'b1),          //   input,   width = 1,     en.en
		.a      (t),  //   input,  width = 32,      a.a
		.b      (dir[63:32]),  //   input,  width = 32,      b.b
		.q      (Mul2_out)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul3 (
		.clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'b1),          //   input,   width = 1,     en.en
		.a      (t),  //   input,  width = 32,      a.a
		.b      (dir[95:64]),  //   input,  width = 32,      b.b
		.q      (Mul3_out)         //  output,  width = 32,      q.q
	);

  Float_Add Add1 (
    .clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'b1),          //   input,   width = 1,     en.en
		.a      (Mul1_out),        //   input,  width = 32,      a.a
		.b      (orig[31:0]),        //   input,  width = 32,      b.b
		.q      (result[31:0]),        //  output,  width = 32,      q.q
		.opSel  (1'b1)             //   input,   width = 1,  opSel.opSel
	);

  Float_Add Add2 (
    .clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'b1),          //   input,   width = 1,     en.en
		.a      (Mul2_out),        //   input,  width = 32,      a.a
		.b      (orig[63:32]),        //   input,  width = 32,      b.b
		.q      (result[63:32]),          //  output,  width = 32,      q.q
		.opSel  (1'b1)             //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Add3 (
    .clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'b1),          //   input,   width = 1,     en.en
		.a      (Mul3_out),        //   input,  width = 32,      a.a
		.b      (orig[95:64]),        //   input,  width = 32,      b.b
		.q      (result[95:64]),          //  output,  width = 32,      q.q
		.opSel  (1'b1)             //   input,   width = 1,  opSel.opSel
	);

endmodule