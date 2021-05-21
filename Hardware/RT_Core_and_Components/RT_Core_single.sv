///////////////////////////////
// This is the five-stage single execution core in 
// our Multi-processor design. It can run one
// thread at a time. More detail will be 
// provided in README file.
// 
// Context_switch will be high with End_program only.
// The instructions evoke context switch and end program
// are almost the same except this signal.
//
// PD related signals
// If kernel mode is on, other module can write or read
// the register file in this core through PD interface
//
// MRTI related signals
// Used for reading instructions
// Address will be ready before the rising clock edge while
// data should be ready after the rising clock edge
//
// MEM related signals
// If Constant Memory read: two cycles, similar to MRTI
// If Main Memory write: one cycle.
// If Main Memory read: x cycle, waiting for MEM_done
// Constant memory only support scalar read.
//
// Author: Yan Xiao
// Last modify: 5/11
///////////////////////////////

module RT_core_single (
    clk, rst_n, rst,
    kernel_mode, End_program, Context_switch, 

    PD_scalar_wen, PD_scalar_wb_address, PD_scalar_wb_data,
    PD_vector_wen, PD_vector_wb_address, PD_vector_wb_data,
    PD_scalar_read_address1, PD_scalar_read_address2, 
    PD_vector_read_address1, PD_vector_read_address2,
    PD_scalar_read1, PD_scalar_read2,
    PD_vector_read1, PD_vector_read2,

    MRTI_addr, MRTI_data,
    MEM_addr, MEM_data_write, MEM_data_read, MEM_read_en, MEM_write_en, MEM_done, MEM_s_or_v
);
    // Control / Normal signals
    input clk, rst_n, rst;
    input kernel_mode;
    output End_program, Context_switch;

    // PD interface signals
    input PD_scalar_wen, PD_vector_wen;
    input [4:0] PD_scalar_wb_address, PD_scalar_read_address1, PD_scalar_read_address2;
    input [3:0] PD_vector_wb_address, PD_vector_read_address1, PD_vector_read_address2;
    input [31:0] PD_scalar_wb_data;
    input [127:0] PD_vector_wb_data;
    output [31:0] PD_scalar_read1, PD_scalar_read2;
    output [127:0] PD_vector_read1, PD_vector_read2;

    // Instruction memory related
    input [31:0] MRTI_data;
    output [31:0] MRTI_addr;

    // Main Memory + Const Memory related
    output [31:0] MEM_addr;
    output [127:0] MEM_data_write; 
    output MEM_read_en, MEM_write_en, MEM_s_or_v;
    input [127:0] MEM_data_read;
    input MEM_done;    
    
    typedef enum logic [1:0] { idle, waiting_int_MEM, waiting_float, waiting_done } waiting_state;
    typedef enum logic[1:0] { running, done, kernel_mode_wait } FIN_state;

    //////////////////////////////////////////////////////////////////
    //////////////// IF registers ////////////////////////////////////
    //////////////////////////////////////////////////////////////////
    
    logic IF_FIN;
    FIN_state IF_FIN_current_state, IF_FIN_next_state;

    logic [31:0] PC_reg, IF_next_PC_reg;
    logic [1:0] IF_next_pc_select;
    logic [31:0] IF_PC_plus_four, IF_DE_link_address, IF_DE_PC_plus_four_offset;
    logic [31:0] IF_instruction;

    //////////////////////////////////////////////////////////////////
    //////////////// IF_DE_pipeline registers ////////////////////////
    //////////////////////////////////////////////////////////////////

    logic IF_DE_stall;
    logic IF_DE_FIN;
    logic [31:0] IF_DE_instruction, IF_DE_current_PC_plus_four, IF_DE_instruction_bypass;

    //////////////////////////////////////////////////////////////////
    //////////////// DE registers ////////////////////////////////////
    //////////////////////////////////////////////////////////////////
    logic [4:0] DE_S1_address, DE_S2_address, DE_Swb_address;
    logic [3:0] DE_V1_address, DE_V2_address, DE_Vwb_address;

    logic [4:0] DE_S1bp_address, DE_S2bp_address;
    logic [3:0] DE_V1bp_address, DE_V2bp_address;

    logic [31:0] DE_scalar1, DE_scalar2;
    logic [127:0] DE_vector1, DE_vector2;

    logic DE_intALU_op2_select, DE_floatALU1_op1_select;
    logic [1:0] DE_floatALU1_op2_select;
    logic DE_floatALU2_op1_select, DE_floatALU2_op2_select, DE_floatALU3_op1_select;
    logic [1:0] DE_floatALU3_op2_select;
    logic DE_floatALU4_op1_select, DE_floatALU4_op2_select;

    logic DE_intALU_en, DE_floatALU1_en, DE_floatALU234_en;
    logic DE_update_int_flag, DE_update_float_flag;

    logic [2:0] DE_Scalar_out_select, DE_memory_op;
    logic DE_vector_reduce_en;
    logic DE_context_switch;
    
    logic DE_Branch_stall, DE_Mem_address_stall;

    //////////////////////////////////////////////////////////////////
    //////////////// DE_EX_pipeline registers ////////////////////////
    //////////////////////////////////////////////////////////////////

    logic DE_EX_FIN, DE_EX_context_switch;

    // Forwarding address. If address = 0 means no forwarding needed
    logic [4:0] DE_EX_S1_address, DE_EX_S2_address, DE_EX_Swb_address;
    logic [3:0] DE_EX_V1_address, DE_EX_V2_address, DE_EX_Vwb_address;

    logic [31:0] DE_EX_scalar1, DE_EX_scalar2;
    logic [127:0] DE_EX_vector1, DE_EX_vector2;
    logic [15:0] DE_EX_immediate;
    
    // Control Pipeline
    logic DE_EX_intALU_op2_select;
    logic DE_EX_floatALU1_op1_select;
    logic [1:0] DE_EX_floatALU1_op2_select;
    logic DE_EX_floatALU2_op1_select, DE_EX_floatALU2_op2_select, DE_EX_floatALU3_op1_select;
    logic [1:0] DE_EX_floatALU3_op2_select;
    logic DE_EX_floatALU4_op1_select, DE_EX_floatALU4_op2_select;
    
    logic DE_EX_intALU_en, DE_EX_floatALU1_en, DE_EX_floatALU234_en;
    logic DE_EX_update_int_flag, DE_EX_update_float_flag;

    logic [3:0] DE_EX_integer_ALU_opcode;
    logic [2:0] DE_EX_float_ALU_opcode;
    logic [2:0] DE_EX_Scalar_out_select, DE_EX_memory_op;
    logic DE_EX_vector_reduce_en;
    
    //////////////////////////////////////////////////////////////////
    //////////////// EX registers ////////////////////////////////////
    //////////////////////////////////////////////////////////////////

    logic [31:0] EX_integer_ALU_OP1, EX_integer_ALU_OP2, EX_integer_ALU_out;

    logic [31:0] EX_float_ALU1_OP1, EX_float_ALU1_OP2, EX_float_ALU2_OP1, EX_float_ALU2_OP2;
    logic [31:0] EX_float_ALU3_OP1, EX_float_ALU3_OP2, EX_float_ALU4_OP1, EX_float_ALU4_OP2;
    logic [31:0] EX_float_ALU1_out, EX_float_ALU2_out, EX_float_ALU3_out, EX_float_ALU4_out;
    
    logic [1:0] EX_int_flag, EX_float_flag;
    logic EX_int_flag_en, EX_float_flag_en, EX_flag_update;

    waiting_state EX_current_state, EX_next_state;
    logic EX_busy;
    logic EX_integer_done, EX_float_done;
    logic EX_int_knockdown, EX_float1_knockdown, EX_float234_knockdown;
    
    logic [31:0] EX_S_out;
    logic [127:0] EX_V_out;

    ///////////////////////////////////////////////////////////////////
    //////////////// EX_MEM_pipeline registers ////////////////////////
    ///////////////////////////////////////////////////////////////////
    logic EX_MEM_FIN, EX_MEM_context_switch;

    logic [4:0] EX_MEM_S_data_address, EX_MEM_Swb_address;
    logic [3:0] EX_MEM_V_data_address, EX_MEM_Vwb_address;
    // data 
    logic [127:0] EX_MEM_v_out; // shared between ALU out and data out.
    logic [31:0] EX_MEM_s_out, EX_MEM_memory_data; // Address and data
    // control
    logic [2:0] EX_MEM_memory_op; 
    logic [2:0] EX_MEM_memory_op_stay;
    logic EX_MEM_vector_reduce_en;
    logic EX_MEM_vector_reduce_en_stay;
    
    //////////////////////////////////////////////////////////////////
    //////////////// MEM registers ///////////////////////////////////
    //////////////////////////////////////////////////////////////////

    logic [31:0] MEM_forwarded_s_data;
    logic [127:0] MEM_forwarded_v_data;

    waiting_state MEM_current_state, MEM_next_state;
    logic MEM_busy;
    logic MEM_V_reduce_done;
    logic MEM_knockdown;
    
    logic [31:0] MEM_reduce_out;
    logic [31:0] MEM_S_out;
    logic [127:0] MEM_V_out;
    
    ///////////////////////////////////////////////////////////////////
    //////////////// MEM_WB_pipeline registers ////////////////////////
    ///////////////////////////////////////////////////////////////////

    logic MEM_WB_FIN, MEM_WB_context_switch;

    logic [127:0] MEM_WB_vector; 
    logic [31:0] MEM_WB_scalar;
    logic [4:0] MEM_WB_Swb_address;
    logic [3:0] MEM_WB_Vwb_address;
    
    ///////////////////////////////////////////////////////////////////
    //////////////////// DEBUG OUT signals  ///////////////////////////
    ///////////////////////////////////////////////////////////////////
    logic [4:0] DEBUG_scalar_wb_address, DEBUG_scalar_read_address1, DEBUG_scalar_read_address2;
    logic [3:0] DEBUG_vector_wb_address, DEBUG_vector_read_address1, DEBUG_vector_read_address2;
    logic [31:0] DEBUG_scalar_wb_data;
    logic [127:0] DEBUG_vector_wb_data;
    logic [31:0] DEBUG_scalar_read1, DEBUG_scalar_read2;
    logic [127:0] DEBUG_vector_read1, DEBUG_vector_read2;
    logic [31:0] DEBUG_PC, DEBUG_inst;
    logic [31:0] DEBUG_memory_address;
	logic DEBUG_memory_R_enable;
	logic DEBUG_memory_W_enable;
	logic [127:0] DEBUG_memory_R_data;
	logic [127:0] DEBUG_memory_W_data;

    ///////////////////////////////////////////////////////////////////
    ////////////// DEBUG IF_DE_EX_Pipeline signals  ///////////////////
    ///////////////////////////////////////////////////////////////////
    logic [31:0] DEBUG_IF_DE_PC;
    logic [31:0] DEBUG_DE_EX_inst, DEBUG_DE_EX_PC;


    //////////////////////////
    // Instruction Fetch Stage
    //////////////////////////

    assign IF_PC_plus_four = PC_reg + 4;

    always_comb begin : Select_next_PC
        IF_next_PC_reg = IF_PC_plus_four;
        case (IF_next_pc_select)
            2'b00: IF_next_PC_reg = IF_PC_plus_four;
            2'b10: IF_next_PC_reg = IF_DE_PC_plus_four_offset;
            default: IF_next_PC_reg = IF_DE_link_address;
        endcase
        if (IF_FIN || IF_DE_stall) IF_next_PC_reg = PC_reg;
    end

    // Instruction read address bypass
    assign MRTI_addr = IF_next_PC_reg;
    assign IF_instruction = MRTI_data;

    always_ff @(posedge clk, negedge rst_n) begin : IF_update_PC_Reg   
        if (!rst_n) 
            PC_reg <= 32'h0000;
        else if (kernel_mode == 1'b1 && PD_scalar_wen && PD_scalar_wb_address == 5'b11111)
            PC_reg <= PD_scalar_wb_data;
        else if (!IF_DE_stall && !IF_FIN)
            PC_reg <= IF_next_PC_reg;   
    end

    always_ff @( posedge clk, negedge rst_n ) begin : IF_update_IF_FIN_state
        if (!rst_n)
            IF_FIN_current_state <= done;
        else 
            IF_FIN_current_state <= IF_FIN_next_state;
    end

    always_comb begin : IF_FIN_state_machine
        IF_FIN = 1'b0;
        IF_FIN_next_state = IF_FIN_current_state;
            case (IF_FIN_current_state)
                running: begin
                    if (!IF_DE_stall && IF_next_pc_select == 2'b0 && IF_instruction[31:28] == 4'b1110) begin
                        IF_FIN = 1'b1;
                        IF_FIN_next_state = done;
                    end
                end
                done: begin
                    IF_FIN = 1'b1;
                    if (kernel_mode) 
                        IF_FIN_next_state = kernel_mode_wait;
                end
                // Kernel Mode
                default: begin
                    IF_FIN = 1'b1;
                    if (!kernel_mode) begin
                        IF_FIN_next_state = running;
                        IF_FIN = 1'b0;
                    end
                end
            endcase

    end

    //////////////////////////
    // IF DE pipeline
    //////////////////////////
    
    always @(posedge clk, negedge rst_n) begin : IF_DE_pipeline
        if (!rst_n) begin
            DEBUG_IF_DE_PC <= 32'h0000;
            IF_DE_instruction <= 32'h30000000;
            IF_DE_current_PC_plus_four <= 32'h0000;
            IF_DE_FIN <= 1'b1;
        end else begin
            if (~IF_DE_stall) begin
                if (IF_next_pc_select != 2'b00) begin
                    IF_DE_instruction <= 32'h30000000;
                    IF_DE_current_PC_plus_four <= 32'h0000;
                    DEBUG_IF_DE_PC <= PC_reg;
                    IF_DE_FIN <= 1'b0;
                end else begin
                    IF_DE_FIN <= IF_FIN;
                    DEBUG_IF_DE_PC <= PC_reg;
                    IF_DE_instruction <= IF_instruction;
                    IF_DE_current_PC_plus_four <= IF_PC_plus_four;
                end
            end

            if (kernel_mode) begin
                IF_DE_FIN <= 1'b0;
            end
        end


    end

    // make sure it arrives early for RF memory
    assign IF_DE_instruction_bypass = IF_instruction;

    //////////////////////////
    // DE Stage
    //////////////////////////  
   
    always_comb begin : DE_bypass_RF_address
        if (~IF_DE_stall) begin
            DE_S1bp_address = IF_DE_instruction_bypass[20:16];
            DE_S2bp_address = IF_DE_instruction_bypass[15:11];
            DE_V1bp_address = IF_DE_instruction_bypass[19:16];
            DE_V2bp_address = IF_DE_instruction_bypass[14:11];
            // V get from S
            if (IF_DE_instruction_bypass[31:26] == 6'b100111)
                DE_V1bp_address = IF_DE_instruction_bypass[24:21];
            // Store S
            if (IF_DE_instruction_bypass[31:26] == 6'b111100)
                DE_S2bp_address = IF_DE_instruction_bypass[25:21];
            // Store V
            if (IF_DE_instruction_bypass[31:26] == 6'b111111)
                DE_V1bp_address = IF_DE_instruction_bypass[24:21];
        end else begin
            DE_S1bp_address = IF_DE_instruction[20:16];
            DE_S2bp_address = IF_DE_instruction[15:11];
            DE_V1bp_address = IF_DE_instruction[19:16];
            DE_V2bp_address = IF_DE_instruction[14:11];
            // V get from S
            if (IF_DE_instruction[31:26] == 6'b100111)
                DE_V1bp_address = IF_DE_instruction[24:21];
            // Store S
            if (IF_DE_instruction[31:26] == 6'b111100)
                DE_S2bp_address = IF_DE_instruction[25:21];
            // Store V
            if (IF_DE_instruction[31:26] == 6'b111111)
                DE_V1bp_address = IF_DE_instruction[24:21];
        end
    end

    Register_file RF(.clk(clk), 
        .scalar_read_address1(kernel_mode? PD_scalar_read_address1 : DE_S1bp_address), .scalar_read_address2(kernel_mode? PD_scalar_read_address2 : DE_S2bp_address), 
        .vector_read_address1(kernel_mode? PD_vector_read_address1 : DE_V1bp_address), .vector_read_address2(kernel_mode? PD_vector_read_address2 : DE_V2bp_address), 
        .scalar_read1(DE_scalar1), .scalar_read2(DE_scalar2), 
        .vector_read1(DE_vector1), .vector_read2(DE_vector2),
        .scalar_wen(kernel_mode? PD_scalar_wen : |MEM_WB_Swb_address), .scalar_wb_address(kernel_mode? PD_scalar_wb_address : MEM_WB_Swb_address), 
        .vector_wen(kernel_mode? PD_vector_wen : |MEM_WB_Vwb_address), .vector_wb_address(kernel_mode? PD_vector_wb_address : MEM_WB_Vwb_address), 
        .scalar_wb_data(kernel_mode? PD_scalar_wb_data : MEM_WB_scalar), .vector_wb_data(kernel_mode? PD_vector_wb_data : MEM_WB_vector)
    );

    assign PD_scalar_read1 = PD_scalar_read_address1 == 5'b11111 ? IF_PC_plus_four : DE_scalar1;
    assign PD_scalar_read2 = PD_scalar_read_address2 == 5'b11111 ? IF_PC_plus_four : DE_scalar2;
    assign PD_vector_read1 = DE_vector1;
    assign PD_vector_read2 = DE_vector2;

    assign IF_DE_PC_plus_four_offset = IF_DE_current_PC_plus_four + {{17{IF_DE_instruction[15]}}, IF_DE_instruction[14:0]}; 
    assign IF_DE_link_address = DE_scalar1;
    
    // Decode the opcode
    instruction_decode_unit IDU(.opcode(IF_DE_instruction[31:26]), .immediate(IF_DE_instruction[1:0]),
        .intALU_op2_select(DE_intALU_op2_select),
        .floatALU1_op1_select(DE_floatALU1_op1_select), .floatALU2_op1_select(DE_floatALU2_op1_select),
        .floatALU3_op1_select(DE_floatALU3_op1_select), .floatALU4_op1_select(DE_floatALU4_op1_select),
        .floatALU1_op2_select(DE_floatALU1_op2_select), .floatALU2_op2_select(DE_floatALU2_op2_select),
        .floatALU3_op2_select(DE_floatALU3_op2_select), .floatALU4_op2_select(DE_floatALU4_op2_select),
        .intALU_en(DE_intALU_en), .floatALU1_en(DE_floatALU1_en), .floatALU234_en(DE_floatALU234_en), 
        .Scalar_out_select(DE_Scalar_out_select), .memory_op(DE_memory_op),
        .vector_reduce_en(DE_vector_reduce_en), .update_int_flag(DE_update_int_flag), .update_float_flag(DE_update_float_flag),
        .context_switch(DE_context_switch)
    );

    address_decode_unit ADU(
        .instruction(IF_DE_instruction), .DE_S1_address(DE_S1_address), .DE_S2_address(DE_S2_address), 
        .DE_Swb_address(DE_Swb_address), .DE_V1_address(DE_V1_address), .DE_V2_address(DE_V2_address), .DE_Vwb_address(DE_Vwb_address)
    );

    branch branch_unit(
        .clk(clk), .rst_n(rst_n), 
        .EX_busy(EX_busy), .MEM_busy(MEM_busy), 
        .IF_DE_stall(DE_Branch_stall), .next_pc_select(IF_next_pc_select), 
        .int_flag(EX_int_flag), .float_flag(EX_float_flag), .int_flag_en(EX_int_flag_en), .float_flag_en(EX_float_flag_en), 
        .branch_opcode(IF_DE_instruction[28:26]), .branch_en(IF_DE_instruction[31:29] == 3'b110)
    );

    Forwarding_decode Decode_stage_data_hazard(
        .DE_EX_Swb_address(DE_EX_Swb_address), .DE_EX_Vwb_address(DE_EX_Vwb_address), .MEM_WB_Swb_address(MEM_WB_Swb_address), 
        .DE_EX_MEM_read(DE_EX_memory_op[2:1] == 2'b10), .DE_EX_V_reduce(DE_EX_vector_reduce_en), .DE_stall(DE_Mem_address_stall), 
        .DE_S1_address(DE_S1_address), .DE_S2_address(DE_S2_address), .DE_V1_address(DE_V1_address), .DE_V2_address(DE_V2_address),
        .EX_MEM_Swb_address(EX_MEM_Swb_address), .link_en(IF_next_pc_select == 2'b11)
    );

    assign IF_DE_stall = DE_Branch_stall | DE_Mem_address_stall;

    //////////////////////////
    // DE EX Pipeline
    ////////////////////////// 

    always_ff @( posedge clk, negedge rst_n ) begin : Debug_DE_EX_pipeline
        if (!rst_n) begin 
            DEBUG_DE_EX_inst <=  32'hF8000000;
            DEBUG_DE_EX_PC <= 32'b0;
        end else begin
            if (!EX_busy && !MEM_busy) begin
                DEBUG_DE_EX_inst <= IF_DE_stall ? 32'hF8000000 : IF_DE_instruction;
                DEBUG_DE_EX_PC <= DEBUG_IF_DE_PC;
            end
        end
    end

    always_ff @( posedge clk, negedge rst_n ) begin : DE_EX_data_pipeline
        if (!rst_n) begin 
            DE_EX_scalar1 <= 32'b0;
            DE_EX_scalar2 <= 32'b0;
            DE_EX_vector1 <= 128'b0;
            DE_EX_vector2 <= 128'b0;
            DE_EX_immediate <= 16'b0;
        end else begin
            if (!EX_busy && !MEM_busy) begin
                if (DE_S1_address == DE_EX_Swb_address && DE_S1_address != 5'b0 && DE_EX_memory_op[2:1] != 2'b10 && DE_EX_vector_reduce_en != 1'b1)
                    DE_EX_scalar1 <= EX_S_out;
                else if (DE_S1_address == EX_MEM_Swb_address && DE_S1_address != 5'b0)
                    DE_EX_scalar1 <= MEM_S_out;
                else if (DE_S1_address == MEM_WB_Swb_address && DE_S1_address != 5'b0)
                    DE_EX_scalar1 <= MEM_WB_scalar;
                else 
                    DE_EX_scalar1 <= DE_S1_address == 5'b11111 ? IF_DE_current_PC_plus_four : DE_scalar1;

                if (DE_S2_address == DE_EX_Swb_address && DE_S2_address != 5'b0 && DE_EX_memory_op[2:1] != 2'b10 && DE_EX_vector_reduce_en != 1'b1)
                    DE_EX_scalar2 <= EX_S_out;
                else if (DE_S2_address == EX_MEM_Swb_address && DE_S2_address != 5'b0)
                    DE_EX_scalar2 <= MEM_S_out;
                else if (DE_S2_address == MEM_WB_Swb_address && DE_S2_address != 5'b0)
                    DE_EX_scalar2 <= MEM_WB_scalar;
                else 
                    DE_EX_scalar2 <= DE_S2_address == 5'b11111 ? IF_DE_current_PC_plus_four : DE_scalar2;
                
                if (DE_V1_address == DE_EX_Vwb_address && DE_V1_address != 4'b0 && DE_EX_memory_op[2:1] != 2'b10)
                    DE_EX_vector1 <= EX_V_out;
                else if (DE_V1_address == EX_MEM_Vwb_address && DE_V1_address != 5'b0)
                    DE_EX_vector1 <= MEM_V_out;
                else if (DE_V1_address == MEM_WB_Vwb_address && DE_V1_address != 5'b0)
                    DE_EX_vector1 <= MEM_WB_vector;
                else 
                    DE_EX_vector1 <= DE_vector1;

                if (DE_V2_address == DE_EX_Vwb_address && DE_V2_address != 4'b0 && DE_EX_memory_op[2:1] != 2'b10)
                    DE_EX_vector2 <= EX_V_out;
                else if (DE_V2_address == EX_MEM_Vwb_address && DE_V2_address != 5'b0)
                    DE_EX_vector2 <= MEM_V_out;
                else if (DE_V2_address == MEM_WB_Vwb_address && DE_V2_address != 5'b0)
                    DE_EX_vector2 <= MEM_WB_vector;
                else 
                    DE_EX_vector2 <= DE_vector2;
                DE_EX_immediate <= IF_DE_instruction[15:0];
            end
        end
    end

    always @(posedge clk, negedge rst_n) begin : DE_EX_address_pipeline
        if (!rst_n) begin
            DE_EX_S1_address <= 5'b0;
            DE_EX_S2_address <= 5'b0;
            DE_EX_Swb_address <= 5'b0;
            DE_EX_V1_address <= 4'b0;
            DE_EX_V2_address <= 4'b0;
            DE_EX_Vwb_address <= 4'b0;
        end else begin
            if (!EX_busy && !MEM_busy) begin
                DE_EX_S1_address <= DE_S1_address;
                DE_EX_S2_address <= DE_S2_address;
                DE_EX_Swb_address <= IF_DE_stall ? 5'b0 : DE_Swb_address;
                DE_EX_V1_address <= DE_V1_address;
                DE_EX_V2_address <= DE_V2_address;
                DE_EX_Vwb_address <= IF_DE_stall ? 4'b0 : DE_Vwb_address;
            end
        end 
    end
    
    always_ff @( posedge clk, negedge rst_n ) begin : DE_EX_control_pipeline
        if (!rst_n) begin
            DE_EX_integer_ALU_opcode <= 4'b0;
            DE_EX_float_ALU_opcode <= 3'b0;
            DE_EX_intALU_op2_select <= 1'b0;
            DE_EX_floatALU1_op1_select <= 1'b0; 
            DE_EX_floatALU3_op1_select <= 1'b0; 
            DE_EX_floatALU2_op1_select <= 1'b0; 
            DE_EX_floatALU4_op1_select <= 1'b0;
            DE_EX_floatALU2_op2_select <= 1'b0;
            DE_EX_floatALU4_op2_select <= 1'b0;
            DE_EX_floatALU1_op2_select <= 2'b0;
            DE_EX_floatALU3_op2_select <= 2'b0;
            DE_EX_Scalar_out_select <= 3'b0;
            DE_EX_memory_op <= 3'b0;
            DE_EX_vector_reduce_en <= 1'b0;
            DE_EX_update_int_flag <= 1'b0;
            DE_EX_update_float_flag <= 1'b0;
            DE_EX_FIN <= 1'b1;
            DE_EX_context_switch <= 1'b0;
        end
        else begin
            if (!EX_busy && !MEM_busy) begin
                DE_EX_intALU_op2_select <= DE_intALU_op2_select;
                DE_EX_floatALU1_op1_select <= DE_floatALU1_op1_select; 
                DE_EX_floatALU3_op1_select <= DE_floatALU3_op1_select; 
                DE_EX_floatALU2_op1_select <= DE_floatALU2_op1_select; 
                DE_EX_floatALU4_op1_select <= DE_floatALU4_op1_select;
                DE_EX_floatALU2_op2_select <= DE_floatALU2_op2_select;
                DE_EX_floatALU4_op2_select <= DE_floatALU4_op2_select;
                DE_EX_floatALU1_op2_select <= DE_floatALU1_op2_select;
                DE_EX_floatALU3_op2_select <= DE_floatALU3_op2_select;

                DE_EX_Scalar_out_select <= DE_Scalar_out_select;
                DE_EX_memory_op<= IF_DE_stall ? 3'b0 : DE_memory_op;
                DE_EX_vector_reduce_en <= IF_DE_stall ? 1'b0 :DE_vector_reduce_en;

                DE_EX_update_int_flag <= DE_update_int_flag;
                DE_EX_update_float_flag <= DE_update_float_flag;
                // Int and float opcode is special designed 
                DE_EX_integer_ALU_opcode <= {IF_DE_instruction[31:28] == 4'b1000 ? 1'b1:1'b0, IF_DE_instruction[31:28] == 4'b0011 ? 1'b1 : 1'b0, IF_DE_instruction[27:26]};
                // memory needs integer ALU to do multiply
                if (IF_DE_instruction[31] == 1'b1 && IF_DE_instruction[29:28] == 2'b11)
                    DE_EX_integer_ALU_opcode[1:0] <= 2'b0;
                
                DE_EX_float_ALU_opcode <= {IF_DE_instruction[31:28] == 4'b1001 || IF_DE_instruction[31:26] == 6'b111111 ? 1'b1 : 1'b0, IF_DE_instruction[27:26]};

                DE_EX_FIN <= IF_DE_FIN;
                DE_EX_context_switch <= DE_context_switch;
            end
            if (kernel_mode) begin
                DE_EX_FIN <= 1'b0;
            end
        end
    end
    
    always_ff @( posedge clk, negedge rst_n ) begin : DE_EX_enable_pipeline
        if (!rst_n) begin
            DE_EX_intALU_en <= 1'b0;
            DE_EX_floatALU1_en <= 1'b0;
            DE_EX_floatALU234_en <= 1'b0;
        end
        else begin
            if (!EX_busy && !MEM_busy)
                DE_EX_intALU_en <= (IF_DE_stall || IF_DE_FIN) == 1'b1 ? 1'b0 : DE_intALU_en;
            else if (EX_integer_done)
                DE_EX_intALU_en <= 1'b0;
            
            if (!EX_busy && !MEM_busy)
                DE_EX_floatALU1_en <= (IF_DE_stall || IF_DE_FIN) == 1'b1 ? 1'b0 : DE_floatALU1_en;
            else if (EX_float_done)
                DE_EX_floatALU1_en <= 1'b0;

            if (!EX_busy && !MEM_busy)
                DE_EX_floatALU234_en <= (IF_DE_stall || IF_DE_FIN) == 1'b1 ? 1'b0 : DE_floatALU234_en;
            else if (EX_float_done)
                DE_EX_floatALU234_en <= 1'b0;
        end

    end

    //////////////////////////
    // EX Stage
    //////////////////////////  
    
    always_ff @( posedge clk, negedge rst_n ) begin : EX_update_waiting_state     
        if (!rst_n)
            EX_current_state <= idle;
        else
            EX_current_state <= EX_next_state;
    end

    always_comb begin : EX_waiting_state_machine
        EX_busy = 1'b0;
        EX_flag_update = 1'b0;
        EX_next_state = EX_current_state;
        case (EX_current_state)
            idle: begin
                if (DE_EX_intALU_en && (DE_EX_integer_ALU_opcode[3:2] == 2'b00 || (DE_EX_integer_ALU_opcode[3] == 1'b1 && DE_EX_integer_ALU_opcode[1] == 1'b1))) begin
                    EX_next_state = waiting_int_MEM;
                    EX_busy = 1'b1;
                end
                if (DE_EX_floatALU1_en && (DE_EX_float_ALU_opcode[2] == 1'b0 || (DE_EX_float_ALU_opcode[2] == 1'b1 && DE_EX_float_ALU_opcode[0] == 1'b0))) begin
                    EX_next_state = waiting_float;
                    EX_busy = 1'b1;
                end
            end
            waiting_int_MEM: begin
                EX_busy = 1'b1;
                if (EX_integer_done) begin
                    EX_next_state = waiting_done; 
                end
            end
            waiting_float: begin
                EX_busy = 1'b1;
                if (EX_float_done) begin
                    EX_next_state = waiting_done; 
                end
            end
            default:begin
                EX_next_state = idle;
                EX_flag_update = 1'b1;
            end
        endcase
    end

    // Int ALU
    always_comb begin : EX_int_ALU_op_select
        EX_integer_ALU_OP1 = DE_EX_scalar1;
        if (DE_EX_intALU_op2_select) 
            EX_integer_ALU_OP2 = {{17{DE_EX_immediate[15]}}, DE_EX_immediate[14:0]}; 
        else 
            EX_integer_ALU_OP2 = DE_EX_scalar2; 
    end

    // float ALU1
    always_comb begin : EX_float_ALU1_op_select
        if (DE_EX_floatALU1_op1_select)
            EX_float_ALU1_OP1 = DE_EX_scalar1;
        else 
            EX_float_ALU1_OP1 = DE_EX_vector1[31:0];

        case (DE_EX_floatALU1_op2_select)
            2'b00: EX_float_ALU1_OP2 = DE_EX_vector2[31:0];
            2'b01: EX_float_ALU1_OP2 = DE_EX_scalar2;
            default: EX_float_ALU1_OP2 = DE_EX_vector1[63:32];
        endcase
    end

    // float ALU2
    always_comb begin : EX_float_ALU2_op_select
        if (DE_EX_floatALU2_op1_select)
            EX_float_ALU2_OP1 = DE_EX_scalar1;
        else 
            EX_float_ALU2_OP1 = DE_EX_vector1[63:32];

        if (DE_EX_floatALU2_op2_select)
            EX_float_ALU2_OP2 = DE_EX_scalar2;
        else
            EX_float_ALU2_OP2 = DE_EX_vector2[63:32];
    end

    // float ALU3
    always_comb begin : EX_float_ALU3_op_select
        if (DE_EX_floatALU3_op1_select)
            EX_float_ALU3_OP1 = DE_EX_scalar1;
        else 
            EX_float_ALU3_OP1 = DE_EX_vector1[95:64];

        case (DE_EX_floatALU3_op2_select)
            2'b00: EX_float_ALU3_OP2 = DE_EX_vector2[95:64];
            2'b01: EX_float_ALU3_OP2 = DE_EX_scalar2;
            default: EX_float_ALU3_OP2 = DE_EX_vector1[127:96];
        endcase
    end

    // float ALU4
    always_comb begin : EX_float_ALU4_op_select
        if (DE_EX_floatALU4_op1_select)
            EX_float_ALU4_OP1 = DE_EX_scalar1;
        else 
            EX_float_ALU4_OP1 = DE_EX_vector1[127:96];

        if (DE_EX_floatALU4_op2_select)
            EX_float_ALU4_OP2 = DE_EX_scalar2;
        else
            EX_float_ALU4_OP2 = DE_EX_vector2[127:96];
    end

    Integer_alu IALU(.op1(EX_integer_ALU_OP1), .op2(EX_integer_ALU_OP2), .clk(clk), .rst_n(rst_n), .en(DE_EX_intALU_en), 
        .out(EX_integer_ALU_out), .done(EX_integer_done), .operation(DE_EX_integer_ALU_opcode), .flag(EX_int_flag), .rst(rst));
    
    Float_alu FALU1(.op1(EX_float_ALU1_OP1), .op2(EX_float_ALU1_OP2), .clk(clk), .rst_n(rst_n), .en(DE_EX_floatALU1_en), 
        .out(EX_float_ALU1_out), .done(EX_float_done), .operation(DE_EX_float_ALU_opcode), .flag(EX_float_flag), .rst(rst));
    Float_alu FALU2(.op1(EX_float_ALU2_OP1), .op2(EX_float_ALU2_OP2), .clk(clk), .rst_n(rst_n), .en(DE_EX_floatALU234_en), 
        .out(EX_float_ALU2_out), .done(), .operation(DE_EX_float_ALU_opcode), .flag(), .rst(rst));
    Float_alu FALU3(.op1(EX_float_ALU3_OP1), .op2(EX_float_ALU3_OP2), .clk(clk), .rst_n(rst_n), .en(DE_EX_floatALU234_en),
        .out(EX_float_ALU3_out), .done(), .operation(DE_EX_float_ALU_opcode), .flag(), .rst(rst));
    Float_alu FALU4(.op1(EX_float_ALU4_OP1), .op2(EX_float_ALU4_OP2), .clk(clk), .rst_n(rst_n), .en(DE_EX_floatALU234_en),
        .out(EX_float_ALU4_out), .done(), .operation(DE_EX_float_ALU_opcode), .flag(), .rst(rst));

    assign EX_int_flag_en = EX_flag_update & DE_EX_update_int_flag;
    assign EX_float_flag_en = EX_flag_update & DE_EX_update_float_flag;

    always_comb begin : EX_select_output
        EX_S_out = 32'b0;
        EX_V_out = 128'b0;

        EX_V_out = {EX_float_ALU4_out, EX_float_ALU3_out, EX_float_ALU2_out, EX_float_ALU1_out};
        if (DE_EX_Scalar_out_select[2] == 1'b0)
            EX_S_out = EX_integer_ALU_out;
        else 
            case (DE_EX_Scalar_out_select[1:0])
                2'b00: EX_S_out = EX_float_ALU1_out;
                2'b01: EX_S_out = EX_float_ALU2_out;
                2'b10: EX_S_out = EX_float_ALU3_out;
                default: EX_S_out = EX_float_ALU4_out;
            endcase
    end

    //////////////////////////
    // EX MEM Pipeline
    ////////////////////////// 

    logic [31:0] DEBUG_EX_MEM_inst, DEBUG_EX_MEM_PC;
    logic [4:0] DEBUG_EX_MEM_RF_AddressS1;
	logic [4:0] DEBUG_EX_MEM_RF_AddressS2;
	logic [3:0] DEBUG_EX_MEM_RF_AddressV1;
	logic [3:0] DEBUG_EX_MEM_RF_AddressV2;
	logic [31:0] DEBUG_EX_MEM_RF_readS1;
	logic [31:0] DEBUG_EX_MEM_RF_readS2;
	logic [127:0] DEBUG_EX_MEM_RF_readV1;
	logic [127:0] DEBUG_EX_MEM_RF_readV2;
    

    always_ff @( posedge clk, negedge rst_n ) begin : Debug_EX_MEM_pipeline
        if (!rst_n) begin 
            DEBUG_EX_MEM_inst <= 32'hF8000000;
            DEBUG_EX_MEM_PC <= 32'b0;
            DEBUG_EX_MEM_RF_AddressS1 <= 5'b0;
            DEBUG_EX_MEM_RF_AddressS2 <= 5'b0;
            DEBUG_EX_MEM_RF_AddressV1 <= 4'b0;
            DEBUG_EX_MEM_RF_AddressV2 <= 4'b0;
            DEBUG_EX_MEM_RF_readS1 <= 32'b0;
            DEBUG_EX_MEM_RF_readS2 <= 32'b0;
            DEBUG_EX_MEM_RF_readV1 <= 128'b0;
            DEBUG_EX_MEM_RF_readV2 <= 128'b0;
        end else begin
            if (!MEM_busy) begin
                DEBUG_EX_MEM_inst <= EX_busy ? 32'hF8000000 : DEBUG_DE_EX_inst;
                DEBUG_EX_MEM_PC <= DEBUG_DE_EX_PC;
                DEBUG_EX_MEM_RF_AddressS1 <= DE_EX_S1_address;
                DEBUG_EX_MEM_RF_AddressS2 <= DE_EX_S2_address;
                DEBUG_EX_MEM_RF_AddressV1 <= DE_EX_V1_address;
                DEBUG_EX_MEM_RF_AddressV2 <= DE_EX_V2_address;
                DEBUG_EX_MEM_RF_readS1 <= DE_EX_scalar1;
                DEBUG_EX_MEM_RF_readS2 <= DE_EX_scalar2;
                DEBUG_EX_MEM_RF_readV1 <= DE_EX_vector1;
                DEBUG_EX_MEM_RF_readV2 <= DE_EX_vector2;
            end
        end
    end

    always_ff @( posedge clk, negedge rst_n ) begin : EX_MEM_data_pipeline
        if (!rst_n) begin
            EX_MEM_v_out <= 128'b0;
            EX_MEM_s_out <= 32'b0;
            EX_MEM_memory_data <= 32'b0;
        end
        else begin
            if (!MEM_busy) begin
                EX_MEM_memory_data <= DE_EX_scalar2;
                EX_MEM_v_out <= EX_V_out;
                EX_MEM_s_out <= EX_S_out;
            end
        end

    end

    always_ff @( posedge clk, negedge rst_n ) begin : EX_MEM_address_pipeline
        if (!rst_n) begin
            EX_MEM_Swb_address <= 5'b0;
            EX_MEM_S_data_address <= 5'b0;
            EX_MEM_V_data_address <= 4'b0;
            EX_MEM_Vwb_address <= 4'b0;
        end else begin 
            if (!MEM_busy) begin
                EX_MEM_Swb_address <= EX_busy ? 5'b0 : DE_EX_Swb_address;
                EX_MEM_Vwb_address <= EX_busy ? 4'b0 :DE_EX_Vwb_address;
                EX_MEM_V_data_address <= DE_EX_V1_address;
                EX_MEM_S_data_address <= DE_EX_S2_address;
            end
        end
    end


    always_ff @( posedge clk, negedge rst_n ) begin : EX_MEM_control_and_enable_pipeline
        if (!rst_n) begin
            EX_MEM_memory_op <= 3'b0;
            EX_MEM_memory_op_stay <= 3'b0;
            EX_MEM_vector_reduce_en <= 1'b0;
            EX_MEM_vector_reduce_en_stay <= 1'b0;

            EX_MEM_FIN <= 1'b1;
            EX_MEM_context_switch <= 1'b0;
        end else begin
            if (!MEM_busy) begin
                if (EX_busy) begin
                    EX_MEM_FIN <= EX_MEM_FIN;
                    EX_MEM_context_switch <= 1'b0;
                end
                else begin
                    EX_MEM_FIN <= DE_EX_FIN;
                    EX_MEM_context_switch <= DE_EX_context_switch;
                end
            end

            if (!MEM_busy)
                EX_MEM_memory_op <= (EX_busy || DE_EX_FIN) == 1'b1 ? 3'b0 : DE_EX_memory_op;
            else if (MEM_knockdown)
                EX_MEM_memory_op <= 3'b0;

            if (!MEM_busy)
                EX_MEM_memory_op_stay <= DE_EX_memory_op;

            if (!MEM_busy) begin
                EX_MEM_vector_reduce_en <= (EX_busy || DE_EX_FIN) == 1'b1 ? 1'b0 : DE_EX_vector_reduce_en;
                EX_MEM_vector_reduce_en_stay <= (EX_busy || DE_EX_FIN) == 1'b1 ? 1'b0 : DE_EX_vector_reduce_en;
            end
            else if (MEM_V_reduce_done)
                EX_MEM_vector_reduce_en <= 3'b0;

            if (kernel_mode) begin
                EX_MEM_FIN <= 1'b0;
            end
        end
    end

    //////////////////////////
    // MEM Stage
    ////////////////////////// 
    always_comb begin : MEM_forwarding
        if (EX_MEM_S_data_address == MEM_WB_Swb_address && EX_MEM_S_data_address != 5'b0) 
            MEM_forwarded_s_data = MEM_WB_scalar;
        else 
            MEM_forwarded_s_data = EX_MEM_memory_data;

        if (EX_MEM_V_data_address == MEM_WB_Vwb_address && EX_MEM_V_data_address != 4'b0) 
            MEM_forwarded_v_data = MEM_WB_vector;
        else 
            MEM_forwarded_v_data = EX_MEM_v_out;

    end

    assign MEM_knockdown = EX_MEM_memory_op[2];
    assign MEM_v_reduce_knockdown = EX_MEM_vector_reduce_en;
    assign MEM_s_or_v = EX_MEM_memory_op[0];
    
    assign MEM_addr = EX_MEM_s_out;
    assign MEM_data_write = EX_MEM_memory_op[0] == 1'b1 ? MEM_forwarded_v_data : {96'b0, MEM_forwarded_s_data};

    assign MEM_read_en = EX_MEM_memory_op[2:1] == 2'b10;
    assign MEM_write_en = EX_MEM_memory_op[2:1] == 2'b11;

    Float_adder Reduce_adder(.op1(EX_MEM_v_out[31:0]), .op2(EX_MEM_v_out[95:64]), .out(MEM_reduce_out), .en(EX_MEM_vector_reduce_en), 
        .clk(clk), .rst_n(rst_n), .done(MEM_V_reduce_done), .rst(rst));

    always_ff @( posedge clk, negedge rst_n ) begin : MEM_update_waiting_state     
        if (!rst_n)
            MEM_current_state <= idle;
        else
            MEM_current_state <= MEM_next_state;
    end

    always_comb begin : MEM_waiting_state_machine
        MEM_busy = 1'b0;
        MEM_next_state = MEM_current_state;
        case (MEM_current_state)
            idle: begin
                // Reading Main memory need the waiting
                if (EX_MEM_memory_op[2:1] == 2'b10 && EX_MEM_s_out[31:29] == 3'b100) begin
                    MEM_next_state = waiting_int_MEM;
                    MEM_busy = 1'b1;
                end 
                // Reading constant memory need two cycles
                else if (EX_MEM_memory_op[2:1] == 2'b10 && EX_MEM_s_out[31:29] == 3'b010) begin
                    MEM_busy = 1'b1;
                end
                
                if (EX_MEM_vector_reduce_en) begin
                    MEM_next_state = waiting_float;
                    MEM_busy = 1'b1;
                end
            end
            waiting_int_MEM: begin
                MEM_busy = 1'b1;
                if (MEM_done) begin
                    MEM_next_state = waiting_done; 
                end
            end
            waiting_float: begin
                MEM_busy = 1'b1;
                if (MEM_V_reduce_done) begin
                    MEM_next_state = waiting_done; 
                end
            end
            default:begin
                MEM_next_state = idle;
            end
        endcase
    end

    always_comb begin : MEM_select_output
        MEM_S_out = 32'b0;
        MEM_V_out = 128'b0;
        if (EX_MEM_memory_op_stay == 3'b101) 
            MEM_V_out = MEM_data_read;
        else MEM_V_out = EX_MEM_v_out;

        if (EX_MEM_memory_op_stay == 3'b100) 
            MEM_S_out = MEM_data_read[31:0];
        else if (EX_MEM_vector_reduce_en_stay) 
            MEM_S_out = MEM_reduce_out;
        else MEM_S_out = EX_MEM_s_out;
        
    end
    //////////////////////////
    // MEM_WB Pipeline
    ////////////////////////// 

    always_ff @( posedge clk, negedge rst_n ) begin : MEM_WB_pipeline
        if (!rst_n) begin
            MEM_WB_vector <= 128'b0;
            MEM_WB_scalar <= 32'b0;
            MEM_WB_Swb_address <= 5'b0;
            MEM_WB_Vwb_address <= 4'b0;
            MEM_WB_FIN <= 1'b0;
            MEM_WB_context_switch <= 1'b0;
        end
        else begin
            
            if (!MEM_busy) begin
                MEM_WB_FIN <= EX_MEM_FIN;
                MEM_WB_context_switch <= EX_MEM_context_switch;
            end else begin
                MEM_WB_context_switch <= 1'b0;
            end
            MEM_WB_Swb_address <= MEM_busy ? 5'b0 : EX_MEM_Swb_address;
            MEM_WB_Vwb_address <= MEM_busy ? 4'b0 :EX_MEM_Vwb_address;

            MEM_WB_vector <= MEM_V_out;
            MEM_WB_scalar <= MEM_S_out; 
            if (kernel_mode) begin
                MEM_WB_FIN <= 1'b0;
            end
        end
    end

    logic [31:0] DEBUG_MEM_WB_inst, DEBUG_MEM_WB_PC;
    logic [4:0] DEBUG_MEM_WB_RF_AddressS1;
	logic [4:0] DEBUG_MEM_WB_RF_AddressS2;
	logic [3:0] DEBUG_MEM_WB_RF_AddressV1;
	logic [3:0] DEBUG_MEM_WB_RF_AddressV2;
	logic [31:0] DEBUG_MEM_WB_RF_readS1;
	logic [31:0] DEBUG_MEM_WB_RF_readS2;
	logic [127:0] DEBUG_MEM_WB_RF_readV1;
	logic [127:0] DEBUG_MEM_WB_RF_readV2;
    logic [31:0] DEBUG_MEM_WB_memory_address;
	logic DEBUG_MEM_WB_memory_R_enable;
	logic DEBUG_MEM_WB_memory_W_enable;
	logic [127:0] DEBUG_MEM_WB_memory_R_data;
	logic [127:0] DEBUG_MEM_WB_memory_W_data;

    always_ff @( posedge clk, negedge rst_n ) begin : Debug_MEM_WB_pipeline
        if (!rst_n) begin 
            DEBUG_MEM_WB_inst <= 32'hF8000000;
            DEBUG_MEM_WB_PC <= 32'b0;
            DEBUG_MEM_WB_RF_AddressS1 <= 5'b0;
            DEBUG_MEM_WB_RF_AddressS2 <= 5'b0;
            DEBUG_MEM_WB_RF_AddressV1 <= 4'b0;
            DEBUG_MEM_WB_RF_AddressV2 <= 4'b0;
            DEBUG_MEM_WB_RF_readS1 <= 32'b0;
            DEBUG_MEM_WB_RF_readS2 <= 32'b0;
            DEBUG_MEM_WB_RF_readV1 <= 128'b0;
            DEBUG_MEM_WB_RF_readV2 <= 128'b0;
            DEBUG_MEM_WB_memory_address <= 32'b0;
            DEBUG_MEM_WB_memory_R_enable <= 1'b0;
            DEBUG_MEM_WB_memory_W_enable <= 1'b0;
            DEBUG_MEM_WB_memory_R_data <= 128'b0;
            DEBUG_MEM_WB_memory_W_data <= 128'b0;
        end else begin
            DEBUG_MEM_WB_inst <= (MEM_busy || kernel_mode) ? 32'hF8000000 : DEBUG_EX_MEM_inst;
            DEBUG_MEM_WB_PC <= DEBUG_EX_MEM_PC;
            DEBUG_MEM_WB_RF_AddressS1 <= DEBUG_EX_MEM_RF_AddressS1;
            DEBUG_MEM_WB_RF_AddressS2 <= DEBUG_EX_MEM_RF_AddressS2;
            DEBUG_MEM_WB_RF_AddressV1 <= DEBUG_EX_MEM_RF_AddressV1;
            DEBUG_MEM_WB_RF_AddressV2 <= DEBUG_EX_MEM_RF_AddressV2;
            DEBUG_MEM_WB_RF_readS1 <= DEBUG_EX_MEM_RF_readS1;
            DEBUG_MEM_WB_RF_readS2 <= DEBUG_EX_MEM_RF_readS2;
            DEBUG_MEM_WB_RF_readV1 <= DEBUG_EX_MEM_RF_readV1;
            DEBUG_MEM_WB_RF_readV2 <= DEBUG_EX_MEM_RF_readV2;
            DEBUG_MEM_WB_memory_address <= MEM_addr;
            DEBUG_MEM_WB_memory_R_enable <= EX_MEM_memory_op_stay[2:1] == 2'b10;
            DEBUG_MEM_WB_memory_W_enable <= EX_MEM_memory_op_stay[2:1] == 2'b11;
            DEBUG_MEM_WB_memory_R_data <= MEM_data_read;
            DEBUG_MEM_WB_memory_W_data <= MEM_data_write;
        end
    end

    assign End_program = MEM_WB_FIN;
    assign Context_switch = MEM_WB_context_switch;

    assign DEBUG_scalar_read_address1 = DEBUG_MEM_WB_RF_AddressS1;
    assign DEBUG_scalar_read_address2 = DEBUG_MEM_WB_RF_AddressS2;
    assign DEBUG_vector_read_address1 = DEBUG_MEM_WB_RF_AddressV1;
    assign DEBUG_vector_read_address2 = DEBUG_MEM_WB_RF_AddressV2;
    assign DEBUG_scalar_read1 = DEBUG_MEM_WB_RF_readS1;
    assign DEBUG_scalar_read2 = DEBUG_MEM_WB_RF_readS2;
    assign DEBUG_vector_read1 = DEBUG_MEM_WB_RF_readV1;
    assign DEBUG_vector_read2 = DEBUG_MEM_WB_RF_readV2;
    assign DEBUG_scalar_wb_address = MEM_WB_Swb_address;
    assign DEBUG_scalar_wb_data = MEM_WB_scalar;
    assign DEBUG_vector_wb_address = MEM_WB_Vwb_address;
    assign DEBUG_vector_wb_data = MEM_WB_vector;

    assign DEBUG_PC = DEBUG_MEM_WB_PC;
    assign DEBUG_inst = DEBUG_MEM_WB_inst;
    assign DEBUG_memory_address = DEBUG_MEM_WB_memory_address;
	assign DEBUG_memory_R_enable = DEBUG_MEM_WB_memory_R_enable;
	assign DEBUG_memory_W_enable = DEBUG_MEM_WB_memory_W_enable;
	assign DEBUG_memory_R_data = DEBUG_MEM_WB_memory_R_data;
	assign DEBUG_memory_W_data = DEBUG_MEM_WB_memory_W_data;
endmodule