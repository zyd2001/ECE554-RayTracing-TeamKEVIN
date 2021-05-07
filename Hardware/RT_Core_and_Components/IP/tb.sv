`timescale 1ns / 1ps
module FPU_tb ();

  logic clk, rst_n, en, done, rst;
  logic [31:0] op1, op2, out;
  logic [1:0] operation, flag;

  shortreal op1sr, op2sr, outsr;
  
  //FPU iDUT (.op1_in(op1), .op2_in(op2), .out(out), .operation(operation), .flag(flag), .clk(clk), .en(en), .done(done), .rst_n(rst_n));
  //ICU iDUT (.op1_in(op1), .op2_in(op2), .out(out), .operation(operation), .flag(flag), .clk(clk), .en(en), .done(done), .rst_n(rst_n));
  //itf iDUT(.in_in(op1), .out(out), .clk(clk), .en(en), .done(done), .rst_n(rst_n));
  fti iDUT_2(.in_in(op1), .out(out), .clk(clk), .en(en), .done(done), .rst_n(rst_n), .rst(rst));
  //itf iDUT_3(.in_in(op1), .out(out), .clk(clk), .en(en), .done(done), .rst_n(rst_n));
  
  initial begin
    clk = 0;
    operation = 2'b11;
    rst_n = 0;
    en = 0;
    op1sr = 100;
    op2sr = 5;
    op1 = $shortrealtobits(op1sr);
    //op1 = (op1sr);
    op2 = $shortrealtobits(op2sr);
    //op2 = (op2sr);
    @(negedge clk)
    @(negedge clk)
    @(negedge clk)
    @(negedge clk)
    rst_n = 1;
    en = 1;
    @(negedge clk)
    en = 0;
    @(posedge done)
    outsr = $bitstoshortreal(out);
    //outsr = (out);
    
    $display("result it: %f", outsr);
    @(negedge clk);
    @(negedge clk);
    operation = 2'b00;
    op1sr = 90;
    op2sr = 99;
    op1 = $shortrealtobits(op1sr);
    //op1 = (op1sr);
    op2 = $shortrealtobits(op2sr);
    //op2 = (op2sr);
    en = 1;
    @(negedge clk)
    en = 0;
    @(posedge done)
    outsr = $bitstoshortreal(out);
    //outsr = (out);

    $display("result it: %f", outsr);
    @(negedge clk);
    @(negedge clk);
    operation = 2'b01;
    op1sr = 625;
    op2sr = 125;
    op1 = $shortrealtobits(op1sr);
    //op1 = (op1sr);
    op2 = $shortrealtobits(op2sr);
    //op2 = (op2sr);
    en = 1;
    @(negedge clk)
    en = 0;
    @(posedge done)
    outsr = $bitstoshortreal(out);
    //outsr = (out);

    $display("result it: %f", outsr);
    @(negedge clk);
    @(negedge clk);
    operation = 2'b10;
    op1sr = 1213;
    op2sr = 1102;
    op1 = $shortrealtobits(op1sr);
    //op1 = (op1sr);
    op2 = $shortrealtobits(op2sr);
    //op2 = (op2sr);
    en = 1;
    @(negedge clk)
    en = 0;
    @(posedge done)
    outsr = $bitstoshortreal(out);
    //outsr = (out);

    $display("result it: %f", outsr);
    $stop();

  end
  
  assign rst = ~rst_n;
 
  always #2 clk = ~clk;

endmodule