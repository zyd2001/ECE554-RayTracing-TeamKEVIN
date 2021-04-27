module CP(
    load_start_PD, re_mem
    clk, rst_n, patch_out_done_MC, invalid_mem, init_mem_fin,
);
    parameter NUM_THREAD = 32;
    localparam BIT_THREAD = $clog2(NUM_THREAD);
    /*
        input
    */
    input clk, rst_n;
    // mem CP
    input invalid_mem;
    // MC
    input init_mem_fin;
    input patch_out_done_MC;
    /*
        output
    */
    // PD
    output logic load_start_PD;
    output load_done_PD;
    // mem CP
    output logic re_mem;
    enum {idle, patching, patching_wait} state, next;

    logic load_done_PD_reg, load_done_PD_reg_in;
    logic [BIT_THREAD-1:0] thread_cnt, thread_cnt_in;
    assign load_done_PD = invalid_mem | load_done_PD_reg;
    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            state <= idle;
            thread_cnt <= '0;
            load_start_PD <= 1'b0;
            load_done_PD_reg <= 1'b0;
        end
        else begin
            state <= next;
            thread_cnt <= thread_cnt_in;
            load_start_PD <= load_start_PD_in;
            load_done_PD_reg <= load_done_PD_reg_in;
        end
    end

    always_comb begin
        next = state;
        load_done_PD = 1'b0;
        re_mem = 1'b0;
        thread_cnt_in = thread_cnt;
        load_done_PD_reg_in = 1'b0;
        load_start_PD_in = 1'b0;
        case(state)
            patching: begin
                if(invalid_mem) begin
                    next = idle;
                    thread_cnt_in = '0;
                end
                else begin
                    re_mem = 1'b1;
                    if (&thread_cnt) begin
                        next = patching_wait;
                        thread_cnt_in = '0;
                        load_done_PD_reg_in = 1'b1;
                    end
                    else begin
                        thread_cnt_in = thread_cnt + 1;
                    end
                end
            end
            patching_wait: begin
                    next = patching;
                if(patch_out_done_MC) begin
                    re_mem = 1'b1;
                    thread_cnt_in = thread_cnt + 1;
                    load_start_PD_in = 1'b1;
                end
            end
            default: begin
                if(init_mem_fin) begin
                    next = patching;
                    re_mem = 1'b1;
                    thread_cnt_in = thread_cnt + 1;
                    load_start_PD_in = 1'b1;
                end
            end
        endcase
    end

endmodule