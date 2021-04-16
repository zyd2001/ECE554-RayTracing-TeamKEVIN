///////////////////////////////
// Integer ALU operation encoding
// 0__ ASMD (Add, sub, Mul, Div)
// 1__ special (V_reduce, no-op, square_root, no-op)
//
// Author: Yan Xiao
// Last modify: 4/14
///////////////////////////////

module Float_alu (
    op1, op2, clk, out, done, operation, flag
);
    input clk;
    input [31:0] op1, op2;
    input [2:0] operation
    output [31:0] out;
    output [1:0]flag;
    output done;

    logic [31:0] FPU_out, floating_point_out;
    FPU floating_point_unit(.op1(op1), .op2(op2), .out(FPU_out), .operation(operation[1:0]), .flag(flag), .clk(clk));
    Sqrt square_root_unit(.in(op1), .out(floating_point_out), .clk(clk));

    always_comb begin
        if (operation[2] === 1'b0) out = FPU_out;
        else begin
            case (operation[1:0])
                2'b00: out = FPU_out; 
                2'b10: out = floating_point_out;
                default: out = op1;
            endcase
            
        end
    end
  

endmodule