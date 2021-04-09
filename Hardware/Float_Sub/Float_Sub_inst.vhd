	component Float_Sub is
		port (
			clk0   : in  std_logic                     := 'X';             -- clk
			ena    : in  std_logic                     := 'X';             -- ena
			clr0   : in  std_logic                     := 'X';             -- reset
			clr1   : in  std_logic                     := 'X';             -- reset
			result : out std_logic_vector(31 downto 0);                    -- result
			ax     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- ax
			ay     : in  std_logic_vector(31 downto 0) := (others => 'X')  -- ay
		);
	end component Float_Sub;

	u0 : component Float_Sub
		port map (
			clk0   => CONNECTED_TO_clk0,   --   clk0.clk
			ena    => CONNECTED_TO_ena,    --    ena.ena
			clr0   => CONNECTED_TO_clr0,   --   clr0.reset
			clr1   => CONNECTED_TO_clr1,   --   clr1.reset
			result => CONNECTED_TO_result, -- result.result
			ax     => CONNECTED_TO_ax,     --     ax.ax
			ay     => CONNECTED_TO_ay      --     ay.ay
		);

