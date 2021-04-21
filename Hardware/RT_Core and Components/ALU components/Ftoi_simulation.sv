module ftoi (
    in, out, clk
);
    input clk;
    input [31:0] in;
    output signed [31:0] out; 

    shortreal in_float;
    int out_integer;
    
    always_comb begin 
        in_float = $bitstoshortreal(in);
        out_integer = int'(in_float);
        out = out_integer;
    end

endmodule