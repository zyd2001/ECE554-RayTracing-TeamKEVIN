///////////////////////////////
// Integer compute unit encoding
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


module ICU (
    op1, op2, out, operation, flag, clk
); 
    input clk;
    input signed [31:0] op1, op2;
    input [1:0] operation;
    output signed [31:0] out;
    output [1:0] flag;

    always_comb begin 
        case (operation)
            2'b00: out = op1 + op2;
            2'b01: out = op1 - op2;
            2'b10: out = op1 * op2;
            default: out = op1 / op2;
        endcase
    end

    assign flag[1] = |out == 0;
    assign flag[0] = out[31];
    
endmodule