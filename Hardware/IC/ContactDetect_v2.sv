module ContactDetect_v2(
  clk, rst,
  u, v, det, 
  result);
  
  parameter KEPSILON = 32'h322bcc77;   //1e-8
  localparam POSITIVEONE = 32'h3f800000; // 1

  input clk, rst;
  input [31:0] u, v, det;
  
  output result;

  logic Less1_out, Less2_out, Less3_out, Greater1_out, Greater2_out;
  logic [31:0] Add_out;

  Float_Add Add (
    .clk    (clk),            //   input,   width = 1,    clk.clk
		.areset (rst),            //   input,   width = 1, areset.reset
		.en     (1'b1),             //   input,   width = 1,     en.en
		.a      (u),              //   input,  width = 32,      a.a
		.b      (v),              //   input,  width = 32,      b.b
		.q      (Add_out),        //  output,  width = 32,      q.q
		.opSel  (1'b1)            //   input,   width = 1,  opSel.opSel
	);

	Float_Less Less1 (
		.clk    (clk),            //   input,   width = 1,    clk.clk
		.areset (rst),            //   input,   width = 1, areset.reset
		.a      (u),              //   input,  width = 32,      a.a
		.b      (32'b0),             //   input,  width = 32,      b.b
		.q      (Less1_out)       //  output,   width = 1,      q.q
	);

	Float_Less Less2 (
		.clk    (clk),            //   input,   width = 1,    clk.clk
		.areset (rst),            //   input,   width = 1, areset.reset
		.a      (v),              //   input,  width = 32,      a.a
		.b      (32'b0),             //   input,  width = 32,      b.b
		.q      (Less2_out)       //  output,   width = 1,      q.q
	);

	Float_Less Less3 (
		.clk    (clk),            //   input,   width = 1,    clk.clk
		.areset (rst),            //   input,   width = 1, areset.reset
    .en     (1'b1),
		.a      (det),            //   input,  width = 32,      a.a
		.b      (KEPSILON),       //   input,  width = 32,      b.b
		.q      (Less3_out)       //  output,   width = 1,      q.q
	);

	Float_Grtr Greater1 (
		.clk    (clk),            //   input,   width = 1,    clk.clk
		.areset (rst),            //   input,   width = 1, areset.reset
    .en     (1'b1),
		.a      (u),              //   input,  width = 32,      a.a
		.b      (POSITIVEONE),    //   input,  width = 32,      b.b
		.q      (Greater1_out)    //  output,   width = 1,      q.q
	);
  
  Float_Grtr Greater2 (
		.clk    (clk),            //   input,   width = 1,    clk.clk
		.areset (rst),            //   input,   width = 1, areset.reset
    .en     (1'b1),
		.a      (Add_out),        //   input,  width = 32,      a.a
		.b      (POSITIVEONE),    //   input,  width = 32,      b.b
		.q      (Greater2_out)    //  output,   width = 1,      q.q
	);
  
  assign result = ~(Less1_out | Less2_out | Less3_out | Greater1_out | Greater2_out);
  
endmodule