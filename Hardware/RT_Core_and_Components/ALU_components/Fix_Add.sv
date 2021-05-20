module Fix_Add (
	input clk,
    input rst,
    input en,
    input signed [31:0] a0,
    input signed [31:0] a1,
    output logic signed [32:0] result 
);

    longint operand1, operand2, int_output;

    assign result = int_output;
    always_comb begin 
        operand1 = a0;
        operand2 = a1;
        int_output = operand1 + operand2;
    end
endmodule