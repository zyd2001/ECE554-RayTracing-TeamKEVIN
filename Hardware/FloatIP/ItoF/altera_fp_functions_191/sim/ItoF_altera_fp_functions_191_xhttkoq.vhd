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

-- VHDL created from ItoF_altera_fp_functions_191_xhttkoq
-- VHDL created on Tue Apr 20 22:59:51 2021


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

entity ItoF_altera_fp_functions_191_xhttkoq is
    port (
        a : in std_logic_vector(31 downto 0);  -- sfix32
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end ItoF_altera_fp_functions_191_xhttkoq;

architecture normal of ItoF_altera_fp_functions_191_xhttkoq is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid6_fxpToFPTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xXorSign_uid7_fxpToFPTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal xXorSign_uid7_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yE_uid8_fxpToFPTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal yE_uid8_fxpToFPTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yE_uid8_fxpToFPTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal yE_uid8_fxpToFPTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal y_uid9_fxpToFPTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal y_uid9_fxpToFPTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal maxCount_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal inIsZero_uid12_fxpToFPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal inIsZero_uid12_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal msbIn_uid13_fxpToFPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expPreRnd_uid14_fxpToFPTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expPreRnd_uid14_fxpToFPTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expPreRnd_uid14_fxpToFPTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expPreRnd_uid14_fxpToFPTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracRnd_uid16_fxpToFPTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal sticky_uid20_fxpToFPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid20_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal nr_uid21_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rnd_uid22_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracR_uid24_fxpToFPTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracR_uid24_fxpToFPTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracR_uid24_fxpToFPTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracR_uid24_fxpToFPTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal fracR_uid25_fxpToFPTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracR_uid25_fxpToFPTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expR_uid26_fxpToFPTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal udf_uid27_fxpToFPTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal udf_uid27_fxpToFPTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal udf_uid27_fxpToFPTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal udf_uid27_fxpToFPTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expInf_uid28_fxpToFPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal ovf_uid29_fxpToFPTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal ovf_uid29_fxpToFPTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal ovf_uid29_fxpToFPTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal ovf_uid29_fxpToFPTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelector_uid30_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracZ_uid31_fxpToFPTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid32_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid32_fxpToFPTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal udfOrInZero_uid33_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelector_uid34_fxpToFPTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expZ_uid37_fxpToFPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid38_fxpToFPTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid38_fxpToFPTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPostExc_uid39_fxpToFPTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid39_fxpToFPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal outRes_uid40_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid42_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid47_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid61_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid68_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid77_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid80_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid81_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid81_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid82_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest_o : STD_LOGIC_VECTOR (7 downto 0);
    signal vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal vCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal l_uid17_fxpToFPTest_merged_bit_select_in : STD_LOGIC_VECTOR (1 downto 0);
    signal l_uid17_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal l_uid17_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (23 downto 0);
    signal rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (27 downto 0);
    signal rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (29 downto 0);
    signal rVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (30 downto 0);
    signal fracRnd_uid15_fxpToFPTest_merged_bit_select_in : STD_LOGIC_VECTOR (30 downto 0);
    signal fracRnd_uid15_fxpToFPTest_merged_bit_select_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRnd_uid15_fxpToFPTest_merged_bit_select_c : STD_LOGIC_VECTOR (6 downto 0);
    signal redist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist1_vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_2_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_expR_uid26_fxpToFPTest_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist7_fracR_uid25_fxpToFPTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_inIsZero_uid12_fxpToFPTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_y_uid9_fxpToFPTest_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_y_uid9_fxpToFPTest_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_signX_uid6_fxpToFPTest_b_7_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- signX_uid6_fxpToFPTest(BITSELECT,5)@0
    signX_uid6_fxpToFPTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- redist11_signX_uid6_fxpToFPTest_b_7(DELAY,106)
    redist11_signX_uid6_fxpToFPTest_b_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signX_uid6_fxpToFPTest_b, xout => redist11_signX_uid6_fxpToFPTest_b_7_q, ena => en(0), clk => clk, aclr => areset );

    -- expInf_uid28_fxpToFPTest(CONSTANT,27)
    expInf_uid28_fxpToFPTest_q <= "11111111";

    -- expZ_uid37_fxpToFPTest(CONSTANT,36)
    expZ_uid37_fxpToFPTest_q <= "00000000";

    -- rVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select(BITSELECT,93)@5
    rVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b <= vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q(31 downto 31);
    rVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c <= vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q(30 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cStage_uid80_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,79)@5
    cStage_uid80_lzcShifterZ1_uid10_fxpToFPTest_q <= rVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c & GND_q;

    -- rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select(BITSELECT,92)@4
    rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b <= vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q(31 downto 30);
    rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c <= vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q(29 downto 0);

    -- zs_uid68_lzcShifterZ1_uid10_fxpToFPTest(CONSTANT,67)
    zs_uid68_lzcShifterZ1_uid10_fxpToFPTest_q <= "00";

    -- cStage_uid73_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,72)@4
    cStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_q <= rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c & zs_uid68_lzcShifterZ1_uid10_fxpToFPTest_q;

    -- rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select(BITSELECT,91)@4
    rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b <= vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q(31 downto 28);
    rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c <= vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q(27 downto 0);

    -- zs_uid61_lzcShifterZ1_uid10_fxpToFPTest(CONSTANT,60)
    zs_uid61_lzcShifterZ1_uid10_fxpToFPTest_q <= "0000";

    -- cStage_uid66_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,65)@4
    cStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_q <= rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c & zs_uid61_lzcShifterZ1_uid10_fxpToFPTest_q;

    -- rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select(BITSELECT,90)@3
    rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b <= vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q(31 downto 24);
    rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c <= vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q(23 downto 0);

    -- cStage_uid59_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,58)@3
    cStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_q <= rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c & expZ_uid37_fxpToFPTest_q;

    -- rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select(BITSELECT,89)@2
    rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b <= vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q(31 downto 16);
    rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c <= vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q(15 downto 0);

    -- zs_uid47_lzcShifterZ1_uid10_fxpToFPTest(CONSTANT,46)
    zs_uid47_lzcShifterZ1_uid10_fxpToFPTest_q <= "0000000000000000";

    -- cStage_uid52_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,51)@2
    cStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_q <= rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c & zs_uid47_lzcShifterZ1_uid10_fxpToFPTest_q;

    -- zs_uid42_lzcShifterZ1_uid10_fxpToFPTest(CONSTANT,41)
    zs_uid42_lzcShifterZ1_uid10_fxpToFPTest_q <= "00000000000000000000000000000000";

    -- xXorSign_uid7_fxpToFPTest(LOGICAL,6)@0
    xXorSign_uid7_fxpToFPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => signX_uid6_fxpToFPTest_b(0)) & signX_uid6_fxpToFPTest_b));
    xXorSign_uid7_fxpToFPTest_q <= a xor xXorSign_uid7_fxpToFPTest_b;

    -- yE_uid8_fxpToFPTest(ADD,7)@0
    yE_uid8_fxpToFPTest_a <= STD_LOGIC_VECTOR("0" & xXorSign_uid7_fxpToFPTest_q);
    yE_uid8_fxpToFPTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & signX_uid6_fxpToFPTest_b);
    yE_uid8_fxpToFPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yE_uid8_fxpToFPTest_a) + UNSIGNED(yE_uid8_fxpToFPTest_b));
    yE_uid8_fxpToFPTest_q <= yE_uid8_fxpToFPTest_o(32 downto 0);

    -- y_uid9_fxpToFPTest(BITSELECT,8)@0
    y_uid9_fxpToFPTest_in <= STD_LOGIC_VECTOR(yE_uid8_fxpToFPTest_q(31 downto 0));
    y_uid9_fxpToFPTest_b <= STD_LOGIC_VECTOR(y_uid9_fxpToFPTest_in(31 downto 0));

    -- redist9_y_uid9_fxpToFPTest_b_1(DELAY,104)
    redist9_y_uid9_fxpToFPTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist9_y_uid9_fxpToFPTest_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist9_y_uid9_fxpToFPTest_b_1_q <= STD_LOGIC_VECTOR(y_uid9_fxpToFPTest_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist10_y_uid9_fxpToFPTest_b_2(DELAY,105)
    redist10_y_uid9_fxpToFPTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_y_uid9_fxpToFPTest_b_2_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist10_y_uid9_fxpToFPTest_b_2_q <= STD_LOGIC_VECTOR(redist9_y_uid9_fxpToFPTest_b_1_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,43)@1 + 1
    vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_qi <= "1" WHEN redist9_y_uid9_fxpToFPTest_b_1_q = zs_uid42_lzcShifterZ1_uid10_fxpToFPTest_q ELSE "0";
    vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_qi, xout => vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q, ena => en(0), clk => clk, aclr => areset );

    -- vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest(MUX,45)@2
    vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_combproc: PROCESS (vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_s, en, redist10_y_uid9_fxpToFPTest_b_2_q, zs_uid42_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
        CASE (vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_s) IS
            WHEN "0" => vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q <= redist10_y_uid9_fxpToFPTest_b_2_q;
            WHEN "1" => vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q <= zs_uid42_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN OTHERS => vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,48)@2
    vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" WHEN rVStage_uid48_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b = zs_uid47_lzcShifterZ1_uid10_fxpToFPTest_q ELSE "0";

    -- vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest(MUX,52)@2 + 1
    vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    CASE (vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_s) IS
                        WHEN "0" => vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q <= vStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q;
                        WHEN "1" => vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_q;
                        WHEN OTHERS => vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,55)@3
    vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" WHEN rVStage_uid55_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b = expZ_uid37_fxpToFPTest_q ELSE "0";

    -- vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest(MUX,59)@3 + 1
    vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    CASE (vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_s) IS
                        WHEN "0" => vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q <= vStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q;
                        WHEN "1" => vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_q;
                        WHEN OTHERS => vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,62)@4
    vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" WHEN rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b = zs_uid61_lzcShifterZ1_uid10_fxpToFPTest_q ELSE "0";

    -- vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest(MUX,66)@4
    vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_combproc: PROCESS (vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_s, en, vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q, cStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
        CASE (vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_s) IS
            WHEN "0" => vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q <= vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN "1" => vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN OTHERS => vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,69)@4
    vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" WHEN rVStage_uid69_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b = zs_uid68_lzcShifterZ1_uid10_fxpToFPTest_q ELSE "0";

    -- vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest(MUX,73)@4 + 1
    vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    CASE (vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_s) IS
                        WHEN "0" => vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q <= vStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q;
                        WHEN "1" => vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_q;
                        WHEN OTHERS => vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- vCount_uid77_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,76)@5
    vCount_uid77_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" WHEN rVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b = GND_q ELSE "0";

    -- vStagei_uid81_lzcShifterZ1_uid10_fxpToFPTest(MUX,80)@5
    vStagei_uid81_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid77_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid81_lzcShifterZ1_uid10_fxpToFPTest_combproc: PROCESS (vStagei_uid81_lzcShifterZ1_uid10_fxpToFPTest_s, en, vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q, cStage_uid80_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
        CASE (vStagei_uid81_lzcShifterZ1_uid10_fxpToFPTest_s) IS
            WHEN "0" => vStagei_uid81_lzcShifterZ1_uid10_fxpToFPTest_q <= vStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN "1" => vStagei_uid81_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid80_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN OTHERS => vStagei_uid81_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRnd_uid15_fxpToFPTest_merged_bit_select(BITSELECT,94)@5
    fracRnd_uid15_fxpToFPTest_merged_bit_select_in <= vStagei_uid81_lzcShifterZ1_uid10_fxpToFPTest_q(30 downto 0);
    fracRnd_uid15_fxpToFPTest_merged_bit_select_b <= fracRnd_uid15_fxpToFPTest_merged_bit_select_in(30 downto 7);
    fracRnd_uid15_fxpToFPTest_merged_bit_select_c <= fracRnd_uid15_fxpToFPTest_merged_bit_select_in(6 downto 0);

    -- sticky_uid20_fxpToFPTest(LOGICAL,19)@5 + 1
    sticky_uid20_fxpToFPTest_qi <= "1" WHEN fracRnd_uid15_fxpToFPTest_merged_bit_select_c /= "0000000" ELSE "0";
    sticky_uid20_fxpToFPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => sticky_uid20_fxpToFPTest_qi, xout => sticky_uid20_fxpToFPTest_q, ena => en(0), clk => clk, aclr => areset );

    -- nr_uid21_fxpToFPTest(LOGICAL,20)@6
    nr_uid21_fxpToFPTest_q <= not (l_uid17_fxpToFPTest_merged_bit_select_c);

    -- l_uid17_fxpToFPTest_merged_bit_select(BITSELECT,88)@6
    l_uid17_fxpToFPTest_merged_bit_select_in <= STD_LOGIC_VECTOR(expFracRnd_uid16_fxpToFPTest_q(1 downto 0));
    l_uid17_fxpToFPTest_merged_bit_select_b <= STD_LOGIC_VECTOR(l_uid17_fxpToFPTest_merged_bit_select_in(1 downto 1));
    l_uid17_fxpToFPTest_merged_bit_select_c <= STD_LOGIC_VECTOR(l_uid17_fxpToFPTest_merged_bit_select_in(0 downto 0));

    -- rnd_uid22_fxpToFPTest(LOGICAL,21)@6
    rnd_uid22_fxpToFPTest_q <= l_uid17_fxpToFPTest_merged_bit_select_b or nr_uid21_fxpToFPTest_q or sticky_uid20_fxpToFPTest_q;

    -- maxCount_uid11_fxpToFPTest(CONSTANT,10)
    maxCount_uid11_fxpToFPTest_q <= "100000";

    -- redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4(DELAY,100)
    redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_delay_0 <= (others => '0');
                redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_delay_1 <= (others => '0');
                redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_delay_0 <= STD_LOGIC_VECTOR(vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q);
                    redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_delay_1 <= redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_delay_0;
                    redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_q <= redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_delay_1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3(DELAY,99)
    redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_delay_0 <= (others => '0');
                redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_delay_1 <= (others => '0');
                redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_delay_0 <= STD_LOGIC_VECTOR(vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q);
                    redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_delay_1 <= redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_delay_0;
                    redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_q <= redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_delay_1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_2(DELAY,98)
    redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_2_delay_0 <= (others => '0');
                redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_2_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_2_delay_0 <= STD_LOGIC_VECTOR(vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q);
                    redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_2_q <= redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_2_delay_0;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist2_vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q_1(DELAY,97)
    redist2_vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist2_vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q_1_q <= STD_LOGIC_VECTOR(vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist1_vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q_1(DELAY,96)
    redist1_vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist1_vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q_1_q <= STD_LOGIC_VECTOR(vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- vCount_uid82_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,81)@5
    vCount_uid82_lzcShifterZ1_uid10_fxpToFPTest_q <= redist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_4_q & redist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_3_q & redist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_2_q & redist2_vCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_q_1_q & redist1_vCount_uid70_lzcShifterZ1_uid10_fxpToFPTest_q_1_q & vCount_uid77_lzcShifterZ1_uid10_fxpToFPTest_q;

    -- vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest(COMPARE,83)@5
    vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest_a <= STD_LOGIC_VECTOR("00" & maxCount_uid11_fxpToFPTest_q);
    vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest_b <= STD_LOGIC_VECTOR("00" & vCount_uid82_lzcShifterZ1_uid10_fxpToFPTest_q);
    vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest_a) - UNSIGNED(vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest_b));
    vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest_c(0) <= vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest_o(7);

    -- vCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest(MUX,85)@5
    vCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_s <= vCountBig_uid84_lzcShifterZ1_uid10_fxpToFPTest_c;
    vCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_combproc: PROCESS (vCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_s, en, vCount_uid82_lzcShifterZ1_uid10_fxpToFPTest_q, maxCount_uid11_fxpToFPTest_q)
    BEGIN
        CASE (vCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_s) IS
            WHEN "0" => vCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q <= vCount_uid82_lzcShifterZ1_uid10_fxpToFPTest_q;
            WHEN "1" => vCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q <= maxCount_uid11_fxpToFPTest_q;
            WHEN OTHERS => vCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- msbIn_uid13_fxpToFPTest(CONSTANT,12)
    msbIn_uid13_fxpToFPTest_q <= "10011110";

    -- expPreRnd_uid14_fxpToFPTest(SUB,13)@5 + 1
    expPreRnd_uid14_fxpToFPTest_a <= STD_LOGIC_VECTOR("0" & msbIn_uid13_fxpToFPTest_q);
    expPreRnd_uid14_fxpToFPTest_b <= STD_LOGIC_VECTOR("000" & vCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q);
    expPreRnd_uid14_fxpToFPTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expPreRnd_uid14_fxpToFPTest_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    expPreRnd_uid14_fxpToFPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPreRnd_uid14_fxpToFPTest_a) - UNSIGNED(expPreRnd_uid14_fxpToFPTest_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    expPreRnd_uid14_fxpToFPTest_q <= expPreRnd_uid14_fxpToFPTest_o(8 downto 0);

    -- redist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1(DELAY,95)
    redist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(fracRnd_uid15_fxpToFPTest_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- expFracRnd_uid16_fxpToFPTest(BITJOIN,15)@6
    expFracRnd_uid16_fxpToFPTest_q <= expPreRnd_uid14_fxpToFPTest_q & redist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q;

    -- expFracR_uid24_fxpToFPTest(ADD,23)@6
    expFracR_uid24_fxpToFPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => expFracRnd_uid16_fxpToFPTest_q(32)) & expFracRnd_uid16_fxpToFPTest_q));
    expFracR_uid24_fxpToFPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000000000000000000000000" & rnd_uid22_fxpToFPTest_q));
    expFracR_uid24_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracR_uid24_fxpToFPTest_a) + SIGNED(expFracR_uid24_fxpToFPTest_b));
    expFracR_uid24_fxpToFPTest_q <= expFracR_uid24_fxpToFPTest_o(33 downto 0);

    -- expR_uid26_fxpToFPTest(BITSELECT,25)@6
    expR_uid26_fxpToFPTest_b <= STD_LOGIC_VECTOR(expFracR_uid24_fxpToFPTest_q(33 downto 24));

    -- redist6_expR_uid26_fxpToFPTest_b_1(DELAY,101)
    redist6_expR_uid26_fxpToFPTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist6_expR_uid26_fxpToFPTest_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist6_expR_uid26_fxpToFPTest_b_1_q <= STD_LOGIC_VECTOR(expR_uid26_fxpToFPTest_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- expR_uid38_fxpToFPTest(BITSELECT,37)@7
    expR_uid38_fxpToFPTest_in <= redist6_expR_uid26_fxpToFPTest_b_1_q(7 downto 0);
    expR_uid38_fxpToFPTest_b <= expR_uid38_fxpToFPTest_in(7 downto 0);

    -- ovf_uid29_fxpToFPTest(COMPARE,28)@7
    ovf_uid29_fxpToFPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => redist6_expR_uid26_fxpToFPTest_b_1_q(9)) & redist6_expR_uid26_fxpToFPTest_b_1_q));
    ovf_uid29_fxpToFPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & expInf_uid28_fxpToFPTest_q));
    ovf_uid29_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid29_fxpToFPTest_a) - SIGNED(ovf_uid29_fxpToFPTest_b));
    ovf_uid29_fxpToFPTest_n(0) <= not (ovf_uid29_fxpToFPTest_o(11));

    -- inIsZero_uid12_fxpToFPTest(LOGICAL,11)@5 + 1
    inIsZero_uid12_fxpToFPTest_qi <= "1" WHEN vCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q = maxCount_uid11_fxpToFPTest_q ELSE "0";
    inIsZero_uid12_fxpToFPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => inIsZero_uid12_fxpToFPTest_qi, xout => inIsZero_uid12_fxpToFPTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist8_inIsZero_uid12_fxpToFPTest_q_2(DELAY,103)
    redist8_inIsZero_uid12_fxpToFPTest_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist8_inIsZero_uid12_fxpToFPTest_q_2_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist8_inIsZero_uid12_fxpToFPTest_q_2_q <= STD_LOGIC_VECTOR(inIsZero_uid12_fxpToFPTest_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- udf_uid27_fxpToFPTest(COMPARE,26)@7
    udf_uid27_fxpToFPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & GND_q));
    udf_uid27_fxpToFPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => redist6_expR_uid26_fxpToFPTest_b_1_q(9)) & redist6_expR_uid26_fxpToFPTest_b_1_q));
    udf_uid27_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid27_fxpToFPTest_a) - SIGNED(udf_uid27_fxpToFPTest_b));
    udf_uid27_fxpToFPTest_n(0) <= not (udf_uid27_fxpToFPTest_o(11));

    -- udfOrInZero_uid33_fxpToFPTest(LOGICAL,32)@7
    udfOrInZero_uid33_fxpToFPTest_q <= udf_uid27_fxpToFPTest_n or redist8_inIsZero_uid12_fxpToFPTest_q_2_q;

    -- excSelector_uid34_fxpToFPTest(BITJOIN,33)@7
    excSelector_uid34_fxpToFPTest_q <= ovf_uid29_fxpToFPTest_n & udfOrInZero_uid33_fxpToFPTest_q;

    -- expRPostExc_uid39_fxpToFPTest(MUX,38)@7
    expRPostExc_uid39_fxpToFPTest_s <= excSelector_uid34_fxpToFPTest_q;
    expRPostExc_uid39_fxpToFPTest_combproc: PROCESS (expRPostExc_uid39_fxpToFPTest_s, en, expR_uid38_fxpToFPTest_b, expZ_uid37_fxpToFPTest_q, expInf_uid28_fxpToFPTest_q)
    BEGIN
        CASE (expRPostExc_uid39_fxpToFPTest_s) IS
            WHEN "00" => expRPostExc_uid39_fxpToFPTest_q <= expR_uid38_fxpToFPTest_b;
            WHEN "01" => expRPostExc_uid39_fxpToFPTest_q <= expZ_uid37_fxpToFPTest_q;
            WHEN "10" => expRPostExc_uid39_fxpToFPTest_q <= expInf_uid28_fxpToFPTest_q;
            WHEN "11" => expRPostExc_uid39_fxpToFPTest_q <= expInf_uid28_fxpToFPTest_q;
            WHEN OTHERS => expRPostExc_uid39_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracZ_uid31_fxpToFPTest(CONSTANT,30)
    fracZ_uid31_fxpToFPTest_q <= "00000000000000000000000";

    -- fracR_uid25_fxpToFPTest(BITSELECT,24)@6
    fracR_uid25_fxpToFPTest_in <= expFracR_uid24_fxpToFPTest_q(23 downto 0);
    fracR_uid25_fxpToFPTest_b <= fracR_uid25_fxpToFPTest_in(23 downto 1);

    -- redist7_fracR_uid25_fxpToFPTest_b_1(DELAY,102)
    redist7_fracR_uid25_fxpToFPTest_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist7_fracR_uid25_fxpToFPTest_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist7_fracR_uid25_fxpToFPTest_b_1_q <= STD_LOGIC_VECTOR(fracR_uid25_fxpToFPTest_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- excSelector_uid30_fxpToFPTest(LOGICAL,29)@7
    excSelector_uid30_fxpToFPTest_q <= redist8_inIsZero_uid12_fxpToFPTest_q_2_q or ovf_uid29_fxpToFPTest_n or udf_uid27_fxpToFPTest_n;

    -- fracRPostExc_uid32_fxpToFPTest(MUX,31)@7
    fracRPostExc_uid32_fxpToFPTest_s <= excSelector_uid30_fxpToFPTest_q;
    fracRPostExc_uid32_fxpToFPTest_combproc: PROCESS (fracRPostExc_uid32_fxpToFPTest_s, en, redist7_fracR_uid25_fxpToFPTest_b_1_q, fracZ_uid31_fxpToFPTest_q)
    BEGIN
        CASE (fracRPostExc_uid32_fxpToFPTest_s) IS
            WHEN "0" => fracRPostExc_uid32_fxpToFPTest_q <= redist7_fracR_uid25_fxpToFPTest_b_1_q;
            WHEN "1" => fracRPostExc_uid32_fxpToFPTest_q <= fracZ_uid31_fxpToFPTest_q;
            WHEN OTHERS => fracRPostExc_uid32_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- outRes_uid40_fxpToFPTest(BITJOIN,39)@7
    outRes_uid40_fxpToFPTest_q <= redist11_signX_uid6_fxpToFPTest_b_7_q & expRPostExc_uid39_fxpToFPTest_q & fracRPostExc_uid32_fxpToFPTest_q;

    -- xOut(GPOUT,4)@7
    q <= outRes_uid40_fxpToFPTest_q;

END normal;
