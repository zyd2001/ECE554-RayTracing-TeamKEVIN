module PreProcess_v2(
  clk, rst,
  v0,
  v1,
  v2,
  orig,
  v0v2,
  v0v1,
  tvec);
  
  input clk, rst;
  input [95:0] v0, v1, v2, orig;
  
  output [95:0] v0v2, v0v1, tvec;
  
  // v0v1
  Float_Add Addv0v1_1 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),               //   input,   width = 1,     en.en
		.a      (v1[31:0]),         //   input,  width = 32,      a.a
		.b      (v0[31:0]),         //   input,  width = 32,      b.b
		.q      (v0v1[31:0]),       //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Addv0v1_2 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),               //   input,   width = 1,     en.en
		.a      (v1[63:32]),        //   input,  width = 32,      a.a
		.b      (v0[63:32]),        //   input,  width = 32,      b.b
		.q      (v0v1[63:32]),      //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Addv0v1_3 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),               //   input,   width = 1,     en.en
		.a      (v1[95:64]),        //   input,  width = 32,      a.a
		.b      (v0[95:64]),        //   input,  width = 32,      b.b
		.q      (v0v1[95:64]),      //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  // v0v2
  Float_Add Addv0v2_1 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),               //   input,   width = 1,     en.en
		.a      (v2[31:0]),         //   input,  width = 32,      a.a
		.b      (v0[31:0]),         //   input,  width = 32,      b.b
		.q      (v0v2[31:0]),       //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Addv0v2_2 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),               //   input,   width = 1,     en.en
		.a      (v2[63:32]),        //   input,  width = 32,      a.a
		.b      (v0[63:32]),        //   input,  width = 32,      b.b
		.q      (v0v2[63:32]),      //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Addv0v2_3 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),               //   input,   width = 1,     en.en
		.a      (v2[95:64]),        //   input,  width = 32,      a.a
		.b      (v0[95:64]),        //   input,  width = 32,      b.b
		.q      (v0v2[95:64]),      //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  // tvec
  Float_Add Addtvec_1 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),               //   input,   width = 1,     en.en
		.a      (orig[31:0]),       //   input,  width = 32,      a.a
		.b      (v0[31:0]),         //   input,  width = 32,      b.b
		.q      (tvec[31:0]),       //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Addtvec_2 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),               //   input,   width = 1,     en.en
		.a      (orig[63:32]),      //   input,  width = 32,      a.a
		.b      (v0[63:32]),        //   input,  width = 32,      b.b
		.q      (tvec[63:32]),      //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
  Float_Add Addtvec_3 (
    .clk    (clk),              //   input,   width = 1,    clk.clk
		.areset (rst),              //   input,   width = 1, areset.reset
		.en     (1'b1),               //   input,   width = 1,     en.en
		.a      (orig[95:64]),      //   input,  width = 32,      a.a
		.b      (v0[95:64]),        //   input,  width = 32,      b.b
		.q      (tvec[95:64]),      //  output,  width = 32,      q.q
		.opSel  (1'b0)              //   input,   width = 1,  opSel.opSel
	);
  
endmodule