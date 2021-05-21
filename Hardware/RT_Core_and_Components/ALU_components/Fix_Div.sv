module Fix_Div (
	input clk,
    input rst,
    input en,
    input signed [31:0] numerator,
    input signed [31:0] denominator,
    output logic signed [31:0] result 
);

    logic signed [31:0] pip [21:0];
    longint operand1, operand2, int_output;

    assign result = en ? pip[21] : '0;
    always_comb begin 
        operand1 = numerator;
        operand2 = denominator;
        int_output = operand1 / operand2;
    end

    genvar i;
    generate;
        for (int i=1; i<22; ++i) begin
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

    always_ff @( posedge clk, posedge rst ) begin : internal_pipe
        if (rst) begin
            pip[0] <= '0;
        end else begin
            if (en) begin
                pip[0] <= int_output;
            end else begin
                pip[0] <= '0;
            end     
        end
    end
endmodule