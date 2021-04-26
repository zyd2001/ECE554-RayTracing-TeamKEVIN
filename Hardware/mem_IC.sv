module mem_IC (
    //input
    clk, rst_n, q_en_rt2ic_PD, core_id_rt2ic_PD, q_en_ic2rt_PD, core_id_ic2rt_PD,
    ray_origin_RT, ray_direction_RT, thread_id_RT_in, dequeue_RT,
    shader_info_IC, normal_IC, thread_id_IC_in, dequeue_IC,
    //output
    ray_origin_IC, ray_direction_IC, thread_id_IC_out,
    shader_info_RT, normal_RT, thread_id_RT_out
    );

    parameter NUM_RT = 4;
    parameter NUM_IC = 4;
    parameter NUM_THREAD = 32;
    localparam BIT_THREAD = $clog2(NUM_THREAD);
    localparam RT2IC_WIDTH = 255+BIT_THREAD;
    localparam IC2RT_WIDTH = 255+BIT_THREAD;
    /*
        Input​
    */
    input clk, rst_n;
    // PD
    input q_en_rt2ic_PD;
    input core_id_rt2ic_PD[NUM_RT-1:0];
    input q_en_ic2rt_PD;
    input core_id_ic2rt_PD[NUM_IC-1:0];
    // RT
    input [127:0] ray_origin_RT [NUM_RT-1:0];
    input [127:0] ray_direction_RT [NUM_RT-1:0];
    input [BIT_THREAD-1:0] thread_id_RT_in [NUM_RT-1:0];
    input dequeue_RT;
    // IC​
    input [127:0] shader_info_IC [NUM_IC-1:0]; //(v0, v1, v2, sid)
    input [127:0] normal_IC [NUM_IC-1:0];
    input [BIT_THREAD-1:0] thread_id_IC_in [NUM_IC-1:0];
    input dequeue_IC;
    /*
        Output
    */
    // IC
    output [127:0] ray_origin_IC;
    output [127:0] ray_direction_IC;
    output [BIT_THREAD-1:0] thread_id_IC_out;
    // RT​
    output [31:0] shader_info_RT;
    output [127:0] normal_RT;
    output [BIT_THREAD-1:0] thread_id_RT_out;

    genvar j;
    logic [RT2IC_WIDTH-1:0] data_in_RT2IC;
    logic [IC2RT_WIDTH-1:0] data_in_IC2RT;
    logic [RT2IC_WIDTH-1:0] fifo_RT2IC [NUM_THREAD-1:0];
    logic [IC2RT_WIDTH-1:0] fifo_IC2RT [NUM_THREAD-1:0];
    logic enqueue_RT2IC [NUM_THREAD-1:0];
    logic enqueue_IC2RT [NUM_THREAD-1:0];
    // enable queue start
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            enqueue_RT2IC[0] <= 1'b1;
        end
        else if (q_en_rt2ic_PD ^ dequeue_IC) begin
            if (q_en_rt2ic_PD) begin
                enqueue_RT2IC[0] <= 1'b0;
            end
            else begin
                enqueue_RT2IC[0] <= enqueue_RT2IC[1];
            end
        end
        else begin
            enqueue_RT2IC[0] <= enqueue_RT2IC[0];
        end
    end
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            enqueue_IC2RT[0] <= 1'b1;
        end
        else if (q_en_ic2rt_PD ^ dequeue_RT) begin
            if (q_en_ic2rt_PD) begin
                enqueue_IC2RT[0] <= 1'b0;
            end
            else begin
                enqueue_IC2RT[0] <= enqueue_IC2RT[1];
            end
        end
        else begin
            enqueue_IC2RT[0] <= enqueue_IC2RT[0];
        end
    end
    // enable queue end
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            enqueue_RT2IC[NUM_THREAD-1] <= 1'b0;
        end
        else if (q_en_rt2ic_PD ^ dequeue_IC) begin
            if (dequeue_IC) begin
                enqueue_RT2IC[NUM_THREAD-1] <= 1'b0;
            end
            else begin
                enqueue_RT2IC[NUM_THREAD-1] <= enqueue_RT2IC[NUM_THREAD-2];
            end
        end
        else begin
            enqueue_RT2IC[NUM_THREAD-1] <= enqueue_RT2IC[NUM_THREAD-1];
        end
    end
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            enqueue_IC2RT[NUM_THREAD-1] <= 1'b0;
        end
        else if (q_en_ic2rt_PD ^ dequeue_RT) begin
            if (dequeue_IC) begin
                enqueue_IC2RT[NUM_THREAD-1] <= 1'b0;
            end
            else begin
                enqueue_IC2RT[NUM_THREAD-1] <= enqueue_IC2RT[NUM_THREAD-2];
            end
        end
        else begin
            enqueue_IC2RT[NUM_THREAD-1] <= enqueue_IC2RT[0];
        end
    end
    // enable queue
    generate;
        for (j = 1; j < NUM_THREAD-1; ++j) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if(!rst_n) begin
                    enqueue_RT2IC[j] <= 1'b0;
                end
                else if (q_en_rt2ic_PD ^ dequeue_IC) begin
                    if (q_en_rt2ic_PD) begin
                        enqueue_RT2IC[j] <= enqueue_RT2IC[j-1];
                    end
                    else begin
                        enqueue_RT2IC[j] <= enqueue_RT2IC[j+1];
                    end
                end
                else begin
                    enqueue_RT2IC[j] <= enqueue_RT2IC[j];
                end
            end
            always_ff @(posedge clk, negedge rst_n) begin
                if(!rst_n) begin
                    enqueue_IC2RT[j] <= 1'b0;
                end
                else if (q_en_ic2rt_PD ^ dequeue_RT) begin
                    if (q_en_ic2rt_PD) begin
                        enqueue_IC2RT[j] <= enqueue_IC2RT[j-1];
                    end
                    else if (dequeue_RT) begin
                        enqueue_IC2RT[j] <= enqueue_IC2RT[j+1];
                    end
                end
                else begin
                    enqueue_IC2RT[j] <= enqueue_IC2RT[j];
                end
            end
        end
    endgenerate
    // input select
    always_comb begin
        data_in_RT2IC = {RT2IC_WIDTH{1'b0}};
        for(int i = 0; i < NUM_RT; ++i) begin
            if (core_id_rt2ic_PD[i]) begin
                data_in_RT2IC = {thread_id_RT_in[i], ray_origin_RT[i], ray_direction_RT[i]};
            end
            else begin end
        end
    end
    always_comb begin
        data_in_IC2RT = {IC2RT_WIDTH{1'b0}};
        for(int i = 0; i < NUM_RT; ++i) begin
            if (core_id_ic2rt_PD[i]) begin
                data_in_IC2RT = {thread_id_IC_in[i], shader_info_IC[i], normal_IC[i]};
            end
            else begin end
        end
    end

    // fifo in
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            fifo_RT2IC[NUM_THREAD-1] <= {RT2IC_WIDTH{1'b0}};
        end
        else if (enqueue_RT2IC[NUM_THREAD-1] & q_en_rt2ic_PD) begin
            fifo_RT2IC[NUM_THREAD-1] <= data_in_RT2IC;
        end
        else if (dequeue_RT) begin
            fifo_RT2IC[NUM_THREAD-1] <= {RT2IC_WIDTH{1'b0}};
        end
        else begin
            fifo_RT2IC[NUM_THREAD-1] <= fifo_RT2IC[NUM_THREAD-1];
        end
    end
    always_ff @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            fifo_IC2RT[NUM_THREAD-1] <= {IC2RT_WIDTH{1'b0}};
        end
        else if (enqueue_IC2RT[NUM_THREAD-1] & q_en_ic2rt_PD) begin
            fifo_IC2RT[NUM_THREAD-1] <= data_in_IC2RT;
        end
        else if (dequeue_IC) begin
            fifo_IC2RT[NUM_THREAD-1] <= {IC2RT_WIDTH{1'b0}};
        end
        else begin
            fifo_IC2RT[NUM_THREAD-1] <= fifo_IC2RT[NUM_THREAD-1];
        end
    end
    // fifo
    generate;
        for (j = 0; j < NUM_THREAD-1; ++j) begin
            always_ff @(posedge clk, negedge rst_n) begin
                if(!rst_n) begin
                    fifo_RT2IC[j] <= {RT2IC_WIDTH{1'b0}};
                end
                else if (enqueue_RT2IC[j] & q_en_rt2ic_PD) begin
                    fifo_RT2IC[j] <= data_in_RT2IC;
                end
                else if (dequeue_RT) begin
                    fifo_RT2IC[j] <= fifo_RT2IC[j+1];
                end
                else begin
                    fifo_RT2IC[j] <= fifo_RT2IC[j];
                end
            end
            always_ff @(posedge clk, negedge rst_n) begin
                if(!rst_n) begin
                    fifo_IC2RT[j] <= {IC2RT_WIDTH{1'b0}};
                end
                else if (enqueue_IC2RT[j] & q_en_ic2rt_PD) begin
                    fifo_IC2RT[j] <= data_in_IC2RT;
                end
                else if (dequeue_IC) begin
                    fifo_IC2RT[j] <= fifo_IC2RT[j+1];
                end
                else begin
                    fifo_IC2RT[j] <= fifo_IC2RT[j];
                end
            end
        end
    endgenerate

    // output
    assign ray_origin_IC = fifo_RT2IC[0][127:0];
    assign ray_direction_IC = fifo_RT2IC[0][255:128];
    assign thread_id_IC_out = fifo_RT2IC[0][255+BIT_THREAD:256];
    assign shader_info_RT = fifo_IC2RT[0][127:0];
    assign normal_RT = fifo_IC2RT[0][255:128];
    assign thread_id_RT_out = fifo_IC2RT[0][255+BIT_THREAD:256];
endmodule