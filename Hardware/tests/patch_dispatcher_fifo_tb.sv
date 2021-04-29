module patch_dispatcher_tb();

logic clk, rst_n;
logic en_q, de_q;
logic empty;
logic [4:0] data_in, data_out;

patch_dispatcher_fifo iDUT
    (
        .clk(clk),
        .rst_n(rst_n),
        .en_q(en_q),
        .de_q(de_q),
        .data_in(data_in),
        .empty(empty),
        .data_out(data_out)
    );


always #5 clk = ~clk;

initial begin
    clk = 0;
    rst_n = 1;
    en_q = 0;
    de_q = 0;
    data_in = 5'h0;
    @(negedge clk);
    rst_n = 0;
    @(negedge clk);
    rst_n = 1;

    @(negedge clk);
    if (!empty) begin
        $display("Err");
        $stop();
    end

    for (int i = 0; i < 32; i++) begin
        en_q = 1;
        data_in = i;
        @(negedge clk);
        if (empty) begin
            $display("Err");
            $stop();
        end
    end

    en_q = 0;

    if (data_out !== 5'b0) begin
        $display("Err");
        $stop();
    end

    for (int i = 1; i < 32; i++) begin
        de_q = 1;
        @(negedge clk);
        if (data_out !== i) begin
            $display("Err");
            $stop();
        end
    end

    de_q = 1;
    @(negedge clk);
     de_q = 0;
    if (!empty) begin
        $display("Err");
        $stop();
    end

    for (int i = 0; i < 15; i++) begin
        en_q = 1;
        data_in = i;
        @(negedge clk);
        if (empty) begin
            $display("Err");
            $stop();
        end
    end

    if (data_out !== 0) begin
        $display("Err");
        $stop();
    end

    for (int i = 1; i < 15; i++) begin
        en_q = 1;
        de_q = 1;
        data_in = i;
        @(negedge clk);
        if (data_out !== i) begin
            $display("Err");
            $stop();
        end
    end
    en_q = 1;
    de_q = 1;
    data_in = 5'hF;
    @(negedge clk);
    en_q = 0;
    de_q = 0;
    if (empty) begin
        $display("Err");
        $stop();
    end

    for (int i = 1; i <= 15; i++) begin
        if (data_out !== i) begin
            $display("Err");
            $stop();
        end
        de_q = 1;
        @(negedge clk);
     end

     if (!empty) begin
        $display("Err");
        $stop();
     end

     $display("Pass");
     $stop();









end

endmodule