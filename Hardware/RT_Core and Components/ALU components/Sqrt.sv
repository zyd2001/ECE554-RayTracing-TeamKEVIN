module Sqrt (
    in, out, clk
);
    input clk;
    input [31:0] in;
    output [31:0] out;

    always_comb begin
        out = $sqrt(in);
    end

endmodule