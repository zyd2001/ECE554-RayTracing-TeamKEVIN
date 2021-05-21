///////////////////////////////
// Integer ALU operation encoding
// 0__ ASMD (Add, sub, Mul, Div)
// 1__ special (V_reduce, no-op, square_root, no-op)
//
// Author: Yan Xiao
// Last modify: 4/14
///////////////////////////////

module Float_alu (
    op1, op2, clk, out, done, operation, flag, en, rst_n, rst
);
    parameter ADD_LATENCY_R = 3,
              MUL_LATENCY_R = 3,
              DIV_LATENCY_R = 12,
              SQRT_LATENCY_R = 8;

    parameter ADD_LATENCY = 2,
              MUL_LATENCY = 2,
              DIV_LATENCY = 11,
              SQRT_LATENCY = 7;

    input clk, en, rst_n, rst;
    input [31:0] op1, op2;
    input [2:0] operation;
    output logic [31:0] out;
    output logic [1:0]flag;
    output logic done;

    logic [31:0] Multiplier_result, Adder_result, Divider_result, Sqrt_result;

    Float_Sqrt sqrter (
		.clk    (clk),      //   input,   width = 1,    clk.clk
		.areset (rst),   //   input,   width = 1, areset.reset
		.en     (1'h1),   //   input,   width = 1,     en.en
		.a      (op1),    //   input,  width = 32,      a.a
		.q      (Sqrt_result)       //  output,  width = 32,      q.q
	);

    Float_Add Adder (
		.clk    (clk),                //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'h1),       //   input,   width = 1,     en.en
		.a      (op1),             //   input,  width = 32,      a.a
		.b      (op2),             //   input,  width = 32,      b.b
		.q      (Adder_result),       //  output,  width = 32,      q.q
		.opSel  (!operation[0])       //   input,   width = 1,  opSel.opSel
	);

	Float_Mul Multiplier (
		.clk    (clk),                //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'h1),  //   input,   width = 1,     en.en
		.a      (op1),             //   input,  width = 32,      a.a
		.b      (op2),             //   input,  width = 32,      b.b
		.q      (Multiplier_result)   //  output,  width = 32,      q.q
	);

	Float_Div Divider (
		.clk    (clk),                //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'h1),     //   input,   width = 1,     en.en
		.a      (op1),             //   input,  width = 32,      a.a
		.b      (op2),             //   input,  width = 32,      b.b
		.q      (Divider_result)      //  output,  width = 32,      q.q
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
        done = 1'b0;
        out = op1;
        wait_start = '0;
        waiting_time = ADD_LATENCY;
        // Float ALU
        if (operation[2] == 1'b0) begin
            case (operation[1:0])
                2'b00: begin
                    out = Adder_result;
                    wait_start = en;
                    waiting_time = ADD_LATENCY;
                    done = waiting_done;
                end 
                2'b01: begin
                    out = Adder_result;
                    wait_start = en;
                    waiting_time = ADD_LATENCY;
                    done = waiting_done;
                end
                2'b10: begin
                    out = Multiplier_result;
                    wait_start = en;
                    waiting_time = MUL_LATENCY;
                    done = waiting_done;
                end
                default: begin
                    out = Divider_result;
                    wait_start = en;
                    waiting_time = DIV_LATENCY;
                    done = waiting_done;
                end
            endcase
        end
        else begin
            case (operation[1:0])
                2'b00: begin
                    out = Adder_result;
                    wait_start = en;
                    waiting_time = ADD_LATENCY;
                    done = waiting_done;
                end 
                2'b10: begin 
                    out = Sqrt_result;
                    wait_start = en;
                    waiting_time = SQRT_LATENCY;
                    done = waiting_done;
                end
                default: begin
                    // it is always ready 
                    done = 1'b1;
                    out = op1;
                end
            endcase
        end
        
    end
    always_comb begin 
        if (out == 0)
            flag[1] = 0;
        else 
            flag[1] = 1;
        flag[0] = out[31];      
  end


endmodule