module FPU_tb ();

    logic clk, rst_n, en, done;
    logic [31:0] op1, op2, out;
    logic [1:0] operation, flag;

    shortreal op1sr, op2sr, outsr;

    Sqrt iDUT(.in(op1), .out(out), .clk(clk), .en(en), .done(done), .rst_n(rst_n));

    initial begin
        clk = 0;
        operation = 2'b11;
        rst_n = 0;
        en = 0;
        op1sr = 100;
        op2sr = 5;
        op1 = $shortrealtobits(op1sr);
        op2 = (op2sr);
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        rst_n = 1;
        en = 1;
        @(posedge done)
        outsr = $bitstoshortreal(out);
        $display("result it: %f", outsr);
        @(negedge clk);
        operation = 2'b00;
        op1sr = 90;
        op2sr = 99;
        op1 = (op1sr);
        op2 = (op2sr);
        @(posedge done)
        outsr = (out);
    
        $display("result it: %d", outsr);
        $stop();

    end

    always #2 clk = ~clk;

endmodule