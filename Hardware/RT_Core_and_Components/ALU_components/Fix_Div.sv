module Fix_Div (
	input clk,
    input rst,
    input en,
    input signed [31:0] numerator,
    input signed [31:0] denominator,
    output logic signed [31:0] result 
);

    logic signed [31:0] pip0, pip1, pip2, pip3, pip4;
    longint operand1, operand2, int_output;

    assign result = en ? pip4 : '0;
    always_comb begin 
        operand1 = numerator;
        operand2 = denominator;
        int_output = operand1 / operand2;
    end

    always_ff @( posedge clk, posedge rst ) begin : internal_pipe
        if (rst) begin
            pip0 <= '0;
            pip1 <= '0;
            pip2 <= '0;
            pip3 <= '0;
            pip4 <= '0;

        end else begin
            if (en) begin
                pip0 <= int_output;
                pip1 <= pip0;
                pip2 <= pip1;
                pip3 <= pip2;
                pip4 <= pip3;
            end else begin
                pip0 <= '0;
                pip1 <= '0;
                pip2 <= '0;
                pip3 <= '0;
                pip4 <= '0;
            end
                
        end
        
    end
endmodule