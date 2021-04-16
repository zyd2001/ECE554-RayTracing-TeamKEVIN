module ftoi (
    in, out, clk
);
    input clk;
    input [31:0] in;
    output signed [31:0] out; 

    shortreal in_float = in;
    int out_integer;

    out_integer = int'(in_float);
    assign out = out_integer;
endmodule