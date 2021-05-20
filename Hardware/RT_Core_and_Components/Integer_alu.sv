///////////////////////////////
// Integer ALU operation encoding
// 00__ ASMD (Add, sub, Mul, Div)
// 01__ NAOX (Not, And, Or, Xor) (Opcode encoding _011_)
// 1x__ special (S_write_high, S_write_low, S_itof, S_ftoi)
//
// Opcode encoding
// 1 bit: 100___
// 2 bit: _011__
// 3-4 bit: last two bits of Opcode
//
// Author: Yan Xiao
// Last modify: 4/14
///////////////////////////////

module Integer_alu (
    op1, op2, clk, out, done, operation, flag, en, rst_n, rst
);

    parameter ADD_LATENCY_R = 0,
            MUL_LATENCY_R = 5,
            DIV_LATENCY_R = 37,
            ITOF_LATENCY_R = 6,
            FTOI_LATENCY_R = 2;

    parameter ADD_LATENCY = 0,
            MUL_LATENCY = 4,
            DIV_LATENCY = 36,
            ITOF_LATENCY = 5,
            FTOI_LATENCY = 1;

    input clk, en, rst_n, rst;
    input signed [31:0] op1, op2;
    input [3:0] operation;
    output logic signed [31:0] out;
    output logic [1:0]flag;
    output logic done;

    logic [63:0] ASMD_out;
    logic [31:0] itof_out, ftoi_out;
    logic itof_done, ftoi_done, ICU_done;
    logic itof_en, ftoi_en, ICU_en;
    logic signed [31:0] adder_op2;
    
    logic [31:0] Divider_result, ftoi_result, itof_result;
    logic [32:0] Adder_result;
    logic [63:0] Multiplier_result;

    assign adder_op2 = operation[0] ? (~op2 + 1'b1) : op2;

    FtoI F2I (
        .clk    (clk),       //   input,   width = 1,    clk.clk
        .areset (rst),    //   input,   width = 1, areset.reset
        .en     (1'h1),    //   input,   width = 1,     en.en
        .a      (op1),     //   input,  width = 32,      a.a
        .q      (ftoi_result)        //  output,  width = 32,      q.q
	);
    
    ItoF ItF (
		.clk    (clk),        //   input,   width = 1,    clk.clk
		.areset (rst),     //   input,   width = 1, areset.reset
		.en     (1'h1),     //   input,   width = 1,     en.en
		.a      (op1),      //   input,  width = 32,      a.a
		.q      (itof_result)         //  output,  width = 32,      q.q
	);

    Fix_Add Adder (
		.clk    (clk),                  //   input,   width = 1,    clk.clk
		.rst    (rst),               //   input,   width = 1,    rst.reset
		.en     (1'h1),         //   input,   width = 1,     en.en
		.a0     (op1),               //   input,  width = 32,     a0.a0
		.a1     (adder_op2),              //   input,  width = 32,     a1.a1
		.result (Adder_result)          //  output,  width = 33, result.result
	);

	Fix_Mul Multiplier (
		.clk    (clk),                  //   input,   width = 1,    clk.clk
		.rst    (rst),               //   input,   width = 1,    rst.reset
		.en     (1'h1),    //   input,   width = 1,     en.en
		.a      (op1),               //   input,  width = 32,      a.a
		.b      (op2),               //   input,  width = 32,      b.b
		.result (Multiplier_result)     //  output,  width = 64, result.result
	);

	Fix_Div Divider (
		.clk         (clk),             //   input,   width = 1,         clk.clk
		.rst         (rst),          //   input,   width = 1,         rst.reset
		.en          (1'h1),  //   input,   width = 1,          en.en
		.numerator   (op1),          //   input,  width = 32,   numerator.numerator
		.denominator (op2),          //   input,  width = 32, denominator.denominator
		.result      (Divider_result)   //  output,  width = 32,      result.result
	);
    
    typedef enum logic { idle, busy } waiting_state;
    waiting_state current_state, next_state;
    logic wait_start, waiting_done;
    logic [5:0] counter, next_counter;
    logic [5:0] max_count, waiting_time;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= '0;
            max_count <= '0;
            current_state <= idle;
        end else begin 
            current_state <= next_state;
            counter <= next_counter;
            if (wait_start) 
                max_count <= waiting_time;
        end
    end
    
    always_comb begin : waiting_state_machine
        next_state = current_state;
        next_counter = counter;  
        waiting_done = 1'b0;
        case (current_state)
            idle: begin
                if (wait_start) begin
                    next_state = busy;
                    next_counter = 1'b1;
                end
            end
            default : begin
                next_counter = counter+1;
                if (counter == max_count) begin
                    next_counter = '0;
                    next_state = idle;
                    waiting_done = 1'b1;
                end
            end
        endcase
    end

    always_comb begin 
        itof_en = 1'b0;
        ftoi_en = 1'b0;
        ICU_en = 1'b0;
        done = 1'b0;
        out = op1;
        wait_start = '0;
        waiting_time = '0;
        if (operation[3] === 1'b0) begin
            if (operation[2] === 1'b0) begin
                case (operation[1:0])
                    2'b00: begin
                        ASMD_out = {{31{Adder_result[32]}}, Adder_result};
                        done = 1'b1;
                    end 
                    2'b01: begin
                        ASMD_out = {{31{Adder_result[32]}}, Adder_result};
                        done = 1'b1;
                    end
                    2'b10: begin
                        ASMD_out = Multiplier_result;
                        wait_start = en;
                        waiting_time = MUL_LATENCY;
                        done = waiting_done;
                    end
                    default: begin
                        ASMD_out = {{32{Divider_result[31]}}, Divider_result};
                        wait_start = en;
                        waiting_time = DIV_LATENCY;
                        done = waiting_done;
                    end
                endcase
                out = ASMD_out[31:0];
            end 
            else begin
                done = 1'b1;
                case (operation[1:0])
                    2'b00: out = ~op1;
                    2'b01: out = op1 & op2;
                    2'b10: out = op1 | op2;
                    default: out = op1 ^ op2;
                endcase
            end
        end else begin
            case (operation[1:0])
                2'b00: begin 
                    done = 1'b1;
                    out = {op2[15:0], op1[15:0]};
                end 
                2'b01: begin
                    done = 1'b1;
                    out = {op1[31:16], op2[15:0]};
                end 
                2'b10: begin 
                    out = itof_result;
                    wait_start = en;
                    waiting_time = ITOF_LATENCY;
                    done = waiting_done;
                end 
                default: begin 
                    out = ftoi_out;
                    wait_start = en;
                    waiting_time = FTOI_LATENCY;
                    done = waiting_done;
                end 
            endcase

        end
        
    end

    always_comb begin 
        if (ASMD_out == 0)
            flag[1] = 0;
        else 
            flag[1] = 1;
        flag[0] = ASMD_out[63];      
    end

endmodule