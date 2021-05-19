module Float_Mul (
	input clk,
    input areset,
    input en,
    input [31:0] a,
    input [31:0] b,
    output logic [31:0] q
);

    logic [31:0] pip0;
    shortreal operand1, operand2, float_output;

    assign q = en ? pip0 : '0;
    always_comb begin 
        operand1 = $bitstoshortreal(a);
        operand2 = $bitstoshortreal(b);
        float_output = operand1 * operand2;
    end

    always_ff @( posedge clk, posedge areset ) begin : internal_pipe
        if (areset) begin
            pip0 <= '0;
        end else begin
            if (en)
                pip0 <= $shortrealtobits(float_output);
            else 
                pip0 <= '0;
        end
        
    end
endmodule