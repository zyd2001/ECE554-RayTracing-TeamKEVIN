module patch_dispatcher_tb();

localparam NUM_THREAD = 32;
localparam BIT_THREAD = $clog2(NUM_THREAD);
localparam NUM_RT = 4;
localparam BIT_RT = $clog2(NUM_RT);
localparam NUM_IC = 4;
localparam BIT_IC = $clog2(NUM_IC);
localparam NUM_CYCLE = 10;

localparam [6:0] rt_cycle[NUM_RT-1:0] = {7'd60, 7'd45, 7'd80, 7'd100};
localparam [6:0] ic_cycle[NUM_IC-1:0] = {7'd50, 789, 7'd30, 7'd120};

genvar i;
integer j;

// input 
logic clk;
logic rst_n;

logic load_cp;
logic load_done_cp;
logic [31:0] pixel_id_cp;

logic task_done_rt[NUM_RT-1:0];
logic context_switch_rt[NUM_RT-1:0];
logic [BIT_THREAD-1:0] thread_id_in_rt[NUM_RT-1:0];
logic [31:0] pc_in_rt[NUM_RT-1:0];
logic [31:0] stack_ptr_in_rt[NUM_RT-1:0];

logic context_switch_ic[NUM_IC-1:0];
logic [BIT_THREAD-1:0] thread_id_in_ic[NUM_IC-1:0];

// output
logic patch_done;

logic job_dispatch_rt[NUM_RT-1:0];
logic [BIT_THREAD-1:0] thread_id_out_rt;
logic [31:0] pixel_id_rt;
logic [31:0] pc_out_rt;
logic [31:0] sp_out_rt;

logic job_dispatch_ic[NUM_IC-1:0];
logic [BIT_THREAD-1:0] thread_id_out_ic;

logic q_en_rt2ic;
logic core_id_rt2ic[NUM_RT-1:0];

logic q_en_ic2rt;
logic core_id_ic2rt[NUM_IC-1:0];

// tb

logic cs_rt[NUM_RT-1:0][511:0];


logic [BIT_THREAD-1:0] tid[NUM_RT-1:0];
logic [31:0] pid[NUM_RT-1:0];
logic [31:0] pc[NUM_RT-1:0];
logic [31:0] sp[NUM_RT-1:0];

logic [3:0] job_cnt[NUM_THREAD-1:0];
logic job_done[NUM_RT-1:0];

logic [31:0] pid_done[NUM_THREAD-1:0];
logic [31:0] pc_done[NUM_THREAD-1:0];
logic [31:0] sp_done[NUM_THREAD-1:0];

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (j = 0; j < NUM_THREAD; j++)
                job_cnt[j] <= 32'h0;
        end
        else begin
            for (j = 0; j < NUM_RT; j++) begin
                if (cs_rt[j][1] == 1'h1)
                    job_cnt[tid[j]] <= job_cnt[tid[j]] + 1;
            end
        end

    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (j = 0; j < NUM_THREAD; j++) begin
               pid_done[j] <= 32'h0;
                pc_done[j] <= 32'h0;
                sp_done[j] <= 32'h0; 
            end
        end 
        else begin
            for (j = 0; j < NUM_RT; j++) begin
                if (task_done_rt[j]) begin
                    pid_done[tid[j]] <= pid[j];
                    pc_done[tid[j]] <= pc[j];
                    sp_done[tid[j]] <= sp[j];
                end
            end
        end
     end


generate
    for (i = 0; i < NUM_RT; i++) begin
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                for (j = 0; j < rt_cycle[i]-1; j++) 
                    cs_rt[i][j] <= 0;
                cs_rt[i][rt_cycle[i]-1] <= 0;
            end
            else begin
                for (j = 0; j < rt_cycle[i]-1; j++) 
                    cs_rt[i][j] <= cs_rt[i][j+1];
                cs_rt[i][rt_cycle[i]-1] <= job_dispatch_rt[i];
            end
        end

        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                tid[i] <= '0;
                pc[i] <= 32'h0;
                sp[i] <= 32'h0;
                pid[i] <= 32'h0;
            end
            else if (job_dispatch_rt[i]) begin
                tid[i] <= thread_id_out_rt;
                pc[i] <= (pc_out_rt == 32'h0) ? ({{(32-BIT_THREAD){1'h0}}, thread_id_out_rt} + 1000) : (pc_out_rt + 100);
                sp[i] <= (sp_out_rt == 32'h0) ? ({{(32-BIT_THREAD){1'h0}}, thread_id_out_rt} + 2000) : (sp_out_rt + 100);
                pid[i] <= pixel_id_rt;
            end
        end

        assign task_done_rt[i] = cs_rt[i][0] && job_cnt[tid[i]] == NUM_CYCLE;

        assign context_switch_rt[i] = task_done_rt[i] ? 0 : cs_rt[i][0];
        assign thread_id_in_rt[i] = tid[i];
        assign pc_in_rt[i] = pc[i];
        assign stack_ptr_in_rt[i] = sp[i];

    end
endgenerate

logic [BIT_THREAD-1:0] tid_ic[NUM_IC-1:0];
logic cs_ic[NUM_IC][511:0];
generate
    for (i = 0; i < NUM_IC; i++) begin
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                for (j = 0; j < ic_cycle[i]-1; j++)
                    cs_ic[i][j] <= 0;
                cs_ic[i][ic_cycle[i]-1] <= 0;
            end
            else begin
                for (j = 0; j < ic_cycle[i]-1; j++)
                    cs_ic[i][j] <= cs_ic[i][j+1];
                cs_ic[i][ic_cycle[i]-1] <= job_dispatch_ic[i];
            end
        end

        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n)
                tid_ic[i] <= 0;
            else if (job_dispatch_ic[i])
                tid_ic[i] <= thread_id_out_ic;
        end

        assign context_switch_ic[i] = cs_ic[i][0];
        assign thread_id_in_ic[i] = tid_ic[i];
    end
endgenerate

patch_dispatcher iDUT(.*);

always #5 clk = ~clk;

initial begin
    clk = 1;
    rst_n = 1;
    load_cp = 0;
    pixel_id_cp = 32'h0;
    load_done_cp = 1'h0;

    @(negedge clk);
    rst_n = 0;
    @(negedge clk);
    rst_n = 1;

    load_cp = 1;
    for (int i = 0; i < 32; i++) begin
        pixel_id_cp = 3000 + i;
        @(negedge clk);
        load_cp = 0;
    end
    load_done_cp = 1'h1;
    @(negedge clk);
    load_done_cp = 1'h0;
    @(posedge patch_done);
    @(negedge clk);

    for (int k = 0; k < NUM_THREAD; k++) begin
        $display("pc: %d; sp: %d; pid: %d;", pc_done[k], sp_done[k], pid_done[k]);
        if (pc_done[k] !== (k + 100*(NUM_CYCLE-1) + 1000)) 
            $stop();
        if (sp_done[k] !== (k + 100*(NUM_CYCLE-1) + 2000))
            $stop();
        if (pid_done[k] !== (k + 3000))
            $stop();
    end

    $display("Test Pass");
    $stop();


end


endmodule