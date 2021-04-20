-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 19.2 (Release Build #57)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2019 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from Fix_Mul_altera_fxp_functions_191_vsvne7a
-- VHDL created on Mon Apr 19 21:15:20 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;

library fourteennm;
use fourteennm.fourteennm_components.fourteennm_mac;
use fourteennm.fourteennm_components.fourteennm_fp_mac;

entity Fix_Mul_altera_fxp_functions_191_vsvne7a is
    port (
        a : in std_logic_vector(31 downto 0);  -- sfix32
        b : in std_logic_vector(31 downto 0);  -- sfix32
        en : in std_logic_vector(0 downto 0);  -- ufix1
        result : out std_logic_vector(63 downto 0);  -- sfix64
        clk : in std_logic;
        rst : in std_logic
    );
end Fix_Mul_altera_fxp_functions_191_vsvne7a;

architecture normal of Fix_Mul_altera_fxp_functions_191_vsvne7a is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal multiplier_bs1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal multiplier_bs2_b : STD_LOGIC_VECTOR (13 downto 0);
    signal multiplier_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal multiplier_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal multiplier_bs6_b : STD_LOGIC_VECTOR (13 downto 0);
    signal multiplier_bs7_in : STD_LOGIC_VECTOR (17 downto 0);
    signal multiplier_bs7_b : STD_LOGIC_VECTOR (17 downto 0);
    signal multiplier_bs10_in : STD_LOGIC_VECTOR (17 downto 0);
    signal multiplier_bs10_b : STD_LOGIC_VECTOR (17 downto 0);
    signal multiplier_sums_join_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal multiplier_sums_align_1_q : STD_LOGIC_VECTOR (50 downto 0);
    signal multiplier_sums_align_1_qint : STD_LOGIC_VECTOR (50 downto 0);
    signal multiplier_sums_result_add_0_0_a : STD_LOGIC_VECTOR (64 downto 0);
    signal multiplier_sums_result_add_0_0_b : STD_LOGIC_VECTOR (64 downto 0);
    signal multiplier_sums_result_add_0_0_o : STD_LOGIC_VECTOR (64 downto 0);
    signal multiplier_sums_result_add_0_0_q : STD_LOGIC_VECTOR (64 downto 0);
    signal multiplier_im0_cma_reset : std_logic;
    type multiplier_im0_cma_ahtype is array(NATURAL range <>) of SIGNED(13 downto 0);
    signal multiplier_im0_cma_ah : multiplier_im0_cma_ahtype(0 to 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of multiplier_im0_cma_ah : signal is true;
    signal multiplier_im0_cma_ch : multiplier_im0_cma_ahtype(0 to 0);
    attribute preserve_syn_only of multiplier_im0_cma_ch : signal is true;
    signal multiplier_im0_cma_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal multiplier_im0_cma_c0 : STD_LOGIC_VECTOR (13 downto 0);
    signal multiplier_im0_cma_s0 : STD_LOGIC_VECTOR (27 downto 0);
    signal multiplier_im0_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal multiplier_im0_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal multiplier_im0_cma_ena0 : std_logic;
    signal multiplier_im0_cma_ena1 : std_logic;
    signal multiplier_im0_cma_ena2 : std_logic;
    signal multiplier_im8_cma_reset : std_logic;
    type multiplier_im8_cma_ahtype is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal multiplier_im8_cma_ah : multiplier_im8_cma_ahtype(0 to 0);
    attribute preserve_syn_only of multiplier_im8_cma_ah : signal is true;
    signal multiplier_im8_cma_ch : multiplier_im8_cma_ahtype(0 to 0);
    attribute preserve_syn_only of multiplier_im8_cma_ch : signal is true;
    signal multiplier_im8_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multiplier_im8_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multiplier_im8_cma_s0 : STD_LOGIC_VECTOR (35 downto 0);
    signal multiplier_im8_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal multiplier_im8_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal multiplier_im8_cma_ena0 : std_logic;
    signal multiplier_im8_cma_ena1 : std_logic;
    signal multiplier_im8_cma_ena2 : std_logic;
    signal multiplier_ma3_cma_reset : std_logic;
    signal multiplier_ma3_cma_ah : multiplier_im0_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multiplier_ma3_cma_ah : signal is true;
    signal multiplier_ma3_cma_ch : multiplier_im8_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multiplier_ma3_cma_ch : signal is true;
    signal multiplier_ma3_cma_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal multiplier_ma3_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multiplier_ma3_cma_a1 : STD_LOGIC_VECTOR (13 downto 0);
    signal multiplier_ma3_cma_c1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multiplier_ma3_cma_s0 : STD_LOGIC_VECTOR (32 downto 0);
    signal multiplier_ma3_cma_qq : STD_LOGIC_VECTOR (32 downto 0);
    signal multiplier_ma3_cma_q : STD_LOGIC_VECTOR (32 downto 0);
    signal multiplier_ma3_cma_ena0 : std_logic;
    signal multiplier_ma3_cma_ena1 : std_logic;
    signal multiplier_ma3_cma_ena2 : std_logic;

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- multiplier_bs4(BITSELECT,10)@0
    multiplier_bs4_in <= a(17 downto 0);
    multiplier_bs4_b <= multiplier_bs4_in(17 downto 0);

    -- multiplier_bs2(BITSELECT,8)@0
    multiplier_bs2_b <= STD_LOGIC_VECTOR(b(31 downto 18));

    -- multiplier_bs7(BITSELECT,13)@0
    multiplier_bs7_in <= STD_LOGIC_VECTOR(b(17 downto 0));
    multiplier_bs7_b <= STD_LOGIC_VECTOR(multiplier_bs7_in(17 downto 0));

    -- multiplier_bs6(BITSELECT,12)@0
    multiplier_bs6_b <= a(31 downto 18);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- multiplier_ma3_cma(CHAINMULTADD,23)@0 + 4
    -- out q@5
    multiplier_ma3_cma_reset <= rst;
    multiplier_ma3_cma_ena0 <= en(0) or multiplier_ma3_cma_reset;
    multiplier_ma3_cma_ena1 <= multiplier_ma3_cma_ena0;
    multiplier_ma3_cma_ena2 <= multiplier_ma3_cma_ena0;
    multiplier_ma3_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    multiplier_ma3_cma_ah(0) <= RESIZE(SIGNED(multiplier_bs6_b),14);
                    multiplier_ma3_cma_ah(1) <= RESIZE(SIGNED(multiplier_bs2_b),14);
                    multiplier_ma3_cma_ch(0) <= RESIZE(UNSIGNED(multiplier_bs7_b),18);
                    multiplier_ma3_cma_ch(1) <= RESIZE(UNSIGNED(multiplier_bs4_b),18);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    multiplier_ma3_cma_a0 <= STD_LOGIC_VECTOR(multiplier_ma3_cma_ah(0));
    multiplier_ma3_cma_c0 <= STD_LOGIC_VECTOR(multiplier_ma3_cma_ch(0));
    multiplier_ma3_cma_a1 <= STD_LOGIC_VECTOR(multiplier_ma3_cma_ah(1));
    multiplier_ma3_cma_c1 <= STD_LOGIC_VECTOR(multiplier_ma3_cma_ch(1));
    multiplier_ma3_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_sumof2",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 14,
        by_clock => "0",
        by_width => 14,
        ax_clock => "0",
        bx_clock => "0",
        ax_width => 18,
        bx_width => 18,
        signed_may => "true",
        signed_mby => "true",
        signed_max => "false",
        signed_mbx => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 33
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => multiplier_ma3_cma_ena0,
        ena(1) => multiplier_ma3_cma_ena1,
        ena(2) => multiplier_ma3_cma_ena2,
        clr(0) => multiplier_ma3_cma_reset,
        clr(1) => multiplier_ma3_cma_reset,
        ay => multiplier_ma3_cma_a1,
        by => multiplier_ma3_cma_a0,
        ax => multiplier_ma3_cma_c1,
        bx => multiplier_ma3_cma_c0,
        resulta => multiplier_ma3_cma_s0
    );
    multiplier_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 33, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => multiplier_ma3_cma_s0, xout => multiplier_ma3_cma_qq, ena => en(0), clk => clk, aclr => rst );
    multiplier_ma3_cma_q <= STD_LOGIC_VECTOR(multiplier_ma3_cma_qq(32 downto 0));

    -- multiplier_sums_align_1(BITSHIFT,18)@5
    multiplier_sums_align_1_qint <= multiplier_ma3_cma_q & "000000000000000000";
    multiplier_sums_align_1_q <= multiplier_sums_align_1_qint(50 downto 0);

    -- multiplier_bs1(BITSELECT,7)@0
    multiplier_bs1_b <= STD_LOGIC_VECTOR(a(31 downto 18));

    -- multiplier_im0_cma(CHAINMULTADD,21)@0 + 4
    -- out q@5
    multiplier_im0_cma_reset <= rst;
    multiplier_im0_cma_ena0 <= en(0) or multiplier_im0_cma_reset;
    multiplier_im0_cma_ena1 <= multiplier_im0_cma_ena0;
    multiplier_im0_cma_ena2 <= multiplier_im0_cma_ena0;
    multiplier_im0_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    multiplier_im0_cma_ah(0) <= RESIZE(SIGNED(multiplier_bs1_b),14);
                    multiplier_im0_cma_ch(0) <= RESIZE(SIGNED(multiplier_bs2_b),14);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    multiplier_im0_cma_a0 <= STD_LOGIC_VECTOR(multiplier_im0_cma_ah(0));
    multiplier_im0_cma_c0 <= STD_LOGIC_VECTOR(multiplier_im0_cma_ch(0));
    multiplier_im0_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 14,
        ax_clock => "0",
        ax_width => 14,
        signed_may => "true",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 28,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => multiplier_im0_cma_ena0,
        ena(1) => multiplier_im0_cma_ena1,
        ena(2) => multiplier_im0_cma_ena2,
        clr(0) => multiplier_im0_cma_reset,
        clr(1) => multiplier_im0_cma_reset,
        ay => multiplier_im0_cma_a0,
        ax => multiplier_im0_cma_c0,
        resulta => multiplier_im0_cma_s0
    );
    multiplier_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => multiplier_im0_cma_s0, xout => multiplier_im0_cma_qq, ena => en(0), clk => clk, aclr => rst );
    multiplier_im0_cma_q <= STD_LOGIC_VECTOR(multiplier_im0_cma_qq(27 downto 0));

    -- multiplier_bs10(BITSELECT,16)@0
    multiplier_bs10_in <= b(17 downto 0);
    multiplier_bs10_b <= multiplier_bs10_in(17 downto 0);

    -- multiplier_im8_cma(CHAINMULTADD,22)@0 + 4
    -- out q@5
    multiplier_im8_cma_reset <= rst;
    multiplier_im8_cma_ena0 <= en(0) or multiplier_im8_cma_reset;
    multiplier_im8_cma_ena1 <= multiplier_im8_cma_ena0;
    multiplier_im8_cma_ena2 <= multiplier_im8_cma_ena0;
    multiplier_im8_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    multiplier_im8_cma_ah(0) <= RESIZE(UNSIGNED(multiplier_bs4_b),18);
                    multiplier_im8_cma_ch(0) <= RESIZE(UNSIGNED(multiplier_bs10_b),18);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    multiplier_im8_cma_a0 <= STD_LOGIC_VECTOR(multiplier_im8_cma_ah(0));
    multiplier_im8_cma_c0 <= STD_LOGIC_VECTOR(multiplier_im8_cma_ch(0));
    multiplier_im8_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        ax_clock => "0",
        ax_width => 18,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 36,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => multiplier_im8_cma_ena0,
        ena(1) => multiplier_im8_cma_ena1,
        ena(2) => multiplier_im8_cma_ena2,
        clr(0) => multiplier_im8_cma_reset,
        clr(1) => multiplier_im8_cma_reset,
        ay => multiplier_im8_cma_a0,
        ax => multiplier_im8_cma_c0,
        resulta => multiplier_im8_cma_s0
    );
    multiplier_im8_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => multiplier_im8_cma_s0, xout => multiplier_im8_cma_qq, ena => en(0), clk => clk, aclr => rst );
    multiplier_im8_cma_q <= STD_LOGIC_VECTOR(multiplier_im8_cma_qq(35 downto 0));

    -- multiplier_sums_join_0(BITJOIN,17)@5
    multiplier_sums_join_0_q <= multiplier_im0_cma_q & multiplier_im8_cma_q;

    -- multiplier_sums_result_add_0_0(ADD,20)@5
    multiplier_sums_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((64 downto 64 => multiplier_sums_join_0_q(63)) & multiplier_sums_join_0_q));
    multiplier_sums_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((64 downto 51 => multiplier_sums_align_1_q(50)) & multiplier_sums_align_1_q));
    multiplier_sums_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(multiplier_sums_result_add_0_0_a) + SIGNED(multiplier_sums_result_add_0_0_b));
    multiplier_sums_result_add_0_0_q <= multiplier_sums_result_add_0_0_o(64 downto 0);

    -- out_rsrvd_fix(GPOUT,5)@5
    result <= multiplier_sums_result_add_0_0_q(63 downto 0);

END normal;
