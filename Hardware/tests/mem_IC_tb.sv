module mem_IC_tb();
    parameter NUM_RT = 4;
    parameter NUM_IC = 4;
    parameter NUM_THREAD = 32;
    localparam BIT_THREAD = $clog2(NUM_THREAD);
    localparam RT2IC_WIDTH = 255+BIT_THREAD;
    localparam IC2RT_WIDTH = 255+BIT_THREAD;
    /*
        input
    */
    logic clk, rst_n;
    // PD
    logic q_en_rt2ic_PD;
    logic core_id_rt2ic_PD[NUM_RT-1:0];
    logic q_en_ic2rt_PD;
    logic core_id_ic2rt_PD[NUM_IC-1:0];
    // RT
    logic [127:0] ray_origin_RT [NUM_RT-1:0];
    logic [127:0] ray_direction_RT [NUM_RT-1:0];
    logic [BIT_THREAD-1:0] thread_id_RT_in [NUM_RT-1:0];
    logic shift_en_RT;
    // IC​
    logic [127:0] shader_info_IC [NUM_IC-1:0]; //(v0, v1, v2, sid)
    logic [127:0] normal_IC [NUM_IC-1:0];
    logic [BIT_THREAD-1:0] thread_id_IC_in [NUM_IC-1:0];
    logic shift_en_IC;
    /*
        output
    */
    // IC
    logic [127:0] ray_origin_IC;
    logic [127:0] ray_direction_IC;
    logic [BIT_THREAD-1:0] thread_id_IC_out;
    // RT​
    logic [31:0] shader_info_RT;
    logic [127:0] normal_RT;
    logic [BIT_THREAD-1:0] thread_id_RT_out;

    always #1 clk = ~clk;

    module mem_IC (
        //input
        clk, rst_n, q_en_rt2ic_PD, core_id_rt2ic_PD, q_en_ic2rt_PD, core_id_ic2rt_PD,
        ray_origin_RT, ray_direction_RT, thread_id_RT_in, shift_en_RT,
        shader_info_IC, normal_IC, thread_id_IC_in, shift_en_IC,
        //output
        ray_origin_IC, ray_direction_IC, thread_id_IC_out,
        shader_info_RT, normal_RT, thread_id_RT_out
    );

    int error = 0;
    initial begin
        clk = 0;
        rst_n = 1;
        q_en_rt2ic_PD = 0;
        for(int i = 0; i < NUM_RT; i++) begin
            core_id_rt2ic_PD[i] = 0;
            ray_origin_RT[i] = 0;
            ray_direction_RT[i] = 0;
            thread_id_RT_in[i] = 0;
            shift_en_RT = 0;
        end
        q_en_ic2rt_PD = 0;
        for(int i = 0; i < NUM_IC; i++) begin
            core_id_ic2rt_PD[i] = 0;
            shader_info_IC[i] = 0;
            normal_IC[i] = 0;
            thread_id_IC_in[i] = 0;
            shift_en_IC = 0;
        end
        // reset
        @(posedge clk) begin end
        rst_n = 1'b0; // active low reset
        @(posedge clk) begin end
        rst_n = 1'b1; // reset finished
        @(posedge clk) begin end

        // write
        for(int j = 0; j < 3; j++) begin
            // init data
            for(int i = 0; i < NUM_RT; i++) begin
                ray_origin_RT[i] = i+j*NUM_RT;
                ray_direction_RT[i] = i+j*NUM_RT;
                thread_id_RT_in[i] = i+j*NUM_RT;
            end
            for(int i = 0; i < NUM_IC; i++) begin
                shader_info_IC[i] = i+j*NUM_IC;
                normal_IC[i] = i+j*NUM_IC;
                thread_id_IC_in[i] = i+j*NUM_IC;
            end
            // enqueue
            for(int i = 0; i < NUM_RT; i++) begin
                core_id_rt2ic_PD[i] = 1;
                q_en_rt2ic_PD = 1;
                @(posedge clk);
            end
            for(int i = 0; i < NUM_RT; i++) begin
                core_id_ic2rt_PD[i] = 1;
                q_en_ic2rt_PD = 1;
                @(posedge clk);
            end            
        end
                shift_en_RT = 0;
                shift_en_IC = 0;

        if(error == 0) begin
            $display("All tests passed!!!"); 
        end
        else begin
            $display("In all tests, there are <%d> errors", error);
        end
        $stop();
    end
endmodule