`timescale 1ns / 1ps
module IP_tb();
  
  logic clk, rst;
  logic [31:0] a, b;
  
  logic [31:0] q;
  
  Float_Add iDUT (
		.clk    (clk),    //   input,   width = 1,    clk.clk
		.areset (rst), //   input,   width = 1, areset.reset
		.en     (1'b1),     //   input,   width = 1,     en.en
		.a      (a),      //   input,  width = 32,      a.a
		.b      (b),      //   input,  width = 32,      b.b
		.q      (q),      //  output,  width = 32,      q.q
		.opSel  (1'b1)   //   input,   width = 1,  opSel.opSel
	);
  
  always #2 clk = ~clk;
  
  initial begin
    clk = 1'b0;
    rst = 1'b1;
    
    a = 32'b00111111100000000000000000000000; //1
    b = 32'b01000000000000000000000000000000; //2
    #4
    rst = 1'b0;
    #4
    a = 32'b01000000010000000000000000000000; //3
    b = 32'b01000000100000000000000000000000; //4
    #4
    a = 32'b01000000101000000000000000000000; //5
    b = 32'b01000000110000000000000000000000; //6
    #4
    a = 32'b01000000111000000000000000000000; //7
    b = 32'b01000001000000000000000000000000; //8
  end
  
endmodule