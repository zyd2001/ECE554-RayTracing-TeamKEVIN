module address_decode_unit (
    instruction, DE_S1_address, DE_S2_address, DE_Swb_address,
    DE_V1_address, DE_V2_address, DE_Vwb_address
);
    input [31:0] instruction;
    output logic [4:0] DE_S1_address, DE_S2_address, DE_Swb_address;
    output logic [3:0] DE_V1_address, DE_V2_address, DE_Vwb_address;

    always_comb begin
        if (instruction[31] === 1'b0) begin
            DE_S1_address = instruction[20:16];
            DE_S2_address = instruction[15:11];
            DE_V1_address = instruction[19:16];
            DE_V2_address = instruction[14:11];

            DE_Swb_address = instruction[25:21];
            DE_Vwb_address = instruction[24:21];
            // VV instructions 
            if (instruction[30:29] === 2'b00) begin
                DE_S1_address = 5'b0;
                DE_S2_address = 5'b0;

                DE_Swb_address = 5'b0;
                DE_Vwb_address = instruction[28] == 1'b0? instruction[24:21] : 4'b0;
            end 
            // VF instructions
            else if(instruction[30:28] === 3'b010) begin
                DE_S1_address = 5'b0;
                DE_V2_address = 4'b0;

                DE_Swb_address = 5'b0;
            end 
            // NAOX instructions 
            else if(instruction[30:28] === 3'b011) begin
                DE_V1_address = 4'b0;
                DE_V2_address = 4'b0; 
                DE_Vwb_address = 4'b0; 
            end 
            // Int and Float operations
            else begin
                DE_V1_address = 4'b0;
                DE_V2_address = 4'b0; 
                DE_Vwb_address = 4'b0; 
                DE_Swb_address = instruction[28] == 1'b0? instruction[25:21] : 5'b0;
            end
        end
        // Immediate MODe
        else begin
            DE_S1_address = instruction[20:16];
            DE_V1_address = instruction[19:16];
            
            DE_S2_address = 5'b0;
            DE_V2_address = 4'b0;

            DE_Swb_address = instruction[25:21];
            DE_Vwb_address = instruction[24:21];
            // If Write back enable
            if (instruction[30] == 1'b0) begin
                case (instruction[29:28])
                    2'b00: begin
                        DE_V1_address = 4'b0;
                        DE_Vwb_address = 4'b0;
                    end
                    2'b01: begin
                        case (instruction[27:26])
                            2'b00: begin
                                DE_S1_address = 5'b0;
                                DE_Vwb_address = 4'b0;
                            end
                            2'b01: begin
                                DE_S1_address = 5'b0;
                                DE_Vwb_address = 4'b0;
                            end
                            2'b10: begin
                                DE_V1_address = instruction[24:21];
                                DE_Vwb_address = 4'b0;
                            end
                            default: begin
                                DE_V1_address = 4'b0;
                                DE_Swb_address = 5'b0;
                            end
                                
                        endcase
                    end
                    2'b10: begin
                        DE_V1_address = 4'b0;
                        DE_Vwb_address = 4'b0;
                    end
                    // memory load
                    default: begin
                        DE_V1_address = 4'b0;
                        if (instruction[27] == 1'b1) DE_Swb_address = 5'b0;
                        else DE_Vwb_address = 4'b0;
                        
                    end
                endcase
            end
            else begin
                DE_Vwb_address = 4'b0;
                DE_Swb_address = 5'b0;
                DE_V1_address = 4'b0;
                DE_S1_address = 5'b0;
                // for load instructions
                if (instruction[29:28] == 2'b11) begin
                    DE_S1_address = instruction[20:16];
                    if (instruction[27:26] == 2'b11) DE_V1_address = instruction[24:21]
                    else DE_S2_address = instruction[25:21];

                end
            end

        end
    end

endmodule