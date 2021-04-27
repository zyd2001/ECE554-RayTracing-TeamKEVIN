module mem_controller_dma_rd_128
    (   
        input clk,
        input rst_n,
        input dma_rd_strt,
        input dma_rd_done,
        input dma_empty,
        input mem_wr_rdy,
        output reg dma_rd_end_128,
        output reg dma_rd_go_128,
        output reg  dma_rd_en_128,
        output reg dma_rd_data_128_upd,
        output reg dma_rd_data_128_shft,
        output reg dma_rd_done_clr_128,
        output reg [1:0] mem_wr_en_128
        );
    


    logic [2:0] mem_wr_data_128_cnt;
    logic mem_wr_data_128_cnt_clr;
    logic mem_wr_data_128_cnt_inc;
    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n)
            mem_wr_data_128_cnt <= 3'h0;
        else if (mem_wr_data_128_cnt_clr)
            mem_wr_data_128_cnt <= 3'h0;
        else if (mem_wr_data_128_cnt_inc)
            mem_wr_data_128_cnt <= mem_wr_data_128_cnt + 3'h1;
    end
    
    typedef enum reg [2:0] {DMA_RD_128_IDLE, DMA_RD_128_GO, DMA_RD_128_WAIT, DMA_RD_128_HOLD, 
                            DMA_RD_128_LOAD} t_state_dma_rd_128;
    t_state_dma_rd_128 state_dma_rd_128, nxt_state_dma_rd_128;
    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n)
            state_dma_rd_128 <= DMA_RD_128_IDLE;
        else
            state_dma_rd_128 <= nxt_state_dma_rd_128;
    end
    always_comb begin 
        nxt_state_dma_rd_128 = DMA_RD_128_IDLE;
        dma_rd_end_128 = 1'h0;
        dma_rd_go_128 = 1'h0;
        dma_rd_en_128 = 1'h0;
        dma_rd_data_128_upd = 1'h0;
        dma_rd_data_128_shft = 1'h0;
        mem_wr_data_128_cnt_clr = 1'h0;
        mem_wr_data_128_cnt_inc = 1'h0;
        dma_rd_done_clr_128 = 1'h0;
        mem_wr_en_128 = 2'b00;

        case(state_dma_rd_128)
            DMA_RD_128_IDLE: begin
                if (dma_rd_strt) begin
                    nxt_state_dma_rd_128 = DMA_RD_128_GO;
                end
            end
            DMA_RD_128_GO: begin
                nxt_state_dma_rd_128 = DMA_RD_128_WAIT;
                dma_rd_go_128 = 1'h1;
            end
            DMA_RD_128_WAIT: begin
                if (dma_rd_done) begin
                    dma_rd_end_128 = 1'h1;
                    mem_wr_en_128 = 2'b10;
                    dma_rd_done_clr_128 = 1'h1;
                end
                else if (!dma_empty) begin
                    nxt_state_dma_rd_128 = DMA_RD_128_HOLD;
                    dma_rd_data_128_upd = 1'h1;
                end
                else
                    nxt_state_dma_rd_128 = DMA_RD_128_WAIT;
            end
            DMA_RD_128_HOLD: begin
                nxt_state_dma_rd_128 = DMA_RD_128_LOAD;
                dma_rd_en_128 = 1'h1;
                mem_wr_en_128 = 2'b01;
                dma_rd_data_128_shft = 1'h1;
		        mem_wr_data_128_cnt_inc = 1'h1;
            end
            default: begin
                if (mem_wr_rdy) begin
                    if (mem_wr_data_128_cnt[2]) begin
                        nxt_state_dma_rd_128 = DMA_RD_128_WAIT;
                        mem_wr_data_128_cnt_clr = 1'h1;
                    end
                    else begin
                        nxt_state_dma_rd_128 = DMA_RD_128_LOAD;
                        mem_wr_en_128 = 2'b01;
                        dma_rd_data_128_shft = 1'h1;
                        mem_wr_data_128_cnt_inc = 1'h1;
                    end
                end
                else
                    nxt_state_dma_rd_128 = DMA_RD_128_LOAD;
            end
	endcase
    end
endmodule