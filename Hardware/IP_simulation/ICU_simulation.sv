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
    op1_in, op2_in, out, operation, flag, clk, en, done, rst_n, rst
);
    input clk, en, rst_n, rst;
    input signed [31:0] op1_in, op2_in;
    input signed [1:0] operation;
    output logic signed [63:0] out;
    output logic [1:0] flag;
    output logic done;

    reg [1:0] counter, next_counter; 
    longint operand1, operand2, int_output;
    reg [31:0] op1_stored, op2_stored;
    logic [31:0] op1, op2;

    always_ff @( posedge clk, negedge rst_n ) begin : Pipeline_simulation  
        if (!rst_n) begin
            op1_stored <= 32'b0;
            op2_stored <= 32'b0;
        end
        else if (en) begin
            op1_stored <= op1_in;
            op2_stored <= op2_in;
        end
    end

    assign op1 = en ? op1_in : op1_stored;
    assign op2 = en ? op2_in : op2_stored;

    
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
        flag[0] = out[63];      

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