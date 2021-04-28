module CP(clk, rst_n, init_mem_fin_MC, patch_out_done_MC, pixel_size_MC,
        load_start_PD, load_done_PD, pixel_id_PD);
    parameter NUM_THREAD = 32;
    localparam BIT_THREAD = $clog2(NUM_THREAD);
    /*
        input
    */
    input clk, rst_n;
    // MC
    input init_mem_fin_MC;
    input patch_out_done_MC;
    input [31:0] pixel_size_MC;
    /*
        output
    */
    // PD
    output logic load_start_PD;
    output load_done_PD;
    output [31:0] pixel_id_PD;
    enum {idle, patching, patching_wait} state, next;

    logic load_done_patch, load_done_patch_in, load_done_term;
    // logic load_start_PD_reg_in, load_start_PD_reg;
    logic [BIT_THREAD-1:0] thread_cnt, thread_cnt_in;
    logic [31:0] pixel_max, pixel_curr, pixel_curr_in;
    assign pixel_id_PD = pixel_curr;
    assign load_done_PD = load_done_patch | load_done_term;
    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            state <= idle;
            thread_cnt <= '0;
            load_done_patch <= 1'b0;
            pixel_max <= '0;
            pixel_curr <= '0;
        end
        else begin
            state <= next;
            thread_cnt <= thread_cnt_in;
            load_done_patch <= load_done_patch_in;
            pixel_max <= init_mem_fin_MC ? pixel_size_MC - 1 : pixel_max;
            pixel_curr <= pixel_curr_in;
        end
    end

    always_comb begin
        next = state;
        thread_cnt_in = thread_cnt;
        load_start_PD = 1'b0;
        load_done_term = 1'b0;
        load_done_patch_in = 1'b0;
        pixel_curr_in = pixel_curr;
        case(state)
            patching: begin
                if(pixel_curr == pixel_max) begin
                    next = idle;
                    thread_cnt_in = '0;
                    pixel_curr_in = '0;
                    load_done_patch_in = 1'b1;
                end
                else begin
                    pixel_curr_in = pixel_curr + 1;
                    if (&thread_cnt) begin
                        next = patching_wait;
                        thread_cnt_in = '0;
                        load_done_patch_in = 1'b1;
                    end
                    else begin
                        thread_cnt_in = thread_cnt + 1;
                    end
                end
            end
            patching_wait: begin
                if(patch_out_done_MC) begin
                    next = patching;
                    thread_cnt_in = thread_cnt + 1;
                    load_start_PD = 1'b1;
                    pixel_curr_in = pixel_curr + 1;
                end
            end
            default: begin
                if(init_mem_fin_MC) begin
                    next = patching;
                    thread_cnt_in = thread_cnt + 1;
                    load_start_PD = 1'b1;
                    pixel_curr_in = pixel_curr + 1;
                end
            end
        endcase
    end

endmodule