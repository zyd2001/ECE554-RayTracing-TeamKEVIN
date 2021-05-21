module Float_Sqrt (
	input clk,
    input areset,
    input en,
    input [31:0] a,
    output logic [31:0] q 
);

    logic [31:0] pip [7:0];
    shortreal out, in;

    assign q = en ? pip[7] : '0;
    always_comb begin 
        in = $bitstoshortreal(a);
        if (in >= 0)
            out = $sqrt(in);
        else 
            out = 0;
    end

    genvar i;
    generate;
        for (int i=1; i<8; ++i) begin
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
                pip[0] <= $shortrealtobits(out);
            end else begin
                pip[0] <= '0;
            end
                
        end
        
    end
endmodule