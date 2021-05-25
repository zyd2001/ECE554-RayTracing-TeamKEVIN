///////////////////////////////
// This module that have 32 scalar registers and 16 vector registers
// Register at position 0 is always 0 
//
// Author: Yan Xiao
// Last modify: 4/14
///////////////////////////////
module Register_file (
    clk,  
    scalar_wen, scalar_wb_address, scalar_wb_data,
    vector_wen, vector_wb_address, vector_wb_data,
    scalar_read_address1, scalar_read_address2, 
    vector_read_address1, vector_read_address2,
    scalar_read1, scalar_read2,
    vector_read1, vector_read2
);
    input clk;
    input scalar_wen, vector_wen;
    input  [4:0] scalar_wb_address, scalar_read_address1, scalar_read_address2;
    input  [3:0] vector_wb_address, vector_read_address1, vector_read_address2;
    input  [31:0] scalar_wb_data;
    input  [127:0] vector_wb_data;
    output logic [31:0] scalar_read1, scalar_read2;
    output logic [127:0] vector_read1, vector_read2;

    // R31 does not stored here, R0 is always 0, but it can write to it
    reg [31:0] scalar_ram [31:0];
    reg [127:0] vector_ram [15:0];

    // Scalar Block
    always @(posedge clk) begin
        if (scalar_wen)
            scalar_ram[scalar_wb_address] = scalar_wb_data;
        scalar_read1 <= scalar_read_address1 == 5'h00 ? 32'h0 : scalar_ram[scalar_read_address1];
        scalar_read2 <= scalar_read_address2 == 5'h00 ? 32'h0 : scalar_ram[scalar_read_address2];
    end

    // Vector Block
    always @(posedge clk) begin
        if (vector_wen)
            vector_ram[vector_wb_address] = vector_wb_data;
        vector_read1 <= vector_read_address1 == 4'h00 ? 128'h0 :vector_ram[vector_read_address1];
        vector_read2 <= vector_read_address2 == 4'h00 ? 128'h0 : vector_ram[vector_read_address2];
    end

endmodule