module itof (
    in, out, clk
); 
    input clk;
    input signed [31:0] in;
    output [31:0] out; 

    shortreal out_float;
    int in_integer;

    always_comb begin 
        in_integer = in;
        out_float = float'(in_integer);
        out = $shortrealtobits(out_float);
    end
  
endmodule