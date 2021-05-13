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
    op1, op2, clk, out, done, operation, flag, en, rst_n, en_knock_down, rst
);
    input clk, en, rst_n, rst;
    input signed [31:0] op1, op2;
    input [3:0] operation;
    output logic signed [31:0] out;
    output [1:0]flag;
    output logic en_knock_down, done;

    logic [31:0] ASMD_out, itof_out, ftoi_out;
    logic itof_done, ftoi_done, ICU_done;
    logic itof_en, ftoi_en, ICU_en;

    itf itof(.in_in(op1), .out(itof_out), .clk(clk), .en(itof_en), .done(itof_done), .rst_n(rst_n), .rst(rst));
    fti ftoi(.in_in(op1), .out(ftoi_out), .clk(clk), .en(ftoi_en), .done(ftoi_done), .rst_n(rst_n), .rst(rst));
    ICU integer_unit(.op1_in(op1), .op2_in(op2), .out(ASMD_out), .operation(operation[1:0]), 
        .flag(flag), .clk(clk), .en(1'h1), .done(ICU_done), .rst_n(rst_n), .rst(rst));
    
    always_comb begin 
        itof_en = 1'b0;
        ftoi_en = 1'b0;
        ICU_en = 1'b0;
        en_knock_down = 1'b0;
        done = 1'b0;
        out = op1;
        
        if (operation[3] === 1'b0) begin
            if (operation[2] === 1'b0) begin
                out = ASMD_out;
                ICU_en = en;
                en_knock_down = en;
                done = ICU_done;
            end 
            else begin
                done = 1'b1;
                en_knock_down = 1'b1;
                case (operation[1:0])
                    2'b00: out = ~op1;
                    2'b01: out = op1 & op2;
                    2'b10: out = op1 | op2;
                    default: out = op1 ^ op2;
                endcase
            end
        end else begin
            case (operation[1:0])
                2'b00: begin 
                    done = 1'b1;
                    en_knock_down = 1'b1;
                    out = {op2[15:0], op1[15:0]};
                end 
                2'b01: begin
                    done = 1'b1;
                    en_knock_down = 1'b1;
                    out = {op1[31:16], op2[15:0]};
                end 
                2'b10: begin 
                    itof_en = en;
                    en_knock_down = en;
                    out = itof_out;
                    done = itof_done;
                end 
                default: begin 
                    ftoi_en = en;
                    en_knock_down = en;
                    out = ftoi_out;
                    done = ftoi_done;
                end 
            endcase

        end
        
    end

endmodule