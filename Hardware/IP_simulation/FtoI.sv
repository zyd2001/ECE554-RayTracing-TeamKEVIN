module FtoI (
	input clk,
    input areset,
    input en,
    input [31:0] a,
    output logic signed [31:0] q 
);

    logic signed [31:0] pip0, pip1;
    shortreal in;

    assign q = en ? pip1 : '0;
    always_comb begin 
        in = $bitstoshortreal(a);
    end

    always_ff @( posedge clk, posedge areset ) begin : internal_pipe
        if (areset) begin
            pip0 <= '0;
            pip1 <= '0;
        end else begin
            if (en) begin
                pip0 <= int'(in);
                pip1 <= pip0;
            end else begin
                pip0 <= '0;
                pip1 <= '0;
            end
                
        end
        
    end
endmodule