module Float_Sqrt (
	input clk,
    input areset,
    input en,
    input [31:0] a,
    output logic [31:0] q 
);

    logic [31:0] pip0, pip1, pip2, pip3, pip4;
    shortreal out, in;

    assign q = en ? pip4 : '0;
    always_comb begin 
        in = $bitstoshortreal(a);
        out = $sqrt(in);
    end

    always_ff @( posedge clk, posedge areset ) begin : internal_pipe
        if (areset) begin
            pip0 <= '0;
            pip1 <= '0;
            pip2 <= '0;
            pip3 <= '0;
            pip4 <= '0;

        end else begin
            if (en) begin
                pip0 <= $shortrealtobits(out);
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