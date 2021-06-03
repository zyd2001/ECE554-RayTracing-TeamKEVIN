module Calculation_v4(
  clk, rst, 
  v0, v1, v2, orig, dir, sid_in,
  sid_out, Intersection_Point, norm, t, hit);
  
  input clk, rst;
  input [31:0] sid_in;
  input [95:0] v0, v1, v2, orig, dir;
  
  output ConDet_ff_out;
  output [31:0] sid_out, t;
  output [95:0] Intersection_Point, norm;
  
  logic hit;
  logic [31:0] det, invDet, upre, vpre, tpre, u, v, upre_ff_out, vpre_ff_out, tpre_ff_out, det_ff_out;
  logic [95:0] v0v2, v0v1, tvec,
               pvec, qvec,
               v0v2_ff_out, v0v1_ff_out, tvec_ff_out,
               Pre_ff_out;
  
  logic [287:0] PrePro_ff_out;

  ic_fifo ff (
    .clk(clk), .rst(rst), .en(1'b1),
    .d(sid_in), .q(sid_out)
  );
  
  PreProcess_v2 PrePro (
    .clk(clk), .rst(rst),
    .v0(v0), .v1(v1), .v2(v2), .orig(orig),
    .v0v2(v0v2), .v0v1(v0v1), .tvec(tvec)
  );
    
  ic_fifo PrePro_ff #(.DEPTH(6), .BITS(288)) (
		.clk(clk), .rst(rst), .en(1'b1),
  	.d({v0v2, v0v1, tvec}),
  	.q(PrePro_ff_out)  
	);

  assign v0v2_ff_out = PrePro_ff_out[287:192];
  assign v0v1_ff_out = PrePro_ff_out[191:96];
  assign tvec_ff_out = PrePro_ff_out[95:0];

  CrossProduct_v2 CrossP1 (
    .clk(clk), .rst(rst),
    .vector1(dir), .vector2(v0v2),
    .result(pvec)
  );
  
  CrossProduct_v2 CrossP2 (
    .clk(clk), .rst(rst),
    .vector1(tvec), .vector2(v0v1),
    .result(qvec)
  );
  
  CrossProduct_v2 CrossP3 (
    .clk(clk), .rst(rst),
    .vector1(v0v1), .vector2(v0v2),
    .result(norm)
  );
  
  DotProduct_v2 DotP1 (
    .clk(clk), .rst(rst),
    .vector1(v0v1_ff_out), .vector2(pvec),
    .result(det)
  );
  
  DotProduct_v2 DotP2 (
    .clk(clk), .rst(rst),
    .vector1(tvec_ff_out), .vector2(pvec),
    .result(upre)
  );
  
  DotProduct_v2 DotP3 (
    .clk(clk), .rst(rst),
    .vector1(dir), .vector2(qvec),
    .result(vpre)
  );
  
  DotProduct_v2 DotP4 (
    .clk(clk), .rst(rst),
    .vector1(v0v2_ff_out), .vector2(qvec),
    .result(tpre)
  );
  
  ic_fifo Pre_ff #(.DEPTH(8), .BITS(96)) (
		.clk(clk), .rst(rst), .en(1'b1),
  	.d({upre, vpre, tpre}),
  	.q(Pre_ff_out)  
	);

  assign upre_ff_out = Pre_ff_out[95:64];
  assign vpre_ff_out = Pre_ff_out[63:32];
  assign tpre_ff_out = PreP_ff_out[31:0];

  Float_Inv inverse (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),      //   input,   width = 1, areset.reset
    .en     (1'b1),
		.a      (det),      //   input,  width = 32,      a.a
		.q      (invDet)    //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul1 (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),      //   input,   width = 1, areset.reset
		.en     (1'b1),     //   input,   width = 1,     en.en
		.a      (upre_ff_out),     //   input,  width = 32,      a.a
		.b      (invDet),   //   input,  width = 32,      b.b
		.q      (u)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul2 (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),      //   input,   width = 1, areset.reset
		.en     (1'b1),     //   input,   width = 1,     en.en
		.a      (vpre_ff_out),     //   input,  width = 32,      a.a
		.b      (invDet),   //   input,  width = 32,      b.b
		.q      (v)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul3 (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),      //   input,   width = 1, areset.reset
		.en     (1'b1),     //   input,   width = 1,     en.en
		.a      (tpre_ff_out),     //   input,  width = 32,      a.a
		.b      (invDet),   //   input,  width = 32,      b.b
		.q      (t)         //  output,  width = 32,      q.q
	);
  
  ic_fifo det_ff #(.DEPTH(11), .BITS(32)) (
		.clk(clk), .rst(rst), .en(1'b1),
  	.d(det),
  	.q(det_ff_out)  
	);

  ContactDetect_v2 ConDet (
    .clk(clk), .rst(rst),
    .u(u), .v(v), .det(det_ff_out), 
    .result(hit)
  );

  ic_fifo ConDet_ff #(.DEPTH(2), .BITS(1)) (
		.clk(clk), .rst(rst), .en(1'b1),
  	.d(hit),
  	.q(ConDet_ff_out)  
	);

  ContactPoint_v2 ConPnt (
    .clk(clk), .rst(rst),
    .t(t), .orig(orig), .dir(dir), 
    .result(Intersection_Point)
  );  
  
endmodule