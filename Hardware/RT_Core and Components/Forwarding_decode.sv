//////////
// Select
// 0 -> original, 1 -> WB data
//////////

module Forwarding_decode (
    DE_EX_Swb_address, DE_EX_Vwb_address, MEM_WB_Swb_address, MEM_WB_Vwb_address, DE_EX_MEM_read, DE_EX_V_reduce 
    DE_stall, DE_S1_address, DE_S2_address, DE_V1_address, DE_V2_address,
    DE_EX_S1_select, DE_EX_S2_select, DE_EX_V1_select, DE_EX_V2_select
);
    input [4:0] DE_EX_Swb_address, MEM_WB_Swb_address;
    input [3:0] MEM_WB_Vwb_address;

    input [4:0] DE_S1_address, DE_S2_address;
    input [3:0] DE_V1_address, DE_V2_address;
    input DE_EX_MEM_read, DE_EX_V_reduce;

    output DE_stall, 
    output DE_EX_S1_select, DE_EX_S2_select, DE_EX_V1_select, DE_EX_V2_select;

    // If we are using WB registers from previous instruction 
    // and their data will be ready in MEM stage, we stall
    always_comb begin : memory_address_stall
        DE_stall == 1'b0;
        if (DE_EX_MEM_read || DE_EX_V_reduce)
            if (DE_S1_address == DE_EX_Swb_address || DE_S2_address == DE_EX_Swb_address)
                DE_stall == 1'b1;
        if (DE_EX_MEM_read)
            if (DE_V1_address == DE_EX_Vwb_address || DE_V2_address == DE_EX_Vwb_address)
                DE_stall == 1'b1;
    end

    // By pass the write back value to
    always_comb begin : WB_bypass
        if (DE_S1_address == MEM_WB_Swb_address)
            DE_EX_S1_select = 1'b1;
        else 
            DE_EX_S1_select = 1'b0;
        
        if (DE_S2_address == MEM_WB_Swb_address)
            DE_EX_S2_select = 1'b1;
        else 
            DE_EX_S2_select = 1'b0;

        if (DE_V1_address == MEM_WB_Vwb_address)
            DE_EX_V1_select = 1'b1;
        else 
            DE_EX_V1_select = 1'b0;

        if (DE_V2_address == MEM_WB_Vwb_address)
            DE_EX_V2_select = 1'b1;
        else 
            DE_EX_V2_select = 1'b0;
    end

endmodule