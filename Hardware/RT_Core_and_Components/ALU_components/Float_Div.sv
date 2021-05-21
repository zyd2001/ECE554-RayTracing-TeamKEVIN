module Float_Div (
	input clk,
    input areset,
    input en,
    input [31:0] a,
    input [31:0] b,
    output logic [31:0] q
);

    logic [31:0] pip [11:0];
    shortreal operand1, operand2, float_output;

    assign q = en ? pip[11] : '0;
    always_comb begin 
        operand1 = $bitstoshortreal(a);
        operand2 = $bitstoshortreal(b);
        float_output =  operand1 / operand2;
    end

    genvar i;
    generate;
        for (int i=1; i<12; ++i) begin
            always_ff@( posedge clk, posedge rst ) begin
                if (rst) 
                    pip[i] <= '0;
                else if (en)
                    pip[i] <= pip[i-1];
                else
                    pip[i] <= '0;
            end
        end
    endgenerate

    always_ff @( posedge clk, posedge areset ) begin : internal_pipe
        if (areset) begin
            pip[0] <= '0;
        end else begin
            if (en) begin
                pip[0] <= $shortrealtobits(float_output);
            end
            else begin
                pip[0] <= '0;
            end
        end
        
    end
endmodule