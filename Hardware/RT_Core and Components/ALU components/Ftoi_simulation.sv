module ftoi (
    in, out, clk, en, done, rst_n
);
    input clk, en, rst_n;
    input [31:0] in;
    output logic signed [31:0] out; 
    output logic done;

    shortreal in_float;
    int out_integer;
    
    reg [1:0] counter, next_counter; 

    always_comb begin 
        in_float = $bitstoshortreal(in);
        out_integer = int'(in_float);
        out = out_integer;
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
        if (counter == 2'b0 && en == 1'b1 || counter != 2'b0) 
            next_counter = counter + 1;
        if (counter == 2'b10) begin
            done = 1'b1;
        end
    end

endmodule