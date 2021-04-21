module Sqrt (
    in, out, clk, en, done, rst_n
);
    input clk, en, rst_n;
    input [31:0] in;
    output logic [31:0] out;
    output logic done;
    
    shortreal in_float, out_float;
    reg [4:0] counter, next_counter; 

    always_comb begin
        in_float = $bitstoshortreal(in);
        out_float = $sqrt(in_float);
        out = $shortrealtobits(out_float);
    end

    always_ff @( posedge clk ) begin
        if (!rst_n)
            counter <= 2'b0;
        else
            counter <= next_counter;
    end

    always_comb begin 
        next_counter = counter;
        done = 1'b0;
        if (counter == 5'b0 && en == 1'b1 || counter != 5'b0) 
            next_counter = counter + 1;
        if (counter == 5'b10001) begin
            done = 1'b1;
            next_counter = 5'b0;
        end
    end
endmodule