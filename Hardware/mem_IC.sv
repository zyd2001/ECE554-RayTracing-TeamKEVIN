module mem_IC (
    //input
    clk, rst_n, q_en_rt2ic_PD, core_id_rt2ic_PD, q_en_ic2rt_PD, core_id_ic2rt_PD,
    ray_origin_RT, ray_direction_RT, thread_id_RT_in, shift_en_RT,
    shader_id_IC, v0_IC, v1_IC, v2_IC, normal_IC, thread_id_IC_in, shift_en_IC,
    //output
    ray_origin_IC, ray_direction_IC, thread_id_IC_out,
    shader_id_RT, v0_RT, v1_RT, v2_RT, normal_RT, thread_id_RT_out
    );

    parameter NUM_RT = 4;
    parameter NUM_IC = 4;
    parameter NUM_THREAD = 32;
    localparam BIT_THREAD = $clog2(NUM_THREAD);
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
    input [127:0] ray_origin_RT [NUM_RT-1:0]​;
    input [127:0] ray_direction_RT [NUM_RT-1:0];​
    input [BIT_THREAD-1:0] thread_id_RT_in [NUM_RT-1:0];
    input shift_en_RT;
    // IC​
    input [31:0] shader_id_IC [NUM_RT-1:0]​;
    input [31:0] v0_IC [NUM_RT-1:0];
    input [31:0] v1_IC [NUM_RT-1:0];
    input [31:0] v2_IC [NUM_RT-1:0];​
    input [127:0] normal_IC [NUM_RT-1:0];​
    input [BIT_THREAD-1:0] thread_id_IC_in [NUM_IC-1:0];​
    input shift_en_IC;
    ​
    /*
        Output
    */
    // IC
    output [127:0] ray_origin_IC;
    output [127:0] ray_direction_IC;
    output [BIT_THREAD-1:0] thread_id_IC_out;
    // RT​
    output [31:0] shader_id_RT, v0_RT, v1_RT, v2_RT;​
    output [127:0] normal_RT;
    output [BIT_THREAD-1:0] thread_id_RT_out;
endmodule