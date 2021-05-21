///////////////////////////////
// This module can only do float add
//
// Author: Yan Xiao
// Last modify: 4/14
///////////////////////////////

module Float_adder (
    op1, op2, clk, out, done, en, rst_n, rst
);

    parameter ADD_LATENCY_R = 2;
    parameter ADD_LATENCY = 1;

    input clk, en, rst_n, rst;
    input [31:0] op1, op2;
    output logic [31:0] out;
    output logic done;

    logic [31:0] Adder_result;

    Float_Add Adder (
		.clk    (clk),                //   input,   width = 1,    clk.clk
		.areset (rst),             //   input,   width = 1, areset.reset
		.en     (1'h1),       //   input,   width = 1,     en.en
		.a      (op1),             //   input,  width = 32,      a.a
		.b      (op2),             //   input,  width = 32,      b.b
		.q      (Adder_result),       //  output,  width = 32,      q.q
		.opSel  (1'b1)       //   input,   width = 1,  opSel.opSel
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
        out = Adder_result;
        wait_start = en;
        waiting_time = ADD_LATENCY;
        done = waiting_done;
    end


endmodule