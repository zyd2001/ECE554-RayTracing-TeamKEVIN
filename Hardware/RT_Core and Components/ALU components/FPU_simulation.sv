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
// In this model, assume the latency of all operations  
// will be 4 cycles
//
// Author: Yan Xiao
// Last modify: 4/14
///////////////////////////////


module FPU (
    op1, op2, out, operation, flag, clk, en, done, rst_n
);
    input clk, en, rst_n;
    input [31:0] op1, op2;
    input [1:0] operation;
    output logic [31:0] out;
    output logic [1:0] flag;
    output logic done;

    reg [1:0] counter, next_counter; 
    shortreal operand1, operand2, float_output;

    always_comb begin 
        operand1 = $bitstoshortreal(op1);
        operand2 = $bitstoshortreal(op2);
        case (operation)
            2'b00: float_output = operand1 + operand2;
            2'b01: float_output = operand1 - operand2;
            2'b10: float_output = operand1 * operand2;
            default: float_output = operand1 / operand2;
        endcase
        out = $shortrealtobits(float_output);
        if (float_output == 0)
            flag[1] = 0;
        else 
            flag[1] = 1;
        flag[0] = out[31];      

    end

    always_ff @( posedge clk ) begin
        if (!rst_n)
            counter <= 2'b0;
        else
            counter <= next_counter;
    end

    always_comb begin 
        next_counter = counter;
        done = 1'b0;
        if (counter == 2'b0 && en == 1'b1 || counter != 2'b0) 
            next_counter = counter + 1;
        if (counter == 2'b11)
            done = 1'b1;
    end


endmodule