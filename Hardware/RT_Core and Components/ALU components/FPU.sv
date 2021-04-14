///////////////////////////////
// Floating point compute unit encoding
// 00: Add
// 01: Sub
// 10: Multiply
// 11: Divide
//
// Flag encoding
// 
// Author: Yan Xiao
// Last modify: 4/14
///////////////////////////////


module FPU (
    op1, op2, out, operation, flag 
);
    input [31:0] op1, op2;
    input [1:0] operation;
    output [31:0] out;
    output [1:0] flag;


endmodule