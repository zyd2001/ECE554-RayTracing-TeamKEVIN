///////////////////////////////
// Floating point compute unit encoding
// 00: Add
// 01: Sub
// 10: Multiply
// 11: Divide
//
// Flag encoding
// Zero bit, sign bit
// 0x: output is 0
// 10: positive
// 11: negative
//
// Author: Yan Xiao
// Last modify: 4/14
///////////////////////////////


module FPU (
    op1, op2, out, operation, flag, clk
);
    input clk; // in case it cannot be done in one cycle 
    input [31:0] op1, op2;
    input [1:0] operation;
    output [31:0] out;
    output [1:0] flag;

    // I don't know how...

endmodule