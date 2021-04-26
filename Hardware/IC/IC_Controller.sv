module IC_Controller();
  
  parameter NUM_THREAD = 32;
  parameter NUM_TRIANGLE = 512;
  parameter KEPSILON = 32'h0x322bcc77;   //1e-8
  localparam BIT_THREAD = $clog2(NUM_THREAD);
  localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);
  localparam POSITIVEONE = 32'h0x3f800000; // 1
  
  ICMemManager ICMemMng (
    .clk(clk), .rst(rst),
    .Core_ID(Core_ID), .IC_Done(IC_Done),
    .thread_id_IC_in(thread_id_IC_in), .thread_id_Mem_in(thread_id_Mem_in),
    .thread_id_out(thread_id_out),
    .orig_in(orig_in), .orig_out(orig_out),
    .dir_in(dir_in), .dir_out(dir_out),
    .IntersectionPoint_in(IntersectionPoint_in), .IntersectionPoint_out(IntersectionPoint_out),
    .sid_in(sid_IC_in), .sid_out(sid_IC_out),
    .norm_in(norm_in), .norm_out(norm_out),
    .IC_Mem_Rdy(IC_Mem_Rdy)
  );
  
  TriManager TriMng (
    .clk(clk), .rst(rst),
    .Mem_Rdy(Mem_Rdy), .Fetch(Fetch),
    .v1_in(v1_in), .v1_out(v1_out),
    .v2_in(v2_in), .v2_out(v2_out),
    .v0_in(v0_in), .v0_out(v0_out),
    .sid_in(sid_Mem_in), .sid_out(sid_Mem_out),
    .Mem_NotValid(Mem_NotValid), .Mem_En(Mem_En),
    .triangle_id(triangle_id),
    .Tri_Rdy(Tri_Rdy)
  );

  ContactDetect CD (
    .clk(clk), .rst(rst), .start(start),
    .u(u), .v(v), .det(det), 
    .done(done),
    .result(result)
  );

  ContactPoint CP (
    .clk(clk), .rst(rst), .start(start),
    .t(t), .orig(orig), .dir(dir), 
    .done(done),
    .result(IntersectionPoint_in)
  );
  
endmodule