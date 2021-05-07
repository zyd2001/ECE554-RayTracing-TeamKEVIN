//////////
// Select
// 0 -> original, 1 -> WB data
//////////

module Forwarding_decode (
    DE_EX_Swb_address, DE_EX_Vwb_address, EX_MEM_Swb_address, MEM_WB_Swb_address, MEM_WB_Vwb_address, DE_EX_MEM_read, DE_EX_V_reduce, 
    DE_stall, DE_S1_address, DE_S2_address, DE_V1_address, DE_V2_address,
    DE_EX_S1_select, DE_EX_S2_select, DE_EX_V1_select, DE_EX_V2_select, link_en
);
    input [4:0] DE_EX_Swb_address, MEM_WB_Swb_address, EX_MEM_Swb_address;
    input [3:0] MEM_WB_Vwb_address, DE_EX_Vwb_address;

    input [4:0] DE_S1_address, DE_S2_address;
    input [3:0] DE_V1_address, DE_V2_address;
    input DE_EX_MEM_read, DE_EX_V_reduce, link_en;

    output logic DE_stall;
    output logic DE_EX_S1_select, DE_EX_S2_select, DE_EX_V1_select, DE_EX_V2_select;
    
    logic memory_address_stall, link_stall;

    assign DE_stall = memory_address_stall | link_stall;
    // If we are using WB registers from previous instruction 
    // and their data will be ready in MEM stage, we stall
    always_comb begin : memory_address_stall_comb
        memory_address_stall = 1'b0;
        if (DE_EX_MEM_read || DE_EX_V_reduce) begin
            if (DE_S1_address == DE_EX_Swb_address && DE_EX_Swb_address != 5'b0)
                memory_address_stall = 1'b1;
            if (DE_S2_address == DE_EX_Swb_address && DE_EX_Swb_address != 5'b0) 
                memory_address_stall = 1'b1;
        end
        if (DE_EX_MEM_read) begin
            if (DE_V1_address == DE_EX_Vwb_address && DE_EX_Vwb_address != 4'b0)
                memory_address_stall = 1'b1;
            if (DE_V2_address == DE_EX_Vwb_address && DE_EX_Vwb_address != 4'b0)
                memory_address_stall = 1'b1;
        end
    end

    always_comb begin : link_stall_comb
        link_stall = 1'b0;
        if (link_en) begin
            if (DE_S1_address == DE_EX_Swb_address || DE_S1_address == MEM_WB_Swb_address || DE_S1_address == EX_MEM_Swb_address)
            link_stall = 1'b1;
        end
    end

    // By pass the write back value to
    always_comb begin : WB_bypass
        if (DE_S1_address == MEM_WB_Swb_address && DE_S1_address != 5'b0)
            DE_EX_S1_select = 1'b1;
        else 
            DE_EX_S1_select = 1'b0;
        
        if (DE_S2_address == MEM_WB_Swb_address && DE_S2_address != 5'b0)
            DE_EX_S2_select = 1'b1;
        else 
            DE_EX_S2_select = 1'b0;

        if (DE_V1_address == MEM_WB_Vwb_address && DE_V1_address != 4'b0)
            DE_EX_V1_select = 1'b1;
        else 
            DE_EX_V1_select = 1'b0;

        if (DE_V2_address == MEM_WB_Vwb_address && DE_V2_address != 4'b0)
            DE_EX_V2_select = 1'b1;
        else 
            DE_EX_V2_select = 1'b0;
    end

endmodule