	component FPU is
		port (
			clk       : in  std_logic                     := 'X';             -- clk
			clk_en    : in  std_logic                     := 'X';             -- clk_en
			dataa     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- dataa
			datab     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datab
			n         : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- n
			reset     : in  std_logic                     := 'X';             -- reset
			reset_req : in  std_logic                     := 'X';             -- reset_req
			start     : in  std_logic                     := 'X';             -- start
			done      : out std_logic;                                        -- done
			result    : out std_logic_vector(31 downto 0)                     -- result
		);
	end component FPU;

	u0 : component FPU
		port map (
			clk       => CONNECTED_TO_clk,       -- s1.clk
			clk_en    => CONNECTED_TO_clk_en,    --   .clk_en
			dataa     => CONNECTED_TO_dataa,     --   .dataa
			datab     => CONNECTED_TO_datab,     --   .datab
			n         => CONNECTED_TO_n,         --   .n
			reset     => CONNECTED_TO_reset,     --   .reset
			reset_req => CONNECTED_TO_reset_req, --   .reset_req
			start     => CONNECTED_TO_start,     --   .start
			done      => CONNECTED_TO_done,      --   .done
			result    => CONNECTED_TO_result     --   .result
		);

