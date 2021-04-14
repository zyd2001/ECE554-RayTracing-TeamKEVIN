`timescale 1ns / 1ps

module FPU_tb();
  
  reg clk, rst;
  reg [1:0] mode;
  reg [31:0] a, b, out;
  
  FPU iDUT(
    .clk(clk), .rst(rst),
    .mode(mode), 
    .a(a),
    .b(b),
    .out(out));
  
  initial begin
    clk = 1'b1;
    rst = 1'b0;
    a = 32'b0_10000001_00001100110011001100110;  // 4.2 
    b = 32'b0_10000000_10011001100110011001100;  // 3.2
    mode = 2'b00;
    #10
    rst = 1'b1;
    
  end
  
  always #5 clk = ~clk;
  
endmodule