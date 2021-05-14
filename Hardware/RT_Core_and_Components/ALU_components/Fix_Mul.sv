module Fix_Mul (
	input clk,
    input rst,
    input en,
    input signed [31:0] a,
    input signed [31:0] b,
    output logic signed [63:0] result 
);

    logic signed [63:0] pip0, pip1, pip2;
    longint operand1, operand2, int_output;

    assign result = en ? pip2 : '0;
    always_comb begin 
        operand1 = a;
        operand2 = b;
        int_output = operand1 * operand2;
    end

    always_ff @( posedge clk, posedge rst ) begin : internal_pipe
        if (rst) begin
            pip0 <= '0;
            pip1 <= '0;
            pip2 <= '0;
        end else begin
            if (en) begin
                pip0 <= int_output;
                pip1 <= pip0;
                pip2 <= pip1;
            end else begin
                pip0 <= '0;
                pip1 <= '0;
                pip2 <= '0;
            end
                
        end
        
    end
endmodule