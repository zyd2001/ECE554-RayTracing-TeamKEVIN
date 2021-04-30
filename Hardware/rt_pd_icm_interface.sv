module rt_pd_icm_interface
 #(
    parameter NUM_THREAD = 32,
    parameter BIT_THREAD = $clog2(NUM_THREAD)
    )
 
 (
    input clk,
    input rst_n,

    // PD
    input job_assign,
    input [BIT_THREAD-1:0] thread_id_in,
    input [31:0] pixel_id_in,
    input [31:0] program_counter_in,
    input [31:0] stack_ptr_in,
    output reg context_switch_pd,
    output reg task_done_pd,
    output reg [BIT_THREAD-1:0] thread_id_out,
    output [31:0] program_counter_out,
    output [31:0] stack_ptr_out,
    
    // IC MEM
    input [127:0] shader_info,
    input [127:0] normal,
    output reg de_q,
    output [127:0] origin,
    output [127:0] direction,

    // RT
    input end_program,
    input context_switch_rt,

    input [31:0] scalar_rd_data_0,
    input [31:0] scalar_rd_data_1,
    input [127:0] vector_rd_data_0,
    input [127:0] vector_rd_data_1,

    output [4:0] scalar_rd_addr_0,
    output [4:0] scalar_rd_addr_1,
    output [3:0] vector_rd_addr_0,
    output [3:0] vector_rd_addr_1,

    output reg kernel_mode,
    output reg scalar_we,
    output reg vector_we,
    output reg [4:0] scalar_wb_addr,
    output reg [3:0] vector_wb_addr,
    output reg [31:0] scalar_wb_data,
    output reg [127:0] vector_wb_data,

    
    );

    logic upd_in;
    logic upd_out;
    logic [31:0] pid;
    logic [31:0] pc;
    logic [31:0] sp;
    logic [127:0] rv14;
    logic [127:0] rv15;

    // RT
    assign scalar_rd_addr_0 = 5'd31;
    assign scalar_rd_addr_1 = 5'd29;
    assign vector_rd_addr_0 = 4'd14;
    assign vector_rd_addr_1 = 4'd15;
    // PD
    assign program_counter_out = pc;
    assign stack_ptr_out = sp;
    // IC MEM
    assign origin = rv14;
    assign direction = rv15;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            thread_id_out <= '0;
            pid <= 32'h0;
        end
        else if (upd_in)
            thread_id_out <= thread_id_in;
            pid <= pixel_id_in;
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pc <= 32'h0;
            sp <= 32'h0;
            rv14 <= 127'h0;
            rv15 <= 127'h0;
        end
        else if (upd_in) begin
            pc <= program_counter_in;
            sp <= stack_ptr_in;
            rv14 <= shader_info;
            rv15 <= normal;
        end
        else if (upd_out) begin
            pc <= scalar_rd_data_0;
            sp <= scalar_rd_data_1;
            rv14 <= vector_rd_data_0;
            rv15 <= vector_rd_data_1;
        end
    end

    typedef enum reg [1:0] {IDLE_LOAD, LOADING_LOAD_0, LOADING_LOAD_1, LOADING_LOAD_2} t_state_load;
    t_state_load state_load, nxt_state_load;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state_load <= IDLE_LOAD;
        else 
            state_laod <= nxt_state_load;
    end

    always_comb begin
        nxt_state_load = IDLE_LOAD;
        upd_in = 1'h0
        de_q = 1'h0
        kernel_mode = 1'h0;
        scalar_we = 1'h0;
        vector_we = 1'h0;
        scalar_wb_addr = 5'h0;
        vector_wb_addr = 4'h0;
        scalar_wb_data = 32'h0;
        vector_wb_data = 128'h0;

        case(state_load)
            IDLE_LOAD: begin
                if (job_assign) begin
                    nxt_state_load = LOADING_LOAD_0;
                    upd_in = 1'h1;
                    de_q = 1'h1;
                end
            end
            LOADING_LOAD_0: begin
                nxt_state_load = LOADING_LOAD_1;
                kernel_mode = 1'h1;
                scalar_we = 1'h1;
                scalar_wb_addr = 5'h1;
                scalar_wb_data = pid;
                vector_we = 1'h1;
                vector_wb_addr = 4'd14;
                vector_wb_data = rv14;
            end
            LOADING_LOAD_1: begin
                nxt_state_load = LOADING_LOAD_2;
                kernel_mode = 1'h1;
                scalar_we = 1'h1;
                scalar_wb_addr = 5'd31;
                scalar_wb_data = pc;
                vector_we = 1'h1;
                vector_wb_addr = 4'd15;
                vector_wb_data = rv15;
            end
            default: begin
                kernel_mode = 1'h1;
                scalar_we = 1'h1;
                scalar_wb_addr = 5'd29;
                scalar_wb_data = sp;
            end
        endcase
    end

    typedef enum reg [1:0] {IDLE_UNLOAD, UPD_UNLOAD, DONE_UNLOAD} t_state_unload;
    t_state_unload state_unload, nxt_state_unload;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state_unload <= IDLE_UNLOAD;
        else 
            state_unload <= nxt_state_unload;
    end

    always_comb begin
        nxt_state_unload = IDLE_UNLOAD;
        context_switch_pd = 1'h0;
        task_done_pd = 1'h0;
        upd_out = 1'h0;

        case(state_unload)
            IDLE_UNLOAD: begin
               if (end_program && context_switch_rt) 
                   nxt_state_unload = UPD_UNLOAD;
               else if (end_program) 
                   task_done_pd = 1'h1;
            end
            UPD_UNLOAD: begin
                nxt_state_unload = DONE_UNLOAD;
                upd_out = 1'h1;
            end
            default: begin
                context_switch_pd = 1;
            end
    end



endmodule