	component Native_Fixed_Add is
		port (
			ay      : in  std_logic_vector(17 downto 0) := (others => 'X'); -- ay
			by      : in  std_logic_vector(17 downto 0) := (others => 'X'); -- by
			ax      : in  std_logic_vector(17 downto 0) := (others => 'X'); -- ax
			bx      : in  std_logic_vector(17 downto 0) := (others => 'X'); -- bx
			resulta : out std_logic_vector(36 downto 0);                    -- resulta
			clk0    : in  std_logic                     := 'X';             -- clk
			clk1    : in  std_logic                     := 'X';             -- clk
			clk2    : in  std_logic                     := 'X';             -- clk
			ena     : in  std_logic_vector(2 downto 0)  := (others => 'X')  -- ena
		);
	end component Native_Fixed_Add;

	u0 : component Native_Fixed_Add
		port map (
			ay      => CONNECTED_TO_ay,      --      ay.ay
			by      => CONNECTED_TO_by,      --      by.by
			ax      => CONNECTED_TO_ax,      --      ax.ax
			bx      => CONNECTED_TO_bx,      --      bx.bx
			resulta => CONNECTED_TO_resulta, -- resulta.resulta
			clk0    => CONNECTED_TO_clk0,    --    clk0.clk
			clk1    => CONNECTED_TO_clk1,    --    clk1.clk
			clk2    => CONNECTED_TO_clk2,    --    clk2.clk
			ena     => CONNECTED_TO_ena      --     ena.ena
		);

