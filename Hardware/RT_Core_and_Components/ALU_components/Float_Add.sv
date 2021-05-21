module Float_Add (
	input clk,
    input areset,
    input en,
    input [31:0] a,
    input [31:0] b,
    input opSel,
    output logic [31:0] q
);

    logic [31:0] pip0, pip1, pip2;
    shortreal operand1, operand2, float_output;

    assign q = en ? pip2 : '0;
    always_comb begin 
        operand1 = $bitstoshortreal(a);
        operand2 = $bitstoshortreal(b);
        float_output = opSel ? operand1 + operand2 : operand1 - operand2;
    end

    always_ff @( posedge clk, posedge areset ) begin : internal_pipe
        if (areset) begin
            pip0 <= '0;
            pip1 <= '0;
            pip2 <= '0;
        end else begin
            if (en) begin
                pip0 <= $shortrealtobits(float_output);
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