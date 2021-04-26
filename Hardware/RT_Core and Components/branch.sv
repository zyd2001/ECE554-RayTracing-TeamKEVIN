/////////////////////
// branch_opcode
// 000	bne	Branch if not equal
// 001	bg	Branch if greater than
// 010	bl	Branch If less than
// 011	bge	Branch if greater or equal than
// 100	ble	Branh if less or equal than
// 110	jmp	Jump to a label
// 111	ret	Return to a stored address
//
// Next PC Select
// 00: normal PC+4
// 10: PC of this instruction + 4 + offset
// 11: Reg File R30 (Link Reg) 

module branch (
    clk, rst_n, EX_busy, MEM_busy, IF_DE_stall, next_pc_select, int_flag, float_flag, int_flag_en, float_flag_en, branch_opcode, branch_en
);
    input clk, rst_n;
    input EX_busy, MEM_busy, int_flag_en, float_flag_en, branch_en;
    input [1:0] int_flag, float_flag;
    input [2:0] branch_opcode;

    output logic IF_DE_stall;
    output logic [1:0] next_pc_select;

    typedef enum logic { idle, waiting } branch_state;
    branch_state current_state, next_state;
    logic [1:0] flag;

    always_ff @( posedge clk, negedge rst_n ) begin 
        if (!rst_n) begin
            current_state <= idle;
            flag <= 2'b0;
        end else begin
            current_state <= next_state;
            if (int_flag_en)
                flag <= int_flag;
            else
                flag <= float_flag;
        end
    end

    always_comb begin : branch_opcode_compare
        next_pc_select = 2'b0;
        if (branch_en)
            case (branch_opcode)
                3'b000: next_pc_select = flag == 2'b0x ? 2'b10 : 2'b00;
                3'b001: next_pc_select = flag == 2'b1x ? 2'b10 : 2'b00;
                3'b010: next_pc_select = flag == 2'b10 ? 2'b10 : 2'b00;
                3'b011: next_pc_select = flag == 2'b11 ? 2'b10 : 2'b00;
                3'b100: next_pc_select = flag == (2'b10 || flag == 2'b0x) ? 2'b10 : 2'b00;
                3'b101: next_pc_select = flag == (2'b11 || flag == 2'b0x) ? 2'b10 : 2'b00;
                3'b110: next_pc_select = 2'b10;
                default: next_pc_select = 2'b11;
            endcase
    end

    always_comb begin 
        IF_DE_stall = 1'b0;
        next_state = current_state;
        // No matter what, if the later stage is busy, we will wait
        if (EX_busy || MEM_busy) begin
            IF_DE_stall = 1'b1;  
        end

        
        if (branch_en && current_state == idle) begin
            // case one, MEM not busy and EX not busy
            if (!EX_busy && !MEM_busy) begin
                IF_DE_stall = 1'b0;  
            end
            // case two, EX and MEM busy
            else begin
                next_state = waiting;
                IF_DE_stall = 1'b1;  
            end
        end else if (branch_en && current_state == waiting) begin
            // while DE is waiting
            // Case 1, EX or MEM still busy
            if (EX_busy || MEM_busy) 
                next_state = waiting;
            else begin
                next_state = idle;
                // Case 2, EX and MEM are done and it is a unconditional jump
                if ( branch_opcode == 3'b111) begin
                    IF_DE_stall = 1'b0; 
                // Case 3, EX and MEM are done but they do no update the flag
                end else if(int_flag_en == 1'b0 && float_flag_en == 1'b0) begin
                    IF_DE_stall = 1'b0; 
                // Case 4, EX and MEM are done but they do update the flag
                end else begin
                    IF_DE_stall = 1'b1; 
                end
            end
        end
        
    end

endmodule