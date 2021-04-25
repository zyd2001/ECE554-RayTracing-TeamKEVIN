//////// 
// Only decode, active in decode stage
// forwarding will be resolved in EX or MEM stage
// 
// Int ALU select:
// op1: Always Scalar 1
// op2: 0 -> scalar 2, 1 -> immediate
// 
// Float ALU1 select:
// op1: 0 -> Vector1[0], 1->scalar 1
// op2: 00 -> Vecotr2[0], 01->scalar 2, 10-> Vector1[1]
// Float ALU2 select:
// op1: 0 -> Vector1[1], 1-> scalar 1
// op2: 0 -> Vector2[1], 1-> scalar 2
// Float ALU3 select:
// op1: 0 -> Vector1[2], 1->scalar 1
// op2: 00 -> Vecotr2[2], 01->scalar 2, 10-> Vector1[3]
// Float ALU2 select:
// op1: 0 -> Vector1[3], 1-> scalar 1
// op2: 0 -> Vector2[3], 1-> scalar 2
//
// Scalar Out Select
// 000 -> int ALU
// 1xx -> Float ALU[3:0] 
// 
// Memory operation
// 0xx -> memory deactivated
// 1xx -> memory activated
//  _  -> 0 for read, 1 for write
//   _ -> 0 for scalar, 1 for vector 
// 


module instruction_decode_unit (
    opcode, immediate,
    intALU_op2_select, intALU_en,
    floatALU1_op1_select, floatALU2_op1_select,
    floatALU3_op1_select, floatALU4_op1_select,
    floatALU1_op2_select, floatALU2_op2_select,
    floatALU3_op2_select, floatALU4_op2_select,
    floatALU1_en, floatALU2_en,
    floatALU3_en, floatALU4_en,
    Scalar_out_select, memory_op,
    vector_reduce_en, update_int_flag, update_float_flag,
    context_switch
);
    input [5:0] opcode;
    input [1:0] immediate;
    output logic intALU_op2_select, floatALU1_op1_select, floatALU2_op1_select,
        floatALU3_op1_select, floatALU4_op1_select,floatALU2_op2_select, floatALU4_op2_select;
    output logic [1:0] floatALU1_op2_select, floatALU3_op2_select;
    output logic intALU_en, floatALU1_en, floatALU2_en, floatALU3_en, floatALU4_en, vector_reduce_en;
    output logic [2:0] Scalar_out_select, memory_op;
    output logic update_int_flag, update_float_flag;
    output logic context_switch;

    always_comb begin
        // Default values
        intALU_op2_select = 1'b1;
        floatALU1_op1_select = 1'b0; 
        floatALU2_op1_select = 1'b0;
        floatALU3_op1_select = 1'b0; 
        floatALU4_op1_select = 1'b0;
        floatALU1_op2_select = 2'b0; 
        floatALU2_op2_select = 1'b0;
        floatALU3_op2_select = 2'b0; 
        floatALU4_op2_select = 1'b0;

        intALU_en = 1'b0;
        floatALU1_en = 1'b0; 
        floatALU2_en = 1'b0;
        floatALU3_en = 1'b0;
        floatALU4_en = 1'b0;

        Scalar_out_select = 3'b0;
        memory_op = 3'b0;
        vector_reduce_en = 1'b0;

        update_float_flag = 1'b0;
        update_int_flag = 1'b0;
        
        if (opcode[5:3] == 3'b011) intALU_op2_select = 1'b0; // only Int int will use scalar 2
        
        // float float, sqrt, v get from s 
        if (opcode[5:3] == 3'b010 | opcode[5:0] == 6'b100110 
            | (opcode[5:0] == 6'b100111 & immediate == 2'b00))
            floatALU1_op1_select = 1'b1; 
        // reduce, VF and FF
        if (opcode[5:0] == 6'b100100) 
            floatALU1_op2_select = 2'b10;
        else if (opcode[5:3] == 3'b010 | opcode[5:3] == 6'b001)
            floatALU1_op2_select = 2'b01; 

        // v get from s 
        if (opcode[5:0] == 6'b100111 & immediate == 2'b01)
            floatALU2_op1_select = 1'b1; 
        // VF and FF
        if ( opcode[5:3] == 6'b001)
            floatALU2_op2_select = 1'b1; 
        
        // v get from s 
        if (opcode[5:0] == 6'b100111 & immediate == 2'b10)
            floatALU3_op1_select = 1'b1; 
        // reduce, VF and FF
        if (opcode[5:0] == 6'b100100) 
            floatALU1_op2_select = 2'b10;
        else if (opcode[5:3] == 6'b001)
            floatALU3_op2_select = 2'b01; 

        // v get from s 
        if (opcode[5:0] == 6'b100111 & immediate == 2'b11)
            floatALU4_op1_select = 1'b1; 
        // VF and FF
        if (opcode[5:3] == 6'b001)
            floatALU4_op2_select = 1'b1; 

        // NAOX, ASMD, Special, Memory, ASMD + imm, Memory
        if (opcode[5:2] == 4'b0011 | opcode[5:3] == 4'b011 | opcode[5:2] == 4'b1000 | opcode[5:3] == 3'b101 | opcode[5:2] == 4'b1111)
            intALU_en =  1'b1;

        // VV, VF, FF, V_special
        if (opcode[5:3] == 3'b000 | opcode[5:2] == 4'b0010 | opcode[5:3] == 3'b010 | opcode[5:2] == 3'b1001)
            floatALU1_en = 1'b1;

        // VV, VF
        if (opcode[5:3] == 3'b000 | opcode[5:2] == 4'b0010 | opcode[5:0] == 6'b100111)
            floatALU2_en = 1'b1;

        // VV, VF, reduce
        if (opcode[5:3] == 3'b000 | opcode[5:2] == 4'b0010 | opcode[5:0] == 3'b100100 | opcode[5:0] == 6'b100111)
            floatALU3_en = 1'b1;

        // VV, VF
        if (opcode[5:3] == 3'b000 | opcode[5:2] == 4'b0010 | opcode[5:0] == 6'b100111)
            floatALU4_en = 1'b1;

        // FF and Sqrt
        if (opcode[5:2] == 4'b0100 | opcode == 6'b100110) 
            Scalar_out_select = 3'b100;
        
        if (opcode == 6'b100101) 
            Scalar_out_select = {3'b1, immediate};
        
        if (opcode[5:2] == 4'b1011 | opcode[5:2] == 4'b1111 ) begin
            memory_op[2] = 1'b1;
            memory_op[1] = opcode[4];
            memory_op[0] = opcode[1];
        end
            
        if (opcode == 6'b100100) 
            vector_reduce_en = 1'b1;

        if (opcode == 6'b010101)
            update_float_flag = 1'b1;

        if (opcode == 6'b011101)
            update_float_flag = 1'b1;
        
        if (opcode == 6'b111010)
            context_switch = 1'b1;
    end
        
    
endmodule