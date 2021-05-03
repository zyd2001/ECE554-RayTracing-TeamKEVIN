module Calculation(
  clk, rst, 
  v0, v1, v2, orig, dir, sid_in,
  sid_out, Intersection_Point, norm, t);
  
  input clk, rst;
  input [31:0] sid_in;
  input [95:0] v0, v1, v2, orig, dir;
  
  output [31:0] sid_out, t;
  output [95:0] Intersection_Point, norm;
  
  logic hit;
  logic [31:0] det, invDet, upre, vpre, tpre, u, v, sid_ff_out, Det_ff_out;
  logic [95:0] v0v2, v0v1, tvec,
               pvec, qvec, Intersection_Point_in, Pre_ff_out;
  logic [287:0] PrePro_ff_out;
  
  fifo ff (
    .clk(clk), .rst(rst), .en(1'b1),
    .d(sid_in), .q(sid_out)
  );
  
  PreProcess_v2 PrePro (
    .clk(clk), .rst(rst),
    .v0(v0), .v1(v1), .v2(v2), .orig(orig),
    .v0v2(v0v2), .v0v1(v0v1), .tvec(tvec)
  );
    
  fifo #(6, 288) PrePro_ff (
    .clk(clk), .rst(rst), .en(1'b1),
    .d({v0v1, v0v2, tvec}), .q(PrePro_ff_out)
  );
  
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
    .vector1(PrePro_ff_out[287:192]), .vector2(pvec),
    .result(det)
  );
  
  DotProduct_v2 DotP2 (
    .clk(clk), .rst(rst),
    .vector1(PrePro_ff_out[95:0]), .vector2(pvec),
    .result(upre)
  );
  
  DotProduct_v2 DotP3 (
    .clk(clk), .rst(rst),
    .vector1(dir), .vector2(qvec),
    .result(vpre)
  );
  
  DotProduct_v2 DotP4 (
    .clk(clk), .rst(rst),
    .vector1(PrePro_ff_out[191:96]), .vector2(qvec),
    .result(tpre)
  );
  
  fifo #(17, 96) Pre_ff (
    .clk(clk), .rst(rst), .en(1'b1),
    .d({upre, vpre, tpre}), .q(Pre_ff_out)
  );
  
  fifo #(20, 32) Det_ff (
    .clk(clk), .rst(rst), .en(1'b1),
    .d(det), .q(Det_ff_out)
  );
  
  Float_Inv inverse (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),      //   input,   width = 1, areset.reset
		.a      (det),      //   input,  width = 32,      a.a
		.q      (invDet)    //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul1 (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),      //   input,   width = 1, areset.reset
		.en     (1'b1),     //   input,   width = 1,     en.en
		.a      (Pre_ff_out[95:64]),     //   input,  width = 32,      a.a
		.b      (invDet),   //   input,  width = 32,      b.b
		.q      (u)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul2 (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),      //   input,   width = 1, areset.reset
		.en     (1'b1),     //   input,   width = 1,     en.en
		.a      (Pre_ff_out[63:32]),     //   input,  width = 32,      a.a
		.b      (invDet),   //   input,  width = 32,      b.b
		.q      (v)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul3 (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),      //   input,   width = 1, areset.reset
		.en     (1'b1),     //   input,   width = 1,     en.en
		.a      (Pre_ff_out[31:0]),     //   input,  width = 32,      a.a
		.b      (invDet),   //   input,  width = 32,      b.b
		.q      (t)         //  output,  width = 32,      q.q
	);
  
  ContactDetect_v2 ConDet (
    .clk(clk), .rst(rst),
    .u(u), .v(v), .det(Det_ff_out), 
    .result(hit)
  );
    
  ContactPoint_v2 ConPnt (
    .clk(clk), .rst(rst),
    .t(t), .orig(orig), .dir(dir), 
    .result(Intersection_Point)
  );  
  
endmodule