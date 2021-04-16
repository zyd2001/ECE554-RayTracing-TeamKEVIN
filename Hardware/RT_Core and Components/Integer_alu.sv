///////////////////////////////
// Integer ALU operation encoding
// 00__ ASMD (Add, sub, Mul, Div)
// 01__ NAOX (Not, And, Or, Xor) (Opcode encoding _011_)
// 1x__ special (S_write_high, S_write_low, S_itof, S_ftoi)
//
// Opcode encoding
// 1 bit: 100___
// 2 bit: _011__
// 3-4 bit: last two bits of Opcode
//
// Author: Yan Xiao
// Last modify: 4/14
///////////////////////////////

module Integer_alu (
    op1, op2, clk, out, done, operation, flag
);
    input clk;
    input signed [31:0] op1, op2;
    input [3:0] operation
    output signed [31:0] out;
    output [1:0]flag;
    output done;

    logic [31:0] ASMD, NAOX, special, itof_result, ftoi_result;
    itof itof_caster(.in(op1), .out(itof_result), .clk(clk));
    ftoi ftoi_caster(.in(op1), .out(ftoi_result), .clk(clk));
    ICU integer_unit(.op1(op1), .op2(op2), .out(ASMD), .operation(operation[1:0]), .flag(flag), .clk(clk));
    
    always_comb begin 
        case (operation[1:0])
            2'b00: NAOX = ~op1;
            2'b01: NAOX = op1 & op2;
            2'b10: NAOX = op1 | op2;
            default: NAOX = op1 ^ op2;
        endcase
        case (operation[1:0])
            2'b00: special = {op2[15:0], op1[15:0]};
            2'b01: special = {op1[31:16], op2[15:0]};
            2'b10: special = itof_result;
            default: special = ftoi_result;
        endcase

        if (operation[3] === 1'b0) begin
            if (operation[2] === 1'b0) out = ASMD;
            else out = NAOX;
        end else out = special;
    end

endmodule