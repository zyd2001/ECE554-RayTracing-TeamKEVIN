`include "mmio_if.svh"
`include "dma_if.svh"

module mem_controller_tb();

    dma_if 
     #(
       .DATA_WIDTH(512),
       .ADDR_WIDTH(64),
       .SIZE_WIDTH(43)
       ) dma();

     mmio_if 
     #(
       .DATA_WIDTH(64),
       .ADDR_WIDTH(32),
       .START_ADDR(16'h0),
       .END_ADDR(16'h0)
       ) mmio();
    
    
    logic clk, rst_n;
    logic mem_wr_strt_CP_MC;
    logic mem_wr_rdy_tri_TRI_MC;
    logic patch_done_PD_MC;
    logic [127:0] out_data_MAIN_MC[3:0];
    logic cp_strt_MC_CP;
    logic [1:0] mem_wr_en_MC_X[3:0];
    logic [31:0] mem_wr_data_32_MC_X;
    logic [127:0] mem_wr_data_128_MC_TRI;
    logic re_MC_MAIN;
    logic [31:0] addr_MC_MAIN[3:0];

    mem_controller mc_IDUT(.clk(clk),
                            .rst_n(rst_n),
                            .dma(dma.peripheral),
                            .mmio(mmio),
                            .mem_wr_strt(mem_wr_strt_CP_MC),
                            .mem_wr_rdy_tri(mem_wr_rdy_tri_TRI_MC),
                            .patch_done(patch_done_PD_MC),
                            .out_data(out_data_MAIN_MC),
                            .cp_strt(cp_strt_MC_CP),
                            .mem_wr_en(mem_wr_en_MC_X),
                            .mem_wr_data_32(mem_wr_data_32_MC_X),
                            .mem_wr_data_128(mem_wr_data_128_MC_TRI),
                            .re_MAIN(re_MC_MAIN),
                            .addr_MAIN(addr_MC_MAIN));

    logic we_RT_MC[3:0];
    logic [31:0] addr_RT_MAIN[3:0];
    logic [31:0] addr_MAIN[3:0];
    logic [127:0] data_RT_MAIN[3:0];
    logic [127:0] data_MAIN[1:0][31:0];
    assign addr_MAIN[0] = we_RT_MC[0] ? addr_RT_MAIN[0] : addr_MC_MAIN[0];
    assign addr_MAIN[1] = we_RT_MC[1] ? addr_RT_MAIN[1] : addr_MC_MAIN[1];
    assign addr_MAIN[2] = we_RT_MC[2] ? addr_RT_MAIN[2] : addr_MC_MAIN[2];
    assign addr_MAIN[3] = we_RT_MC[3] ? addr_RT_MAIN[3] : addr_MC_MAIN[3];
	logic re_MC_MAIN_REAL[3:0];
	assign re_MC_MAIN_REAL[0] = re_MC_MAIN;
	assign re_MC_MAIN_REAL[1] = re_MC_MAIN;
	assign re_MC_MAIN_REAL[2] = re_MC_MAIN;
	assign re_MC_MAIN_REAL[3] = re_MC_MAIN;
    mem_main main_IDUT(.clk(clk),   
                        .rst_n(rst_n),
                        .we(we_RT_MC),
                        .re(re_MC_MAIN_REAL),
                        .addr(addr_MAIN),
                        .data_in(data_RT_MAIN),
                        .data_out(out_data_MAIN_MC),
                        .rd_rdy());


    always #5 clk = ~clk;

    logic [63:0] mmio_wr_data[4:0];
    logic [31:0] mmio_wr_addr[4:0];
    logic [511:0] dma_rd_data[3:0][3:0];

    initial begin
        clk = 0;
        rst_n = 1;
        we_RT_MC[0] = 0;
	we_RT_MC[1] = 0;
	we_RT_MC[2] = 0;
	we_RT_MC[3] = 0;

        mem_wr_strt_CP_MC = 0;
        mem_wr_rdy_tri_TRI_MC = 0;
        patch_done_PD_MC = 0;
        addr_RT_MAIN[0] = 32'h0000FFF0;
        addr_RT_MAIN[1] = 32'h0001FFF0;
        addr_RT_MAIN[2] = 32'h0002FFF0;
        addr_RT_MAIN[3] = 32'h0003FFF0;
        // data_RT_MAIN[0] = 128'h00000003000000020000000100000000;
        // data_RT_MAIN[1] = 128'h00000007000000060000000500000004;
        // data_RT_MAIN[2] = 128'h0000000B0000000A0000000900000008;
        // data_RT_MAIN[3] = 128'h0000000F0000000E0000000D0000000C;
        
        mmio_wr_data[0] = 64'h0;
        mmio_wr_data[1] = 64'h1;
        mmio_wr_data[2] = 64'h2;
        mmio_wr_data[3] = 64'h3;
        mmio_wr_data[4] = 64'h4;

        mmio_wr_addr[0] = 32'h80000008;
        mmio_wr_addr[1] = 32'h80000008;
        mmio_wr_addr[2] = 32'h80000008;
        mmio_wr_addr[3] = 32'h80000008;
        mmio_wr_addr[4] = 32'h80000008;

        mmio.wr_en = 0;
        mmio.wr_data = 64'h0;
        mmio.wr_addr = 64'h8;
        mmio.rd_en = 0;
        mmio.rd_addr = 64'h0;
	
        for (int i = 0; i < 4; i++)begin
          for (int j = 0; j < 4; j++) begin
            dma_rd_data[i][j] = {$random, $random, $random, $random, $random,
				 $random, $random, $random, $random, $random,
				$random, $random, $random, $random, $random, $random};
          end
        end        

        dma.empty = 1;
        dma.rd_done = 0;
        dma.rd_data = 512'h0;
	dma.wr_done = 1'h0;
	dma.full = 1;

        @(negedge clk);
        rst_n = 0;
        @(negedge clk);
        rst_n = 1;
        @(negedge clk);
        mmio.wr_en = 1;
        mmio.wr_addr = mmio_wr_addr[0];
        mmio.wr_data = mmio_wr_data[0];
	@(negedge clk);
	mmio.wr_en = 0;
        repeat(2) @(negedge clk);
        mmio.wr_en = 1;
        mmio.wr_addr = mmio_wr_addr[1];
        mmio.wr_data = mmio_wr_data[1];
	@(negedge clk);
	mmio.wr_en = 0;
        repeat(2) @(negedge clk);
        mmio.wr_en = 1;
        mmio.wr_addr = mmio_wr_addr[2];
        mmio.wr_data = mmio_wr_data[2];
	@(negedge clk);
	mmio.wr_en = 0;
        repeat(2) @(negedge clk);
        mmio.wr_en = 1;
        mmio.wr_addr = mmio_wr_addr[3];
        mmio.wr_data = mmio_wr_data[3];
	@(negedge clk);
	mmio.wr_en = 0;
        repeat(2) @(negedge clk);
        mmio.wr_en = 1;
        mmio.wr_addr = mmio_wr_addr[4];
        mmio.wr_data = mmio_wr_data[4];
	@(negedge clk);
	mmio.wr_en = 0;


        @(negedge clk);
        if (dma.rd_go !== 1'h1) begin
            $display("Error: dma.rd_go not incurred");
            $stop();
        end
        if (dma.rd_size !== 43'h4) begin
            $display("Error: dma.rd_size incorrect");
            $stop();
        end
        if (dma.rd_addr !== mmio_wr_data[0]) begin
            $display("Error: dma.rd_size incorrect");
            $stop();
        end
        repeat(4) @(negedge clk);

        for (int i = 0; i < 4; i++) begin
          dma.rd_data = dma_rd_data[0][i];
          dma.empty = 0;
          @(negedge clk);
          dma.empty = 1;
          if (dma.rd_en !== 1'h1) begin
            $display("Error: dma.rd_en incorrect");
            $stop();
          end
          //@(negedge clk);
          for (int j = 0; j < 16; j++) begin
            if (mem_wr_data_32_MC_X !== dma_rd_data[0][i][j*32 +: 32]) begin
              $display("Error: data_out_32 incorrect");
              $stop();
            end
            if (mem_wr_en_MC_X[0] !== 2'b01) begin
              $display("Error: wr_en incorrect");
              $stop();
            end
            @(negedge clk);
          end
          @(negedge clk);
        end
        dma.rd_done = 1;
        @(negedge clk);
        dma.rd_done = 0;
        if (mem_wr_en_MC_X[0] !== 2'b10) begin
              $display("Error: wr_en incorrect");
              $stop();
        end
        if (cp_strt_MC_CP !== 1'h1) begin
              $display("Error: cp_start incorrect");
              $stop();
        end

        repeat(5)@(negedge clk);
        mem_wr_strt_CP_MC = 1'h1;
        @(negedge clk);
        mem_wr_strt_CP_MC = 1'h0;
        @(negedge clk);

        if (dma.rd_go !== 1'h1) begin
            $display("Error: dma.rd_go not incurred");
            $stop();
        end
        if (dma.rd_size !== 43'h4) begin
            $display("Error: dma.rd_size incorrect");
            $stop();
        end
        if (dma.rd_addr !== mmio_wr_data[1]) begin
            $display("Error: dma.rd_size incorrect");
            $stop();
        end
        repeat(4) @(negedge clk);
        
        for (int i = 0; i < 4; i++) begin
          dma.rd_data = dma_rd_data[1][i];
          dma.empty = 0;
          @(negedge clk);
          dma.empty = 1;
          if (dma.rd_en !== 1'h1) begin
            $display("Error: dma.rd_en incorrect");
            $stop();
          end
          //@(negedge clk);
          for (int j = 0; j < 16; j++) begin
            if (mem_wr_data_32_MC_X !== dma_rd_data[1][i][j*32+:32]) begin
              $display("Error: data_out_32 incorrect");
              $stop();
            end
            if (mem_wr_en_MC_X[1] !== 2'b01) begin
              $display("Error: wr_en incorrect");
              $stop();
            end
            @(negedge clk);
          end
          @(negedge clk);
        end
        dma.rd_done = 1;
        @(negedge clk);
        dma.rd_done = 0;
        if (mem_wr_en_MC_X[1] !== 2'b10) begin
              $display("Error: wr_en incorrect");
              $stop();
        end
        @(negedge clk);
        @(negedge clk);
        if (dma.rd_go !== 1'h1) begin
            $display("Error: dma.rd_go not incurred");
            $stop();
        end
        if (dma.rd_size !== 43'h4) begin
            $display("Error: dma.rd_size incorrect");
            $stop();
        end
        if (dma.rd_addr !== mmio_wr_data[2]) begin
            $display("Error: dma.rd_size incorrect");
            $stop();
        end
        repeat(4) @(negedge clk);
        
        for (int i = 0; i < 4; i++) begin
          dma.rd_data = dma_rd_data[2][i];
          dma.empty = 0;
          @(negedge clk);
          dma.empty = 1;
          if (dma.rd_en !== 1'h1) begin
            $display("Error: dma.rd_en incorrect");
            $stop();
          end
          //@(negedge clk);
          for (int j = 0; j < 16; j++) begin
            if (mem_wr_data_32_MC_X !== dma_rd_data[2][i][j*32+:32]) begin
              $display("Error: data_out_32 incorrect");
              $stop();
            end
            if (mem_wr_en_MC_X[2] !== 2'b01) begin
              $display("Error: wr_en incorrect");
              $stop();
            end
            @(negedge clk);
          end
          @(negedge clk);
        end

        dma.rd_done = 1;
        @(negedge clk);
        dma.rd_done = 0;
        if (mem_wr_en_MC_X[2] !== 2'b10) begin
              $display("Error: wr_en incorrect");
              $stop();
        end
        @(negedge clk);
        @(negedge clk);


        if (dma.rd_go !== 1'h1) begin
            $display("Error: dma.rd_go not incurred");
            $stop();
        end
        if (dma.rd_size !== 43'h4) begin
            $display("Error: dma.rd_size incorrect");
            $stop();
        end
        if (dma.rd_addr !== mmio_wr_data[3]) begin
            $display("Error: dma.rd_size incorrect");
            $stop();
        end
        repeat(4) @(negedge clk);
         
        for (int i = 0; i < 4; i++) begin
          dma.rd_data = dma_rd_data[3][i];
		//$display("dma_rd_data: %h", dma_rd_data[3][i]);
          dma.empty = 0;
          @(negedge clk);
          dma.empty = 1;
          if (dma.rd_en !== 1'h1) begin
            $display("Error: dma.rd_en incorrect");
            $stop();
          end
          //@(negedge clk);
          for (int j = 0; j < 4; j++) begin
            if (mem_wr_data_128_MC_TRI !== dma_rd_data[3][i][j*128+:128]) begin
              $display("Error: data_out_128 incorrect; expected: %h, received: %h", dma_rd_data[3][i][j*128+:128], mem_wr_data_128_MC_TRI);
              $stop();
            end
            if (mem_wr_en_MC_X[3] !== 2'b01) begin
              $display("Error: wr_en incorrect");
              $stop();
            end
	          @(posedge clk);
	          mem_wr_rdy_tri_TRI_MC = 1'h0;
		        repeat(4)@(posedge clk);
	          mem_wr_rdy_tri_TRI_MC = 1'h1;
            @(negedge clk);
	
          end
          @(negedge clk);
        end

        dma.rd_done = 1;
        @(negedge clk);
        dma.rd_done = 0;
        if (mem_wr_en_MC_X[3] !== 2'b10) begin
              $display("Error: wr_en incorrect");
              $stop();
        end

        for (int i = 0; i < 2; i++) begin
          for (int j = 0; j < 32; j++) begin
            data_MAIN[i][j] = {$randome, $random, $random, $random};
          end
        end

        for (int k = 0; k < 2; k++) begin

            we_RT_MC[0] = 1'h1;
            we_RT_MC[1] = 1'h1;
            we_RT_MC[2] = 1'h1;
            we_RT_MC[3] = 1'h1;
            
            addr_RT_MAIN[0] = 32'h0000FFF0;
            addr_RT_MAIN[1] = 32'h0001FFF0;
            addr_RT_MAIN[2] = 32'h0002FFF0;
            addr_RT_MAIN[3] = 32'h0003FFF0;

            data_RT_MAIN[0] = data_MAIN[k][0];
            data_RT_MAIN[1] = data_MAIN[k][1];
            data_RT_MAIN[2] = data_MAIN[k][2];
            data_RT_MAIN[3] = data_MAIN[k][3];

            @(negedge clk);

            addr_RT_MAIN[0] = 32'h0004FFF0;
            addr_RT_MAIN[1] = 32'h0005FFF0;
            addr_RT_MAIN[2] = 32'h0006FFF0;
            addr_RT_MAIN[3] = 32'h0007FFF0;

            data_RT_MAIN[0] = data_MAIN[k][4];
            data_RT_MAIN[1] = data_MAIN[k][5];
            data_RT_MAIN[2] = data_MAIN[k][6];
            data_RT_MAIN[3] = data_MAIN[k][7];

            @(negedge clk);

            addr_RT_MAIN[0] = 32'h0008FFF0;
            addr_RT_MAIN[1] = 32'h0009FFF0;
            addr_RT_MAIN[2] = 32'h000AFFF0;
            addr_RT_MAIN[3] = 32'h000BFFF0;

            data_RT_MAIN[0] = data_MAIN[k][8];
            data_RT_MAIN[1] = data_MAIN[k][9];
            data_RT_MAIN[2] = data_MAIN[k][10];
            data_RT_MAIN[3] = data_MAIN[k][11];

            @(negedge clk);

            addr_RT_MAIN[0] = 32'h000CFFF0;
            addr_RT_MAIN[1] = 32'h000DFFF0;
            addr_RT_MAIN[2] = 32'h000EFFF0;
            addr_RT_MAIN[3] = 32'h000FFFF0;

            data_RT_MAIN[0] = data_MAIN[k][12];
            data_RT_MAIN[1] = data_MAIN[k][13];
            data_RT_MAIN[2] = data_MAIN[k][14];
            data_RT_MAIN[3] = data_MAIN[k][15];

            @(negedge clk);

            addr_RT_MAIN[0] = 32'h0010FFF0;
            addr_RT_MAIN[1] = 32'h0011FFF0;
            addr_RT_MAIN[2] = 32'h0012FFF0;
            addr_RT_MAIN[3] = 32'h0013FFF0;

            data_RT_MAIN[0] = data_MAIN[k][16];
            data_RT_MAIN[1] = data_MAIN[k][17];
            data_RT_MAIN[2] = data_MAIN[k][18];
            data_RT_MAIN[3] = data_MAIN[k][19];

            @(negedge clk);

            addr_RT_MAIN[0] = 32'h0014FFF0;
            addr_RT_MAIN[1] = 32'h0015FFF0;
            addr_RT_MAIN[2] = 32'h0016FFF0;
            addr_RT_MAIN[3] = 32'h0017FFF0;

            data_RT_MAIN[0] = data_MAIN[k][20];
            data_RT_MAIN[1] = data_MAIN[k][21];
            data_RT_MAIN[2] = data_MAIN[k][22];
            data_RT_MAIN[3] = data_MAIN[k][23];

            @(negedge clk);

            addr_RT_MAIN[0] = 32'h0018FFF0;
            addr_RT_MAIN[1] = 32'h0019FFF0;
            addr_RT_MAIN[2] = 32'h001AFFF0;
            addr_RT_MAIN[3] = 32'h001BFFF0;

            data_RT_MAIN[0] = data_MAIN[k][24];
            data_RT_MAIN[1] = data_MAIN[k][25];
            data_RT_MAIN[2] = data_MAIN[k][26];
            data_RT_MAIN[3] = data_MAIN[k][27];

            @(negedge clk);

            addr_RT_MAIN[0] = 32'h001CFFF0;
            addr_RT_MAIN[1] = 32'h001DFFF0;
            addr_RT_MAIN[2] = 32'h001EFFF0;
            addr_RT_MAIN[3] = 32'h001FFFF0;

            data_RT_MAIN[0] = data_MAIN[k][28];
            data_RT_MAIN[1] = data_MAIN[k][29];
            data_RT_MAIN[2] = data_MAIN[k][30];
            data_RT_MAIN[3] = data_MAIN[k][31];

            @(negedge clk);

            we_RT_MC[0] = 1'h0;
            we_RT_MC[1] = 1'h0;
            we_RT_MC[2] = 1'h0;
            we_RT_MC[3] = 1'h0;

            repeat(30) @(negedge clk);

            

            @(posedge clk);
            patch_done_PD_MC = 1'h1;
            @(negedge clk);
            if (dma.wr_go !== 1'h1) begin
              $display("Error: dma.wr_go incorrect");
              $stop();
            end
            if (dma.wr_addr !== (mmio_wr_data[4] + k*8)) begin
              $display("Error: dma.wr_addr. Expected: %d; Actual: %d.", mmio_wr_data[4], dma.wr_data);
              $stop();
            end
            if (dma.wr_size !== 8) begin
              $display("Error: dma.wr_size. Expected: 8; Actual: %d.", dma.wr_size);
              $stop();
            end

            dma.full = 1'h1;
		        @(posedge clk);
            patch_done_PD_MC = 1'h0;

            for (int i = 0; i < 8; i++) begin
              repeat(30) @(posedge clk);
              if (dma.wr_en === 1'h1) begin
                $display("Error: dma.wr_en incorrect.");
                $stop();
              end
              repeat(30) @(posedge clk);
              dma.full = 1'h0;
              @(negedge clk);
              if (dma.wr_en !== 1'h1) begin
                $display("Error: dma.wr_en incorrect.");
                $stop();
              end
              if (dma.wr_data !== {data_MAIN[k][i*4+3], data_MAIN[k][i*4+2], data_MAIN[k][i*4+1], data_MAIN[k][i*4]}) begin
                $display("Error: dma.wr_data incorrect.");
                $display("Expected: %d", {data_MAIN[k][i*4+3], data_MAIN[k][i*4+2], data_MAIN[k][i*4+1], data_MAIN[k][i*4]});
                $display("Actual: %d", dma.wr_data);
                $stop();
              end
              @(posedge clk);
              dma.full = 1'h1;
            end

            repeat(5) @(posedge clk);
            dma.wr_done = 1'h1;
		        @(posedge clk);
		        dma.wr_done = 1'h0;
            @(negedge clk);
            if (k === 1) begin
              if (mmio.rd_data !== 64'h2) begin
                $display("Error: dma.wr_done incorrect. %d", mmio.rd_data);
                $stop();
              end
            end
            else begin
              if (mmio.rd_data !== 64'h1) begin
              $display("Error: dma.wr_done incorrect.");
              $stop();
              end
            end
            repeat(10)@(negedge clk);
            mmio.wr_en = 1'h1;
            mmio.wr_addr = 32'h1;
		 
		        @(negedge clk);
		        mmio.wr_en = 1'h0;
            repeat(50)@(negedge clk);
        
        end

        $display("Test Passed");
        $stop();



    end



endmodule