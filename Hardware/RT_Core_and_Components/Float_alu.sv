///////////////////////////////
// Integer ALU operation encoding
// 0__ ASMD (Add, sub, Mul, Div)
// 1__ special (V_reduce, no-op, square_root, no-op)
//
// Author: Yan Xiao
// Last modify: 4/14
///////////////////////////////

module Float_alu (
    op1, op2, clk, out, done, operation, flag, en, rst_n, en_knock_down, rst
);
    input clk, en, rst_n, rst;
    input [31:0] op1, op2;
    input [2:0] operation;
    output logic [31:0] out;
    output [1:0]flag;
    output logic en_knock_down, done;

    logic [31:0] FPU_out, Sqrt_out;
    logic FPU_en, Sqrt_en, FPU_done, Sqrt_done;

    FPU floating_point_unit(.op1_in(op1), .op2_in(op2), .out(FPU_out), .operation(operation[1:0]), 
        .flag(flag), .clk(clk), .en(FPU_en), .done(FPU_done), .rst_n(rst_n), .rst(rst));
    Sqrt square_root_unit(.in_in(op1), .out(Sqrt_out), .clk(clk), .en(Sqrt_en), .done(Sqrt_done), .rst_n(rst_n), .rst(rst));

    always_comb begin
        FPU_en = 1'b0;
        Sqrt_en = 1'b0;
        en_knock_down = 1'b0;
        done = 1'b0;
        out = op1;
       
        // Float ALU
        if (operation[2] == 1'b0) begin
            out = FPU_out;
            FPU_en = en;
            en_knock_down = en;
            done = FPU_done;
        end
        else begin
            case (operation[1:0])
                2'b00: begin
                    out = FPU_out; 
                    FPU_en = en;
                    en_knock_down = en;
                    done = FPU_done;
                end 
                2'b10: begin 
                    out = Sqrt_out;
                    Sqrt_en = en;
                    en_knock_down = en;
                    done = Sqrt_done;
                end
                default: begin
                    // it is always ready 
                    done = 1'b1;
                    out = op1;
                    en_knock_down = en;
                end
            endcase
        end
        
    end
  

endmodule