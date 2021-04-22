import "DPI-C" function string getenv(input string env_name);
module instruction_decode_tb;

    // trace file
    int tracefile;
	string tracefilename;

    // array of names for each opcode
    string array [string];

    // current opcode
    logic [5:0] op;


    int index;
    int imm_index;

    logic clk;

    
    logic [1:0] immediate;
    logic intALU_op2_select, floatALU1_op1_select, floatALU2_op1_select,
        floatALU3_op1_select, floatALU4_op1_select,floatALU2_op2_select, floatALU4_op2_select;
    logic [1:0] floatALU1_op2_select, floatALU3_op2_select;
    logic intALU_en, floatALU1_en, floatALU2_en, floatALU3_en, floatALU4_en, vector_reduce_en;
    logic [2:0] Scalar_out_select, memory_op;

    // DUT stuff
    instruction_decode_unit DUT(.opcode(op), .immediate(immediate),
        .intALU_op2_select(intALU_op2_select), .intALU_en(intALU_en),
        .floatALU1_op1_select(floatALU1_op1_select), .floatALU2_op1_select(floatALU2_op1_select),
        .floatALU3_op1_select(floatALU3_op1_select), .floatALU4_op1_select(floatALU4_op1_select),
        .floatALU1_op2_select(floatALU1_op2_select), .floatALU2_op2_select(floatALU2_op2_select),
        .floatALU3_op2_select(floatALU3_op2_select), .floatALU4_op2_select(floatALU4_op2_select),
        .floatALU1_en(floatALU1_en), .floatALU2_en(floatALU2_en),
        .floatALU3_en(floatALU3_en), .floatALU4_en(floatALU4_en),
        .Scalar_out_select(Scalar_out_select), .memory_op(memory_op),
        .vector_reduce_en(vector_reduce_en));

    

    initial begin
        clk = 0;
        op = 6'b000000;
        immediate = 2'b00;

        tracefilename = {getenv("PWD"), "/IDU_trace.out"};
		tracefile = $fopen(tracefilename, "w+");


        array = '{ "101100" : "s_load_4byte",
                "111100" : "s_store_4byte",
                "100000" : "s_write_high",
                "100001" : "s_write_low",
                "100101" : "s_get_from_v",
                "101111" : "v_load_16byte",
                "111111" : "v_store_16byte",
                "100111" : "v_get_from_s",
                "000000" : "vv_add",
                "000001" : "vv_sub",
                "000010" : "vv_mul_ele",
                "000011" : "vv_div",
                "100100" : "v_reduce",
                "100110" : "s_sqrt",
                "001000" : "vf_add",
                "001001" : "vf_sub",
                "001010" : "vf_mul",
                "001011" : "vf_div",
                "011000" : "ii_add",
                "011001" : "ii_sub",
                "011010" : "ii_mul",
                "011011" : "ii_div",
                "010000" : "ff_add",
                "010001" : "ff_sub",
                "010010" : "ff_mul",
                "010011" : "ff_div",
                "101000" : "ii_addi",
                "101001" : "ii_subi",
                "101010" : "ii_muli",
                "101011" : "ii_divi",
                "001100" : "not",
                "001101" : "and",
                "001110" : "or",
                "001111" : "xor",
                "111000" : "trace",
                "100010" : "s_itof",
                "100011" : "s_ftoi",
                "000101" : "cmp_v",
                "110100" : "cmp_i",
                "010101" : "cmp_f",
                "110000" : "bne",
                "110001" : "bg",
                "110010" : "bl",
                "110011" : "bge",
                "110100" : "ble",
                "110110" : "real_jmp",
                "110111" : "ret",
                "111011" : "fin"
        };

        for(index = 0; index < 64; index++) begin

            // if the op exists, test it
            if(array.exists($sformatf("%b", op))) begin
                

                for(imm_index = 0; imm_index < 4; imm_index++)begin
                    @(posedge clk)

                    $fwrite(tracefile,"---------------------------------\n\n");
                    
                    $fwrite(tracefile,"%s -> %s, immediate = %s\n\n", array[$sformatf("%b", op)], $sformatf("%b", op), $sformatf("%b", immediate));
                    
                    
                    // int ALU:
                    $fwrite(tracefile, "intALU_en: %s\n", $sformatf("%b",intALU_en));
                    if(intALU_en == 1)begin
                        $fwrite(tracefile,"\tintALU_op2_select: %s\n", $sformatf("%b",intALU_op2_select));
                    end

                    // float ALU1
                    $fwrite(tracefile, "floatALU1_en: %s\n", $sformatf("%b",floatALU1_en));
                    if(floatALU1_en == 1)begin
                        $fwrite(tracefile,"\tfloatALU1_op1_select: %s\n", $sformatf("%b",floatALU1_op1_select));
                        $fwrite(tracefile,"\tfloatALU1_op2_select: %s\n", $sformatf("%b",floatALU1_op2_select));
                    end

                    // float ALU2
                    $fwrite(tracefile, "floatALU2_en: %s\n", $sformatf("%b",floatALU2_en));
                    if(floatALU2_en == 1)begin
                        $fwrite(tracefile,"\tfloatALU2_op1_select: %s\n", $sformatf("%b",floatALU2_op1_select));
                        $fwrite(tracefile,"\tfloatALU2_op2_select: %s\n", $sformatf("%b",floatALU2_op2_select));
                    end

                    // float ALU3
                    $fwrite(tracefile, "floatALU3_en: %s\n", $sformatf("%b",floatALU3_en));
                    if(floatALU3_en == 1)begin
                        $fwrite(tracefile,"\tfloatALU3_op1_select: %s\n", $sformatf("%b",floatALU3_op1_select));
                        $fwrite(tracefile,"\tfloatALU3_op2_select: %s\n", $sformatf("%b",floatALU3_op2_select));
                    end

                    // float ALU4
                    $fwrite(tracefile, "floatALU4_en: %s\n", $sformatf("%b",floatALU4_en));
                    if(floatALU4_en == 1)begin
                        $fwrite(tracefile,"\tfloatALU4_op1_select: %s\n", $sformatf("%b",floatALU4_op1_select));
                        $fwrite(tracefile,"\tfloatALU4_op2_select: %s\n", $sformatf("%b",floatALU4_op2_select));
                    end
                    
                    $fwrite(tracefile, "vector_reduce_en: %s\n", $sformatf("%b",vector_reduce_en));

                    if(Scalar_out_select !== 3'b000) $fwrite(tracefile, "Scalar_out_select: %s\n", $sformatf("%b",Scalar_out_select));
                    if(memory_op !== 3'b000) $fwrite(tracefile, "memory_op: %s\n", $sformatf("%b",memory_op));
                    
                    
                    
                    immediate = immediate + 1;
                    $fwrite(tracefile,"\n");

                end

                $fwrite(tracefile,"---------------------------------\n");
                $fwrite(tracefile,"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n");
                
            end
            op = op + 1;
        end

        $stop;

    end

    always #5 clk = ~clk;

endmodule