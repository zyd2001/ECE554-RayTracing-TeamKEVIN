module Float_Div (
	input clk,
    input areset,
    input en,
    input [31:0] a,
    input [31:0] b,
    output logic [31:0] q
);

    logic [31:0] pip0, pip1, pip2, pip3, pip4;
    shortreal operand1, operand2, float_output;

    assign q = en ? pip4 : '0;
    always_comb begin 
        operand1 = $bitstoshortreal(a);
        operand2 = $bitstoshortreal(b);
        float_output =  operand1 / operand2;
    end

    always_ff @( posedge clk, posedge rst ) begin : internal_pipe
        if (rst) begin
            pip0 <= '0;
            pip1 <= '0;
            pip2 <= '0;
            pip3 <= '0;
            pip4 <= '0;
        end else begin
            if (en)
                pip0 <= $shortrealtobits(float_output);
                pip1 <= pip0;
                pip2 <= pip1;
                pip3 <= pip2;
                pip4 <= pip3;
            else 
                pip0 <= '0;
                pip1 <= '0;
                pip2 <= '0;
                pip3 <= '0;
                pip4 <= '0;
        end
        
    end
endmodule