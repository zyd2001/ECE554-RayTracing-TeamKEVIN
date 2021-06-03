module DotProduct_v3(
  clk, rst,
  vector1, 
  vector2,
  result);

  input clk, rst;
  input [95:0] vector1, vector2;
  
  output [31:0] result;
  
  logic [31:0] Mul1_out, Mul2_out, Mul3_out, Add1_out, Mul3_ff_out;

  Float_Mul Mul1 (
		.clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'b1),          //   input,   width = 1,     en.en
		.a      (vector1[31:0]),   //   input,  width = 32,      a.a
		.b      (vector2[31:0]),   //   input,  width = 32,      b.b
		.q      (Mul1_out)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul2 (
		.clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'b1),          //   input,   width = 1,     en.en
		.a      (vector1[63:32]),  //   input,  width = 32,      a.a
		.b      (vector2[63:32]),  //   input,  width = 32,      b.b
		.q      (Mul2_out)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul3 (
		.clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'b1),          //   input,   width = 1,     en.en
		.a      (vector1[95:64]),  //   input,  width = 32,      a.a
		.b      (vector2[95:64]),  //   input,  width = 32,      b.b
		.q      (Mul3_out)         //  output,  width = 32,      q.q
	);

	ic_fifo Mul3_ff #(.DEPTH(3), .BITS(32)) (
		.clk(clk), .rst(rst), .en(1'b1),
  	.d(Mul3_out),
  	.q(Mul3_ff_out)  
	);

  Float_Add Add1 (
    .clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'b1),          //   input,   width = 1,     en.en
		.a      (Mul1_out),        //   input,  width = 32,      a.a
		.b      (Mul2_out),        //   input,  width = 32,      b.b
		.q      (Add1_out),        //  output,  width = 32,      q.q
		.opSel  (1'b1)             //   input,   width = 1,  opSel.opSel
	);

  Float_Add Add2 (
    .clk    (clk),             //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'b1),          //   input,   width = 1,     en.en
		.a      (Add1_out),        //   input,  width = 32,      a.a
		.b      (Mul3_ff_out),        //   input,  width = 32,      b.b
		.q      (result),          //  output,  width = 32,      q.q
		.opSel  (1'b1)             //   input,   width = 1,  opSel.opSel
	);
  
endmodule