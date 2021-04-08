module PD_RT_interface (
    Assigned_core_id, Pixel_id, Thread_id_in, Stack_Pointer_in, PC_in,
    Thread_id_out, Stack_pointer_out, PC_out, Task_finished_out, Context_switch_out,
    Ray_direction, Ray_origin, Ray_hit_point, Ray_hit_normal, Ray_shader_id
    Kernel_mode, Task_finish_in, Context_switch_in,
    PD_scalar_wen, PD_scalar_wb_address, PD_scalar_wb_data,
    PD_vector_wen, PD_vector_wb_address, PD_vector_wb_data,
    PD_scalar_read_address1, PD_scalar_read_address2, 
    PD_vector_read_address1, PD_vector_read_address2,
    PD_scalar_read1, PD_scalar_read2,
    PD_vector_read1, PD_vector_read2
);
    // Patch Dispatcher Related Signal
    input [1:0] Assigned_core_id;
    input [5:0] Thread_id_in;
    input [31:0] Pixel_id, Stack_Pointer_in, PC_in;
    output [5:0] Thread_id_out;
    output [31:0] Stack_pointer_out, PC_out;
    output Task_finished_out, Context_switch_out;

    // RT core related Signal
    input Task_finish_in, Context_switch_in;
    output Kernel_mode;

    // RT_IC_cache
    input [95:0] Ray_hit_point, Ray_hit_normal;
    input [31:0] Ray_shader_id
    output [127:0] Ray_direction, Ray_origin;

    // RT Core Register File
    output PD_scalar_wen, PD_vector_wen;
    output  [4:0] PD_scalar_wb_address, PD_scalar_read_address1, PD_scalar_read_address2;
    output  [3:0] PD_vector_wb_address, PD_vector_read_address1, PD_vector_read_address2;
    output  [31:0] PD_scalar_wb_data;
    output  [127:0] PD_vector_wb_data;
    input [31:0] PD_scalar_read1, PD_scalar_read2;
    input [127:0] PD_vector_read1, PD_vector_read2;
endmodule