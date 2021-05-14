module Fix_Add (
	input clk,
    input rst,
    input en,
    input signed [31:0] a0,
    input signed [31:0] a1,
    output logic signed [32:0] result 
);

    logic signed [32:0] pip0;
    longint operand1, operand2, int_output;

    assign result = en ? pip0 : '0;
    always_comb begin 
        operand1 = a0;
        operand2 = a1;
        int_output = operand1 + operand2;
    end

    always_ff @( posedge clk, posedge rst ) begin : internal_pipe
        if (rst) begin
            pip0 <= '0;
        end else begin
            if (en)
                pip0 <= int_output;
            else 
                pip0 <= '0;
        end
        
    end
endmodule