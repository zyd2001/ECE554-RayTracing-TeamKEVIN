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
        input load_done_cp,
        input [31:0] pixel_id_cp,

        input task_done_rt[NUM_RT-1:0],
        input context_switch_rt[NUM_RT-1:0],
        input [BIT_THREAD-1:0] thread_id_in_rt[NUM_RT-1:0],
        input [31:0] pc_in_rt[NUM_RT-1:0],
        input [31:0] stack_ptr_in_rt[NUM_RT-1:0],

        input context_switch_ic[NUM_IC-1:0],
        input [BIT_THREAD-1:0] thread_id_in_ic[NUM_IC-1:0],

        output patch_done,

        output reg job_dispatch_rt[NUM_RT-1:0],
        output reg [BIT_THREAD-1:0] thread_id_out_rt,
        output reg [31:0] pixel_id_rt,
        output reg [31:0] pc_out_rt,
        output reg [31:0] sp_out_rt,

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
    integer k = 0;


    logic [BIT_THREAD:0] job_done;

    // RT to IC
    logic empty_tid_rt2ic;
    logic en_q_tid_rt2ic;
    logic de_q_tid_rt2ic;
    logic [BIT_THREAD-1:0] data_in_tid_rt2ic;
    logic [BIT_THREAD-1:0] data_out_tid_rt2ic;

    logic [NUM_RT-1:0] context_switch_rt2ic;
    logic [NUM_RT-1:0] en_q_sel_rt2ic;
    logic [BIT_THREAD-1:0] data_sel_tid_rt2ic;
    logic [31:0] pc_sel_rt2ic;
    logic [31:0] sp_sel_rt2ic;

    logic en_q_sel_rt2ic_reg[NUM_RT-1:0];
    logic en_q_tid_rt2ic_reg;

    //IC to RT
    logic empty_tid_ic2rt;
    logic en_q_tid_ic2rt;
    logic de_q_tid_ic2rt;
    logic [BIT_THREAD-1:0] data_in_tid_ic2rt;
    logic [BIT_THREAD-1:0] data_out_tid_ic2rt;

    logic [NUM_IC-1:0] context_switch_ic2rt;
    logic [NUM_IC-1:0] en_q_sel_ic2rt;
    logic [BIT_THREAD-1:0] data_sel_tid_ic2rt;

    logic job_dispatch_rt_wire[NUM_RT-1:0];

    


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
        else if (patch_done)
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
               if (load_done_cp) begin
                   nxt_state_load = LOAD_IDLE;
                //    pixel_id_addr_clr = 1'h1;
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
    logic [NUM_RT-1:0] busy_rt;
    logic [NUM_IC-1:0] busy_ic;

    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n)
                    busy_rt[i] <= 1'h0;
                else if (en_q_sel_rt2ic_reg[i] || job_dispatch_rt_wire[i] || task_done_rt[i])
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

    logic [31:0] pc [NUM_THREAD-1:0];
    logic [31:0] sp [NUM_THREAD-1:0];

    // reg [BIT_THREAD-1:0] b, c;
    
    always_ff @(posedge clk, negedge rst_n) begin
        // if (!rst_n) begin
        //     for (k = 0; k < NUM_THREAD; k++) begin
        //         pc[k] <= 32'h0;
        //         sp[k] <= 32'h0;
        //     end
        // end
        if (!rst_n) begin
            for (int b = 0; b < NUM_THREAD; b++) begin
                pc[b] <= 32'h0;
                sp[b] <= {{1'h1}, {(15-BIT_THREAD){1'h0}}, b[BIT_THREAD-1:0], {16'h0}};
            end
        end
        else if (load_cp) begin
            for (int c = 0; c < NUM_THREAD; c++) begin
                pc[c] <= 32'h0;
                sp[c] <= {{1'h1}, {(15-BIT_THREAD){1'h0}}, c[BIT_THREAD-1:0], {16'h0}};
            end
        end
        else if (en_q_tid_rt2ic_reg) begin
            pc[data_in_tid_rt2ic] <= pc_sel_rt2ic;
            sp[data_in_tid_rt2ic] <= sp_sel_rt2ic;
        end
    end
    

    logic [BIT_THREAD:0] task_done_rt_sum;
    always_comb begin
        task_done_rt_sum = {(BIT_THREAD+1){1'h0}};
        for (int a = 0; a < NUM_RT; a++) begin
            task_done_rt_sum += {{BIT_THREAD{1'h0}}, task_done_rt[a]};
        end
    end

    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            job_done <= '0;
        else if (patch_done)
            job_done <= '0;
        else 
            job_done <= job_done + task_done_rt_sum;
    end 

    assign patch_done = job_done != 0 && job_done == pixel_id_addr;

    /*
        RT to IC
    */


    patch_dispatcher_fifo thread_id_rt2ic
        (
            .clk(clk),
            .rst_n(rst_n),
            .en_q(en_q_tid_rt2ic_reg),
            .de_q(de_q_tid_rt2ic),
            .data_in(data_in_tid_rt2ic),
            .empty(empty_tid_rt2ic),
            .data_out(data_out_tid_rt2ic)
            );

    // Input 

    generate
        for (i = 1; i < NUM_RT; i++) begin
            assign en_q_sel_rt2ic[i] = context_switch_rt2ic[i] && !(|context_switch_rt2ic[i-1:0]);
        end
        assign en_q_sel_rt2ic[0] = context_switch_rt2ic[0];
    endgenerate

    generate;
        for (i = 0; i < NUM_RT; i++) begin
            always_ff @(posedge clk or negedge rst_n) begin
                if (!rst_n)
                    en_q_sel_rt2ic_reg[i] <= '0;
                else 
                    en_q_sel_rt2ic_reg[i] <= en_q_sel_rt2ic[i];
            end
        end
    endgenerate

    generate
        for (i = 0; i < NUM_RT; i = i + 1) begin
            assign core_id_rt2ic[i] = en_q_sel_rt2ic_reg[i];
        end
    endgenerate

    assign en_q_tid_rt2ic = |context_switch_rt2ic;

    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            en_q_tid_rt2ic_reg <= '0;
        else 
            en_q_tid_rt2ic_reg <= en_q_tid_rt2ic;
    end

    assign q_en_rt2ic = en_q_tid_rt2ic_reg;

    always_comb begin
        data_in_tid_rt2ic = {BIT_THREAD{1'h0}};
        pc_sel_rt2ic = {32'h0};
        sp_sel_rt2ic = {32'h0};
        for (int a = 0; a < NUM_RT; a++) begin
            data_in_tid_rt2ic |= {BIT_THREAD{en_q_sel_rt2ic_reg[a]}} & thread_id_in_rt[a];
            pc_sel_rt2ic |= {32{en_q_sel_rt2ic_reg[a]}} & pc_in_rt[a];
            sp_sel_rt2ic |= {32{en_q_sel_rt2ic_reg[a]}} & stack_ptr_in_rt[a];
        end
    end


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

    generate
        for (i = 1; i < NUM_IC; i++) begin
            assign job_dispatch_ic[i] = !empty_tid_rt2ic && !busy_ic[i] && (&busy_ic[i-1:0]);
        end
        assign job_dispatch_ic[0] = !empty_tid_rt2ic && !busy_ic[0];
    endgenerate

    // Output 
    assign de_q_tid_rt2ic = !empty_tid_rt2ic && !(&busy_ic);
    assign thread_id_out_ic = data_out_tid_rt2ic;

    /*
        IC to RT
    */

    patch_dispatcher_fifo #(.DEPTH(NUM_THREAD),.WIDTH(BIT_THREAD)) thread_id_ic2rt
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
    generate
        for (i = 1; i < NUM_IC; i++) begin
            assign en_q_sel_ic2rt[i] = context_switch_ic2rt[i] && !(|context_switch_ic2rt[i-1:0]);
        end
        assign en_q_sel_ic2rt[0] = context_switch_ic2rt[0];
    endgenerate

    generate
        for (i = 0; i < NUM_IC; i = i + 1) begin
            assign core_id_ic2rt[i] = en_q_sel_ic2rt[i];
        end
    endgenerate

    assign en_q_tid_ic2rt = |context_switch_ic2rt;
    assign q_en_ic2rt = en_q_tid_ic2rt;

    assign data_in_tid_ic2rt = en_q_load ? pixel_id_addr : data_sel_tid_ic2rt;

    always_comb begin
        data_sel_tid_ic2rt = {BIT_THREAD{1'h0}};
        for (int a = 0; a < NUM_IC; a++) begin
            data_sel_tid_ic2rt |= {BIT_THREAD{en_q_sel_ic2rt[a]}} & thread_id_in_ic[a];
        end
    end

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
    assign de_q_tid_ic2rt = !en_q_load && !empty_tid_ic2rt && !(&busy_rt);

    generate
        for (i = 1; i < NUM_RT; i++) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if (!rst_n) 
                    job_dispatch_rt[i] <= '0;
                else 
                    job_dispatch_rt[i] <= job_dispatch_rt_wire[i];
            end
            assign job_dispatch_rt_wire[i] = !en_q_load && !empty_tid_ic2rt && !busy_rt[i] && (&busy_rt[i-1:0]);
        end
        always_ff @(posedge clk, negedge rst_n) begin
            if (!rst_n) 
                job_dispatch_rt[0] <= '0;
            else 
                job_dispatch_rt[0] <= job_dispatch_rt_wire[0];
        end
        assign job_dispatch_rt_wire[0] = !en_q_load && !empty_tid_ic2rt && !busy_rt[0];
    endgenerate


    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            thread_id_out_rt <= '0;
            pixel_id_rt <= '0;
            pc_out_rt <= '0;
            sp_out_rt <= '0;
        end
        else begin
            thread_id_out_rt <= data_out_tid_ic2rt;
            pixel_id_rt <= pixel_id[data_out_tid_ic2rt];
            pc_out_rt <= pc[data_out_tid_ic2rt];
            sp_out_rt <= sp[data_out_tid_ic2rt];
        end
    end

endmodule