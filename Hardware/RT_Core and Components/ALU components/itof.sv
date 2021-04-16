module itof (
    in, out, clk
); 
    input clk;
    input signed [31:0] in;
    output [31:0] out; 

    shortreal out_float;
    int in_integer = in;

    assign out_float = float'(in_integer);
    assign out = out_float;
endmodule