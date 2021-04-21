module Sqrt (
    in, out, clk
);
    input clk;
    input [31:0] in;
    output [31:0] out;

    shortreal in_float, out_float;

    always_comb begin
        in_float = $bitstoshortreal(in);
        out_float = $sqrt(in_float);
        out = $shortrealtobits(out_float);
    end

endmodule