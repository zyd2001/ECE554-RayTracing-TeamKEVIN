//////////////////////////////////////////////////
// This module will make sure the forwarding will work
// It will stall if the data cannot be forwarded
// 
// Reasons why forwarding will not work
// Instruction at DE stage need data to perform compute in EX
// However, the data will not be ready until
//      Instruction at EX stage moved to MEM stage and load from Memory
//      Instruction at EX stage moved to MEM stage and compute final V reduce
// Or Link register has not written back to memory
// 
// Author: Yan Xiao
// Last Modified: 5/11
//////////////////////////////////////////////////

module Forwarding_decode (
    DE_EX_Swb_address, DE_EX_Vwb_address, EX_MEM_Swb_address, MEM_WB_Swb_address, DE_EX_MEM_read, DE_EX_V_reduce, 
    DE_stall, DE_S1_address, DE_S2_address, DE_V1_address, DE_V2_address, link_en
);
    input [4:0] DE_EX_Swb_address, MEM_WB_Swb_address, EX_MEM_Swb_address;
    input [3:0] DE_EX_Vwb_address;

    input [4:0] DE_S1_address, DE_S2_address;
    input [3:0] DE_V1_address, DE_V2_address;
    input DE_EX_MEM_read, DE_EX_V_reduce, link_en;

    output logic DE_stall;
    
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

    // We will stall until the link register WB
    always_comb begin : link_stall_comb
        link_stall = 1'b0;
        if (link_en) begin
            if (DE_S1_address == DE_EX_Swb_address || DE_S1_address == MEM_WB_Swb_address || DE_S1_address == EX_MEM_Swb_address)
            link_stall = 1'b1;
        end
    end


endmodule