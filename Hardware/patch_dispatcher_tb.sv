module patch_dispatcher_tb();

localparam NUM_THREAD = 32;
localparam BIT_THREAD = $clog2(NUM_THREAD);
localparam NUM_RT = 4;
localparam BIT_RT = $clog2(NUM_RT);
localparam NUM_IC = 4;
localparam BIT_IC = $clog2(NUM_IC);


// input 
logic clk,
logic rst_n,

logic load_cp,
logic [31:0] pixel_id_cp,

logic task_done_rt[NUM_RT-1:0],
logic context_switch_rt[NUM_RT-1:0],
logic [BIT_THREAD-1:0] thread_id_in_rt[NUM_RT-1:0],
logic [31:0] pc_in_rt[NUM_RT-1:0],
logic [31:0] stack_ptr_in_rt[NUM_RT-1:0],

logic context_switch_ic[NUM_IC-1:0],
logic [BIT_THREAD-1:0] thread_id_in_ic[NUM_IC-1:0],

// output
logic patch_done,

logic job_dispatch_rt[NUM_RT-1:0],
logic [BIT_THREAD-1:0] thread_id_out_rt,
logic [31:0] pixel_id_rt,
logic [31:0] pc_out_rt,
logic [31:0] sp_out_rt,

logic job_dispatch_ic[NUM_IC-1:0],
logic [BIT_THREAD-1:0] thread_id_out_ic,

logic q_en_rt2ic,
logic core_id_rt2ic[NUM_RT-1:0],

logic q_en_ic2rt,
logic core_id_ic2rt[BIT_IC-1:0]

patch_dispatcher iDUT(.*);

always #5 clk = ~clk;

initial begin
    clk = 1;
    rst_n = 1;
    load_cp = 0;
    pixel_id_cp = 32'h0;
    for (int i = 0; i < 4; i++) begin
        task_done_rt[i] = 0;
        context_switch_rt[i] = 0;
        thread_id_in_rt = 5'h0;
        pc_in_rt[i] = 32'h0
        stack_ptr_in_rt[i] = 32'h0;
        context_switch_ic[i] = 0;
        thread_id_in_ic[i] = 0;
    end

    @(negedge clk);
    rst_n = 0;
    @(negedge clk);
    rst_n = 1;

    


end


endmodule