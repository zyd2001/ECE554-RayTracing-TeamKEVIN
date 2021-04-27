module IC(
  clk, rst,
  Core_ID, thread_id_in, thread_id_out, IntersectionPoint,
  sid_in, sid_out, dir, orig, norm, IC_Mem_Rdy,
  Mem_Rdy, v1, v2, v0, Mem_NotValid, triangle_id, Mem_En
  );

  parameter NUM_THREAD = 32;
  parameter NUM_TRIANGLE = 512;
  localparam BIT_THREAD = $clog2(NUM_THREAD);
  localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);

  input clk, rst;
  // IC Mem
  input Core_ID;
  input [BIT_THREAD-1:0] thread_id_in;
  input [95:0] orig, dir;
  
  output IC_Mem_Rdy;
  output [BIT_THREAD-1:0] thread_id_out;
  output [31:0] sid_out;
  output [95:0] norm, IntersectionPoint;
  // Tri Mem
  input Mem_Rdy, Mem_NotValid;
  input [95:0] v1, v2, v0;
  input [31:0] sid_in;
  
  output Mem_En;
  output unsigned [BIT_TRIANGLE-1:0] triangle_id;
  
  logic flag;
  
  logic [4:0] counter;
  
  logic [95:0] norm_in, orig_out, dir_out, v1_out, v2_out, v0_out, v1, v2, v0, orig, dir, 
               v0v1_0, v0v1_1, v0v1_2, v0v2_0, v0v2_1, v0v2_2, tvec_0, tvec_1, tvec_2,
               dir_1, dir_2, pvec_1, pvec_2, qvec_1, qvec_2, norm_1, norm_2;
 
  logic [31:0] sid_IC_in, sid_Mem_out, u, v, t, det, sid_1, sid_2, det_2, upre_2, vpre_2, tpre_2,
               upre_3, vpre_3, tpre_3, invDet;
  
  
  IC_Controller ICC (
    .clk(clk), .rst(rst), .StageI_capture(StageI_capture), .Controller_capture(Controller_capture),
    .Core_ID(Core_ID), .thread_id_Mem_in(thread_id_in), 
    .sid_IC_in(sid_IC_in), .orig_in(orig), .dir_in(dir), .norm_in(norm_in),
    .IC_Mem_Rdy(IC_Mem_Rdy), .thread_id_out(thread_id_out), .orig_out(orig_out), 
    .dir_out(dir_out), .norm_out(norm), .IntersectionPoint_out(IntersectionPoint), .sid_IC_out(sid_out),
    .Mem_Rdy(Mem_Rdy), .v1_in(v1), .v2_in(v2), .v0_in(v0), .sid_Mem_in(sid_in), .Mem_NotValid(Mem_NotValid),
    .Mem_En(Mem_En), .v1_out(v1_out), .v2_out(v2_out), .v0_out(v0_out), 
    .sid_Mem_out(sid_Mem_out), .triangle_id(triangle_id), .Tri_Rdy(PrePro_start),
    .u(u), .v(v), .t(t), .det(det), .trace_done(trace_done)
  );
  // Stage I
  PreProcess PrePro(
    .clk(clk), .rst(rst), .start(PrePro_start),
    .v0(v0_out), .v1(v1_out), .v2(v2_out), .orig(orig_out), .done(PrePro_done),
    .v0v2(v0v2_0), .v0v1(v0v1_0), .tvec(tvec_0)
  );

  StageI SI(
    .clk(clk), .rst(rst), .StageI_done(PrePro_done), .StageII_capture(StageII_capture), .StageI_capture(StageI_capture),
    .v0v1_in(v0v1_0), .v0v1_out(v0v1_1),
    .v0v2_in(v0v2_0), .v0v2_out(v0v2_1),
    .dir_in(dir_out), .dir_out(dir_1),
    .tvec_in(tvec_0), .tvec_out(tvec_1),
    .sid_in(sid_Mem_out), .sid_out(sid_1)
  );
  // Stage II
  CrossProduct CrossP1 (
    .clk(clk), .rst(rst), .start(StageI_capture),
    .vector1(dir_1), 
    .vector2(v0v2_1),
    .done(CrossP1_done),
    .result(pvec_1)
  );
  
  CrossProduct CrossP2 (
    .clk(clk), .rst(rst), .start(StageI_capture),
    .vector1(tvec_1), 
    .vector2(v0v1_1),
    .done(CrossP2_done),
    .result(qvec_1)
  );
  
  CrossProduct CrossP3 (
    .clk(clk), .rst(rst), .start(StageI_capture),
    .vector1(v0v1_1), 
    .vector2(v0v2_1),
    .done(CrossP3_done),
    .result(norm_1)
  );

  StageII SII(
    .clk(clk), .rst(rst), .StageII_done(CrossP3_done & CrossP2_done & CrossP1_done), .StageIII_capture(StageIII_capture), .StageII_capture(StageII_capture),
    .v0v1_in(v0v1_1), .v0v1_out(v0v1_2),
    .v0v2_in(v0v2_1), .v0v2_out(v0v2_2),
    .dir_in(dir_1), .dir_out(dir_2),
    .tvec_in(tvec_1), .tvec_out(tvec_2),
    .pvec_in(pvec_1), .pvec_out(pvec_2),
    .qvec_in(qvec_1), .qvec_out(qvec_2),
    .norm_in(norm_1), .norm_out(norm_2),
    .sid_in(sid_1), .sid_out(sid_2)
  );
  // Stage III  
  DotProduct DotP1 (
    .clk(clk), .rst(rst), .start(StageII_capture),
    .vector1(v0v1_2), 
    .vector2(pvec_2),
    .done(DotP1_done),
    .result(det_2)
  );
  
  DotProduct DotP2 (
    .clk(clk), .rst(rst), .start(StageII_capture),
    .vector1(tvec_2), 
    .vector2(pvec_2),
    .done(DotP2_done),
    .result(upre_2)
  );
  
  DotProduct DotP3 (
    .clk(clk), .rst(rst), .start(StageII_capture),
    .vector1(dir_2), 
    .vector2(qvec_2),
    .done(DotP3_done),
    .result(vpre_2)
  );
  
  DotProduct DotP4 (
    .clk(clk), .rst(rst), .start(StageII_capture),
    .vector1(v0v2_2), 
    .vector2(qvec_2),
    .done(DotP4_done),
    .result(tpre_2)
  );
  
  StageIII SIII(
    .clk(clk), .rst(rst), .StageIII_done(DotP1_done & DotP2_done & DotP3_done & DotP4_done), .Controller_capture(Controller_capture), .StageIII_capture(StageIII_capture),
    .det_in(det_2), .det_out(det),
    .upre_in(upre_2), .upre_out(upre_3),
    .vpre_in(vpre_2), .vpre_out(vpre_3),
    .tpre_in(tpre_2), .tpre_out(tpre_3),
    .norm_in(norm_2), .norm_out(norm_in),
    .sid_in(sid_2), .sid_out(sid_IC_in)
  );
  // Last Stage
  
  always@(posedge clk or posedge rst) begin
    if (rst) 
      flag <= '0;
    else if (StageIII_capture) 
      flag <= 1'b1;
    else if (trace_done) 
      flag <= 1'b0;
  end
  
  always@(posedge clk or posedge rst) begin
    if (rst) 
      counter <= '0;
    else if (counter == 5'd19) 
      counter <= '0;
    else if (flag)
      counter <= counter + 1'b1;
  end
  
  assign trace_done = (counter == 5'd19);
  
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
		.a      (upre_3),   //   input,  width = 32,      a.a
		.b      (invDet),   //   input,  width = 32,      b.b
		.q      (u)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul2 (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),      //   input,   width = 1, areset.reset
		.en     (1'b1),     //   input,   width = 1,     en.en
		.a      (vpre_3),   //   input,  width = 32,      a.a
		.b      (invDet),   //   input,  width = 32,      b.b
		.q      (v)         //  output,  width = 32,      q.q
	);
  
  Float_Mul Mul3 (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),      //   input,   width = 1, areset.reset
		.en     (1'b1),     //   input,   width = 1,     en.en
		.a      (tpre_3),   //   input,  width = 32,      a.a
		.b      (invDet),   //   input,  width = 32,      b.b
		.q      (t)         //  output,  width = 32,      q.q
	);
  
endmodule