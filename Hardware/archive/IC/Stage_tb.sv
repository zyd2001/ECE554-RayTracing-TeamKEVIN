`timescale 1ns / 1ps
module Stage_tb();
  
  logic clk, rst;
  logic start;
  logic [95:0] vector1, vector2;
  
  logic done;
  logic [31:0] result;
  
  StageII iDUT(
    .clk(clk), .rst(rst), .StageII_done(StageII_done), StageIII_capture, StageII_capture,
    v0v1_in, v0v1_out,
    v0v2_in, v0v2_out,
    dir_in, dir_out,
    tvec_in, tvec_out,
    pvec_in, pvec_out,
    qvec_in, qvec_out,
    thread_id_in, thread_id_out,
    triangle_id_in, triangle_id_out,
    sid_in, sid_out);
  
  DotProduct iDUT(
    .clk(clk), .rst(rst), .start(start),
    .vector1(vector1), 
    .vector2(vector2),
    .done(done),
    .result(result));
  
  always #2 clk = ~clk;
  
  initial begin
    clk = 1'b0;
    rst = 1'b1;
    start = 1'b0;
    
    vector1 = 96'b01000000010000000000000000000000_01000000100000000000000000000000_01000000101000000000000000000000; //3,4,5
    vector2 = 96'b01000001000000000000000000000000_01000001000100000000000000000000_01000001001000000000000000000000; //8,9,10
    
    
    #10
    rst = 1'b0;
    #10
    start = 1'b1;
    #4
    start = 1'b0;
    
    vector1 = 96'b00111111100000000000000000000000_01000000000000000000000000000000_01000000010000000000000000000000; //1,2,3
    vector2 = 96'b01000001010000000000000000000000_01000001010100000000000000000000_01000001011000000000000000000000; //12,13,14
  end
  
endmodule