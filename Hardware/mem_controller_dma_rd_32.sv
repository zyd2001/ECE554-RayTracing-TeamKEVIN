module mem_controller_dma_rd_32 
   #(
        parameter SIZE_32 = 16
        )
    (   
        input clk,
        input rst_n,
        input dma_rd_strt,
        input dma_rd_done,
        input dma_empty,
        output reg dma_rd_end_32,
        output reg dma_rd_go_32,
        output reg  dma_rd_en_32,
        output reg dma_rd_data_32_upd,
        output reg dma_rd_data_32_shft,
        output reg dma_rd_done_clr_32,
        output reg [1:0] mem_wr_en_32
        );
    


    logic [4:0] mem_wr_data_32_cnt;
    logic mem_wr_data_32_cnt_clr;
    logic mem_wr_data_32_cnt_inc;
    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n)
            mem_wr_data_32_cnt <= 5'h0;
        else if (mem_wr_data_32_cnt_clr)
            mem_wr_data_32_cnt <= 5'h0;
        else if (mem_wr_data_32_cnt_inc)
            mem_wr_data_32_cnt <= mem_wr_data_32_cnt + 5'h1;
    end
    
    typedef enum reg [2:0] {DMA_RD_32_IDLE, DMA_RD_32_GO, DMA_RD_32_WAIT, DMA_RD_32_HOLD
                            ,DMA_RD_32_EMPTY, DMA_RD_32_LOAD} t_state_dma_rd_32;
    t_state_dma_rd_32 state_dma_rd_32, nxt_state_dma_rd_32;
    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n)
            state_dma_rd_32 <= DMA_RD_32_IDLE;
        else
            state_dma_rd_32 <= nxt_state_dma_rd_32;
    end
    always_comb begin 
        nxt_state_dma_rd_32 = DMA_RD_32_IDLE;
        dma_rd_end_32 = 1'h0;
        dma_rd_go_32 = 1'h0;
        dma_rd_en_32 = 1'h0;
        dma_rd_data_32_upd = 1'h0;
        dma_rd_data_32_shft = 1'h0;
        mem_wr_data_32_cnt_clr = 1'h0;
        mem_wr_data_32_cnt_inc = 1'h0;
        dma_rd_done_clr_32 = 1'h0;
        mem_wr_en_32 = 2'b00;

        case(state_dma_rd_32)
            DMA_RD_32_IDLE: begin
                if (dma_rd_strt) begin
                    nxt_state_dma_rd_32 = DMA_RD_32_GO;
                end
            end
            DMA_RD_32_GO: begin
                nxt_state_dma_rd_32 = DMA_RD_32_WAIT;
                dma_rd_go_32 = 1'h1;
            end
            DMA_RD_32_WAIT: begin
                if (dma_rd_done) begin
                    dma_rd_end_32 = 1'h1;
                    mem_wr_en_32 = 2'b10;
                    dma_rd_done_clr_32 = 1'h1;
                end
                else if (!dma_empty) begin
                    nxt_state_dma_rd_32 = DMA_RD_32_EMPTY;
                end
                else
                    nxt_state_dma_rd_32 = DMA_RD_32_WAIT;
            end
            DMA_RD_32_EMPTY: begin
                nxt_state_dma_rd_32 = DMA_RD_32_HOLD;
                dma_rd_data_32_upd = 1'h1;
            end
            DMA_RD_32_HOLD: begin
                nxt_state_dma_rd_32 = DMA_RD_32_LOAD;
                dma_rd_en_32 = 1'h1;
		        dma_rd_data_32_shft = 1'h1;
                mem_wr_data_32_cnt_inc = 1'h1;
                mem_wr_en_32 = 2'b01;
            end
            default: begin
                if (mem_wr_data_32_cnt == SIZE_32) begin
                    nxt_state_dma_rd_32 = DMA_RD_32_WAIT;
                    mem_wr_data_32_cnt_clr = 1'h1;
                end
                else begin
                    nxt_state_dma_rd_32 = DMA_RD_32_LOAD;
                    dma_rd_data_32_shft = 1'h1;
                    mem_wr_data_32_cnt_inc = 1'h1;
                    mem_wr_en_32 = 2'b01;
                end
            end
	endcase
    end
endmodule