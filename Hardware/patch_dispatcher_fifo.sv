module patch_dispatcher_fifo
  #(
        parameter DEPTH = 32,
        parameter WIDTH = 5
	)
   (
        input clk,
        input rst_n,
        input en_q,
        input de_q,
        input [WIDTH-1:0] data_in,
        output empty,
        output [WIDTH-1:0] data_out
        );

	localparam BIT_DEPTH = $clog2(DEPTH);

    genvar i;

    logic [WIDTH-1:0] fifo[DEPTH-1:0];
    logic [BIT_DEPTH:0] cnt;
    logic [BIT_DEPTH:0] addr_en_q;

    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n)
            cnt <= '0;
        else if (en_q && de_q)
            cnt <= cnt;
        else if (en_q)
            cnt <= cnt + 1;
        else if (de_q)
            cnt <= cnt - 1;
    end

    assign addr_en_q = de_q ? (cnt - 1) : cnt;

    assign empty = cnt == 0;

    generate
        for (i = 0; i < DEPTH-1; i = i + 1) begin
            always_ff @( posedge clk, negedge rst_n) begin
                if (!rst_n)
                    fifo[i] <= '0;
                else if (en_q && i == addr_en_q) 
                    fifo[i] <= data_in;
                else if (de_q)
                    fifo[i] <= fifo[i + 1];
            end
        end

        always_ff @( posedge clk, negedge rst_n) begin
            if (!rst_n)
                fifo[DEPTH-1]  <= '0;
            else if (en_q && (DEPTH-1) == addr_en_q)
                fifo[DEPTH-1] <= data_in;
            else if (de_q)
                fifo[DEPTH-1] <= '0;
        end
    endgenerate

    assign data_out = fifo[0];

endmodule