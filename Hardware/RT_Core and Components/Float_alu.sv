///////////////////////////////
// Integer ALU operation encoding
// 0__ ASMD (Add, sub, Mul, Div)
// 1__ special (V_reduce, no-op, square_root, no-op)
//
// Author: Yan Xiao
// Last modify: 4/14
///////////////////////////////

module Float_alu (
    op1, op2, clk, out, done, operation
);
    input clk;
    input [31:0] op1, op2;
    input [2:0] operation
    output [31:0] out;
    output done;
    
  

endmodule