module itof (
    in_in, out, clk, en, done, rst_n
);
    input clk, en, rst_n;
    input signed [31:0] in_in;
    output logic [31:0] out; 
    output logic done;

    shortreal out_float;
    int in_integer;
    reg [31:0] in_stored;
    logic [31:0] in;

    assign in = en ? in_in : in_stored;
    
    always_ff @( posedge clk, negedge rst_n ) begin : Pipeline_simulation  
        if (!rst_n) begin
            in_stored <= 32'b0;
        end
        else if (en) begin
            in_stored <= in_in;
        end
    end
    reg [2:0] counter, next_counter; 

    always_comb begin 
        in_integer = in;
        out_float = shortreal'(in_integer);
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
        if (counter == 3'b0 && en == 1'b1 || counter != 3'b0) 
            next_counter = counter + 1;
        if (counter == 3'b111) begin
            done = 1'b1;
        end
    end

endmodule