`timescale 1ns / 1ps
module IC_tb();
  
  parameter NUM_THREAD = 32;
  parameter NUM_TRIANGLE = 512;
  localparam BIT_THREAD = $clog2(NUM_THREAD);
  localparam BIT_TRIANGLE = $clog2(NUM_TRIANGLE);
  
  logic clk, rst;
  // IC Mem
  logic Core_ID;
  logic [BIT_THREAD-1:0] thread_id_in;
  logic [95:0] orig, dir;
  
  logic IC_Mem_Rdy;
  logic [BIT_THREAD-1:0] thread_id_out;
  logic [31:0] sid_out;
  logic [95:0] norm, IntersectionPoint;
  // Tri Mem
  logic Mem_Rdy, Mem_NotValid;
  logic [95:0] v1, v2, v0;
  logic [31:0] sid_in;
  
  logic Mem_En;
  logic unsigned [BIT_TRIANGLE-1:0] triangle_id;
  
  IC iDUT(
    .clk(clk), .rst(rst),
    .Core_ID(Core_ID), .thread_id_in(thread_id_in), .thread_id_out(thread_id_out), .IntersectionPoint(IntersectionPoint),
    .sid_in(sid_in), .sid_out(sid_out), .dir(dir), .orig(orig), .norm(norm), .IC_Mem_Rdy(IC_Mem_Rdy),
    .Mem_Rdy(Mem_Rdy), .v1(v1), .v2(v2), .v0(v0), .Mem_NotValid(Mem_NotValid), .triangle_id(triangle_id), .Mem_En(Mem_En)
  );
  
  always #2 clk = ~clk;
  
  initial begin
    clk = 1'b0;
    rst = 1'b1;
    Core_ID = 1'b0;
    thread_id_in = 5'b00100;
    
    Mem_Rdy = 1'b0;
    Mem_NotValid = 1'b1;
    
    sid_in = 32'h00000007;
    
    v1 = 96'b01000000010000000000000000000000_01000000100000000000000000000000_00000000000000000000000000000000; //3,4,0
    v2 = 96'b11000000010000000000000000000000_01000000100000000000000000000000_00000000000000000000000000000000; //-3,4,0
    v0 = 96'b00000000000000000000000000000000_01000000100000000000000000000000_01000001001000000000000000000000; //0,4,10
    
    orig = 96'b00000000000000000000000000000000_00000000000000000000000000000000_01000000000000000000000000000000; //0,0,2
    dir = 96'b00000000000000000000000000000000_00111111100000000000000000000000_00000000000000000000000000000000; //0,1,0
    
    #4
    rst = 1'b0;
    #4
    Core_ID = 1'b1;
    
  end
  
endmodule