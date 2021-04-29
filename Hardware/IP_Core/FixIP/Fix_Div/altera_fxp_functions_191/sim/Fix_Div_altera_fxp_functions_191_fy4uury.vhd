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

-- VHDL created from Fix_Div_altera_fxp_functions_191_fy4uury
-- VHDL created on Tue Apr 20 23:12:42 2021


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

entity Fix_Div_altera_fxp_functions_191_fy4uury is
    port (
        numerator : in std_logic_vector(31 downto 0);  -- ufix32
        denominator : in std_logic_vector(31 downto 0);  -- ufix32
        en : in std_logic_vector(0 downto 0);  -- ufix1
        result : out std_logic_vector(31 downto 0);  -- sfix32
        clk : in std_logic;
        rst : in std_logic
    );
end Fix_Div_altera_fxp_functions_191_fy4uury;

architecture normal of Fix_Div_altera_fxp_functions_191_fy4uury is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normYNoLeadOne_uid11_divider_in : STD_LOGIC_VECTOR (30 downto 0);
    signal normYNoLeadOne_uid11_divider_b : STD_LOGIC_VECTOR (30 downto 0);
    signal paddingY_uid12_divider_q : STD_LOGIC_VECTOR (30 downto 0);
    signal updatedY_uid13_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid12_divider_a : STD_LOGIC_VECTOR (31 downto 0);
    signal normYIsOneC2_uid12_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOneC2_uid15_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid16_divider_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal normYIsOne_uid16_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid17_divider_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yIsZero_uid17_divider_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yIsZero_uid17_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpInverseRes_uid22_divider_in : STD_LOGIC_VECTOR (38 downto 0);
    signal fxpInverseRes_uid22_divider_b : STD_LOGIC_VECTOR (32 downto 0);
    signal oneInvRes_uid23_divider_q : STD_LOGIC_VECTOR (32 downto 0);
    signal invResPostOneHandling2_uid24_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal invResPostOneHandling2_uid24_divider_q : STD_LOGIC_VECTOR (32 downto 0);
    signal cWOut_uid25_divider_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rShiftCount_uid26_divider_a : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid26_divider_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid26_divider_o : STD_LOGIC_VECTOR (6 downto 0);
    signal rShiftCount_uid26_divider_q : STD_LOGIC_VECTOR (6 downto 0);
    signal prodPostRightShiftPost_uid29_divider_in : STD_LOGIC_VECTOR (63 downto 0);
    signal prodPostRightShiftPost_uid29_divider_b : STD_LOGIC_VECTOR (32 downto 0);
    signal allOnes_uid30_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invAllOnes_uid32_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addOp2_uid33_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal prodPostRightShiftPostRnd_uid34_divider_a : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid34_divider_b : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid34_divider_o : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRnd_uid34_divider_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodPostRightShiftPostRndRange_uid35_divider_in : STD_LOGIC_VECTOR (32 downto 0);
    signal prodPostRightShiftPostRndRange_uid35_divider_b : STD_LOGIC_VECTOR (31 downto 0);
    signal cstValOvf_uid36_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinal_uid37_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal resFinal_uid37_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid39_zCount_uid9_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid41_zCount_uid9_divider_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid41_zCount_uid9_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid44_zCount_uid9_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid44_zCount_uid9_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid45_zCount_uid9_divider_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid47_zCount_uid9_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid50_zCount_uid9_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid50_zCount_uid9_divider_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid51_zCount_uid9_divider_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid53_zCount_uid9_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid56_zCount_uid9_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid56_zCount_uid9_divider_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid57_zCount_uid9_divider_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid59_zCount_uid9_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid62_zCount_uid9_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid62_zCount_uid9_divider_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid63_zCount_uid9_divider_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid65_zCount_uid9_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid68_zCount_uid9_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid68_zCount_uid9_divider_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid70_zCount_uid9_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid71_zCount_uid9_divider_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid72_zCount_uid9_divider_q : STD_LOGIC_VECTOR (5 downto 0);
    signal yT1_uid90_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lowRangeB_uid92_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid92_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid93_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal s1sumAHighB_uid94_invPolyEval_a : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid94_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid94_invPolyEval_o : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid94_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal s1_uid95_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal yT2_uid96_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal lowRangeB_uid98_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid98_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid99_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s2sumAHighB_uid100_invPolyEval_a : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid100_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid100_invPolyEval_o : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid100_invPolyEval_q : STD_LOGIC_VECTOR (29 downto 0);
    signal s2_uid101_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal lowRangeB_uid104_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid104_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid105_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s3sumAHighB_uid106_invPolyEval_a : STD_LOGIC_VECTOR (38 downto 0);
    signal s3sumAHighB_uid106_invPolyEval_b : STD_LOGIC_VECTOR (38 downto 0);
    signal s3sumAHighB_uid106_invPolyEval_o : STD_LOGIC_VECTOR (38 downto 0);
    signal s3sumAHighB_uid106_invPolyEval_q : STD_LOGIC_VECTOR (38 downto 0);
    signal s3_uid107_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal osig_uid110_pT1_uid91_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal osig_uid113_pT2_uid97_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal nx_mergedSignalTM_uid127_pT3_uid103_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_bottomExtension_uid132_pT3_uid103_invPolyEval_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_mergedSignalTM_uid134_pT3_uid103_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomExtension_uid136_pT3_uid103_invPolyEval_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightBottomX_mergedSignalTM_uid138_pT3_uid103_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid144_pT3_uid103_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid144_pT3_uid103_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal highBBits_uid145_pT3_uid103_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid147_pT3_uid103_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal os_uid148_pT3_uid103_invPolyEval_in : STD_LOGIC_VECTOR (52 downto 0);
    signal os_uid148_pT3_uid103_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng16_uid153_normY_uid10_divider_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1Rng16_uid153_normY_uid10_divider_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx1_uid154_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid158_normY_uid10_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid158_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng4_uid160_normY_uid10_divider_in : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng4_uid160_normY_uid10_divider_b : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1_uid161_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx2Rng8_uid163_normY_uid10_divider_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2Rng8_uid163_normY_uid10_divider_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2_uid164_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx3Rng12_uid166_normY_uid10_divider_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage1Idx3Rng12_uid166_normY_uid10_divider_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage1Idx3_uid167_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid169_normY_uid10_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid169_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2Idx1Rng1_uid171_normY_uid10_divider_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage2Idx1Rng1_uid171_normY_uid10_divider_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage2Idx1_uid172_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2Idx2Rng2_uid174_normY_uid10_divider_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage2Idx2Rng2_uid174_normY_uid10_divider_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage2Idx2_uid175_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2Idx3Pad3_uid176_normY_uid10_divider_q : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2Idx3Rng3_uid177_normY_uid10_divider_in : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage2Idx3Rng3_uid177_normY_uid10_divider_b : STD_LOGIC_VECTOR (28 downto 0);
    signal leftShiftStage2Idx3_uid178_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage2_uid180_normY_uid10_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid180_normY_uid10_divider_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXInvY_uid27_divider_bs1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid27_divider_bjA2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid27_divider_bs3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid27_divider_bjB4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal prodXInvY_uid27_divider_bs6_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_bs6_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_bs7_b : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid27_divider_bs8_b : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXInvY_uid27_divider_bs9_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_bs9_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_sums_join_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal prodXInvY_uid27_divider_sums_align_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal prodXInvY_uid27_divider_sums_align_1_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal prodXInvY_uid27_divider_sums_result_add_0_0_a : STD_LOGIC_VECTOR (68 downto 0);
    signal prodXInvY_uid27_divider_sums_result_add_0_0_b : STD_LOGIC_VECTOR (68 downto 0);
    signal prodXInvY_uid27_divider_sums_result_add_0_0_o : STD_LOGIC_VECTOR (68 downto 0);
    signal prodXInvY_uid27_divider_sums_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal rightShiftStage0Idx1Rng1_uid201_prodPostRightShift_uid28_divider_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx1Rng1_uid201_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx1_uid203_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx2Rng2_uid204_prodPostRightShift_uid28_divider_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx2Rng2_uid204_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (62 downto 0);
    signal rightShiftStage0Idx2_uid206_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx3Rng3_uid207_prodPostRightShift_uid28_divider_in : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0Idx3Rng3_uid207_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (61 downto 0);
    signal rightShiftStage0Idx3_uid209_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage0_uid211_prodPostRightShift_uid28_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid211_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx1Rng4_uid212_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (60 downto 0);
    signal rightShiftStage1Idx1_uid214_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx2Rng8_uid215_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (56 downto 0);
    signal rightShiftStage1Idx2_uid217_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1Idx3Rng12_uid218_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (52 downto 0);
    signal rightShiftStage1Idx3_uid220_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage1_uid222_prodPostRightShift_uid28_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid222_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2Idx1Rng16_uid223_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx1_uid225_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2Idx2Rng32_uid226_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage2Idx2_uid228_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2Idx3Rng48_uid229_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage2Idx3Pad48_uid230_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage2Idx3_uid231_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage2_uid233_prodPostRightShift_uid28_divider_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid233_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage3Idx1Rng64_uid234_prodPostRightShift_uid28_divider_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage3Idx1Pad64_uid235_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage3Idx1_uid236_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal rightShiftStage3_uid238_prodPostRightShift_uid28_divider_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage3_uid238_prodPostRightShift_uid28_divider_q : STD_LOGIC_VECTOR (64 downto 0);
    signal memoryC0_uid74_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid74_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (37 downto 0);
    signal memoryC0_uid74_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid74_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid74_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (37 downto 0);
    signal memoryC0_uid74_invTabGen_lutmem_r : STD_LOGIC_VECTOR (37 downto 0);
    signal memoryC1_uid77_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid77_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid77_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid77_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid77_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid77_invTabGen_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC2_uid80_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid80_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid80_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid80_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid80_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid80_invTabGen_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC3_uid83_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid83_invTabGen_lutmem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid83_invTabGen_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid83_invTabGen_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid83_invTabGen_lutmem_ir : STD_LOGIC_VECTOR (13 downto 0);
    signal memoryC3_uid83_invTabGen_lutmem_r : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid109_pT1_uid91_invPolyEval_cma_reset : std_logic;
    type prodXY_uid109_pT1_uid91_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal prodXY_uid109_pT1_uid91_invPolyEval_cma_ah : prodXY_uid109_pT1_uid91_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of prodXY_uid109_pT1_uid91_invPolyEval_cma_ah : signal is true;
    type prodXY_uid109_pT1_uid91_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(13 downto 0);
    signal prodXY_uid109_pT1_uid91_invPolyEval_cma_ch : prodXY_uid109_pT1_uid91_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid109_pT1_uid91_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid109_pT1_uid91_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid109_pT1_uid91_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid109_pT1_uid91_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid109_pT1_uid91_invPolyEval_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid109_pT1_uid91_invPolyEval_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid109_pT1_uid91_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid109_pT1_uid91_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid109_pT1_uid91_invPolyEval_cma_ena2 : std_logic;
    signal prodXY_uid112_pT2_uid97_invPolyEval_cma_reset : std_logic;
    type prodXY_uid112_pT2_uid97_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(20 downto 0);
    signal prodXY_uid112_pT2_uid97_invPolyEval_cma_ah : prodXY_uid112_pT2_uid97_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid112_pT2_uid97_invPolyEval_cma_ah : signal is true;
    type prodXY_uid112_pT2_uid97_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(22 downto 0);
    signal prodXY_uid112_pT2_uid97_invPolyEval_cma_ch : prodXY_uid112_pT2_uid97_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid112_pT2_uid97_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid112_pT2_uid97_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (20 downto 0);
    signal prodXY_uid112_pT2_uid97_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (22 downto 0);
    signal prodXY_uid112_pT2_uid97_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (43 downto 0);
    signal prodXY_uid112_pT2_uid97_invPolyEval_cma_qq : STD_LOGIC_VECTOR (43 downto 0);
    signal prodXY_uid112_pT2_uid97_invPolyEval_cma_q : STD_LOGIC_VECTOR (43 downto 0);
    signal prodXY_uid112_pT2_uid97_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid112_pT2_uid97_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid112_pT2_uid97_invPolyEval_cma_ena2 : std_logic;
    signal sm0_uid141_pT3_uid103_invPolyEval_cma_reset : std_logic;
    type sm0_uid141_pT3_uid103_invPolyEval_cma_ahtype is array(NATURAL range <>) of SIGNED(17 downto 0);
    signal sm0_uid141_pT3_uid103_invPolyEval_cma_ah : sm0_uid141_pT3_uid103_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid141_pT3_uid103_invPolyEval_cma_ah : signal is true;
    signal sm0_uid141_pT3_uid103_invPolyEval_cma_ch : sm0_uid141_pT3_uid103_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of sm0_uid141_pT3_uid103_invPolyEval_cma_ch : signal is true;
    signal sm0_uid141_pT3_uid103_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid141_pT3_uid103_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal sm0_uid141_pT3_uid103_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid141_pT3_uid103_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid141_pT3_uid103_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid141_pT3_uid103_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid141_pT3_uid103_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid141_pT3_uid103_invPolyEval_cma_ena2 : std_logic;
    signal prodXInvY_uid27_divider_im0_cma_reset : std_logic;
    type prodXInvY_uid27_divider_im0_cma_ahtype is array(NATURAL range <>) of SIGNED(15 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_ah : prodXInvY_uid27_divider_im0_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXInvY_uid27_divider_im0_cma_ah : signal is true;
    type prodXInvY_uid27_divider_im0_cma_chtype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_ch : prodXInvY_uid27_divider_im0_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXInvY_uid27_divider_im0_cma_ch : signal is true;
    signal prodXInvY_uid27_divider_im0_cma_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_c0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_s0 : STD_LOGIC_VECTOR (30 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_qq : STD_LOGIC_VECTOR (30 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_q : STD_LOGIC_VECTOR (30 downto 0);
    signal prodXInvY_uid27_divider_im0_cma_ena0 : std_logic;
    signal prodXInvY_uid27_divider_im0_cma_ena1 : std_logic;
    signal prodXInvY_uid27_divider_im0_cma_ena2 : std_logic;
    signal prodXInvY_uid27_divider_im10_cma_reset : std_logic;
    type prodXInvY_uid27_divider_im10_cma_ahtype is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal prodXInvY_uid27_divider_im10_cma_ah : prodXInvY_uid27_divider_im10_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXInvY_uid27_divider_im10_cma_ah : signal is true;
    signal prodXInvY_uid27_divider_im10_cma_ch : prodXInvY_uid27_divider_im10_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXInvY_uid27_divider_im10_cma_ch : signal is true;
    signal prodXInvY_uid27_divider_im10_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_im10_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_im10_cma_s0 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid27_divider_im10_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid27_divider_im10_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXInvY_uid27_divider_im10_cma_ena0 : std_logic;
    signal prodXInvY_uid27_divider_im10_cma_ena1 : std_logic;
    signal prodXInvY_uid27_divider_im10_cma_ena2 : std_logic;
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ah : prodXInvY_uid27_divider_im10_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ah : signal is true;
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ch : sm0_uid141_pT3_uid103_invPolyEval_cma_ahtype(0 to 1);
    attribute preserve_syn_only of multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ch : signal is true;
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_a1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_c1 : STD_LOGIC_VECTOR (17 downto 0);
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ena2 : std_logic;
    signal prodXInvY_uid27_divider_ma5_cma_reset : std_logic;
    type prodXInvY_uid27_divider_ma5_cma_ahtype is array(NATURAL range <>) of UNSIGNED(14 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_ah : prodXInvY_uid27_divider_ma5_cma_ahtype(0 to 1);
    attribute preserve_syn_only of prodXInvY_uid27_divider_ma5_cma_ah : signal is true;
    signal prodXInvY_uid27_divider_ma5_cma_ch : prodXInvY_uid27_divider_im10_cma_ahtype(0 to 1);
    attribute preserve_syn_only of prodXInvY_uid27_divider_ma5_cma_ch : signal is true;
    signal prodXInvY_uid27_divider_ma5_cma_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_c0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_a1 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_c1 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_s0 : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXInvY_uid27_divider_ma5_cma_ena0 : std_logic;
    signal prodXInvY_uid27_divider_ma5_cma_ena1 : std_logic;
    signal prodXInvY_uid27_divider_ma5_cma_ena2 : std_logic;
    signal yAddr_uid19_divider_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid19_divider_merged_bit_select_c : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal rVStage_uid46_zCount_uid9_divider_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid46_zCount_uid9_divider_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid52_zCount_uid9_divider_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid52_zCount_uid9_divider_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid58_zCount_uid9_divider_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid58_zCount_uid9_divider_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid64_zCount_uid9_divider_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid64_zCount_uid9_divider_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto4_uid157_normY_uid10_divider_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto4_uid157_normY_uid10_divider_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto4_uid157_normY_uid10_divider_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal topRangeY_uid130_pT3_uid103_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid130_pT3_uid103_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal topRangeX_uid129_pT3_uid103_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeX_uid129_pT3_uid103_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal redist1_yAddr_uid19_divider_merged_bit_select_b_14_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_3 : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_yAddr_uid19_divider_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist3_yAddr_uid19_divider_merged_bit_select_c_3_delay_0 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist3_yAddr_uid19_divider_merged_bit_select_c_3_delay_1 : STD_LOGIC_VECTOR (22 downto 0);
    signal redist6_memoryC3_uid83_invTabGen_lutmem_r_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist7_os_uid148_pT3_uid103_invPolyEval_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_lowRangeB_uid98_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_lowRangeB_uid92_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_r_uid72_zCount_uid9_divider_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist12_vCount_uid53_zCount_uid9_divider_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_vCount_uid47_zCount_uid9_divider_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_vCount_uid47_zCount_uid9_divider_q_2_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_vCount_uid41_zCount_uid9_divider_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_vCount_uid41_zCount_uid9_divider_q_3_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_prodPostRightShiftPostRndRange_uid35_divider_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_prodPostRightShiftPost_uid29_divider_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist17_yIsZero_uid17_divider_q_34_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_normYIsOne_uid16_divider_q_23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_normYIsOneC2_uid15_divider_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_normYNoLeadOne_uid11_divider_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist22_in_rsrvd_fix_denominator_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_in_rsrvd_fix_denominator_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_in_rsrvd_fix_denominator_4_delay_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_in_rsrvd_fix_denominator_4_delay_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_outputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_reset0 : std_logic;
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_i : signal is true;
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_eq : signal is true;
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist0_yAddr_uid19_divider_merged_bit_select_b_7_sticky_ena_q : signal is true;
    signal redist0_yAddr_uid19_divider_merged_bit_select_b_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_yAddr_uid19_divider_merged_bit_select_b_14_inputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid19_divider_merged_bit_select_b_14_outputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_inputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_outputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_reset0 : std_logic;
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_i : signal is true;
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_eq : signal is true;
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist2_yAddr_uid19_divider_merged_bit_select_b_22_sticky_ena_q : signal is true;
    signal redist2_yAddr_uid19_divider_merged_bit_select_b_22_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_outputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_reset0 : std_logic;
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_i : signal is true;
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_eq : signal is true;
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist4_yAddr_uid19_divider_merged_bit_select_c_10_sticky_ena_q : signal is true;
    signal redist4_yAddr_uid19_divider_merged_bit_select_c_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_inputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_outputreg0_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_reset0 : std_logic;
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdcnt_i : signal is true;
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist5_yAddr_uid19_divider_merged_bit_select_c_17_sticky_ena_q : signal is true;
    signal redist5_yAddr_uid19_divider_merged_bit_select_c_17_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_outputreg0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_mem_reset0 : std_logic;
    signal redist11_r_uid72_zCount_uid9_divider_q_32_mem_ia : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_mem_iq : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_mem_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_i : signal is true;
    signal redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_eq : signal is true;
    signal redist11_r_uid72_zCount_uid9_divider_q_32_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_rdmux_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_r_uid72_zCount_uid9_divider_q_32_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist11_r_uid72_zCount_uid9_divider_q_32_sticky_ena_q : signal is true;
    signal redist11_r_uid72_zCount_uid9_divider_q_32_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_inputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_outputreg0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_mem_reset0 : std_logic;
    signal redist21_in_rsrvd_fix_numerator_29_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve_syn_only of redist21_in_rsrvd_fix_numerator_29_rdcnt_i : signal is true;
    signal redist21_in_rsrvd_fix_numerator_29_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist21_in_rsrvd_fix_numerator_29_rdcnt_eq : signal is true;
    signal redist21_in_rsrvd_fix_numerator_29_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_rdmux_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_in_rsrvd_fix_numerator_29_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist21_in_rsrvd_fix_numerator_29_sticky_ena_q : signal is true;
    signal redist21_in_rsrvd_fix_numerator_29_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- cstValOvf_uid36_divider(CONSTANT,35)
    cstValOvf_uid36_divider_q <= "11111111111111111111111111111111";

    -- allOnes_uid30_divider(LOGICAL,29)@37
    allOnes_uid30_divider_q <= "1" WHEN redist16_prodPostRightShiftPost_uid29_divider_b_1_q = "111111111111111111111111111111111" ELSE "0";

    -- invAllOnes_uid32_divider(LOGICAL,31)@37
    invAllOnes_uid32_divider_q <= not (allOnes_uid30_divider_q);

    -- addOp2_uid33_divider(LOGICAL,32)@37
    addOp2_uid33_divider_q <= invAllOnes_uid32_divider_q and VCC_q;

    -- rightShiftStage3Idx1Pad64_uid235_prodPostRightShift_uid28_divider(CONSTANT,234)
    rightShiftStage3Idx1Pad64_uid235_prodPostRightShift_uid28_divider_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage3Idx1Rng64_uid234_prodPostRightShift_uid28_divider(BITSELECT,233)@36
    rightShiftStage3Idx1Rng64_uid234_prodPostRightShift_uid28_divider_b <= rightShiftStage2_uid233_prodPostRightShift_uid28_divider_q(64 downto 64);

    -- rightShiftStage3Idx1_uid236_prodPostRightShift_uid28_divider(BITJOIN,235)@36
    rightShiftStage3Idx1_uid236_prodPostRightShift_uid28_divider_q <= rightShiftStage3Idx1Pad64_uid235_prodPostRightShift_uid28_divider_q & rightShiftStage3Idx1Rng64_uid234_prodPostRightShift_uid28_divider_b;

    -- rightShiftStage2Idx3Pad48_uid230_prodPostRightShift_uid28_divider(CONSTANT,229)
    rightShiftStage2Idx3Pad48_uid230_prodPostRightShift_uid28_divider_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage2Idx3Rng48_uid229_prodPostRightShift_uid28_divider(BITSELECT,228)@36
    rightShiftStage2Idx3Rng48_uid229_prodPostRightShift_uid28_divider_b <= rightShiftStage1_uid222_prodPostRightShift_uid28_divider_q(64 downto 48);

    -- rightShiftStage2Idx3_uid231_prodPostRightShift_uid28_divider(BITJOIN,230)@36
    rightShiftStage2Idx3_uid231_prodPostRightShift_uid28_divider_q <= rightShiftStage2Idx3Pad48_uid230_prodPostRightShift_uid28_divider_q & rightShiftStage2Idx3Rng48_uid229_prodPostRightShift_uid28_divider_b;

    -- zs_uid39_zCount_uid9_divider(CONSTANT,38)
    zs_uid39_zCount_uid9_divider_q <= "00000000000000000000000000000000";

    -- rightShiftStage2Idx2Rng32_uid226_prodPostRightShift_uid28_divider(BITSELECT,225)@36
    rightShiftStage2Idx2Rng32_uid226_prodPostRightShift_uid28_divider_b <= rightShiftStage1_uid222_prodPostRightShift_uid28_divider_q(64 downto 32);

    -- rightShiftStage2Idx2_uid228_prodPostRightShift_uid28_divider(BITJOIN,227)@36
    rightShiftStage2Idx2_uid228_prodPostRightShift_uid28_divider_q <= zs_uid39_zCount_uid9_divider_q & rightShiftStage2Idx2Rng32_uid226_prodPostRightShift_uid28_divider_b;

    -- zs_uid45_zCount_uid9_divider(CONSTANT,44)
    zs_uid45_zCount_uid9_divider_q <= "0000000000000000";

    -- rightShiftStage2Idx1Rng16_uid223_prodPostRightShift_uid28_divider(BITSELECT,222)@36
    rightShiftStage2Idx1Rng16_uid223_prodPostRightShift_uid28_divider_b <= rightShiftStage1_uid222_prodPostRightShift_uid28_divider_q(64 downto 16);

    -- rightShiftStage2Idx1_uid225_prodPostRightShift_uid28_divider(BITJOIN,224)@36
    rightShiftStage2Idx1_uid225_prodPostRightShift_uid28_divider_q <= zs_uid45_zCount_uid9_divider_q & rightShiftStage2Idx1Rng16_uid223_prodPostRightShift_uid28_divider_b;

    -- rightBottomX_bottomExtension_uid136_pT3_uid103_invPolyEval(CONSTANT,135)
    rightBottomX_bottomExtension_uid136_pT3_uid103_invPolyEval_q <= "000000000000";

    -- rightShiftStage1Idx3Rng12_uid218_prodPostRightShift_uid28_divider(BITSELECT,217)@36
    rightShiftStage1Idx3Rng12_uid218_prodPostRightShift_uid28_divider_b <= rightShiftStage0_uid211_prodPostRightShift_uid28_divider_q(64 downto 12);

    -- rightShiftStage1Idx3_uid220_prodPostRightShift_uid28_divider(BITJOIN,219)@36
    rightShiftStage1Idx3_uid220_prodPostRightShift_uid28_divider_q <= rightBottomX_bottomExtension_uid136_pT3_uid103_invPolyEval_q & rightShiftStage1Idx3Rng12_uid218_prodPostRightShift_uid28_divider_b;

    -- zs_uid51_zCount_uid9_divider(CONSTANT,50)
    zs_uid51_zCount_uid9_divider_q <= "00000000";

    -- rightShiftStage1Idx2Rng8_uid215_prodPostRightShift_uid28_divider(BITSELECT,214)@36
    rightShiftStage1Idx2Rng8_uid215_prodPostRightShift_uid28_divider_b <= rightShiftStage0_uid211_prodPostRightShift_uid28_divider_q(64 downto 8);

    -- rightShiftStage1Idx2_uid217_prodPostRightShift_uid28_divider(BITJOIN,216)@36
    rightShiftStage1Idx2_uid217_prodPostRightShift_uid28_divider_q <= zs_uid51_zCount_uid9_divider_q & rightShiftStage1Idx2Rng8_uid215_prodPostRightShift_uid28_divider_b;

    -- zs_uid57_zCount_uid9_divider(CONSTANT,56)
    zs_uid57_zCount_uid9_divider_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid212_prodPostRightShift_uid28_divider(BITSELECT,211)@36
    rightShiftStage1Idx1Rng4_uid212_prodPostRightShift_uid28_divider_b <= rightShiftStage0_uid211_prodPostRightShift_uid28_divider_q(64 downto 4);

    -- rightShiftStage1Idx1_uid214_prodPostRightShift_uid28_divider(BITJOIN,213)@36
    rightShiftStage1Idx1_uid214_prodPostRightShift_uid28_divider_q <= zs_uid57_zCount_uid9_divider_q & rightShiftStage1Idx1Rng4_uid212_prodPostRightShift_uid28_divider_b;

    -- leftShiftStage2Idx3Pad3_uid176_normY_uid10_divider(CONSTANT,175)
    leftShiftStage2Idx3Pad3_uid176_normY_uid10_divider_q <= "000";

    -- rightShiftStage0Idx3Rng3_uid207_prodPostRightShift_uid28_divider(BITSELECT,206)@36
    rightShiftStage0Idx3Rng3_uid207_prodPostRightShift_uid28_divider_in <= prodXInvY_uid27_divider_sums_result_add_0_0_q(64 downto 0);
    rightShiftStage0Idx3Rng3_uid207_prodPostRightShift_uid28_divider_b <= rightShiftStage0Idx3Rng3_uid207_prodPostRightShift_uid28_divider_in(64 downto 3);

    -- rightShiftStage0Idx3_uid209_prodPostRightShift_uid28_divider(BITJOIN,208)@36
    rightShiftStage0Idx3_uid209_prodPostRightShift_uid28_divider_q <= leftShiftStage2Idx3Pad3_uid176_normY_uid10_divider_q & rightShiftStage0Idx3Rng3_uid207_prodPostRightShift_uid28_divider_b;

    -- zs_uid63_zCount_uid9_divider(CONSTANT,62)
    zs_uid63_zCount_uid9_divider_q <= "00";

    -- rightShiftStage0Idx2Rng2_uid204_prodPostRightShift_uid28_divider(BITSELECT,203)@36
    rightShiftStage0Idx2Rng2_uid204_prodPostRightShift_uid28_divider_in <= prodXInvY_uid27_divider_sums_result_add_0_0_q(64 downto 0);
    rightShiftStage0Idx2Rng2_uid204_prodPostRightShift_uid28_divider_b <= rightShiftStage0Idx2Rng2_uid204_prodPostRightShift_uid28_divider_in(64 downto 2);

    -- rightShiftStage0Idx2_uid206_prodPostRightShift_uid28_divider(BITJOIN,205)@36
    rightShiftStage0Idx2_uid206_prodPostRightShift_uid28_divider_q <= zs_uid63_zCount_uid9_divider_q & rightShiftStage0Idx2Rng2_uid204_prodPostRightShift_uid28_divider_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- rightShiftStage0Idx1Rng1_uid201_prodPostRightShift_uid28_divider(BITSELECT,200)@36
    rightShiftStage0Idx1Rng1_uid201_prodPostRightShift_uid28_divider_in <= prodXInvY_uid27_divider_sums_result_add_0_0_q(64 downto 0);
    rightShiftStage0Idx1Rng1_uid201_prodPostRightShift_uid28_divider_b <= rightShiftStage0Idx1Rng1_uid201_prodPostRightShift_uid28_divider_in(64 downto 1);

    -- rightShiftStage0Idx1_uid203_prodPostRightShift_uid28_divider(BITJOIN,202)@36
    rightShiftStage0Idx1_uid203_prodPostRightShift_uid28_divider_q <= GND_q & rightShiftStage0Idx1Rng1_uid201_prodPostRightShift_uid28_divider_b;

    -- redist21_in_rsrvd_fix_numerator_29_notEnable(LOGICAL,356)
    redist21_in_rsrvd_fix_numerator_29_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist21_in_rsrvd_fix_numerator_29_nor(LOGICAL,357)
    redist21_in_rsrvd_fix_numerator_29_nor_q <= not (redist21_in_rsrvd_fix_numerator_29_notEnable_q or redist21_in_rsrvd_fix_numerator_29_sticky_ena_q);

    -- redist21_in_rsrvd_fix_numerator_29_mem_last(CONSTANT,353)
    redist21_in_rsrvd_fix_numerator_29_mem_last_q <= "011000";

    -- redist21_in_rsrvd_fix_numerator_29_cmp(LOGICAL,354)
    redist21_in_rsrvd_fix_numerator_29_cmp_b <= STD_LOGIC_VECTOR("0" & redist21_in_rsrvd_fix_numerator_29_rdmux_q);
    redist21_in_rsrvd_fix_numerator_29_cmp_q <= "1" WHEN redist21_in_rsrvd_fix_numerator_29_mem_last_q = redist21_in_rsrvd_fix_numerator_29_cmp_b ELSE "0";

    -- redist21_in_rsrvd_fix_numerator_29_cmpReg(REG,355)
    redist21_in_rsrvd_fix_numerator_29_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_in_rsrvd_fix_numerator_29_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist21_in_rsrvd_fix_numerator_29_cmpReg_q <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_29_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist21_in_rsrvd_fix_numerator_29_sticky_ena(REG,358)
    redist21_in_rsrvd_fix_numerator_29_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_in_rsrvd_fix_numerator_29_sticky_ena_q <= "0";
            ELSE
                IF (redist21_in_rsrvd_fix_numerator_29_nor_q = "1") THEN
                    redist21_in_rsrvd_fix_numerator_29_sticky_ena_q <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_29_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist21_in_rsrvd_fix_numerator_29_enaAnd(LOGICAL,359)
    redist21_in_rsrvd_fix_numerator_29_enaAnd_q <= redist21_in_rsrvd_fix_numerator_29_sticky_ena_q and en;

    -- redist21_in_rsrvd_fix_numerator_29_rdcnt(COUNTER,350)
    -- low=0, high=25, step=1, init=0
    redist21_in_rsrvd_fix_numerator_29_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_in_rsrvd_fix_numerator_29_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist21_in_rsrvd_fix_numerator_29_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist21_in_rsrvd_fix_numerator_29_rdcnt_i = TO_UNSIGNED(24, 5)) THEN
                        redist21_in_rsrvd_fix_numerator_29_rdcnt_eq <= '1';
                    ELSE
                        redist21_in_rsrvd_fix_numerator_29_rdcnt_eq <= '0';
                    END IF;
                    IF (redist21_in_rsrvd_fix_numerator_29_rdcnt_eq = '1') THEN
                        redist21_in_rsrvd_fix_numerator_29_rdcnt_i <= redist21_in_rsrvd_fix_numerator_29_rdcnt_i + 7;
                    ELSE
                        redist21_in_rsrvd_fix_numerator_29_rdcnt_i <= redist21_in_rsrvd_fix_numerator_29_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist21_in_rsrvd_fix_numerator_29_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist21_in_rsrvd_fix_numerator_29_rdcnt_i, 5)));

    -- redist21_in_rsrvd_fix_numerator_29_rdmux(MUX,351)
    redist21_in_rsrvd_fix_numerator_29_rdmux_s <= en;
    redist21_in_rsrvd_fix_numerator_29_rdmux_combproc: PROCESS (redist21_in_rsrvd_fix_numerator_29_rdmux_s, redist21_in_rsrvd_fix_numerator_29_wraddr_q, redist21_in_rsrvd_fix_numerator_29_rdcnt_q)
    BEGIN
        CASE (redist21_in_rsrvd_fix_numerator_29_rdmux_s) IS
            WHEN "0" => redist21_in_rsrvd_fix_numerator_29_rdmux_q <= redist21_in_rsrvd_fix_numerator_29_wraddr_q;
            WHEN "1" => redist21_in_rsrvd_fix_numerator_29_rdmux_q <= redist21_in_rsrvd_fix_numerator_29_rdcnt_q;
            WHEN OTHERS => redist21_in_rsrvd_fix_numerator_29_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist21_in_rsrvd_fix_numerator_29_inputreg0(DELAY,347)
    redist21_in_rsrvd_fix_numerator_29_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_in_rsrvd_fix_numerator_29_inputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist21_in_rsrvd_fix_numerator_29_inputreg0_q <= STD_LOGIC_VECTOR(numerator);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist21_in_rsrvd_fix_numerator_29_wraddr(REG,352)
    redist21_in_rsrvd_fix_numerator_29_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_in_rsrvd_fix_numerator_29_wraddr_q <= "11001";
            ELSE
                redist21_in_rsrvd_fix_numerator_29_wraddr_q <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_29_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist21_in_rsrvd_fix_numerator_29_mem(DUALMEM,349)
    redist21_in_rsrvd_fix_numerator_29_mem_ia <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_29_inputreg0_q);
    redist21_in_rsrvd_fix_numerator_29_mem_aa <= redist21_in_rsrvd_fix_numerator_29_wraddr_q;
    redist21_in_rsrvd_fix_numerator_29_mem_ab <= redist21_in_rsrvd_fix_numerator_29_rdmux_q;
    redist21_in_rsrvd_fix_numerator_29_mem_reset0 <= rst;
    redist21_in_rsrvd_fix_numerator_29_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 26,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 26,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist21_in_rsrvd_fix_numerator_29_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist21_in_rsrvd_fix_numerator_29_mem_reset0,
        clock1 => clk,
        address_a => redist21_in_rsrvd_fix_numerator_29_mem_aa,
        data_a => redist21_in_rsrvd_fix_numerator_29_mem_ia,
        wren_a => en(0),
        address_b => redist21_in_rsrvd_fix_numerator_29_mem_ab,
        q_b => redist21_in_rsrvd_fix_numerator_29_mem_iq
    );
    redist21_in_rsrvd_fix_numerator_29_mem_q <= redist21_in_rsrvd_fix_numerator_29_mem_iq(31 downto 0);

    -- redist21_in_rsrvd_fix_numerator_29_outputreg0(DELAY,348)
    redist21_in_rsrvd_fix_numerator_29_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_in_rsrvd_fix_numerator_29_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist21_in_rsrvd_fix_numerator_29_outputreg0_q <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_29_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- prodXInvY_uid27_divider_bs6(BITSELECT,187)@29
    prodXInvY_uid27_divider_bs6_in <= redist21_in_rsrvd_fix_numerator_29_outputreg0_q(17 downto 0);
    prodXInvY_uid27_divider_bs6_b <= prodXInvY_uid27_divider_bs6_in(17 downto 0);

    -- oneInvRes_uid23_divider(CONSTANT,22)
    oneInvRes_uid23_divider_q <= "100000000000000000000000000000000";

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_notEnable(LOGICAL,331)
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_nor(LOGICAL,332)
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_nor_q <= not (redist5_yAddr_uid19_divider_merged_bit_select_c_17_notEnable_q or redist5_yAddr_uid19_divider_merged_bit_select_c_17_sticky_ena_q);

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_last(CONSTANT,328)
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_last_q <= "010";

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmp(LOGICAL,329)
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmp_b <= STD_LOGIC_VECTOR("0" & redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux_q);
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmp_q <= "1" WHEN redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_last_q = redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmp_b ELSE "0";

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmpReg(REG,330)
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmpReg_q <= STD_LOGIC_VECTOR(redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_sticky_ena(REG,333)
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist5_yAddr_uid19_divider_merged_bit_select_c_17_sticky_ena_q <= "0";
            ELSE
                IF (redist5_yAddr_uid19_divider_merged_bit_select_c_17_nor_q = "1") THEN
                    redist5_yAddr_uid19_divider_merged_bit_select_c_17_sticky_ena_q <= STD_LOGIC_VECTOR(redist5_yAddr_uid19_divider_merged_bit_select_c_17_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_enaAnd(LOGICAL,334)
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_enaAnd_q <= redist5_yAddr_uid19_divider_merged_bit_select_c_17_sticky_ena_q and en;

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdcnt(COUNTER,325)
    -- low=0, high=3, step=1, init=0
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdcnt_i <= TO_UNSIGNED(0, 2);
            ELSE
                IF (en = "1") THEN
                    redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdcnt_i <= redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdcnt_i, 2)));

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux(MUX,326)
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux_s <= en;
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux_combproc: PROCESS (redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux_s, redist5_yAddr_uid19_divider_merged_bit_select_c_17_wraddr_q, redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdcnt_q)
    BEGIN
        CASE (redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux_s) IS
            WHEN "0" => redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux_q <= redist5_yAddr_uid19_divider_merged_bit_select_c_17_wraddr_q;
            WHEN "1" => redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux_q <= redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdcnt_q;
            WHEN OTHERS => redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist4_yAddr_uid19_divider_merged_bit_select_c_10_notEnable(LOGICAL,318)
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist4_yAddr_uid19_divider_merged_bit_select_c_10_nor(LOGICAL,319)
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_nor_q <= not (redist4_yAddr_uid19_divider_merged_bit_select_c_10_notEnable_q or redist4_yAddr_uid19_divider_merged_bit_select_c_10_sticky_ena_q);

    -- redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_last(CONSTANT,315)
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_last_q <= "011";

    -- redist4_yAddr_uid19_divider_merged_bit_select_c_10_cmp(LOGICAL,316)
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_cmp_q <= "1" WHEN redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_last_q = redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux_q ELSE "0";

    -- redist4_yAddr_uid19_divider_merged_bit_select_c_10_cmpReg(REG,317)
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist4_yAddr_uid19_divider_merged_bit_select_c_10_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist4_yAddr_uid19_divider_merged_bit_select_c_10_cmpReg_q <= STD_LOGIC_VECTOR(redist4_yAddr_uid19_divider_merged_bit_select_c_10_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist4_yAddr_uid19_divider_merged_bit_select_c_10_sticky_ena(REG,320)
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist4_yAddr_uid19_divider_merged_bit_select_c_10_sticky_ena_q <= "0";
            ELSE
                IF (redist4_yAddr_uid19_divider_merged_bit_select_c_10_nor_q = "1") THEN
                    redist4_yAddr_uid19_divider_merged_bit_select_c_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist4_yAddr_uid19_divider_merged_bit_select_c_10_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist4_yAddr_uid19_divider_merged_bit_select_c_10_enaAnd(LOGICAL,321)
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_enaAnd_q <= redist4_yAddr_uid19_divider_merged_bit_select_c_10_sticky_ena_q and en;

    -- redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt(COUNTER,312)
    -- low=0, high=4, step=1, init=0
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                        redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_eq <= '1';
                    ELSE
                        redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_eq <= '0';
                    END IF;
                    IF (redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_eq = '1') THEN
                        redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_i <= redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_i + 4;
                    ELSE
                        redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_i <= redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_i, 3)));

    -- redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux(MUX,313)
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux_s <= en;
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux_combproc: PROCESS (redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux_s, redist4_yAddr_uid19_divider_merged_bit_select_c_10_wraddr_q, redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_q)
    BEGIN
        CASE (redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux_s) IS
            WHEN "0" => redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux_q <= redist4_yAddr_uid19_divider_merged_bit_select_c_10_wraddr_q;
            WHEN "1" => redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux_q <= redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdcnt_q;
            WHEN OTHERS => redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage2Idx3Rng3_uid177_normY_uid10_divider(BITSELECT,176)@4
    leftShiftStage2Idx3Rng3_uid177_normY_uid10_divider_in <= leftShiftStage1_uid169_normY_uid10_divider_q(28 downto 0);
    leftShiftStage2Idx3Rng3_uid177_normY_uid10_divider_b <= leftShiftStage2Idx3Rng3_uid177_normY_uid10_divider_in(28 downto 0);

    -- leftShiftStage2Idx3_uid178_normY_uid10_divider(BITJOIN,177)@4
    leftShiftStage2Idx3_uid178_normY_uid10_divider_q <= leftShiftStage2Idx3Rng3_uid177_normY_uid10_divider_b & leftShiftStage2Idx3Pad3_uid176_normY_uid10_divider_q;

    -- leftShiftStage2Idx2Rng2_uid174_normY_uid10_divider(BITSELECT,173)@4
    leftShiftStage2Idx2Rng2_uid174_normY_uid10_divider_in <= leftShiftStage1_uid169_normY_uid10_divider_q(29 downto 0);
    leftShiftStage2Idx2Rng2_uid174_normY_uid10_divider_b <= leftShiftStage2Idx2Rng2_uid174_normY_uid10_divider_in(29 downto 0);

    -- leftShiftStage2Idx2_uid175_normY_uid10_divider(BITJOIN,174)@4
    leftShiftStage2Idx2_uid175_normY_uid10_divider_q <= leftShiftStage2Idx2Rng2_uid174_normY_uid10_divider_b & zs_uid63_zCount_uid9_divider_q;

    -- leftShiftStage2Idx1Rng1_uid171_normY_uid10_divider(BITSELECT,170)@4
    leftShiftStage2Idx1Rng1_uid171_normY_uid10_divider_in <= leftShiftStage1_uid169_normY_uid10_divider_q(30 downto 0);
    leftShiftStage2Idx1Rng1_uid171_normY_uid10_divider_b <= leftShiftStage2Idx1Rng1_uid171_normY_uid10_divider_in(30 downto 0);

    -- leftShiftStage2Idx1_uid172_normY_uid10_divider(BITJOIN,171)@4
    leftShiftStage2Idx1_uid172_normY_uid10_divider_q <= leftShiftStage2Idx1Rng1_uid171_normY_uid10_divider_b & GND_q;

    -- leftShiftStage1Idx3Rng12_uid166_normY_uid10_divider(BITSELECT,165)@4
    leftShiftStage1Idx3Rng12_uid166_normY_uid10_divider_in <= leftShiftStage0_uid158_normY_uid10_divider_q(19 downto 0);
    leftShiftStage1Idx3Rng12_uid166_normY_uid10_divider_b <= leftShiftStage1Idx3Rng12_uid166_normY_uid10_divider_in(19 downto 0);

    -- leftShiftStage1Idx3_uid167_normY_uid10_divider(BITJOIN,166)@4
    leftShiftStage1Idx3_uid167_normY_uid10_divider_q <= leftShiftStage1Idx3Rng12_uid166_normY_uid10_divider_b & rightBottomX_bottomExtension_uid136_pT3_uid103_invPolyEval_q;

    -- leftShiftStage1Idx2Rng8_uid163_normY_uid10_divider(BITSELECT,162)@4
    leftShiftStage1Idx2Rng8_uid163_normY_uid10_divider_in <= leftShiftStage0_uid158_normY_uid10_divider_q(23 downto 0);
    leftShiftStage1Idx2Rng8_uid163_normY_uid10_divider_b <= leftShiftStage1Idx2Rng8_uid163_normY_uid10_divider_in(23 downto 0);

    -- leftShiftStage1Idx2_uid164_normY_uid10_divider(BITJOIN,163)@4
    leftShiftStage1Idx2_uid164_normY_uid10_divider_q <= leftShiftStage1Idx2Rng8_uid163_normY_uid10_divider_b & zs_uid51_zCount_uid9_divider_q;

    -- leftShiftStage1Idx1Rng4_uid160_normY_uid10_divider(BITSELECT,159)@4
    leftShiftStage1Idx1Rng4_uid160_normY_uid10_divider_in <= leftShiftStage0_uid158_normY_uid10_divider_q(27 downto 0);
    leftShiftStage1Idx1Rng4_uid160_normY_uid10_divider_b <= leftShiftStage1Idx1Rng4_uid160_normY_uid10_divider_in(27 downto 0);

    -- leftShiftStage1Idx1_uid161_normY_uid10_divider(BITJOIN,160)@4
    leftShiftStage1Idx1_uid161_normY_uid10_divider_q <= leftShiftStage1Idx1Rng4_uid160_normY_uid10_divider_b & zs_uid57_zCount_uid9_divider_q;

    -- leftShiftStage0Idx1Rng16_uid153_normY_uid10_divider(BITSELECT,152)@4
    leftShiftStage0Idx1Rng16_uid153_normY_uid10_divider_in <= redist23_in_rsrvd_fix_denominator_4_q(15 downto 0);
    leftShiftStage0Idx1Rng16_uid153_normY_uid10_divider_b <= leftShiftStage0Idx1Rng16_uid153_normY_uid10_divider_in(15 downto 0);

    -- leftShiftStage0Idx1_uid154_normY_uid10_divider(BITJOIN,153)@4
    leftShiftStage0Idx1_uid154_normY_uid10_divider_q <= leftShiftStage0Idx1Rng16_uid153_normY_uid10_divider_b & zs_uid45_zCount_uid9_divider_q;

    -- redist22_in_rsrvd_fix_denominator_1(DELAY,281)
    redist22_in_rsrvd_fix_denominator_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist22_in_rsrvd_fix_denominator_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist22_in_rsrvd_fix_denominator_1_q <= STD_LOGIC_VECTOR(denominator);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist23_in_rsrvd_fix_denominator_4(DELAY,282)
    redist23_in_rsrvd_fix_denominator_4_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist23_in_rsrvd_fix_denominator_4_delay_0 <= (others => '0');
                redist23_in_rsrvd_fix_denominator_4_delay_1 <= (others => '0');
                redist23_in_rsrvd_fix_denominator_4_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist23_in_rsrvd_fix_denominator_4_delay_0 <= STD_LOGIC_VECTOR(redist22_in_rsrvd_fix_denominator_1_q);
                    redist23_in_rsrvd_fix_denominator_4_delay_1 <= redist23_in_rsrvd_fix_denominator_4_delay_0;
                    redist23_in_rsrvd_fix_denominator_4_q <= redist23_in_rsrvd_fix_denominator_4_delay_1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStage0_uid158_normY_uid10_divider(MUX,157)@4
    leftShiftStage0_uid158_normY_uid10_divider_s <= leftShiftStageSel0Dto4_uid157_normY_uid10_divider_merged_bit_select_b;
    leftShiftStage0_uid158_normY_uid10_divider_combproc: PROCESS (leftShiftStage0_uid158_normY_uid10_divider_s, redist23_in_rsrvd_fix_denominator_4_q, leftShiftStage0Idx1_uid154_normY_uid10_divider_q, zs_uid39_zCount_uid9_divider_q)
    BEGIN
        CASE (leftShiftStage0_uid158_normY_uid10_divider_s) IS
            WHEN "00" => leftShiftStage0_uid158_normY_uid10_divider_q <= redist23_in_rsrvd_fix_denominator_4_q;
            WHEN "01" => leftShiftStage0_uid158_normY_uid10_divider_q <= leftShiftStage0Idx1_uid154_normY_uid10_divider_q;
            WHEN "10" => leftShiftStage0_uid158_normY_uid10_divider_q <= zs_uid39_zCount_uid9_divider_q;
            WHEN "11" => leftShiftStage0_uid158_normY_uid10_divider_q <= zs_uid39_zCount_uid9_divider_q;
            WHEN OTHERS => leftShiftStage0_uid158_normY_uid10_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid169_normY_uid10_divider(MUX,168)@4
    leftShiftStage1_uid169_normY_uid10_divider_s <= leftShiftStageSel0Dto4_uid157_normY_uid10_divider_merged_bit_select_c;
    leftShiftStage1_uid169_normY_uid10_divider_combproc: PROCESS (leftShiftStage1_uid169_normY_uid10_divider_s, leftShiftStage0_uid158_normY_uid10_divider_q, leftShiftStage1Idx1_uid161_normY_uid10_divider_q, leftShiftStage1Idx2_uid164_normY_uid10_divider_q, leftShiftStage1Idx3_uid167_normY_uid10_divider_q)
    BEGIN
        CASE (leftShiftStage1_uid169_normY_uid10_divider_s) IS
            WHEN "00" => leftShiftStage1_uid169_normY_uid10_divider_q <= leftShiftStage0_uid158_normY_uid10_divider_q;
            WHEN "01" => leftShiftStage1_uid169_normY_uid10_divider_q <= leftShiftStage1Idx1_uid161_normY_uid10_divider_q;
            WHEN "10" => leftShiftStage1_uid169_normY_uid10_divider_q <= leftShiftStage1Idx2_uid164_normY_uid10_divider_q;
            WHEN "11" => leftShiftStage1_uid169_normY_uid10_divider_q <= leftShiftStage1Idx3_uid167_normY_uid10_divider_q;
            WHEN OTHERS => leftShiftStage1_uid169_normY_uid10_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- vCount_uid41_zCount_uid9_divider(LOGICAL,40)@0 + 1
    vCount_uid41_zCount_uid9_divider_qi <= "1" WHEN denominator = zs_uid39_zCount_uid9_divider_q ELSE "0";
    vCount_uid41_zCount_uid9_divider_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => vCount_uid41_zCount_uid9_divider_qi, xout => vCount_uid41_zCount_uid9_divider_q, ena => en(0), clk => clk, aclr => rst );

    -- redist14_vCount_uid41_zCount_uid9_divider_q_3(DELAY,273)
    redist14_vCount_uid41_zCount_uid9_divider_q_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist14_vCount_uid41_zCount_uid9_divider_q_3_delay_0 <= (others => '0');
                redist14_vCount_uid41_zCount_uid9_divider_q_3_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist14_vCount_uid41_zCount_uid9_divider_q_3_delay_0 <= STD_LOGIC_VECTOR(vCount_uid41_zCount_uid9_divider_q);
                    redist14_vCount_uid41_zCount_uid9_divider_q_3_q <= redist14_vCount_uid41_zCount_uid9_divider_q_3_delay_0;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid44_zCount_uid9_divider(MUX,43)@1
    vStagei_uid44_zCount_uid9_divider_s <= vCount_uid41_zCount_uid9_divider_q;
    vStagei_uid44_zCount_uid9_divider_combproc: PROCESS (vStagei_uid44_zCount_uid9_divider_s, redist22_in_rsrvd_fix_denominator_1_q, cstValOvf_uid36_divider_q)
    BEGIN
        CASE (vStagei_uid44_zCount_uid9_divider_s) IS
            WHEN "0" => vStagei_uid44_zCount_uid9_divider_q <= redist22_in_rsrvd_fix_denominator_1_q;
            WHEN "1" => vStagei_uid44_zCount_uid9_divider_q <= cstValOvf_uid36_divider_q;
            WHEN OTHERS => vStagei_uid44_zCount_uid9_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid46_zCount_uid9_divider_merged_bit_select(BITSELECT,252)@1
    rVStage_uid46_zCount_uid9_divider_merged_bit_select_b <= vStagei_uid44_zCount_uid9_divider_q(31 downto 16);
    rVStage_uid46_zCount_uid9_divider_merged_bit_select_c <= vStagei_uid44_zCount_uid9_divider_q(15 downto 0);

    -- vCount_uid47_zCount_uid9_divider(LOGICAL,46)@1
    vCount_uid47_zCount_uid9_divider_q <= "1" WHEN rVStage_uid46_zCount_uid9_divider_merged_bit_select_b = zs_uid45_zCount_uid9_divider_q ELSE "0";

    -- redist13_vCount_uid47_zCount_uid9_divider_q_2(DELAY,272)
    redist13_vCount_uid47_zCount_uid9_divider_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist13_vCount_uid47_zCount_uid9_divider_q_2_delay_0 <= (others => '0');
                redist13_vCount_uid47_zCount_uid9_divider_q_2_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist13_vCount_uid47_zCount_uid9_divider_q_2_delay_0 <= STD_LOGIC_VECTOR(vCount_uid47_zCount_uid9_divider_q);
                    redist13_vCount_uid47_zCount_uid9_divider_q_2_q <= redist13_vCount_uid47_zCount_uid9_divider_q_2_delay_0;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid50_zCount_uid9_divider(MUX,49)@1 + 1
    vStagei_uid50_zCount_uid9_divider_s <= vCount_uid47_zCount_uid9_divider_q;
    vStagei_uid50_zCount_uid9_divider_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                vStagei_uid50_zCount_uid9_divider_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    CASE (vStagei_uid50_zCount_uid9_divider_s) IS
                        WHEN "0" => vStagei_uid50_zCount_uid9_divider_q <= rVStage_uid46_zCount_uid9_divider_merged_bit_select_b;
                        WHEN "1" => vStagei_uid50_zCount_uid9_divider_q <= rVStage_uid46_zCount_uid9_divider_merged_bit_select_c;
                        WHEN OTHERS => vStagei_uid50_zCount_uid9_divider_q <= (others => '0');
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- rVStage_uid52_zCount_uid9_divider_merged_bit_select(BITSELECT,253)@2
    rVStage_uid52_zCount_uid9_divider_merged_bit_select_b <= vStagei_uid50_zCount_uid9_divider_q(15 downto 8);
    rVStage_uid52_zCount_uid9_divider_merged_bit_select_c <= vStagei_uid50_zCount_uid9_divider_q(7 downto 0);

    -- vCount_uid53_zCount_uid9_divider(LOGICAL,52)@2
    vCount_uid53_zCount_uid9_divider_q <= "1" WHEN rVStage_uid52_zCount_uid9_divider_merged_bit_select_b = zs_uid51_zCount_uid9_divider_q ELSE "0";

    -- redist12_vCount_uid53_zCount_uid9_divider_q_1(DELAY,271)
    redist12_vCount_uid53_zCount_uid9_divider_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist12_vCount_uid53_zCount_uid9_divider_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist12_vCount_uid53_zCount_uid9_divider_q_1_q <= STD_LOGIC_VECTOR(vCount_uid53_zCount_uid9_divider_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- vStagei_uid56_zCount_uid9_divider(MUX,55)@2 + 1
    vStagei_uid56_zCount_uid9_divider_s <= vCount_uid53_zCount_uid9_divider_q;
    vStagei_uid56_zCount_uid9_divider_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                vStagei_uid56_zCount_uid9_divider_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    CASE (vStagei_uid56_zCount_uid9_divider_s) IS
                        WHEN "0" => vStagei_uid56_zCount_uid9_divider_q <= rVStage_uid52_zCount_uid9_divider_merged_bit_select_b;
                        WHEN "1" => vStagei_uid56_zCount_uid9_divider_q <= rVStage_uid52_zCount_uid9_divider_merged_bit_select_c;
                        WHEN OTHERS => vStagei_uid56_zCount_uid9_divider_q <= (others => '0');
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- rVStage_uid58_zCount_uid9_divider_merged_bit_select(BITSELECT,254)@3
    rVStage_uid58_zCount_uid9_divider_merged_bit_select_b <= vStagei_uid56_zCount_uid9_divider_q(7 downto 4);
    rVStage_uid58_zCount_uid9_divider_merged_bit_select_c <= vStagei_uid56_zCount_uid9_divider_q(3 downto 0);

    -- vCount_uid59_zCount_uid9_divider(LOGICAL,58)@3
    vCount_uid59_zCount_uid9_divider_q <= "1" WHEN rVStage_uid58_zCount_uid9_divider_merged_bit_select_b = zs_uid57_zCount_uid9_divider_q ELSE "0";

    -- vStagei_uid62_zCount_uid9_divider(MUX,61)@3
    vStagei_uid62_zCount_uid9_divider_s <= vCount_uid59_zCount_uid9_divider_q;
    vStagei_uid62_zCount_uid9_divider_combproc: PROCESS (vStagei_uid62_zCount_uid9_divider_s, rVStage_uid58_zCount_uid9_divider_merged_bit_select_b, rVStage_uid58_zCount_uid9_divider_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid62_zCount_uid9_divider_s) IS
            WHEN "0" => vStagei_uid62_zCount_uid9_divider_q <= rVStage_uid58_zCount_uid9_divider_merged_bit_select_b;
            WHEN "1" => vStagei_uid62_zCount_uid9_divider_q <= rVStage_uid58_zCount_uid9_divider_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid62_zCount_uid9_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid64_zCount_uid9_divider_merged_bit_select(BITSELECT,255)@3
    rVStage_uid64_zCount_uid9_divider_merged_bit_select_b <= vStagei_uid62_zCount_uid9_divider_q(3 downto 2);
    rVStage_uid64_zCount_uid9_divider_merged_bit_select_c <= vStagei_uid62_zCount_uid9_divider_q(1 downto 0);

    -- vCount_uid65_zCount_uid9_divider(LOGICAL,64)@3
    vCount_uid65_zCount_uid9_divider_q <= "1" WHEN rVStage_uid64_zCount_uid9_divider_merged_bit_select_b = zs_uid63_zCount_uid9_divider_q ELSE "0";

    -- vStagei_uid68_zCount_uid9_divider(MUX,67)@3
    vStagei_uid68_zCount_uid9_divider_s <= vCount_uid65_zCount_uid9_divider_q;
    vStagei_uid68_zCount_uid9_divider_combproc: PROCESS (vStagei_uid68_zCount_uid9_divider_s, rVStage_uid64_zCount_uid9_divider_merged_bit_select_b, rVStage_uid64_zCount_uid9_divider_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid68_zCount_uid9_divider_s) IS
            WHEN "0" => vStagei_uid68_zCount_uid9_divider_q <= rVStage_uid64_zCount_uid9_divider_merged_bit_select_b;
            WHEN "1" => vStagei_uid68_zCount_uid9_divider_q <= rVStage_uid64_zCount_uid9_divider_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid68_zCount_uid9_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid70_zCount_uid9_divider(BITSELECT,69)@3
    rVStage_uid70_zCount_uid9_divider_b <= vStagei_uid68_zCount_uid9_divider_q(1 downto 1);

    -- vCount_uid71_zCount_uid9_divider(LOGICAL,70)@3
    vCount_uid71_zCount_uid9_divider_q <= "1" WHEN rVStage_uid70_zCount_uid9_divider_b = GND_q ELSE "0";

    -- r_uid72_zCount_uid9_divider(BITJOIN,71)@3
    r_uid72_zCount_uid9_divider_q <= redist14_vCount_uid41_zCount_uid9_divider_q_3_q & redist13_vCount_uid47_zCount_uid9_divider_q_2_q & redist12_vCount_uid53_zCount_uid9_divider_q_1_q & vCount_uid59_zCount_uid9_divider_q & vCount_uid65_zCount_uid9_divider_q & vCount_uid71_zCount_uid9_divider_q;

    -- redist10_r_uid72_zCount_uid9_divider_q_1(DELAY,269)
    redist10_r_uid72_zCount_uid9_divider_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist10_r_uid72_zCount_uid9_divider_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist10_r_uid72_zCount_uid9_divider_q_1_q <= STD_LOGIC_VECTOR(r_uid72_zCount_uid9_divider_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStageSel0Dto4_uid157_normY_uid10_divider_merged_bit_select(BITSELECT,256)@4
    leftShiftStageSel0Dto4_uid157_normY_uid10_divider_merged_bit_select_b <= redist10_r_uid72_zCount_uid9_divider_q_1_q(5 downto 4);
    leftShiftStageSel0Dto4_uid157_normY_uid10_divider_merged_bit_select_c <= redist10_r_uid72_zCount_uid9_divider_q_1_q(3 downto 2);
    leftShiftStageSel0Dto4_uid157_normY_uid10_divider_merged_bit_select_d <= redist10_r_uid72_zCount_uid9_divider_q_1_q(1 downto 0);

    -- leftShiftStage2_uid180_normY_uid10_divider(MUX,179)@4
    leftShiftStage2_uid180_normY_uid10_divider_s <= leftShiftStageSel0Dto4_uid157_normY_uid10_divider_merged_bit_select_d;
    leftShiftStage2_uid180_normY_uid10_divider_combproc: PROCESS (leftShiftStage2_uid180_normY_uid10_divider_s, leftShiftStage1_uid169_normY_uid10_divider_q, leftShiftStage2Idx1_uid172_normY_uid10_divider_q, leftShiftStage2Idx2_uid175_normY_uid10_divider_q, leftShiftStage2Idx3_uid178_normY_uid10_divider_q)
    BEGIN
        CASE (leftShiftStage2_uid180_normY_uid10_divider_s) IS
            WHEN "00" => leftShiftStage2_uid180_normY_uid10_divider_q <= leftShiftStage1_uid169_normY_uid10_divider_q;
            WHEN "01" => leftShiftStage2_uid180_normY_uid10_divider_q <= leftShiftStage2Idx1_uid172_normY_uid10_divider_q;
            WHEN "10" => leftShiftStage2_uid180_normY_uid10_divider_q <= leftShiftStage2Idx2_uid175_normY_uid10_divider_q;
            WHEN "11" => leftShiftStage2_uid180_normY_uid10_divider_q <= leftShiftStage2Idx3_uid178_normY_uid10_divider_q;
            WHEN OTHERS => leftShiftStage2_uid180_normY_uid10_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- normYNoLeadOne_uid11_divider(BITSELECT,10)@4
    normYNoLeadOne_uid11_divider_in <= leftShiftStage2_uid180_normY_uid10_divider_q(30 downto 0);
    normYNoLeadOne_uid11_divider_b <= normYNoLeadOne_uid11_divider_in(30 downto 0);

    -- yAddr_uid19_divider_merged_bit_select(BITSELECT,250)@4
    yAddr_uid19_divider_merged_bit_select_b <= normYNoLeadOne_uid11_divider_b(30 downto 23);
    yAddr_uid19_divider_merged_bit_select_c <= normYNoLeadOne_uid11_divider_b(22 downto 0);

    -- redist3_yAddr_uid19_divider_merged_bit_select_c_3(DELAY,262)
    redist3_yAddr_uid19_divider_merged_bit_select_c_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist3_yAddr_uid19_divider_merged_bit_select_c_3_delay_0 <= (others => '0');
                redist3_yAddr_uid19_divider_merged_bit_select_c_3_delay_1 <= (others => '0');
                redist3_yAddr_uid19_divider_merged_bit_select_c_3_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist3_yAddr_uid19_divider_merged_bit_select_c_3_delay_0 <= STD_LOGIC_VECTOR(yAddr_uid19_divider_merged_bit_select_c);
                    redist3_yAddr_uid19_divider_merged_bit_select_c_3_delay_1 <= redist3_yAddr_uid19_divider_merged_bit_select_c_3_delay_0;
                    redist3_yAddr_uid19_divider_merged_bit_select_c_3_q <= redist3_yAddr_uid19_divider_merged_bit_select_c_3_delay_1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist4_yAddr_uid19_divider_merged_bit_select_c_10_wraddr(REG,314)
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist4_yAddr_uid19_divider_merged_bit_select_c_10_wraddr_q <= "100";
            ELSE
                redist4_yAddr_uid19_divider_merged_bit_select_c_10_wraddr_q <= STD_LOGIC_VECTOR(redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem(DUALMEM,311)
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_ia <= STD_LOGIC_VECTOR(redist3_yAddr_uid19_divider_merged_bit_select_c_3_q);
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_aa <= redist4_yAddr_uid19_divider_merged_bit_select_c_10_wraddr_q;
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_ab <= redist4_yAddr_uid19_divider_merged_bit_select_c_10_rdmux_q;
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_reset0 <= rst;
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 23,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist4_yAddr_uid19_divider_merged_bit_select_c_10_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_reset0,
        clock1 => clk,
        address_a => redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_aa,
        data_a => redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_ia,
        wren_a => en(0),
        address_b => redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_ab,
        q_b => redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_iq
    );
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_q <= redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_iq(22 downto 0);

    -- redist4_yAddr_uid19_divider_merged_bit_select_c_10_outputreg0(DELAY,310)
    redist4_yAddr_uid19_divider_merged_bit_select_c_10_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist4_yAddr_uid19_divider_merged_bit_select_c_10_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist4_yAddr_uid19_divider_merged_bit_select_c_10_outputreg0_q <= STD_LOGIC_VECTOR(redist4_yAddr_uid19_divider_merged_bit_select_c_10_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_inputreg0(DELAY,322)
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist5_yAddr_uid19_divider_merged_bit_select_c_17_inputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist5_yAddr_uid19_divider_merged_bit_select_c_17_inputreg0_q <= STD_LOGIC_VECTOR(redist4_yAddr_uid19_divider_merged_bit_select_c_10_outputreg0_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_wraddr(REG,327)
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist5_yAddr_uid19_divider_merged_bit_select_c_17_wraddr_q <= "11";
            ELSE
                redist5_yAddr_uid19_divider_merged_bit_select_c_17_wraddr_q <= STD_LOGIC_VECTOR(redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem(DUALMEM,324)
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_ia <= STD_LOGIC_VECTOR(redist5_yAddr_uid19_divider_merged_bit_select_c_17_inputreg0_q);
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_aa <= redist5_yAddr_uid19_divider_merged_bit_select_c_17_wraddr_q;
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_ab <= redist5_yAddr_uid19_divider_merged_bit_select_c_17_rdmux_q;
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_reset0 <= rst;
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 23,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist5_yAddr_uid19_divider_merged_bit_select_c_17_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_reset0,
        clock1 => clk,
        address_a => redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_aa,
        data_a => redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_ia,
        wren_a => en(0),
        address_b => redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_ab,
        q_b => redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_iq
    );
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_q <= redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_iq(22 downto 0);

    -- redist5_yAddr_uid19_divider_merged_bit_select_c_17_outputreg0(DELAY,323)
    redist5_yAddr_uid19_divider_merged_bit_select_c_17_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist5_yAddr_uid19_divider_merged_bit_select_c_17_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist5_yAddr_uid19_divider_merged_bit_select_c_17_outputreg0_q <= STD_LOGIC_VECTOR(redist5_yAddr_uid19_divider_merged_bit_select_c_17_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- nx_mergedSignalTM_uid127_pT3_uid103_invPolyEval(BITJOIN,126)@21
    nx_mergedSignalTM_uid127_pT3_uid103_invPolyEval_q <= GND_q & redist5_yAddr_uid19_divider_merged_bit_select_c_17_outputreg0_q;

    -- topRangeX_uid129_pT3_uid103_invPolyEval_merged_bit_select(BITSELECT,258)@21
    topRangeX_uid129_pT3_uid103_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid127_pT3_uid103_invPolyEval_q(23 downto 6));
    topRangeX_uid129_pT3_uid103_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid127_pT3_uid103_invPolyEval_q(5 downto 0));

    -- aboveLeftY_bottomExtension_uid132_pT3_uid103_invPolyEval(CONSTANT,131)
    aboveLeftY_bottomExtension_uid132_pT3_uid103_invPolyEval_q <= "00000";

    -- aboveLeftY_mergedSignalTM_uid134_pT3_uid103_invPolyEval(BITJOIN,133)@21
    aboveLeftY_mergedSignalTM_uid134_pT3_uid103_invPolyEval_q <= topRangeY_uid130_pT3_uid103_invPolyEval_merged_bit_select_c & aboveLeftY_bottomExtension_uid132_pT3_uid103_invPolyEval_q;

    -- memoryC3_uid83_invTabGen_lutmem(DUALMEM,242)@4 + 2
    -- in j@20000000
    memoryC3_uid83_invTabGen_lutmem_aa <= yAddr_uid19_divider_merged_bit_select_b;
    memoryC3_uid83_invTabGen_lutmem_reset0 <= rst;
    memoryC3_uid83_invTabGen_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 14,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Fix_Div_altera_fxp_functions_191_fy4uury_memoryC3_uid83_invTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC3_uid83_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid83_invTabGen_lutmem_aa,
        q_a => memoryC3_uid83_invTabGen_lutmem_ir
    );
    memoryC3_uid83_invTabGen_lutmem_r <= memoryC3_uid83_invTabGen_lutmem_ir(13 downto 0);

    -- redist6_memoryC3_uid83_invTabGen_lutmem_r_1(DELAY,265)
    redist6_memoryC3_uid83_invTabGen_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist6_memoryC3_uid83_invTabGen_lutmem_r_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist6_memoryC3_uid83_invTabGen_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC3_uid83_invTabGen_lutmem_r);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- yT1_uid90_invPolyEval(BITSELECT,89)@7
    yT1_uid90_invPolyEval_b <= redist3_yAddr_uid19_divider_merged_bit_select_c_3_q(22 downto 9);

    -- prodXY_uid109_pT1_uid91_invPolyEval_cma(CHAINMULTADD,243)@7 + 5
    -- out q@13
    prodXY_uid109_pT1_uid91_invPolyEval_cma_reset <= rst;
    prodXY_uid109_pT1_uid91_invPolyEval_cma_ena0 <= en(0) or prodXY_uid109_pT1_uid91_invPolyEval_cma_reset;
    prodXY_uid109_pT1_uid91_invPolyEval_cma_ena1 <= prodXY_uid109_pT1_uid91_invPolyEval_cma_ena0;
    prodXY_uid109_pT1_uid91_invPolyEval_cma_ena2 <= prodXY_uid109_pT1_uid91_invPolyEval_cma_ena0;
    prodXY_uid109_pT1_uid91_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXY_uid109_pT1_uid91_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(yT1_uid90_invPolyEval_b),14);
                    prodXY_uid109_pT1_uid91_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(redist6_memoryC3_uid83_invTabGen_lutmem_r_1_q),14);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid109_pT1_uid91_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid109_pT1_uid91_invPolyEval_cma_ah(0));
    prodXY_uid109_pT1_uid91_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid109_pT1_uid91_invPolyEval_cma_ch(0));
    prodXY_uid109_pT1_uid91_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 14,
        ax_clock => "0",
        ax_width => 14,
        signed_may => "false",
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
        ena(0) => prodXY_uid109_pT1_uid91_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid109_pT1_uid91_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid109_pT1_uid91_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid109_pT1_uid91_invPolyEval_cma_reset,
        clr(1) => prodXY_uid109_pT1_uid91_invPolyEval_cma_reset,
        ay => prodXY_uid109_pT1_uid91_invPolyEval_cma_a0,
        ax => prodXY_uid109_pT1_uid91_invPolyEval_cma_c0,
        resulta => prodXY_uid109_pT1_uid91_invPolyEval_cma_s0
    );
    prodXY_uid109_pT1_uid91_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid109_pT1_uid91_invPolyEval_cma_s0, xout => prodXY_uid109_pT1_uid91_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXY_uid109_pT1_uid91_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid109_pT1_uid91_invPolyEval_cma_qq(27 downto 0));

    -- osig_uid110_pT1_uid91_invPolyEval(BITSELECT,109)@13
    osig_uid110_pT1_uid91_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid109_pT1_uid91_invPolyEval_cma_q(27 downto 14));

    -- highBBits_uid93_invPolyEval(BITSELECT,92)@13
    highBBits_uid93_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid110_pT1_uid91_invPolyEval_b(13 downto 1));

    -- redist0_yAddr_uid19_divider_merged_bit_select_b_7_notEnable(LOGICAL,291)
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist0_yAddr_uid19_divider_merged_bit_select_b_7_nor(LOGICAL,292)
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_nor_q <= not (redist0_yAddr_uid19_divider_merged_bit_select_b_7_notEnable_q or redist0_yAddr_uid19_divider_merged_bit_select_b_7_sticky_ena_q);

    -- redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_last(CONSTANT,288)
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_last_q <= "011";

    -- redist0_yAddr_uid19_divider_merged_bit_select_b_7_cmp(LOGICAL,289)
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_cmp_q <= "1" WHEN redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_last_q = redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux_q ELSE "0";

    -- redist0_yAddr_uid19_divider_merged_bit_select_b_7_cmpReg(REG,290)
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist0_yAddr_uid19_divider_merged_bit_select_b_7_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist0_yAddr_uid19_divider_merged_bit_select_b_7_cmpReg_q <= STD_LOGIC_VECTOR(redist0_yAddr_uid19_divider_merged_bit_select_b_7_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist0_yAddr_uid19_divider_merged_bit_select_b_7_sticky_ena(REG,293)
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist0_yAddr_uid19_divider_merged_bit_select_b_7_sticky_ena_q <= "0";
            ELSE
                IF (redist0_yAddr_uid19_divider_merged_bit_select_b_7_nor_q = "1") THEN
                    redist0_yAddr_uid19_divider_merged_bit_select_b_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist0_yAddr_uid19_divider_merged_bit_select_b_7_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist0_yAddr_uid19_divider_merged_bit_select_b_7_enaAnd(LOGICAL,294)
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_enaAnd_q <= redist0_yAddr_uid19_divider_merged_bit_select_b_7_sticky_ena_q and en;

    -- redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt(COUNTER,285)
    -- low=0, high=4, step=1, init=0
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                        redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_eq <= '1';
                    ELSE
                        redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_eq <= '0';
                    END IF;
                    IF (redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_eq = '1') THEN
                        redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_i <= redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_i + 4;
                    ELSE
                        redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_i <= redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_i, 3)));

    -- redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux(MUX,286)
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux_s <= en;
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux_combproc: PROCESS (redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux_s, redist0_yAddr_uid19_divider_merged_bit_select_b_7_wraddr_q, redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_q)
    BEGIN
        CASE (redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux_s) IS
            WHEN "0" => redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux_q <= redist0_yAddr_uid19_divider_merged_bit_select_b_7_wraddr_q;
            WHEN "1" => redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux_q <= redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdcnt_q;
            WHEN OTHERS => redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist0_yAddr_uid19_divider_merged_bit_select_b_7_wraddr(REG,287)
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist0_yAddr_uid19_divider_merged_bit_select_b_7_wraddr_q <= "100";
            ELSE
                redist0_yAddr_uid19_divider_merged_bit_select_b_7_wraddr_q <= STD_LOGIC_VECTOR(redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem(DUALMEM,284)
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_ia <= STD_LOGIC_VECTOR(yAddr_uid19_divider_merged_bit_select_b);
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_aa <= redist0_yAddr_uid19_divider_merged_bit_select_b_7_wraddr_q;
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_ab <= redist0_yAddr_uid19_divider_merged_bit_select_b_7_rdmux_q;
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_reset0 <= rst;
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 8,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist0_yAddr_uid19_divider_merged_bit_select_b_7_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_reset0,
        clock1 => clk,
        address_a => redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_aa,
        data_a => redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_ia,
        wren_a => en(0),
        address_b => redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_ab,
        q_b => redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_iq
    );
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_q <= redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_iq(7 downto 0);

    -- redist0_yAddr_uid19_divider_merged_bit_select_b_7_outputreg0(DELAY,283)
    redist0_yAddr_uid19_divider_merged_bit_select_b_7_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist0_yAddr_uid19_divider_merged_bit_select_b_7_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist0_yAddr_uid19_divider_merged_bit_select_b_7_outputreg0_q <= STD_LOGIC_VECTOR(redist0_yAddr_uid19_divider_merged_bit_select_b_7_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC2_uid80_invTabGen_lutmem(DUALMEM,241)@11 + 2
    -- in j@20000000
    memoryC2_uid80_invTabGen_lutmem_aa <= redist0_yAddr_uid19_divider_merged_bit_select_b_7_outputreg0_q;
    memoryC2_uid80_invTabGen_lutmem_reset0 <= rst;
    memoryC2_uid80_invTabGen_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 21,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Fix_Div_altera_fxp_functions_191_fy4uury_memoryC2_uid80_invTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC2_uid80_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid80_invTabGen_lutmem_aa,
        q_a => memoryC2_uid80_invTabGen_lutmem_ir
    );
    memoryC2_uid80_invTabGen_lutmem_r <= memoryC2_uid80_invTabGen_lutmem_ir(20 downto 0);

    -- s1sumAHighB_uid94_invPolyEval(ADD,93)@13 + 1
    s1sumAHighB_uid94_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => memoryC2_uid80_invTabGen_lutmem_r(20)) & memoryC2_uid80_invTabGen_lutmem_r));
    s1sumAHighB_uid94_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid93_invPolyEval_b(12)) & highBBits_uid93_invPolyEval_b));
    s1sumAHighB_uid94_invPolyEval_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                s1sumAHighB_uid94_invPolyEval_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    s1sumAHighB_uid94_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid94_invPolyEval_a) + SIGNED(s1sumAHighB_uid94_invPolyEval_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    s1sumAHighB_uid94_invPolyEval_q <= s1sumAHighB_uid94_invPolyEval_o(21 downto 0);

    -- lowRangeB_uid92_invPolyEval(BITSELECT,91)@13
    lowRangeB_uid92_invPolyEval_in <= osig_uid110_pT1_uid91_invPolyEval_b(0 downto 0);
    lowRangeB_uid92_invPolyEval_b <= lowRangeB_uid92_invPolyEval_in(0 downto 0);

    -- redist9_lowRangeB_uid92_invPolyEval_b_1(DELAY,268)
    redist9_lowRangeB_uid92_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist9_lowRangeB_uid92_invPolyEval_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist9_lowRangeB_uid92_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid92_invPolyEval_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- s1_uid95_invPolyEval(BITJOIN,94)@14
    s1_uid95_invPolyEval_q <= s1sumAHighB_uid94_invPolyEval_q & redist9_lowRangeB_uid92_invPolyEval_b_1_q;

    -- yT2_uid96_invPolyEval(BITSELECT,95)@14
    yT2_uid96_invPolyEval_b <= redist4_yAddr_uid19_divider_merged_bit_select_c_10_outputreg0_q(22 downto 2);

    -- prodXY_uid112_pT2_uid97_invPolyEval_cma(CHAINMULTADD,244)@14 + 5
    -- out q@20
    prodXY_uid112_pT2_uid97_invPolyEval_cma_reset <= rst;
    prodXY_uid112_pT2_uid97_invPolyEval_cma_ena0 <= en(0) or prodXY_uid112_pT2_uid97_invPolyEval_cma_reset;
    prodXY_uid112_pT2_uid97_invPolyEval_cma_ena1 <= prodXY_uid112_pT2_uid97_invPolyEval_cma_ena0;
    prodXY_uid112_pT2_uid97_invPolyEval_cma_ena2 <= prodXY_uid112_pT2_uid97_invPolyEval_cma_ena0;
    prodXY_uid112_pT2_uid97_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXY_uid112_pT2_uid97_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(yT2_uid96_invPolyEval_b),21);
                    prodXY_uid112_pT2_uid97_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(s1_uid95_invPolyEval_q),23);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid112_pT2_uid97_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid112_pT2_uid97_invPolyEval_cma_ah(0));
    prodXY_uid112_pT2_uid97_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid112_pT2_uid97_invPolyEval_cma_ch(0));
    prodXY_uid112_pT2_uid97_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 21,
        ax_clock => "0",
        ax_width => 23,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 44
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid112_pT2_uid97_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid112_pT2_uid97_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid112_pT2_uid97_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid112_pT2_uid97_invPolyEval_cma_reset,
        clr(1) => prodXY_uid112_pT2_uid97_invPolyEval_cma_reset,
        ay => prodXY_uid112_pT2_uid97_invPolyEval_cma_a0,
        ax => prodXY_uid112_pT2_uid97_invPolyEval_cma_c0,
        resulta => prodXY_uid112_pT2_uid97_invPolyEval_cma_s0
    );
    prodXY_uid112_pT2_uid97_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 44, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid112_pT2_uid97_invPolyEval_cma_s0, xout => prodXY_uid112_pT2_uid97_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXY_uid112_pT2_uid97_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid112_pT2_uid97_invPolyEval_cma_qq(43 downto 0));

    -- osig_uid113_pT2_uid97_invPolyEval(BITSELECT,112)@20
    osig_uid113_pT2_uid97_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid112_pT2_uid97_invPolyEval_cma_q(43 downto 21));

    -- highBBits_uid99_invPolyEval(BITSELECT,98)@20
    highBBits_uid99_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid113_pT2_uid97_invPolyEval_b(22 downto 1));

    -- redist1_yAddr_uid19_divider_merged_bit_select_b_14_inputreg0(DELAY,295)
    redist1_yAddr_uid19_divider_merged_bit_select_b_14_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist1_yAddr_uid19_divider_merged_bit_select_b_14_inputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist1_yAddr_uid19_divider_merged_bit_select_b_14_inputreg0_q <= STD_LOGIC_VECTOR(redist0_yAddr_uid19_divider_merged_bit_select_b_7_outputreg0_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist1_yAddr_uid19_divider_merged_bit_select_b_14(DELAY,260)
    redist1_yAddr_uid19_divider_merged_bit_select_b_14_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_0 <= (others => '0');
                redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_1 <= (others => '0');
                redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_2 <= (others => '0');
                redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_3 <= (others => '0');
                redist1_yAddr_uid19_divider_merged_bit_select_b_14_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_0 <= STD_LOGIC_VECTOR(redist1_yAddr_uid19_divider_merged_bit_select_b_14_inputreg0_q);
                    redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_1 <= redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_0;
                    redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_2 <= redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_1;
                    redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_3 <= redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_2;
                    redist1_yAddr_uid19_divider_merged_bit_select_b_14_q <= redist1_yAddr_uid19_divider_merged_bit_select_b_14_delay_3;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist1_yAddr_uid19_divider_merged_bit_select_b_14_outputreg0(DELAY,296)
    redist1_yAddr_uid19_divider_merged_bit_select_b_14_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist1_yAddr_uid19_divider_merged_bit_select_b_14_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist1_yAddr_uid19_divider_merged_bit_select_b_14_outputreg0_q <= STD_LOGIC_VECTOR(redist1_yAddr_uid19_divider_merged_bit_select_b_14_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid77_invTabGen_lutmem(DUALMEM,240)@18 + 2
    -- in j@20000000
    memoryC1_uid77_invTabGen_lutmem_aa <= redist1_yAddr_uid19_divider_merged_bit_select_b_14_outputreg0_q;
    memoryC1_uid77_invTabGen_lutmem_reset0 <= rst;
    memoryC1_uid77_invTabGen_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 29,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Fix_Div_altera_fxp_functions_191_fy4uury_memoryC1_uid77_invTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC1_uid77_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid77_invTabGen_lutmem_aa,
        q_a => memoryC1_uid77_invTabGen_lutmem_ir
    );
    memoryC1_uid77_invTabGen_lutmem_r <= memoryC1_uid77_invTabGen_lutmem_ir(28 downto 0);

    -- s2sumAHighB_uid100_invPolyEval(ADD,99)@20 + 1
    s2sumAHighB_uid100_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => memoryC1_uid77_invTabGen_lutmem_r(28)) & memoryC1_uid77_invTabGen_lutmem_r));
    s2sumAHighB_uid100_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid99_invPolyEval_b(21)) & highBBits_uid99_invPolyEval_b));
    s2sumAHighB_uid100_invPolyEval_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                s2sumAHighB_uid100_invPolyEval_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    s2sumAHighB_uid100_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid100_invPolyEval_a) + SIGNED(s2sumAHighB_uid100_invPolyEval_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    s2sumAHighB_uid100_invPolyEval_q <= s2sumAHighB_uid100_invPolyEval_o(29 downto 0);

    -- lowRangeB_uid98_invPolyEval(BITSELECT,97)@20
    lowRangeB_uid98_invPolyEval_in <= osig_uid113_pT2_uid97_invPolyEval_b(0 downto 0);
    lowRangeB_uid98_invPolyEval_b <= lowRangeB_uid98_invPolyEval_in(0 downto 0);

    -- redist8_lowRangeB_uid98_invPolyEval_b_1(DELAY,267)
    redist8_lowRangeB_uid98_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist8_lowRangeB_uid98_invPolyEval_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist8_lowRangeB_uid98_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid98_invPolyEval_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- s2_uid101_invPolyEval(BITJOIN,100)@21
    s2_uid101_invPolyEval_q <= s2sumAHighB_uid100_invPolyEval_q & redist8_lowRangeB_uid98_invPolyEval_b_1_q;

    -- topRangeY_uid130_pT3_uid103_invPolyEval_merged_bit_select(BITSELECT,257)@21
    topRangeY_uid130_pT3_uid103_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(s2_uid101_invPolyEval_q(30 downto 13));
    topRangeY_uid130_pT3_uid103_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(s2_uid101_invPolyEval_q(12 downto 0));

    -- rightBottomX_mergedSignalTM_uid138_pT3_uid103_invPolyEval(BITJOIN,137)@21
    rightBottomX_mergedSignalTM_uid138_pT3_uid103_invPolyEval_q <= topRangeX_uid129_pT3_uid103_invPolyEval_merged_bit_select_c & rightBottomX_bottomExtension_uid136_pT3_uid103_invPolyEval_q;

    -- multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma(CHAINMULTADD,248)@21 + 5
    -- out q@27
    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_reset <= rst;
    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ena0 <= en(0) or multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_reset;
    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ena2 <= multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid138_pT3_uid103_invPolyEval_q),18);
                    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ah(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid134_pT3_uid103_invPolyEval_q),18);
                    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(topRangeY_uid130_pT3_uid103_invPolyEval_merged_bit_select_b),18);
                    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ch(1) <= RESIZE(SIGNED(topRangeX_uid129_pT3_uid103_invPolyEval_merged_bit_select_b),18);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ah(0));
    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ch(0));
    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_a1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ah(1));
    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_c1 <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ch(1));
    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_sumof2",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        by_clock => "0",
        by_width => 18,
        ax_clock => "0",
        bx_clock => "0",
        ax_width => 18,
        bx_width => 18,
        signed_may => "false",
        signed_mby => "false",
        signed_max => "true",
        signed_mbx => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 37
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ena0,
        ena(1) => multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ena1,
        ena(2) => multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_ena2,
        clr(0) => multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_reset,
        clr(1) => multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_reset,
        ay => multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_a1,
        by => multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_a0,
        ax => multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_c1,
        bx => multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_c0,
        resulta => multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_s0
    );
    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_s0, xout => multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => rst );
    multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_qq(36 downto 0));

    -- highBBits_uid145_pT3_uid103_invPolyEval(BITSELECT,144)@27
    highBBits_uid145_pT3_uid103_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_q(36 downto 18));

    -- sm0_uid141_pT3_uid103_invPolyEval_cma(CHAINMULTADD,245)@21 + 5
    -- out q@27
    sm0_uid141_pT3_uid103_invPolyEval_cma_reset <= rst;
    sm0_uid141_pT3_uid103_invPolyEval_cma_ena0 <= en(0) or sm0_uid141_pT3_uid103_invPolyEval_cma_reset;
    sm0_uid141_pT3_uid103_invPolyEval_cma_ena1 <= sm0_uid141_pT3_uid103_invPolyEval_cma_ena0;
    sm0_uid141_pT3_uid103_invPolyEval_cma_ena2 <= sm0_uid141_pT3_uid103_invPolyEval_cma_ena0;
    sm0_uid141_pT3_uid103_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    sm0_uid141_pT3_uid103_invPolyEval_cma_ah(0) <= RESIZE(SIGNED(topRangeX_uid129_pT3_uid103_invPolyEval_merged_bit_select_b),18);
                    sm0_uid141_pT3_uid103_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(topRangeY_uid130_pT3_uid103_invPolyEval_merged_bit_select_b),18);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    sm0_uid141_pT3_uid103_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(sm0_uid141_pT3_uid103_invPolyEval_cma_ah(0));
    sm0_uid141_pT3_uid103_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(sm0_uid141_pT3_uid103_invPolyEval_cma_ch(0));
    sm0_uid141_pT3_uid103_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 18,
        ax_clock => "0",
        ax_width => 18,
        signed_may => "true",
        signed_max => "true",
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
        ena(0) => sm0_uid141_pT3_uid103_invPolyEval_cma_ena0,
        ena(1) => sm0_uid141_pT3_uid103_invPolyEval_cma_ena1,
        ena(2) => sm0_uid141_pT3_uid103_invPolyEval_cma_ena2,
        clr(0) => sm0_uid141_pT3_uid103_invPolyEval_cma_reset,
        clr(1) => sm0_uid141_pT3_uid103_invPolyEval_cma_reset,
        ay => sm0_uid141_pT3_uid103_invPolyEval_cma_a0,
        ax => sm0_uid141_pT3_uid103_invPolyEval_cma_c0,
        resulta => sm0_uid141_pT3_uid103_invPolyEval_cma_s0
    );
    sm0_uid141_pT3_uid103_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => sm0_uid141_pT3_uid103_invPolyEval_cma_s0, xout => sm0_uid141_pT3_uid103_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => rst );
    sm0_uid141_pT3_uid103_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid141_pT3_uid103_invPolyEval_cma_qq(35 downto 0));

    -- lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval(ADD,145)@27
    lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => sm0_uid141_pT3_uid103_invPolyEval_cma_q(35)) & sm0_uid141_pT3_uid103_invPolyEval_cma_q));
    lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 19 => highBBits_uid145_pT3_uid103_invPolyEval_b(18)) & highBBits_uid145_pT3_uid103_invPolyEval_b));
    lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval_b));
    lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval_q <= lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval_o(36 downto 0);

    -- lowRangeB_uid144_pT3_uid103_invPolyEval(BITSELECT,143)@27
    lowRangeB_uid144_pT3_uid103_invPolyEval_in <= multSumOfTwoTS_uid142_pT3_uid103_invPolyEval_cma_q(17 downto 0);
    lowRangeB_uid144_pT3_uid103_invPolyEval_b <= lowRangeB_uid144_pT3_uid103_invPolyEval_in(17 downto 0);

    -- lev1_a0_uid147_pT3_uid103_invPolyEval(BITJOIN,146)@27
    lev1_a0_uid147_pT3_uid103_invPolyEval_q <= lev1_a0sumAHighB_uid146_pT3_uid103_invPolyEval_q & lowRangeB_uid144_pT3_uid103_invPolyEval_b;

    -- os_uid148_pT3_uid103_invPolyEval(BITSELECT,147)@27
    os_uid148_pT3_uid103_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid147_pT3_uid103_invPolyEval_q(52 downto 0));
    os_uid148_pT3_uid103_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid148_pT3_uid103_invPolyEval_in(52 downto 21));

    -- redist7_os_uid148_pT3_uid103_invPolyEval_b_1(DELAY,266)
    redist7_os_uid148_pT3_uid103_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist7_os_uid148_pT3_uid103_invPolyEval_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist7_os_uid148_pT3_uid103_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(os_uid148_pT3_uid103_invPolyEval_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- highBBits_uid105_invPolyEval(BITSELECT,104)@28
    highBBits_uid105_invPolyEval_b <= STD_LOGIC_VECTOR(redist7_os_uid148_pT3_uid103_invPolyEval_b_1_q(31 downto 2));

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_notEnable(LOGICAL,306)
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_nor(LOGICAL,307)
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_nor_q <= not (redist2_yAddr_uid19_divider_merged_bit_select_b_22_notEnable_q or redist2_yAddr_uid19_divider_merged_bit_select_b_22_sticky_ena_q);

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_last(CONSTANT,303)
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_last_q <= "011";

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_cmp(LOGICAL,304)
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_cmp_q <= "1" WHEN redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_last_q = redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux_q ELSE "0";

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_cmpReg(REG,305)
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist2_yAddr_uid19_divider_merged_bit_select_b_22_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist2_yAddr_uid19_divider_merged_bit_select_b_22_cmpReg_q <= STD_LOGIC_VECTOR(redist2_yAddr_uid19_divider_merged_bit_select_b_22_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_sticky_ena(REG,308)
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist2_yAddr_uid19_divider_merged_bit_select_b_22_sticky_ena_q <= "0";
            ELSE
                IF (redist2_yAddr_uid19_divider_merged_bit_select_b_22_nor_q = "1") THEN
                    redist2_yAddr_uid19_divider_merged_bit_select_b_22_sticky_ena_q <= STD_LOGIC_VECTOR(redist2_yAddr_uid19_divider_merged_bit_select_b_22_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_enaAnd(LOGICAL,309)
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_enaAnd_q <= redist2_yAddr_uid19_divider_merged_bit_select_b_22_sticky_ena_q and en;

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt(COUNTER,300)
    -- low=0, high=4, step=1, init=0
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                        redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_eq <= '1';
                    ELSE
                        redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_eq <= '0';
                    END IF;
                    IF (redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_eq = '1') THEN
                        redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_i <= redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_i + 4;
                    ELSE
                        redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_i <= redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_i, 3)));

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux(MUX,301)
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux_s <= en;
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux_combproc: PROCESS (redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux_s, redist2_yAddr_uid19_divider_merged_bit_select_b_22_wraddr_q, redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_q)
    BEGIN
        CASE (redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux_s) IS
            WHEN "0" => redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux_q <= redist2_yAddr_uid19_divider_merged_bit_select_b_22_wraddr_q;
            WHEN "1" => redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux_q <= redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdcnt_q;
            WHEN OTHERS => redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_inputreg0(DELAY,297)
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_inputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist2_yAddr_uid19_divider_merged_bit_select_b_22_inputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist2_yAddr_uid19_divider_merged_bit_select_b_22_inputreg0_q <= STD_LOGIC_VECTOR(redist1_yAddr_uid19_divider_merged_bit_select_b_14_outputreg0_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_wraddr(REG,302)
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist2_yAddr_uid19_divider_merged_bit_select_b_22_wraddr_q <= "100";
            ELSE
                redist2_yAddr_uid19_divider_merged_bit_select_b_22_wraddr_q <= STD_LOGIC_VECTOR(redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem(DUALMEM,299)
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_ia <= STD_LOGIC_VECTOR(redist2_yAddr_uid19_divider_merged_bit_select_b_22_inputreg0_q);
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_aa <= redist2_yAddr_uid19_divider_merged_bit_select_b_22_wraddr_q;
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_ab <= redist2_yAddr_uid19_divider_merged_bit_select_b_22_rdmux_q;
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_reset0 <= rst;
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 8,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist2_yAddr_uid19_divider_merged_bit_select_b_22_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_reset0,
        clock1 => clk,
        address_a => redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_aa,
        data_a => redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_ia,
        wren_a => en(0),
        address_b => redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_ab,
        q_b => redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_iq
    );
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_q <= redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_iq(7 downto 0);

    -- redist2_yAddr_uid19_divider_merged_bit_select_b_22_outputreg0(DELAY,298)
    redist2_yAddr_uid19_divider_merged_bit_select_b_22_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist2_yAddr_uid19_divider_merged_bit_select_b_22_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist2_yAddr_uid19_divider_merged_bit_select_b_22_outputreg0_q <= STD_LOGIC_VECTOR(redist2_yAddr_uid19_divider_merged_bit_select_b_22_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid74_invTabGen_lutmem(DUALMEM,239)@26 + 2
    -- in j@20000000
    memoryC0_uid74_invTabGen_lutmem_aa <= redist2_yAddr_uid19_divider_merged_bit_select_b_22_outputreg0_q;
    memoryC0_uid74_invTabGen_lutmem_reset0 <= rst;
    memoryC0_uid74_invTabGen_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 38,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Fix_Div_altera_fxp_functions_191_fy4uury_memoryC0_uid74_invTabGen_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC0_uid74_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid74_invTabGen_lutmem_aa,
        q_a => memoryC0_uid74_invTabGen_lutmem_ir
    );
    memoryC0_uid74_invTabGen_lutmem_r <= memoryC0_uid74_invTabGen_lutmem_ir(37 downto 0);

    -- s3sumAHighB_uid106_invPolyEval(ADD,105)@28
    s3sumAHighB_uid106_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 38 => memoryC0_uid74_invTabGen_lutmem_r(37)) & memoryC0_uid74_invTabGen_lutmem_r));
    s3sumAHighB_uid106_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 30 => highBBits_uid105_invPolyEval_b(29)) & highBBits_uid105_invPolyEval_b));
    s3sumAHighB_uid106_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid106_invPolyEval_a) + SIGNED(s3sumAHighB_uid106_invPolyEval_b));
    s3sumAHighB_uid106_invPolyEval_q <= s3sumAHighB_uid106_invPolyEval_o(38 downto 0);

    -- lowRangeB_uid104_invPolyEval(BITSELECT,103)@28
    lowRangeB_uid104_invPolyEval_in <= redist7_os_uid148_pT3_uid103_invPolyEval_b_1_q(1 downto 0);
    lowRangeB_uid104_invPolyEval_b <= lowRangeB_uid104_invPolyEval_in(1 downto 0);

    -- s3_uid107_invPolyEval(BITJOIN,106)@28
    s3_uid107_invPolyEval_q <= s3sumAHighB_uid106_invPolyEval_q & lowRangeB_uid104_invPolyEval_b;

    -- fxpInverseRes_uid22_divider(BITSELECT,21)@28
    fxpInverseRes_uid22_divider_in <= s3_uid107_invPolyEval_q(38 downto 0);
    fxpInverseRes_uid22_divider_b <= fxpInverseRes_uid22_divider_in(38 downto 6);

    -- paddingY_uid12_divider(CONSTANT,11)
    paddingY_uid12_divider_q <= "0000000000000000000000000000000";

    -- updatedY_uid13_divider(BITJOIN,12)@5
    updatedY_uid13_divider_q <= GND_q & paddingY_uid12_divider_q;

    -- redist20_normYNoLeadOne_uid11_divider_b_1(DELAY,279)
    redist20_normYNoLeadOne_uid11_divider_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist20_normYNoLeadOne_uid11_divider_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist20_normYNoLeadOne_uid11_divider_b_1_q <= STD_LOGIC_VECTOR(normYNoLeadOne_uid11_divider_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- normYIsOneC2_uid12_divider(LOGICAL,13)@5
    normYIsOneC2_uid12_divider_a <= STD_LOGIC_VECTOR("0" & redist20_normYNoLeadOne_uid11_divider_b_1_q);
    normYIsOneC2_uid12_divider_q <= "1" WHEN normYIsOneC2_uid12_divider_a = updatedY_uid13_divider_q ELSE "0";

    -- normYIsOneC2_uid15_divider(BITSELECT,14)@4
    normYIsOneC2_uid15_divider_b <= STD_LOGIC_VECTOR(leftShiftStage2_uid180_normY_uid10_divider_q(31 downto 31));

    -- redist19_normYIsOneC2_uid15_divider_b_1(DELAY,278)
    redist19_normYIsOneC2_uid15_divider_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist19_normYIsOneC2_uid15_divider_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist19_normYIsOneC2_uid15_divider_b_1_q <= STD_LOGIC_VECTOR(normYIsOneC2_uid15_divider_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- normYIsOne_uid16_divider(LOGICAL,15)@5 + 1
    normYIsOne_uid16_divider_qi <= redist19_normYIsOneC2_uid15_divider_b_1_q and normYIsOneC2_uid12_divider_q;
    normYIsOne_uid16_divider_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => normYIsOne_uid16_divider_qi, xout => normYIsOne_uid16_divider_q, ena => en(0), clk => clk, aclr => rst );

    -- redist18_normYIsOne_uid16_divider_q_23(DELAY,277)
    redist18_normYIsOne_uid16_divider_q_23 : dspba_delay
    GENERIC MAP ( width => 1, depth => 22, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => normYIsOne_uid16_divider_q, xout => redist18_normYIsOne_uid16_divider_q_23_q, ena => en(0), clk => clk, aclr => rst );

    -- invResPostOneHandling2_uid24_divider(MUX,23)@28 + 1
    invResPostOneHandling2_uid24_divider_s <= redist18_normYIsOne_uid16_divider_q_23_q;
    invResPostOneHandling2_uid24_divider_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                invResPostOneHandling2_uid24_divider_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    CASE (invResPostOneHandling2_uid24_divider_s) IS
                        WHEN "0" => invResPostOneHandling2_uid24_divider_q <= fxpInverseRes_uid22_divider_b;
                        WHEN "1" => invResPostOneHandling2_uid24_divider_q <= oneInvRes_uid23_divider_q;
                        WHEN OTHERS => invResPostOneHandling2_uid24_divider_q <= (others => '0');
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- prodXInvY_uid27_divider_bs7(BITSELECT,188)@29
    prodXInvY_uid27_divider_bs7_b <= invResPostOneHandling2_uid24_divider_q(32 downto 18);

    -- prodXInvY_uid27_divider_bs9(BITSELECT,190)@29
    prodXInvY_uid27_divider_bs9_in <= invResPostOneHandling2_uid24_divider_q(17 downto 0);
    prodXInvY_uid27_divider_bs9_b <= prodXInvY_uid27_divider_bs9_in(17 downto 0);

    -- prodXInvY_uid27_divider_bs8(BITSELECT,189)@29
    prodXInvY_uid27_divider_bs8_b <= redist21_in_rsrvd_fix_numerator_29_outputreg0_q(31 downto 18);

    -- prodXInvY_uid27_divider_ma5_cma(CHAINMULTADD,249)@29 + 5
    -- out q@35
    prodXInvY_uid27_divider_ma5_cma_reset <= rst;
    prodXInvY_uid27_divider_ma5_cma_ena0 <= en(0) or prodXInvY_uid27_divider_ma5_cma_reset;
    prodXInvY_uid27_divider_ma5_cma_ena1 <= prodXInvY_uid27_divider_ma5_cma_ena0;
    prodXInvY_uid27_divider_ma5_cma_ena2 <= prodXInvY_uid27_divider_ma5_cma_ena0;
    prodXInvY_uid27_divider_ma5_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXInvY_uid27_divider_ma5_cma_ah(0) <= RESIZE(UNSIGNED(prodXInvY_uid27_divider_bs8_b),15);
                    prodXInvY_uid27_divider_ma5_cma_ah(1) <= RESIZE(UNSIGNED(prodXInvY_uid27_divider_bs7_b),15);
                    prodXInvY_uid27_divider_ma5_cma_ch(0) <= RESIZE(UNSIGNED(prodXInvY_uid27_divider_bs9_b),18);
                    prodXInvY_uid27_divider_ma5_cma_ch(1) <= RESIZE(UNSIGNED(prodXInvY_uid27_divider_bs6_b),18);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXInvY_uid27_divider_ma5_cma_a0 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_ma5_cma_ah(0));
    prodXInvY_uid27_divider_ma5_cma_c0 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_ma5_cma_ch(0));
    prodXInvY_uid27_divider_ma5_cma_a1 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_ma5_cma_ah(1));
    prodXInvY_uid27_divider_ma5_cma_c1 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_ma5_cma_ch(1));
    prodXInvY_uid27_divider_ma5_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_sumof2",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 15,
        by_clock => "0",
        by_width => 15,
        ax_clock => "0",
        bx_clock => "0",
        ax_width => 18,
        bx_width => 18,
        signed_may => "false",
        signed_mby => "false",
        signed_max => "false",
        signed_mbx => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 34
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXInvY_uid27_divider_ma5_cma_ena0,
        ena(1) => prodXInvY_uid27_divider_ma5_cma_ena1,
        ena(2) => prodXInvY_uid27_divider_ma5_cma_ena2,
        clr(0) => prodXInvY_uid27_divider_ma5_cma_reset,
        clr(1) => prodXInvY_uid27_divider_ma5_cma_reset,
        ay => prodXInvY_uid27_divider_ma5_cma_a1,
        by => prodXInvY_uid27_divider_ma5_cma_a0,
        ax => prodXInvY_uid27_divider_ma5_cma_c1,
        bx => prodXInvY_uid27_divider_ma5_cma_c0,
        resulta => prodXInvY_uid27_divider_ma5_cma_s0
    );
    prodXInvY_uid27_divider_ma5_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXInvY_uid27_divider_ma5_cma_s0, xout => prodXInvY_uid27_divider_ma5_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXInvY_uid27_divider_ma5_cma_q <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_ma5_cma_qq(33 downto 0));

    -- prodXInvY_uid27_divider_sums_align_1(BITSHIFT,195)@35
    prodXInvY_uid27_divider_sums_align_1_qint <= prodXInvY_uid27_divider_ma5_cma_q & "000000000000000000";
    prodXInvY_uid27_divider_sums_align_1_q <= prodXInvY_uid27_divider_sums_align_1_qint(51 downto 0);

    -- prodXInvY_uid27_divider_bs1(BITSELECT,182)@29
    prodXInvY_uid27_divider_bs1_b <= STD_LOGIC_VECTOR(redist21_in_rsrvd_fix_numerator_29_outputreg0_q(31 downto 18));

    -- prodXInvY_uid27_divider_bjA2(BITJOIN,183)@29
    prodXInvY_uid27_divider_bjA2_q <= GND_q & prodXInvY_uid27_divider_bs1_b;

    -- prodXInvY_uid27_divider_bs3(BITSELECT,184)@29
    prodXInvY_uid27_divider_bs3_b <= STD_LOGIC_VECTOR(invResPostOneHandling2_uid24_divider_q(32 downto 18));

    -- prodXInvY_uid27_divider_bjB4(BITJOIN,185)@29
    prodXInvY_uid27_divider_bjB4_q <= GND_q & prodXInvY_uid27_divider_bs3_b;

    -- prodXInvY_uid27_divider_im0_cma(CHAINMULTADD,246)@29 + 5
    -- out q@35
    prodXInvY_uid27_divider_im0_cma_reset <= rst;
    prodXInvY_uid27_divider_im0_cma_ena0 <= en(0) or prodXInvY_uid27_divider_im0_cma_reset;
    prodXInvY_uid27_divider_im0_cma_ena1 <= prodXInvY_uid27_divider_im0_cma_ena0;
    prodXInvY_uid27_divider_im0_cma_ena2 <= prodXInvY_uid27_divider_im0_cma_ena0;
    prodXInvY_uid27_divider_im0_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXInvY_uid27_divider_im0_cma_ah(0) <= RESIZE(SIGNED(prodXInvY_uid27_divider_bjB4_q),16);
                    prodXInvY_uid27_divider_im0_cma_ch(0) <= RESIZE(SIGNED(prodXInvY_uid27_divider_bjA2_q),15);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXInvY_uid27_divider_im0_cma_a0 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_im0_cma_ah(0));
    prodXInvY_uid27_divider_im0_cma_c0 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_im0_cma_ch(0));
    prodXInvY_uid27_divider_im0_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 16,
        ax_clock => "0",
        ax_width => 15,
        signed_may => "true",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 31,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXInvY_uid27_divider_im0_cma_ena0,
        ena(1) => prodXInvY_uid27_divider_im0_cma_ena1,
        ena(2) => prodXInvY_uid27_divider_im0_cma_ena2,
        clr(0) => prodXInvY_uid27_divider_im0_cma_reset,
        clr(1) => prodXInvY_uid27_divider_im0_cma_reset,
        ay => prodXInvY_uid27_divider_im0_cma_a0,
        ax => prodXInvY_uid27_divider_im0_cma_c0,
        resulta => prodXInvY_uid27_divider_im0_cma_s0
    );
    prodXInvY_uid27_divider_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 31, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXInvY_uid27_divider_im0_cma_s0, xout => prodXInvY_uid27_divider_im0_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXInvY_uid27_divider_im0_cma_q <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_im0_cma_qq(30 downto 0));

    -- prodXInvY_uid27_divider_im10_cma(CHAINMULTADD,247)@29 + 5
    -- out q@35
    prodXInvY_uid27_divider_im10_cma_reset <= rst;
    prodXInvY_uid27_divider_im10_cma_ena0 <= en(0) or prodXInvY_uid27_divider_im10_cma_reset;
    prodXInvY_uid27_divider_im10_cma_ena1 <= prodXInvY_uid27_divider_im10_cma_ena0;
    prodXInvY_uid27_divider_im10_cma_ena2 <= prodXInvY_uid27_divider_im10_cma_ena0;
    prodXInvY_uid27_divider_im10_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXInvY_uid27_divider_im10_cma_ah(0) <= RESIZE(UNSIGNED(prodXInvY_uid27_divider_bs6_b),18);
                    prodXInvY_uid27_divider_im10_cma_ch(0) <= RESIZE(UNSIGNED(prodXInvY_uid27_divider_bs9_b),18);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXInvY_uid27_divider_im10_cma_a0 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_im10_cma_ah(0));
    prodXInvY_uid27_divider_im10_cma_c0 <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_im10_cma_ch(0));
    prodXInvY_uid27_divider_im10_cma_DSP0 : fourteennm_mac
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
        ena(0) => prodXInvY_uid27_divider_im10_cma_ena0,
        ena(1) => prodXInvY_uid27_divider_im10_cma_ena1,
        ena(2) => prodXInvY_uid27_divider_im10_cma_ena2,
        clr(0) => prodXInvY_uid27_divider_im10_cma_reset,
        clr(1) => prodXInvY_uid27_divider_im10_cma_reset,
        ay => prodXInvY_uid27_divider_im10_cma_a0,
        ax => prodXInvY_uid27_divider_im10_cma_c0,
        resulta => prodXInvY_uid27_divider_im10_cma_s0
    );
    prodXInvY_uid27_divider_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXInvY_uid27_divider_im10_cma_s0, xout => prodXInvY_uid27_divider_im10_cma_qq, ena => en(0), clk => clk, aclr => rst );
    prodXInvY_uid27_divider_im10_cma_q <= STD_LOGIC_VECTOR(prodXInvY_uid27_divider_im10_cma_qq(35 downto 0));

    -- prodXInvY_uid27_divider_sums_join_0(BITJOIN,194)@35
    prodXInvY_uid27_divider_sums_join_0_q <= prodXInvY_uid27_divider_im0_cma_q & prodXInvY_uid27_divider_im10_cma_q;

    -- prodXInvY_uid27_divider_sums_result_add_0_0(ADD,197)@35 + 1
    prodXInvY_uid27_divider_sums_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => prodXInvY_uid27_divider_sums_join_0_q(66)) & prodXInvY_uid27_divider_sums_join_0_q));
    prodXInvY_uid27_divider_sums_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000" & prodXInvY_uid27_divider_sums_align_1_q));
    prodXInvY_uid27_divider_sums_result_add_0_0_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                prodXInvY_uid27_divider_sums_result_add_0_0_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    prodXInvY_uid27_divider_sums_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(prodXInvY_uid27_divider_sums_result_add_0_0_a) + SIGNED(prodXInvY_uid27_divider_sums_result_add_0_0_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    prodXInvY_uid27_divider_sums_result_add_0_0_q <= prodXInvY_uid27_divider_sums_result_add_0_0_o(67 downto 0);

    -- rightShiftStage0_uid211_prodPostRightShift_uid28_divider(MUX,210)@36
    rightShiftStage0_uid211_prodPostRightShift_uid28_divider_s <= rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select_b;
    rightShiftStage0_uid211_prodPostRightShift_uid28_divider_combproc: PROCESS (rightShiftStage0_uid211_prodPostRightShift_uid28_divider_s, prodXInvY_uid27_divider_sums_result_add_0_0_q, rightShiftStage0Idx1_uid203_prodPostRightShift_uid28_divider_q, rightShiftStage0Idx2_uid206_prodPostRightShift_uid28_divider_q, rightShiftStage0Idx3_uid209_prodPostRightShift_uid28_divider_q)
    BEGIN
        CASE (rightShiftStage0_uid211_prodPostRightShift_uid28_divider_s) IS
            WHEN "00" => rightShiftStage0_uid211_prodPostRightShift_uid28_divider_q <= prodXInvY_uid27_divider_sums_result_add_0_0_q(64 downto 0);
            WHEN "01" => rightShiftStage0_uid211_prodPostRightShift_uid28_divider_q <= rightShiftStage0Idx1_uid203_prodPostRightShift_uid28_divider_q;
            WHEN "10" => rightShiftStage0_uid211_prodPostRightShift_uid28_divider_q <= rightShiftStage0Idx2_uid206_prodPostRightShift_uid28_divider_q;
            WHEN "11" => rightShiftStage0_uid211_prodPostRightShift_uid28_divider_q <= rightShiftStage0Idx3_uid209_prodPostRightShift_uid28_divider_q;
            WHEN OTHERS => rightShiftStage0_uid211_prodPostRightShift_uid28_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid222_prodPostRightShift_uid28_divider(MUX,221)@36
    rightShiftStage1_uid222_prodPostRightShift_uid28_divider_s <= rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select_c;
    rightShiftStage1_uid222_prodPostRightShift_uid28_divider_combproc: PROCESS (rightShiftStage1_uid222_prodPostRightShift_uid28_divider_s, rightShiftStage0_uid211_prodPostRightShift_uid28_divider_q, rightShiftStage1Idx1_uid214_prodPostRightShift_uid28_divider_q, rightShiftStage1Idx2_uid217_prodPostRightShift_uid28_divider_q, rightShiftStage1Idx3_uid220_prodPostRightShift_uid28_divider_q)
    BEGIN
        CASE (rightShiftStage1_uid222_prodPostRightShift_uid28_divider_s) IS
            WHEN "00" => rightShiftStage1_uid222_prodPostRightShift_uid28_divider_q <= rightShiftStage0_uid211_prodPostRightShift_uid28_divider_q;
            WHEN "01" => rightShiftStage1_uid222_prodPostRightShift_uid28_divider_q <= rightShiftStage1Idx1_uid214_prodPostRightShift_uid28_divider_q;
            WHEN "10" => rightShiftStage1_uid222_prodPostRightShift_uid28_divider_q <= rightShiftStage1Idx2_uid217_prodPostRightShift_uid28_divider_q;
            WHEN "11" => rightShiftStage1_uid222_prodPostRightShift_uid28_divider_q <= rightShiftStage1Idx3_uid220_prodPostRightShift_uid28_divider_q;
            WHEN OTHERS => rightShiftStage1_uid222_prodPostRightShift_uid28_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage2_uid233_prodPostRightShift_uid28_divider(MUX,232)@36
    rightShiftStage2_uid233_prodPostRightShift_uid28_divider_s <= rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select_d;
    rightShiftStage2_uid233_prodPostRightShift_uid28_divider_combproc: PROCESS (rightShiftStage2_uid233_prodPostRightShift_uid28_divider_s, rightShiftStage1_uid222_prodPostRightShift_uid28_divider_q, rightShiftStage2Idx1_uid225_prodPostRightShift_uid28_divider_q, rightShiftStage2Idx2_uid228_prodPostRightShift_uid28_divider_q, rightShiftStage2Idx3_uid231_prodPostRightShift_uid28_divider_q)
    BEGIN
        CASE (rightShiftStage2_uid233_prodPostRightShift_uid28_divider_s) IS
            WHEN "00" => rightShiftStage2_uid233_prodPostRightShift_uid28_divider_q <= rightShiftStage1_uid222_prodPostRightShift_uid28_divider_q;
            WHEN "01" => rightShiftStage2_uid233_prodPostRightShift_uid28_divider_q <= rightShiftStage2Idx1_uid225_prodPostRightShift_uid28_divider_q;
            WHEN "10" => rightShiftStage2_uid233_prodPostRightShift_uid28_divider_q <= rightShiftStage2Idx2_uid228_prodPostRightShift_uid28_divider_q;
            WHEN "11" => rightShiftStage2_uid233_prodPostRightShift_uid28_divider_q <= rightShiftStage2Idx3_uid231_prodPostRightShift_uid28_divider_q;
            WHEN OTHERS => rightShiftStage2_uid233_prodPostRightShift_uid28_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist11_r_uid72_zCount_uid9_divider_q_32_notEnable(LOGICAL,343)
    redist11_r_uid72_zCount_uid9_divider_q_32_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist11_r_uid72_zCount_uid9_divider_q_32_nor(LOGICAL,344)
    redist11_r_uid72_zCount_uid9_divider_q_32_nor_q <= not (redist11_r_uid72_zCount_uid9_divider_q_32_notEnable_q or redist11_r_uid72_zCount_uid9_divider_q_32_sticky_ena_q);

    -- redist11_r_uid72_zCount_uid9_divider_q_32_mem_last(CONSTANT,340)
    redist11_r_uid72_zCount_uid9_divider_q_32_mem_last_q <= "011011";

    -- redist11_r_uid72_zCount_uid9_divider_q_32_cmp(LOGICAL,341)
    redist11_r_uid72_zCount_uid9_divider_q_32_cmp_b <= STD_LOGIC_VECTOR("0" & redist11_r_uid72_zCount_uid9_divider_q_32_rdmux_q);
    redist11_r_uid72_zCount_uid9_divider_q_32_cmp_q <= "1" WHEN redist11_r_uid72_zCount_uid9_divider_q_32_mem_last_q = redist11_r_uid72_zCount_uid9_divider_q_32_cmp_b ELSE "0";

    -- redist11_r_uid72_zCount_uid9_divider_q_32_cmpReg(REG,342)
    redist11_r_uid72_zCount_uid9_divider_q_32_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist11_r_uid72_zCount_uid9_divider_q_32_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist11_r_uid72_zCount_uid9_divider_q_32_cmpReg_q <= STD_LOGIC_VECTOR(redist11_r_uid72_zCount_uid9_divider_q_32_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist11_r_uid72_zCount_uid9_divider_q_32_sticky_ena(REG,345)
    redist11_r_uid72_zCount_uid9_divider_q_32_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist11_r_uid72_zCount_uid9_divider_q_32_sticky_ena_q <= "0";
            ELSE
                IF (redist11_r_uid72_zCount_uid9_divider_q_32_nor_q = "1") THEN
                    redist11_r_uid72_zCount_uid9_divider_q_32_sticky_ena_q <= STD_LOGIC_VECTOR(redist11_r_uid72_zCount_uid9_divider_q_32_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist11_r_uid72_zCount_uid9_divider_q_32_enaAnd(LOGICAL,346)
    redist11_r_uid72_zCount_uid9_divider_q_32_enaAnd_q <= redist11_r_uid72_zCount_uid9_divider_q_32_sticky_ena_q and en;

    -- redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt(COUNTER,337)
    -- low=0, high=28, step=1, init=0
    redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_i <= TO_UNSIGNED(0, 5);
                redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_i = TO_UNSIGNED(27, 5)) THEN
                        redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_eq <= '1';
                    ELSE
                        redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_eq <= '0';
                    END IF;
                    IF (redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_eq = '1') THEN
                        redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_i <= redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_i + 4;
                    ELSE
                        redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_i <= redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_i, 5)));

    -- redist11_r_uid72_zCount_uid9_divider_q_32_rdmux(MUX,338)
    redist11_r_uid72_zCount_uid9_divider_q_32_rdmux_s <= en;
    redist11_r_uid72_zCount_uid9_divider_q_32_rdmux_combproc: PROCESS (redist11_r_uid72_zCount_uid9_divider_q_32_rdmux_s, redist11_r_uid72_zCount_uid9_divider_q_32_wraddr_q, redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_q)
    BEGIN
        CASE (redist11_r_uid72_zCount_uid9_divider_q_32_rdmux_s) IS
            WHEN "0" => redist11_r_uid72_zCount_uid9_divider_q_32_rdmux_q <= redist11_r_uid72_zCount_uid9_divider_q_32_wraddr_q;
            WHEN "1" => redist11_r_uid72_zCount_uid9_divider_q_32_rdmux_q <= redist11_r_uid72_zCount_uid9_divider_q_32_rdcnt_q;
            WHEN OTHERS => redist11_r_uid72_zCount_uid9_divider_q_32_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist11_r_uid72_zCount_uid9_divider_q_32_wraddr(REG,339)
    redist11_r_uid72_zCount_uid9_divider_q_32_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist11_r_uid72_zCount_uid9_divider_q_32_wraddr_q <= "11100";
            ELSE
                redist11_r_uid72_zCount_uid9_divider_q_32_wraddr_q <= STD_LOGIC_VECTOR(redist11_r_uid72_zCount_uid9_divider_q_32_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_r_uid72_zCount_uid9_divider_q_32_mem(DUALMEM,336)
    redist11_r_uid72_zCount_uid9_divider_q_32_mem_ia <= STD_LOGIC_VECTOR(redist10_r_uid72_zCount_uid9_divider_q_1_q);
    redist11_r_uid72_zCount_uid9_divider_q_32_mem_aa <= redist11_r_uid72_zCount_uid9_divider_q_32_wraddr_q;
    redist11_r_uid72_zCount_uid9_divider_q_32_mem_ab <= redist11_r_uid72_zCount_uid9_divider_q_32_rdmux_q;
    redist11_r_uid72_zCount_uid9_divider_q_32_mem_reset0 <= rst;
    redist11_r_uid72_zCount_uid9_divider_q_32_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 5,
        numwords_a => 29,
        width_b => 6,
        widthad_b => 5,
        numwords_b => 29,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_sclr_b => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken1 => redist11_r_uid72_zCount_uid9_divider_q_32_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist11_r_uid72_zCount_uid9_divider_q_32_mem_reset0,
        clock1 => clk,
        address_a => redist11_r_uid72_zCount_uid9_divider_q_32_mem_aa,
        data_a => redist11_r_uid72_zCount_uid9_divider_q_32_mem_ia,
        wren_a => en(0),
        address_b => redist11_r_uid72_zCount_uid9_divider_q_32_mem_ab,
        q_b => redist11_r_uid72_zCount_uid9_divider_q_32_mem_iq
    );
    redist11_r_uid72_zCount_uid9_divider_q_32_mem_q <= redist11_r_uid72_zCount_uid9_divider_q_32_mem_iq(5 downto 0);

    -- redist11_r_uid72_zCount_uid9_divider_q_32_outputreg0(DELAY,335)
    redist11_r_uid72_zCount_uid9_divider_q_32_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist11_r_uid72_zCount_uid9_divider_q_32_outputreg0_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist11_r_uid72_zCount_uid9_divider_q_32_outputreg0_q <= STD_LOGIC_VECTOR(redist11_r_uid72_zCount_uid9_divider_q_32_mem_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- cWOut_uid25_divider(CONSTANT,24)
    cWOut_uid25_divider_q <= "11111";

    -- rShiftCount_uid26_divider(SUB,25)@35 + 1
    rShiftCount_uid26_divider_a <= STD_LOGIC_VECTOR("00" & cWOut_uid25_divider_q);
    rShiftCount_uid26_divider_b <= STD_LOGIC_VECTOR("0" & redist11_r_uid72_zCount_uid9_divider_q_32_outputreg0_q);
    rShiftCount_uid26_divider_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                rShiftCount_uid26_divider_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    rShiftCount_uid26_divider_o <= STD_LOGIC_VECTOR(UNSIGNED(rShiftCount_uid26_divider_a) - UNSIGNED(rShiftCount_uid26_divider_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    rShiftCount_uid26_divider_q <= rShiftCount_uid26_divider_o(6 downto 0);

    -- rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select(BITSELECT,251)@36
    rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select_b <= rShiftCount_uid26_divider_q(1 downto 0);
    rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select_c <= rShiftCount_uid26_divider_q(3 downto 2);
    rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select_d <= rShiftCount_uid26_divider_q(5 downto 4);
    rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select_e <= rShiftCount_uid26_divider_q(6 downto 6);

    -- rightShiftStage3_uid238_prodPostRightShift_uid28_divider(MUX,237)@36
    rightShiftStage3_uid238_prodPostRightShift_uid28_divider_s <= rightShiftStageSel0Dto0_uid210_prodPostRightShift_uid28_divider_merged_bit_select_e;
    rightShiftStage3_uid238_prodPostRightShift_uid28_divider_combproc: PROCESS (rightShiftStage3_uid238_prodPostRightShift_uid28_divider_s, rightShiftStage2_uid233_prodPostRightShift_uid28_divider_q, rightShiftStage3Idx1_uid236_prodPostRightShift_uid28_divider_q)
    BEGIN
        CASE (rightShiftStage3_uid238_prodPostRightShift_uid28_divider_s) IS
            WHEN "0" => rightShiftStage3_uid238_prodPostRightShift_uid28_divider_q <= rightShiftStage2_uid233_prodPostRightShift_uid28_divider_q;
            WHEN "1" => rightShiftStage3_uid238_prodPostRightShift_uid28_divider_q <= rightShiftStage3Idx1_uid236_prodPostRightShift_uid28_divider_q;
            WHEN OTHERS => rightShiftStage3_uid238_prodPostRightShift_uid28_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- prodPostRightShiftPost_uid29_divider(BITSELECT,28)@36
    prodPostRightShiftPost_uid29_divider_in <= rightShiftStage3_uid238_prodPostRightShift_uid28_divider_q(63 downto 0);
    prodPostRightShiftPost_uid29_divider_b <= prodPostRightShiftPost_uid29_divider_in(63 downto 31);

    -- redist16_prodPostRightShiftPost_uid29_divider_b_1(DELAY,275)
    redist16_prodPostRightShiftPost_uid29_divider_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist16_prodPostRightShiftPost_uid29_divider_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist16_prodPostRightShiftPost_uid29_divider_b_1_q <= STD_LOGIC_VECTOR(prodPostRightShiftPost_uid29_divider_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- prodPostRightShiftPostRnd_uid34_divider(ADD,33)@37
    prodPostRightShiftPostRnd_uid34_divider_a <= STD_LOGIC_VECTOR("0" & redist16_prodPostRightShiftPost_uid29_divider_b_1_q);
    prodPostRightShiftPostRnd_uid34_divider_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000" & addOp2_uid33_divider_q);
    prodPostRightShiftPostRnd_uid34_divider_o <= STD_LOGIC_VECTOR(UNSIGNED(prodPostRightShiftPostRnd_uid34_divider_a) + UNSIGNED(prodPostRightShiftPostRnd_uid34_divider_b));
    prodPostRightShiftPostRnd_uid34_divider_q <= prodPostRightShiftPostRnd_uid34_divider_o(33 downto 0);

    -- prodPostRightShiftPostRndRange_uid35_divider(BITSELECT,34)@37
    prodPostRightShiftPostRndRange_uid35_divider_in <= prodPostRightShiftPostRnd_uid34_divider_q(32 downto 0);
    prodPostRightShiftPostRndRange_uid35_divider_b <= prodPostRightShiftPostRndRange_uid35_divider_in(32 downto 1);

    -- redist15_prodPostRightShiftPostRndRange_uid35_divider_b_1(DELAY,274)
    redist15_prodPostRightShiftPostRndRange_uid35_divider_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist15_prodPostRightShiftPostRndRange_uid35_divider_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist15_prodPostRightShiftPostRndRange_uid35_divider_b_1_q <= STD_LOGIC_VECTOR(prodPostRightShiftPostRndRange_uid35_divider_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- yIsZero_uid17_divider(LOGICAL,16)@4 + 1
    yIsZero_uid17_divider_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000" & GND_q);
    yIsZero_uid17_divider_qi <= "1" WHEN redist23_in_rsrvd_fix_denominator_4_q = yIsZero_uid17_divider_b ELSE "0";
    yIsZero_uid17_divider_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => yIsZero_uid17_divider_qi, xout => yIsZero_uid17_divider_q, ena => en(0), clk => clk, aclr => rst );

    -- redist17_yIsZero_uid17_divider_q_34(DELAY,276)
    redist17_yIsZero_uid17_divider_q_34 : dspba_delay
    GENERIC MAP ( width => 1, depth => 33, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => yIsZero_uid17_divider_q, xout => redist17_yIsZero_uid17_divider_q_34_q, ena => en(0), clk => clk, aclr => rst );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- resFinal_uid37_divider(MUX,36)@38
    resFinal_uid37_divider_s <= redist17_yIsZero_uid17_divider_q_34_q;
    resFinal_uid37_divider_combproc: PROCESS (resFinal_uid37_divider_s, redist15_prodPostRightShiftPostRndRange_uid35_divider_b_1_q, cstValOvf_uid36_divider_q)
    BEGIN
        CASE (resFinal_uid37_divider_s) IS
            WHEN "0" => resFinal_uid37_divider_q <= redist15_prodPostRightShiftPostRndRange_uid35_divider_b_1_q;
            WHEN "1" => resFinal_uid37_divider_q <= cstValOvf_uid36_divider_q;
            WHEN OTHERS => resFinal_uid37_divider_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_rsrvd_fix(GPOUT,5)@38
    result <= resFinal_uid37_divider_q;

END normal;
