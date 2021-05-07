module mem_IC_tb();
    parameter NUM_RT = 4;
    parameter NUM_IC = 4;
    parameter NUM_THREAD = 32;
    localparam BIT_THREAD = $clog2(NUM_THREAD);
    localparam RT2IC_WIDTH = 192;
    localparam IC2RT_WIDTH = 224;
    /*
        input
    */
    logic clk, rst_n;
    // PD
    logic q_en_rt2ic_PD;
    logic core_id_rt2ic_PD[NUM_RT-1:0];
    logic q_en_ic2rt_PD;
    logic core_id_ic2rt_PD[NUM_IC-1:0];
    // RT
    logic [95:0] ray_origin_RT [NUM_RT-1:0];
    logic [95:0] ray_direction_RT [NUM_RT-1:0];
    logic dequeue_RT;
    // IC​
    logic [127:0] shader_info_IC [NUM_IC-1:0]; //(v0, v1, v2, sid)
    logic [95:0] normal_IC [NUM_IC-1:0];
    logic dequeue_IC;
    /*
        output
    */
    // IC
    logic [95:0] ray_origin_IC;
    logic [95:0] ray_direction_IC;
    // RT​
    logic [127:0] shader_info_RT;
    logic [95:0] normal_RT;

    always #1 clk = ~clk;

    mem_IC mem(
        //input
        clk, rst_n, q_en_rt2ic_PD, core_id_rt2ic_PD, q_en_ic2rt_PD, core_id_ic2rt_PD,
        ray_origin_RT, ray_direction_RT, dequeue_RT,
        shader_info_IC, normal_IC, dequeue_IC,
        //output
        ray_origin_IC, ray_direction_IC,
        shader_info_RT, normal_RT
    );

    int error = 0;
    initial begin
        clk = 0;
        rst_n = 1;
        q_en_rt2ic_PD = 0;
        dequeue_RT = 0;
        for(int i = 0; i < NUM_RT; i++) begin
            core_id_rt2ic_PD[i] = 0;
            ray_origin_RT[i] = 0;
            ray_direction_RT[i] = 0;
        end
        q_en_ic2rt_PD = 0;
        dequeue_IC = 0;
        for(int i = 0; i < NUM_IC; i++) begin
            core_id_ic2rt_PD[i] = 0;
            shader_info_IC[i] = 0;
            normal_IC[i] = 0;
        end
        // reset
        @(posedge clk) begin end
        rst_n = 1'b0; // active low reset
        @(posedge clk) begin end
        rst_n = 1'b1; // reset finished
        @(posedge clk) begin end

        // write
        $display("Starting en ...");
        for(int j = 0; j < 3; j++) begin
            // init data
            for(int i = 0; i < NUM_RT; i++) begin
                ray_origin_RT[i] = {i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT};
                ray_direction_RT[i] = {i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT}+1;
            end
            for(int i = 0; i < NUM_IC; i++) begin
                shader_info_IC[i] = {i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT};
                normal_IC[i] = {i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT}+1;
            end
            // enqueue
            for(int i = 0; i < NUM_RT; i++) begin
                core_id_rt2ic_PD = '{NUM_RT{1'b0}};
                core_id_rt2ic_PD[i] = 1;
                q_en_rt2ic_PD = 1;
                @(posedge clk);
            end
            q_en_rt2ic_PD = 0;
            for(int i = 0; i < NUM_IC; i++) begin
                core_id_ic2rt_PD = '{NUM_IC{1'b0}};
                core_id_ic2rt_PD[i] = 1;
                q_en_ic2rt_PD = 1;
                @(posedge clk);
            end
            q_en_ic2rt_PD = 0;
        end
        
        // en + de
        $display("Starting en + de ...");
        for(int j = 3; j < 5; j++) begin
            // init data
            for(int i = 0; i < NUM_RT; i++) begin
                ray_origin_RT[i] = {i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT};
                ray_direction_RT[i] = {i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT}+1;
            end
            // en + de RT2IC
            for(int i = 0; i < NUM_RT; i++) begin
                if(ray_origin_IC !== {i+(j-3)*NUM_RT,i+(j-3)*NUM_RT,i+(j-3)*NUM_RT}) begin
                    $display("Error en de RT2IC ray_origin_IC at thread: %d, expecting: %h got: %h", 
                            i+(j-3)*NUM_RT,{i+(j-3)*NUM_RT,i+(j-3)*NUM_RT,i+(j-3)*NUM_RT},ray_origin_IC);    
                    error++;
                end
                if (ray_direction_IC !== {i+(j-3)*NUM_RT,i+(j-3)*NUM_RT,i+(j-3)*NUM_RT}+1) begin
                    $display("Error en de RT2IC ray_direction_IC at thread: %d, expecting: %h got: %h", 
                            i+(j-3)*NUM_RT,{i+(j-3)*NUM_RT,i+(j-3)*NUM_RT,i+(j-3)*NUM_RT}+1,ray_direction_IC);    
                    error++;
                end
                core_id_rt2ic_PD = '{NUM_RT{1'b0}};
                core_id_rt2ic_PD[i] = 1;
                q_en_rt2ic_PD = 1;
                dequeue_IC = 1;
                @(posedge clk);
                @(negedge clk);
            end
            q_en_rt2ic_PD = 0;
            dequeue_IC = 0;
            // init data
            for(int i = 0; i < NUM_IC; i++) begin
                shader_info_IC[i] = {i+j*NUM_IC,i+j*NUM_IC,i+j*NUM_IC,i+j*NUM_IC};
                normal_IC[i] = {i+j*NUM_IC,i+j*NUM_IC,i+j*NUM_IC,i+j*NUM_IC}+1;
            end
            // en + de IC2RT
            for(int i = 0; i < NUM_IC; i++) begin
                if(shader_info_RT !== {i+(j-3)*NUM_IC,i+(j-3)*NUM_IC,i+(j-3)*NUM_IC,i+(j-3)*NUM_IC}) begin
                    $display("Error en de IC2RT shader_info_RT at thread: %d, expecting: %h got: %h", 
                            i+(j-3)*NUM_IC,{i+(j-3)*NUM_IC,i+(j-3)*NUM_IC,i+(j-3)*NUM_IC,i+(j-3)*NUM_IC},shader_info_RT);    
                    error++;
                end
                if (normal_RT !== {i+(j-3)*NUM_IC,i+(j-3)*NUM_IC,i+(j-3)*NUM_IC}+1) begin
                    $display("Error en de IC2RT normal_RT at thread: %d, expecting: %h got: %h", 
                            i+(j-3)*NUM_IC,{i+(j-3)*NUM_IC,i+(j-3)*NUM_IC,i+(j-3)*NUM_IC}+1,normal_RT);    
                    error++;
                end
                core_id_ic2rt_PD = '{NUM_IC{1'b0}};
                core_id_ic2rt_PD[i] = 1;
                q_en_ic2rt_PD = 1;
                dequeue_RT = 1;
                @(posedge clk);
                @(negedge clk);
            end
            q_en_ic2rt_PD = 0;
            dequeue_RT = 0;
        end
        $display("Starting de ...");
        for(int j = 5; j < 8; j++) begin
            // de RT2IC
            for(int i = 0; i < NUM_RT; i++) begin
                if(ray_origin_IC !== {i+(j-3)*NUM_RT,i+(j-3)*NUM_RT,i+(j-3)*NUM_RT}) begin
                    $display("Error de RT2IC ray_origin_IC at thread: %d, expecting: %h got: %h", 
                            i+(j-3)*NUM_RT,{i+(j-3)*NUM_RT,i+(j-3)*NUM_RT,i+(j-3)*NUM_RT},ray_origin_IC);    
                    error++;
                end
                if (ray_direction_IC !== {i+(j-3)*NUM_RT,i+(j-3)*NUM_RT,i+(j-3)*NUM_RT}+1) begin
                    $display("Error de RT2IC ray_direction_IC at thread: %d, expecting: %h got: %h", 
                            i+(j-3)*NUM_RT,{i+(j-3)*NUM_RT,i+(j-3)*NUM_RT,i+(j-3)*NUM_RT}+1,ray_direction_IC);    
                    error++;
                end
                dequeue_IC = 1;
                @(posedge clk);
                @(negedge clk);
            end
            dequeue_IC = 0;
            // de IC2RT
            for(int i = 0; i < NUM_IC; i++) begin
                if(shader_info_RT !== {i+(j-3)*NUM_IC,i+(j-3)*NUM_IC,i+(j-3)*NUM_IC,i+(j-3)*NUM_IC}) begin
                    $display("Error de IC2RT shader_info_RT at thread: %d, expecting: %h got: %h", 
                            i+(j-3)*NUM_IC,{i+(j-3)*NUM_IC,i+(j-3)*NUM_IC,i+(j-3)*NUM_IC,i+(j-3)*NUM_IC},shader_info_RT);    
                    error++;
                end
                if (normal_RT !== {i+(j-3)*NUM_IC,i+(j-3)*NUM_IC,i+(j-3)*NUM_IC}+1) begin
                    $display("Error de IC2RT normal_RT at thread: %d, expecting: %h got: %h", 
                            i+(j-3)*NUM_IC,{i+(j-3)*NUM_IC,i+(j-3)*NUM_IC,i+(j-3)*NUM_IC}+1,normal_RT);    
                    error++;
                end
                dequeue_RT = 1;
                @(posedge clk);
                @(negedge clk);
            end
            dequeue_RT = 0;
        end

        // full en
        $display("Starting full en ...");
        for(int j = 0; j < NUM_THREAD/NUM_RT; j++) begin
            // init data
            for(int i = 0; i < NUM_RT; i++) begin
                ray_origin_RT[i] = {i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT};
                ray_direction_RT[i] = {i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT}+1;
            end
            for(int i = 0; i < NUM_IC; i++) begin
                shader_info_IC[i] = {i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT};
                normal_IC[i] = {i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT}+1;
            end
            // enqueue
            for(int i = 0; i < NUM_RT; i++) begin
                core_id_rt2ic_PD = '{NUM_RT{1'b0}};
                core_id_rt2ic_PD[i] = 1;
                q_en_rt2ic_PD = 1;
                @(posedge clk);
            end
            q_en_rt2ic_PD = 0;
            for(int i = 0; i < NUM_IC; i++) begin
                core_id_ic2rt_PD = '{NUM_IC{1'b0}};
                core_id_ic2rt_PD[i] = 1;
                q_en_ic2rt_PD = 1;
                @(posedge clk);
            end
            q_en_ic2rt_PD = 0;
        end
        $display("Starting full de ...");
        for(int j = 0; j < NUM_THREAD/NUM_RT; j++) begin
            // de RT2IC
            for(int i = 0; i < NUM_RT; i++) begin
                if(ray_origin_IC !== {i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT}) begin
                    $display("Error de RT2IC ray_origin_IC at thread: %d, expecting: %h got: %h", 
                            i+j*NUM_RT,{i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT},ray_origin_IC);    
                    error++;
                end
                if (ray_direction_IC !== {i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT}+1) begin
                    $display("Error de RT2IC ray_direction_IC at thread: %d, expecting: %h got: %h", 
                            i+j*NUM_RT,{i+j*NUM_RT,i+j*NUM_RT,i+j*NUM_RT}+1,ray_direction_IC);    
                    error++;
                end
                dequeue_IC = 1;
                @(posedge clk);
                @(negedge clk);
            end
            dequeue_IC = 0;
            // de IC2RT
            for(int i = 0; i < NUM_IC; i++) begin
                if(shader_info_RT !== {i+j*NUM_IC,i+j*NUM_IC,i+j*NUM_IC,i+j*NUM_IC}) begin
                    $display("Error de IC2RT shader_info_RT at thread: %d, expecting: %h got: %h", 
                            i+j*NUM_IC,{i+j*NUM_IC,i+j*NUM_IC,i+j*NUM_IC,i+j*NUM_IC},shader_info_RT);    
                    error++;
                end
                if (normal_RT !== {i+j*NUM_IC,i+j*NUM_IC,i+j*NUM_IC}+1) begin
                    $display("Error de IC2RT normal_RT at thread: %d, expecting: %h got: %h", 
                            i+j*NUM_IC,{i+j*NUM_IC,i+j*NUM_IC,i+j*NUM_IC}+1,normal_RT);    
                    error++;
                end
                dequeue_RT = 1;
                @(posedge clk);
                @(negedge clk);
            end
            dequeue_RT = 0;
        end   

        if(error == 0) begin
            $display("All tests passed!!!"); 
        end
        else begin
            $display("In all tests, there are <%d> errors", error);
        end
        $stop();
    end
endmodule