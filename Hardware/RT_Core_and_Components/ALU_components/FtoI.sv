module FtoI (
	input clk,
    input areset,
    input en,
    input [31:0] a,
    output logic signed [31:0] q 
);

    logic signed [31:0] pip0;
    shortreal in;

    assign q = en ? pip0 : '0;
    always_comb begin 
        in = $bitstoshortreal(a);
    end

    always_ff @( posedge clk, posedge areset ) begin : internal_pipe
        if (areset) begin
            pip0 <= '0;

        end else begin
            if (en) begin
                pip0 <= int'(in);
            end else begin
                pip0 <= '0;
            end
                
        end
        
    end
endmodule