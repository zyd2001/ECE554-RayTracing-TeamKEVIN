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
// In this model, assume the latency of all operations  
// will be 4 cycles
//
// Author: Yan Xiao
// Last modify: 4/14
///////////////////////////////


module ICU (
    op1, op2, out, operation, flag, clk, en, done, rst_n
);
    input clk, en, rst_n;
    input signed [31:0] op1, op2;
    input signed [1:0] operation;
    output logic signed [31:0] out;
    output logic [1:0] flag;
    output logic done;

    reg [1:0] counter, next_counter; 
    int operand1, operand2, int_output;

    always_comb begin 
        operand1 = op1;
        operand2 = op2;
        case (operation)
            2'b00: int_output = operand1 + operand2;
            2'b01: int_output = operand1 - operand2;
            2'b10: int_output = operand1 * operand2;
            default: int_output = operand1 / operand2;
        endcase
        out = int_output;
        if (int_output == 0)
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