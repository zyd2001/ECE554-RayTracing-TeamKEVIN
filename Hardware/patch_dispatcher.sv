module patch_dispatcher
  #(  
        parameter NUM_RT = 4,
        parameter NUM_IC = 4,
        parameter NUM_THREAD = 32,
        parameter BIT_THREAD = $clog2(NUM_THREAD)
    )
   (
        input clk,
        input rst_n,

        input load_cp,
        input [31:0] pixel_id_cp,

        input task_done_rt[NUM_RT-1:0],
        input context_switch_rt[NUM_RT-1:0],
        input [BIT_THREAD-1:0] thread_id_in_rt[NUM_RT-1:0],
        input [31:0] pc_in_rt[NUM_RT-1:0],
        input [31:0] stack_ptr_in_rt[NUM_RT-1:0],

        input context_switch_ic[NUM_IC-1:0],
        input [BIT_THREAD-1:0] thread_id_in_ic[NUM_IC-1:0],

        output patch_done,

        output job_dispatch_rt[NUM_RT-1:0],
        output [BIT_THREAD-1:0] thread_id_out_rt,
        output [31:0] pixel_id_rt,
        output [31:0] pc_out_rt,
        output [31:0] sp_out_rt,

        output job_dispatch_ic[NUM_IC-1:0],
        output [BIT_THREAD-1:0] thread_id_out_ic,

        output q_en_rt2ic,
        output core_id_rt2ic[NUM_RT-1:0],

        output q_en_ic2rt,
        output core_id_ic2rt[NUM_IC-1:0]

        );

    
    localparam BIT_RT = $clog2(NUM_RT);
    localparam BIT_IC = $clog2(NUM_IC);

    genvar i;
    integer j = 0;


    logic [BIT_THREAD:0] job_done;

    // RT to IC
    logic empty_tid_rt2ic;
    logic en_q_tid_rt2ic;
    logic de_q_tid_rt2ic;
    logic [BIT_THREAD-1:0] data_in_tid_rt2ic;
    logic [BIT_THREAD-1:0] data_out_tid_rt2ic;

    logic context_switch_rt2ic[NUM_RT-1:0];
    logic en_q_sel_rt2ic[NUM_RT-1:0];
    logic [31:0] data_sel_tid_rt2ic;
    logic [31:0] pc_sel_rt2ic;
    logic [31:0] sp_sel_rt2ic;

    //IC to RT
    logic empty_tid_ic2rt;
    logic en_q_tid_ic2rt;
    logic de_q_tid_ic2rt;
    logic [BIT_THREAD-1:0] data_in_tid_ic2rt;
    logic [BIT_THREAD-1:0] data_out_tid_ic2rt;

    logic context_switch_ic2rt[NUM_IC-1:0];
    logic en_q_sel_ic2rt[NUM_IC-1:0];
    logic [31:0] data_sel_tid_ic2rt;



    /*
        Command Processor Initialization
    */
    
    logic en_q_load;
    logic [31:0] pixel_id[NUM_THREAD-1:0];
    logic [BIT_THREAD:0] pixel_id_addr;
    logic pixel_id_we;
    logic pixel_id_addr_clr;

    always_ff @( posedge clk, negedge rst_n ) begin
        if (!rst_n)
            pixel_id_addr <= '0;
        else if (pixel_id_addr_clr)
            pixel_id_addr <= '0;
        else if (pixel_id_we)
            pixel_id_addr <= pixel_id_addr + 1;
    end
    
    always_ff @( posedge clk , negedge rst_n) begin
        if (!rst_n) begin
            for (j = 0; j < NUM_THREAD; j = j + 1)
                pixel_id[j] <= 32'h0;
        end  
        else if (pixel_id_we)
            pixel_id[pixel_id_addr[BIT_THREAD-1:0]] <= pixel_id_cp;
    end

    typedef enum reg {LOAD_IDLE, LOAD_LOADING} t_state_load;
    t_state_load state_load, nxt_state_load;

    always_ff @( posedge clk, negedge rst_n ) begin 
        if (!rst_n)
            state_load <= LOAD_IDLE;
        else 
            state_load <= nxt_state_load;
    end

    always_comb begin
        nxt_state_load = LOAD_IDLE;
        pixel_id_we = 1'h0;
        pixel_id_addr_clr = 1'h0;
        en_q_load = 1'h0;

        case(state_load)
            LOAD_IDLE: begin
                if (load_cp) begin
                    nxt_state_load = LOAD_LOADING;
                    pixel_id_we = 1'h1;
                    en_q_load = 1'h1;
                end
            end
            default: begin
               if (pixel_id_addr[BIT_THREAD] == 1'h1) begin
                   nxt_state_load = LOAD_IDLE;
                   pixel_id_addr_clr = 1'h1;
               end 
               else begin
                   nxt_state_load = LOAD_LOADING;
                   pixel_id_we = 1'h1;
                   en_q_load = 1'h1;
               end
            end
        endcase
    end

    // Flag Register for availability of RT and IC
    logic busy_rt[NUM_RT-1:0];
    logic busy_ic[NUM_IC-1:0];

    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n)
                    busy_rt[i] <= 1'h0;
                else if (en_q_sel_rt2ic[i] || job_dispatch_rt[i] || task_done_rt[i])
                    busy_rt[i] <= ~busy_rt[i];
            end
        end
        for (i = 0; i < NUM_IC; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n)
                    busy_ic[i] <= 1'h0;
                else if (en_q_sel_ic2rt[i] || job_dispatch_ic[i])
                    busy_ic[i] <= ~busy_ic[i];
            end
        end
    endgenerate

    logic [31:0] pc[NUM_THREAD-1:0];
    logic [31:0] sp [NUM_THREAD-1:0];
    
    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            for (j = 0; j < NUM_THREAD; j = j + 1) begin
                pc[j] <= 32'h0;
                sp[j] <= 32'h0;
            end
        end
        else if (en_q_tid_rt2ic) begin
            pc[data_in_tid_rt2ic] <= pc_sel_rt2ic;
            sp[data_in_tid_rt2ic] <= sp_sel_rt2ic;
        end
    end
    
    // Non Paramatrized
    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            job_done <= '0;
        else if (patch_done)
            job_done <= '0;
        else 
            job_done <= job_done + {{BIT_THREAD{1'h0}}, task_done_rt[0]} 
                                + {{BIT_THREAD{1'h0}}, task_done_rt[1]}
                                + {{BIT_THREAD{1'h0}}, task_done_rt[2]} 
                                + {{BIT_THREAD{1'h0}}, task_done_rt[3]};
    end 

    assign patch_done = job_done[BIT_THREAD];

    /*
        RT to IC
    */

    patch_dispatcher_fifo thread_id_rt2ic
        (
            .clk(clk),
            .rst_n(rst_n),
            .en_q(en_q_tid_rt2ic),
            .de_q(de_q_tid_rt2ic),
            .data_in(data_in_tid_rt2ic),
            .empty(empty_tid_rt2ic),
            .data_out(data_out_tid_rt2ic)
            );

    // Input 
    // Non Paramatrized
    assign en_q_sel_rt2ic[0] = context_switch_rt2ic[0];
    assign en_q_sel_rt2ic[1] = !context_switch_rt2ic[0] && context_switch_rt2ic[1];
    assign en_q_sel_rt2ic[2] = !context_switch_rt2ic[0] && !context_switch_rt2ic[1] && context_switch_rt2ic[2];
    assign en_q_sel_rt2ic[3] = !context_switch_rt2ic[0] && !context_switch_rt2ic[1] && !context_switch_rt2ic[2] && context_switch_rt2ic[3];

    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            assign core_id_rt2ic[i] = en_q_sel_rt2ic[i];
        end
    endgenerate
    
    // Non Paramatrized
    assign en_q_tid_rt2ic = context_switch_rt2ic[0] || context_switch_rt2ic[1] || context_switch_rt2ic[2] || context_switch_rt2ic[3];
    assign q_en_rt2ic = en_q_tid_rt2ic;

    assign data_in_tid_rt2ic = en_q_sel_rt2ic[0] ? thread_id_in_rt[0]   
                                : en_q_sel_rt2ic[1] ? thread_id_in_rt[1]
                                : en_q_sel_rt2ic[2] ? thread_id_in_rt[2]
                                : thread_id_in_rt[3];
    
    assign pc_sel_rt2ic = en_q_sel_rt2ic[0] ? pc_in_rt[0]   
                                : en_q_sel_rt2ic[1] ? pc_in_rt[1]
                                : en_q_sel_rt2ic[2] ? pc_in_rt[2]
                                : pc_in_rt[3];
    assign sp_sel_rt2ic = en_q_sel_rt2ic[0] ? stack_ptr_in_rt[0]   
                                : en_q_sel_rt2ic[1] ? stack_ptr_in_rt[1]
                                : en_q_sel_rt2ic[2] ? stack_ptr_in_rt[2]
                                : stack_ptr_in_rt[3];


    typedef enum reg {ENQ_IDLE_RT2IC, ENQ_WAIT_RT2IC} t_state_en_q_rt2ic;
    t_state_en_q_rt2ic state_en_q_rt2ic[NUM_RT-1:0], nxt_state_en_q_rt2ic[NUM_RT-1:0];

    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @( posedge clk, negedge rst_n ) begin 
                if (!rst_n)
                    state_en_q_rt2ic[i] <= ENQ_IDLE_RT2IC;
                else 
                    state_en_q_rt2ic[i] <= nxt_state_en_q_rt2ic[i];
            end
            always_comb begin
                nxt_state_en_q_rt2ic[i] = ENQ_IDLE_RT2IC;
                context_switch_rt2ic[i] = 1'h0;

                case(state_en_q_rt2ic[i])
                    ENQ_IDLE_RT2IC: begin
                        if (context_switch_rt[i]) begin
                            context_switch_rt2ic[i] = 1'h1;
                            if (!en_q_sel_rt2ic[i])
                                nxt_state_en_q_rt2ic[i] = ENQ_WAIT_RT2IC;
                        end
                    end
                    default: begin
                        context_switch_rt2ic[i] = 1'h1;
                        if (!en_q_sel_rt2ic[i])
                            nxt_state_en_q_rt2ic[i] = ENQ_WAIT_RT2IC;
                    end
                endcase
            end
        end 
    endgenerate


    // Output 
    // Non Paramatrized
    assign job_dispatch_ic[0] = !empty_tid_rt2ic && !busy_ic[0];
    assign job_dispatch_ic[1] = !empty_tid_rt2ic && busy_ic[0] && !busy_ic[1];
    assign job_dispatch_ic[2] = !empty_tid_rt2ic && busy_ic[0] && busy_ic[1] && !busy_ic[2];
    assign job_dispatch_ic[3] = !empty_tid_rt2ic && busy_ic[0] && busy_ic[1] && busy_ic[2] && !busy_ic[3];
    // Non Paramatrized
    assign de_q_tid_rt2ic = !empty_tid_rt2ic && !(busy_ic[0] && busy_ic[1] && busy_ic[2] && busy_ic[3]);

    assign thread_id_out_ic = data_out_tid_rt2ic;

    /*
        IC to RT
    */

    patch_dispatcher_fifo thread_id_ic2rt
        (
            .clk(clk),
            .rst_n(rst_n),
            .en_q(en_q_tid_ic2rt || en_q_load),
            .de_q(de_q_tid_ic2rt),
            .data_in(data_in_tid_ic2rt),
            .empty(empty_tid_ic2rt),
            .data_out(data_out_tid_ic2rt)
            );

    // Input 
    // Non Paramatrized
    assign en_q_sel_ic2rt[0] = context_switch_ic2rt[0];
    assign en_q_sel_ic2rt[1] = !context_switch_ic2rt[0] && context_switch_ic2rt[1];
    assign en_q_sel_ic2rt[2] = !context_switch_ic2rt[0] && !context_switch_ic2rt[1] && context_switch_ic2rt[2];
    assign en_q_sel_ic2rt[3] = !context_switch_ic2rt[0] && !context_switch_ic2rt[1] && !context_switch_ic2rt[2] && context_switch_ic2rt[3];

    generate
        for (i = 0; i < NUM_IC; i = i + 1) begin
            assign core_id_ic2rt[i] = en_q_sel_ic2rt[i];
        end
    endgenerate

    // Non Paramatrized
    assign en_q_tid_ic2rt = context_switch_ic2rt[0] || context_switch_ic2rt[1] || context_switch_ic2rt[2] || context_switch_ic2rt[3];
    assign q_en_ic2rt = en_q_tid_ic2rt;


    // Non Paramatrized
    assign data_in_tid_ic2rt = en_q_load ? {{(31-BIT_THREAD){1'h0}}, pixel_id_addr} : data_sel_tid_ic2rt;
    assign data_sel_tid_ic2rt = en_q_sel_ic2rt[0] ? thread_id_in_ic[0]   
                                : en_q_sel_ic2rt[1] ? thread_id_in_ic[1]
                                : en_q_sel_ic2rt[2] ? thread_id_in_ic[2]
                                : thread_id_in_ic[3];

    typedef enum reg {ENQ_IDLE_IC2RT, ENQ_WAIT_IC2RT} t_state_en_q_ic2rt;
    t_state_en_q_ic2rt state_en_q_ic2rt[NUM_IC-1:0], nxt_state_en_q_ic2rt[NUM_IC-1:0];

    generate
        for (i = 0; i < NUM_IC; i = i + 1) begin
            always_ff @( posedge clk, negedge rst_n ) begin 
                if (!rst_n)
                    state_en_q_ic2rt[i] <= ENQ_IDLE_IC2RT;
                else 
                    state_en_q_ic2rt[i] <= nxt_state_en_q_ic2rt[i];
            end
            always_comb begin
                nxt_state_en_q_ic2rt[i] = ENQ_IDLE_IC2RT;
                context_switch_ic2rt[i] = 1'h0;

                case(state_en_q_ic2rt[i])
                    ENQ_IDLE_IC2RT: begin
                        if (context_switch_ic[i]) begin
                            context_switch_ic2rt[i] = 1'h1;
                            if (!en_q_sel_ic2rt[i])
                                nxt_state_en_q_ic2rt[i] = ENQ_WAIT_IC2RT;
                        end
                    end
                    default: begin
                        context_switch_ic2rt[i] = 1'h1;
                        if (!en_q_sel_ic2rt[i])
                            nxt_state_en_q_ic2rt[i] = ENQ_WAIT_IC2RT;
                    end
                endcase
            end
        end 
    endgenerate

    // output 
    // Non Paramatrized
    assign de_q_tid_ic2rt = !en_q_load && !empty_tid_ic2rt && !(busy_rt[0] && busy_rt[1] && busy_rt[2] && busy_rt[3]);

    // Non Paramatrized
    assign job_dispatch_rt[0] = !en_q_load && !empty_tid_ic2rt && !busy_rt[0];
    assign job_dispatch_rt[1] = !en_q_load && !empty_tid_ic2rt && busy_rt[0] && !busy_rt[1];
    assign job_dispatch_rt[2] = !en_q_load && !empty_tid_ic2rt && busy_rt[0] && busy_rt[1] && !busy_rt[2];
    assign job_dispatch_rt[3] = !en_q_load && !empty_tid_ic2rt && busy_rt[0] && busy_rt[1] && busy_rt[2] && !busy_rt[3];

    assign thread_id_out_rt = data_out_tid_ic2rt;
    assign pixel_id_rt = pixel_id[data_out_tid_ic2rt];
    assign pc_out_rt = pc[data_out_tid_ic2rt];
    assign sp_out_rt = sp[data_out_tid_ic2rt];

endmodule