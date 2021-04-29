`timescale 1ns / 1ps

module ALU_tb();
  
  logic clk, rst;
  logic Fix_en, Float_en, Converter_en, Sqrt_en;
  logic Fix_start, Float_start, Converter_start, Sqrt_start;
  logic Converter_mode;
  logic [1:0] Fix_mode, Float_mode;
  logic [31:0] Fix_a, Fix_b, Float_a, Float_b, Converter_in, Sqrt_in;
  
  logic Fix_done, Float_done, Converter_done, Sqrt_done;
  logic [31:0] Float_result, Converter_out, Sqrt_out;
  logic [63:0] Fix_result;
    
  ALU iDUT(
    .clk(clk), .rst(rst),
    .Fix_mode(Fix_mode), .Fix_en(Fix_en), .Fix_start(Fix_start), .Fix_a(Fix_a), .Fix_b(Fix_b), .Fix_done(Fix_done), .Fix_result(Fix_result),
    .Float_mode(Float_mode), .Float_en(Float_en), .Float_start(Float_start), .Float_a(Float_a), .Float_b(Float_b), .Float_done(Float_done), .Float_result(Float_result), 
    .Converter_mode(Converter_mode), .Converter_en(Converter_en), .Converter_start(Converter_start), .Converter_in(Converter_in), .Converter_done(Converter_done), .Converter_out(Converter_out),
    .Sqrt_in(Sqrt_in), .Sqrt_en(Sqrt_en), .Sqrt_start(Sqrt_start), .Sqrt_done(Sqrt_done), .Sqrt_out(Sqrt_out));
  
  always #2 clk = ~clk;
  
  initial begin
    clk = 1'b0;
    rst = 1'b1;
    Fix_en = 1'b0;
    Float_en = 1'b0;
    Converter_en = 1'b0;
    Sqrt_en = 1'b0;
    Fix_start = 1'b0;
    Float_start = 1'b0;
    Converter_start = 1'b0;
    Sqrt_start = 1'b0;
    
    Converter_mode = 1'b0;
    Fix_mode = 2'b00;
    Float_mode = 2'b00;
    
    Fix_a = 32'd25;
    Fix_b = 32'd25;
    Float_a = 32'b0_10000000_10011001100110011001100;  // 3.2
    Float_b = 32'b0_10000001_00001100110011001100110;  // 4.2
    Converter_in = 32'b0_10000011_10010000000000000000000; // 25.0
    Sqrt_in = 32'b0_10000011_10010000000000000000000; // 25.0;
    
    #10
    rst = 1'b0;
    #10;
    Fix_en = 1'b1;
    Float_en = 1'b1;
    Converter_en = 1'b1;
    Sqrt_en = 1'b1;
    #10
    Fix_start = 1'b1;
    Float_start = 1'b1;
    Converter_start = 1'b1;
    Sqrt_start = 1'b1;
    #4
    Fix_start = 1'b0;
    Float_start = 1'b0;
    Converter_start = 1'b0;
    Sqrt_start = 1'b0;
    
    #100;
    Fix_start = 1'b1;
    Float_start = 1'b1;
    Converter_start = 1'b1;
    Sqrt_start = 1'b1;
    Sqrt_in = 32'b0_10000100_00100000000000000000000; // 36.0;
    Converter_in = 32'd25; // 25.0
    Converter_mode = 1'b1;
    Fix_mode = 2'b01;
    Float_mode = 2'b01;
    #4
    Fix_start = 1'b0;
    Float_start = 1'b0;
    Converter_start = 1'b0;
    Sqrt_start = 1'b0;
    
    #100;
    Fix_start = 1'b1;
    Float_start = 1'b1;
    Sqrt_start = 1'b1;
    Sqrt_in = 32'b01000010110010000000000000000000; // 100.0;
    Fix_mode = 2'b10;
    Float_mode = 2'b10;
    #4
    Fix_start = 1'b0;
    Float_start = 1'b0;
    Sqrt_start = 1'b0;
    
    #100;
    Fix_start = 1'b1;
    Float_start = 1'b1;
    Sqrt_start = 1'b1;
    Sqrt_in = 32'b01000000100000000000000000000000; // 4.0;
    Float_a = 32'b01000001110010000000000000000000;  // 25
    Float_b = 32'b01000000101000000000000000000000;  //5
    Fix_mode = 2'b11;
    Float_mode = 2'b11;
    #4
    Fix_start = 1'b0;
    Float_start = 1'b0;
    Sqrt_start = 1'b0;
  end
  
endmodule