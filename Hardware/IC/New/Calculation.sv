module Calculation(
  clk, rst, 
  v0, v1, v2, orig, dir, sid_in,
  sid_out, Intersection_Point, norm_out);
  
  input clk, rst;
  input [31:0] sid_in;
  input [95:0] v0, v1, v2, orig, dir;
  
  output [31:0] sid_out;
  output [95:0] Intersection_Point, norm_out;
  
  logic hit;
  logic [5:0] counter;
  logic [31:0] det, invDet, upre, vpre, tpre, u, v, t, sid_ff_out;
  logic [95:0] v0v2, v0v1, tvec,
               pvec, qvec, norm, Intersection_Point_in;
               
  always_ff@(posedge clk or posedge rst) begin
    if (rst)
      counter <= '0;
    else if (counter == 6'd43)
      counter <= '0;
    else 
      counter <= counter + 1'b1;
  end
  
  fifo ff (
    .clk(clk), .rst(rst), .en(1'b1),
    .d(sid_in), .q(sid_out)
  );
  
  PreProcess_v2 PrePro (
    .clk(clk), .rst(rst),
    .v0(v0), .v1(v1), .v2(v2), .orig(orig),
    .v0v2(v0v2), .v0v1(v0v1), .tvec(tvec)
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
    .vector1(v0v1), .vector2(pvec),
    .result(det)
  );
  
  DotProduct_v2 DotP2 (
    .clk(clk), .rst(rst),
    .vector1(tvec), .vector2(pvec),
    .result(upre)
  );
  
  DotProduct_v2 DotP3 (
    .clk(clk), .rst(rst),
    .vector1(dir), .vector2(qvec),
    .result(vpre)
  );
  
  DotProduct_v2 DotP4 (
    .clk(clk), .rst(rst),
    .vector1(v0v2), .vector2(qvec),
    .result(tpre)
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
		.a      (upre),     //   input,  width = 32,      a.a
		.b      (invDet),   //   input,  width = 32,      b.b
		.q      (u)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul2 (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),      //   input,   width = 1, areset.reset
		.en     (1'b1),     //   input,   width = 1,     en.en
		.a      (vpre),     //   input,  width = 32,      a.a
		.b      (invDet),   //   input,  width = 32,      b.b
		.q      (v)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul3 (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),      //   input,   width = 1, areset.reset
		.en     (1'b1),     //   input,   width = 1,     en.en
		.a      (tpre),     //   input,  width = 32,      a.a
		.b      (invDet),   //   input,  width = 32,      b.b
		.q      (t)         //  output,  width = 32,      q.q
	);
  
  ContactDetect_v2 ConDet (
    .clk(clk), .rst(rst),
    .u(u), .v(v), .det(det), 
    .result(hit)
  );
    
  ContactPoint_v2 ConPnt (
    .clk(clk), .rst(rst),
    .t(t), .orig(orig), .dir(dir), 
    .result(Intersection_Point_in)
  );  
  
endmodule