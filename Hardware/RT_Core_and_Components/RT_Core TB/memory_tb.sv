module memory_tb ();

    logic clk, rst_n, en, done;
    logic [31:0] op1, out;
    logic [8:0]op2;
    logic [1:0] operation, flag;

    shortreal op1sr, op2sr, outsr;

    single_port_ram_inst #(.ADDR_WIDTH(9), .DATA_WIDTH(32)) iDUT(.clk(clk), .addr(op2), .q(out), .we(1'b0), .data(32'b0));
    assign op2 = op1[10:2];

    initial begin
        clk = 0;
        operation = 2'b11;
        rst_n = 0;
        op1 = 32'h0000;
        @(negedge clk)
        rst_n = 1;
        en = 1;
        @(negedge clk)
        $display("result it: %h", out);
        op1 = 32'h0004;
        @(negedge clk);
        $display("result it: %h", out);
        $stop();

    end

    always #2 clk = ~clk;

endmodule