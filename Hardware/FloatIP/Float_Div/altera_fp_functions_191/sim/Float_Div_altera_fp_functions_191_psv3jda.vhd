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

-- VHDL created from Float_Div_altera_fp_functions_191_psv3jda
-- VHDL created on Mon Apr 19 21:30:40 2021


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

entity Float_Div_altera_fp_functions_191_psv3jda is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end Float_Div_altera_fp_functions_191_psv3jda;

architecture normal of Float_Div_altera_fp_functions_191_psv3jda is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBiasM1_uid6_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expX_uid9_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid10_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signX_uid11_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expY_uid12_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracY_uid13_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signY_uid14_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal paddingY_uid15_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal updatedY_uid16_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid18_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWE_uid20_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid23_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid23_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid27_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid28_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid31_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid31_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid41_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid42_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid45_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXmY_uid47_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid48_fpDivTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal yAddr_uid51_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal yPE_uid52_fpDivTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal fracYPostZ_uid56_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYPostZ_uid56_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal lOAdded_uid58_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oFracXSE_bottomExtension_uid61_fpDivTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oFracXSE_mergedSignalTM_uid63_fpDivTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal divValPreNormTrunc_uid66_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormTrunc_uid66_fpDivTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal norm_uid67_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormHigh_uid68_fpDivTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal divValPreNormHigh_uid68_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal divValPreNormLow_uid69_fpDivTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal divValPreNormLow_uid69_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal normFracRnd_uid70_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracRnd_uid70_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracRnd_uid71_fpDivTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndOp_uid75_fpDivTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal fracRPreExc_uid78_fpDivTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid78_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excRPreExc_uid79_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal excRPreExc_uid79_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRExt_uid80_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expUdf_uid81_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid81_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid81_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid81_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid84_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid84_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid84_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid84_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid85_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid86_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid87_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid88_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid89_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid90_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid91_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid92_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid93_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid94_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid95_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid96_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid97_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid98_fpDivTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid99_fpDivTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid100_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid103_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid103_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid107_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid107_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid108_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid109_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid109_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal divR_uid110_fpDivTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yT1_uid124_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal lowRangeB_uid126_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid126_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid127_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_a : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_o : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal s1_uid129_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal lowRangeB_uid132_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid132_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid133_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_a : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_o : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal s2_uid135_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal osig_uid141_pT1_uid125_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid144_pT2_uid131_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC0_uid112_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid112_invTables_lutmem_ia : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC0_uid112_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid112_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid112_invTables_lutmem_ir : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC0_uid112_invTables_lutmem_r : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC1_uid115_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid115_invTables_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid115_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid115_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid115_invTables_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid115_invTables_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid118_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid118_invTables_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid118_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid118_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid118_invTables_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid118_invTables_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset : std_logic;
    type prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ahtype is array(NATURAL range <>) of UNSIGNED(25 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ah : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ahtype(0 to 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ah : signal is true;
    type prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_chtype is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ch : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ch : signal is true;
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0 : STD_LOGIC_VECTOR (25 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s0 : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_qq : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_q : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0 : std_logic;
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena1 : std_logic;
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena2 : std_logic;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_reset : std_logic;
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(11 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ah : prodXY_uid140_pT1_uid125_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid140_pT1_uid125_invPolyEval_cma_ah : signal is true;
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(11 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ch : prodXY_uid140_pT1_uid125_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid140_pT1_uid125_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_qq : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_ena2 : std_logic;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_reset : std_logic;
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ah : prodXY_uid143_pT2_uid131_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid143_pT2_uid131_invPolyEval_cma_ah : signal is true;
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(22 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ch : prodXY_uid143_pT2_uid131_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid143_pT2_uid131_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (13 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (22 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_ena2 : std_logic;
    signal invY_uid54_fpDivTest_merged_bit_select_in : STD_LOGIC_VECTOR (31 downto 0);
    signal invY_uid54_fpDivTest_merged_bit_select_b : STD_LOGIC_VECTOR (25 downto 0);
    signal invY_uid54_fpDivTest_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_invY_uid54_fpDivTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist1_excRNaN_uid97_fpDivTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_fracYPostZ_uid56_fpDivTest_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_yPE_uid52_fpDivTest_b_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist4_yPE_uid52_fpDivTest_b_2_delay_0 : STD_LOGIC_VECTOR (13 downto 0);
    signal redist6_yAddr_uid51_fpDivTest_b_5_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist6_yAddr_uid51_fpDivTest_b_5_delay_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist6_yAddr_uid51_fpDivTest_b_5_delay_1 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist6_yAddr_uid51_fpDivTest_b_5_delay_2 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist6_yAddr_uid51_fpDivTest_b_5_delay_3 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist7_yAddr_uid51_fpDivTest_b_10_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist7_yAddr_uid51_fpDivTest_b_10_delay_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist7_yAddr_uid51_fpDivTest_b_10_delay_1 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist7_yAddr_uid51_fpDivTest_b_10_delay_2 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist7_yAddr_uid51_fpDivTest_b_10_delay_3 : STD_LOGIC_VECTOR (8 downto 0);
    signal redist9_signR_uid46_fpDivTest_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_excI_y_uid41_fpDivTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_fracXIsZero_uid39_fpDivTest_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_expXIsMax_uid38_fpDivTest_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_expXIsMax_uid38_fpDivTest_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_excZ_y_uid37_fpDivTest_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_excZ_y_uid37_fpDivTest_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_excI_x_uid27_fpDivTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_fracXIsZero_uid25_fpDivTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_fracXIsZero_uid25_fpDivTest_q_5_delay_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_fracXIsZero_uid25_fpDivTest_q_5_delay_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_fracXIsZero_uid25_fpDivTest_q_5_delay_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_expXIsMax_uid24_fpDivTest_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_excZ_x_uid23_fpDivTest_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_excZ_x_uid23_fpDivTest_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_fracYZero_uid15_fpDivTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_mem_reset0 : std_logic;
    signal redist2_lOAdded_uid58_fpDivTest_q_5_mem_ia : STD_LOGIC_VECTOR (23 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_mem_iq : STD_LOGIC_VECTOR (23 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_mem_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist2_lOAdded_uid58_fpDivTest_q_5_rdcnt_i : signal is true;
    signal redist2_lOAdded_uid58_fpDivTest_q_5_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_rdmux_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_lOAdded_uid58_fpDivTest_q_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist2_lOAdded_uid58_fpDivTest_q_5_sticky_ena_q : signal is true;
    signal redist2_lOAdded_uid58_fpDivTest_q_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_mem_reset0 : std_logic;
    signal redist5_yPE_uid52_fpDivTest_b_7_mem_ia : STD_LOGIC_VECTOR (13 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_mem_iq : STD_LOGIC_VECTOR (13 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_mem_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve_syn_only of redist5_yPE_uid52_fpDivTest_b_7_rdcnt_i : signal is true;
    signal redist5_yPE_uid52_fpDivTest_b_7_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_rdmux_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yPE_uid52_fpDivTest_b_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist5_yPE_uid52_fpDivTest_b_7_sticky_ena_q : signal is true;
    signal redist5_yPE_uid52_fpDivTest_b_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_mem_reset0 : std_logic;
    signal redist8_expXmY_uid47_fpDivTest_q_18_mem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_mem_iq : STD_LOGIC_VECTOR (8 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_mem_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve_syn_only of redist8_expXmY_uid47_fpDivTest_q_18_rdcnt_i : signal is true;
    signal redist8_expXmY_uid47_fpDivTest_q_18_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_rdmux_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_expXmY_uid47_fpDivTest_q_18_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist8_expXmY_uid47_fpDivTest_q_18_sticky_ena_q : signal is true;
    signal redist8_expXmY_uid47_fpDivTest_q_18_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_mem_reset0 : std_logic;
    signal redist22_fracX_uid10_fpDivTest_b_13_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve_syn_only of redist22_fracX_uid10_fpDivTest_b_13_rdcnt_i : signal is true;
    signal redist22_fracX_uid10_fpDivTest_b_13_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist22_fracX_uid10_fpDivTest_b_13_rdcnt_eq : signal is true;
    signal redist22_fracX_uid10_fpDivTest_b_13_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_rdmux_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_fracX_uid10_fpDivTest_b_13_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist22_fracX_uid10_fpDivTest_b_13_sticky_ena_q : signal is true;
    signal redist22_fracX_uid10_fpDivTest_b_13_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- fracY_uid13_fpDivTest(BITSELECT,12)@0
    fracY_uid13_fpDivTest_b <= b(22 downto 0);

    -- paddingY_uid15_fpDivTest(CONSTANT,14)
    paddingY_uid15_fpDivTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid39_fpDivTest(LOGICAL,38)@0 + 1
    fracXIsZero_uid39_fpDivTest_qi <= "1" WHEN paddingY_uid15_fpDivTest_q = fracY_uid13_fpDivTest_b ELSE "0";
    fracXIsZero_uid39_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid39_fpDivTest_qi, xout => fracXIsZero_uid39_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist11_fracXIsZero_uid39_fpDivTest_q_18(DELAY,163)
    redist11_fracXIsZero_uid39_fpDivTest_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid39_fpDivTest_q, xout => redist11_fracXIsZero_uid39_fpDivTest_q_18_q, ena => en(0), clk => clk, aclr => areset );

    -- cstAllOWE_uid18_fpDivTest(CONSTANT,17)
    cstAllOWE_uid18_fpDivTest_q <= "11111111";

    -- expY_uid12_fpDivTest(BITSELECT,11)@0
    expY_uid12_fpDivTest_b <= b(30 downto 23);

    -- expXIsMax_uid38_fpDivTest(LOGICAL,37)@0 + 1
    expXIsMax_uid38_fpDivTest_qi <= "1" WHEN expY_uid12_fpDivTest_b = cstAllOWE_uid18_fpDivTest_q ELSE "0";
    expXIsMax_uid38_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid38_fpDivTest_qi, xout => expXIsMax_uid38_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist12_expXIsMax_uid38_fpDivTest_q_18(DELAY,164)
    redist12_expXIsMax_uid38_fpDivTest_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid38_fpDivTest_q, xout => redist12_expXIsMax_uid38_fpDivTest_q_18_q, ena => en(0), clk => clk, aclr => areset );

    -- excI_y_uid41_fpDivTest(LOGICAL,40)@18
    excI_y_uid41_fpDivTest_q <= redist12_expXIsMax_uid38_fpDivTest_q_18_q and redist11_fracXIsZero_uid39_fpDivTest_q_18_q;

    -- redist22_fracX_uid10_fpDivTest_b_13_notEnable(LOGICAL,215)
    redist22_fracX_uid10_fpDivTest_b_13_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist22_fracX_uid10_fpDivTest_b_13_nor(LOGICAL,216)
    redist22_fracX_uid10_fpDivTest_b_13_nor_q <= not (redist22_fracX_uid10_fpDivTest_b_13_notEnable_q or redist22_fracX_uid10_fpDivTest_b_13_sticky_ena_q);

    -- redist22_fracX_uid10_fpDivTest_b_13_mem_last(CONSTANT,212)
    redist22_fracX_uid10_fpDivTest_b_13_mem_last_q <= "01010";

    -- redist22_fracX_uid10_fpDivTest_b_13_cmp(LOGICAL,213)
    redist22_fracX_uid10_fpDivTest_b_13_cmp_b <= STD_LOGIC_VECTOR("0" & redist22_fracX_uid10_fpDivTest_b_13_rdmux_q);
    redist22_fracX_uid10_fpDivTest_b_13_cmp_q <= "1" WHEN redist22_fracX_uid10_fpDivTest_b_13_mem_last_q = redist22_fracX_uid10_fpDivTest_b_13_cmp_b ELSE "0";

    -- redist22_fracX_uid10_fpDivTest_b_13_cmpReg(REG,214)
    redist22_fracX_uid10_fpDivTest_b_13_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist22_fracX_uid10_fpDivTest_b_13_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist22_fracX_uid10_fpDivTest_b_13_cmpReg_q <= STD_LOGIC_VECTOR(redist22_fracX_uid10_fpDivTest_b_13_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist22_fracX_uid10_fpDivTest_b_13_sticky_ena(REG,217)
    redist22_fracX_uid10_fpDivTest_b_13_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist22_fracX_uid10_fpDivTest_b_13_sticky_ena_q <= "0";
            ELSE
                IF (redist22_fracX_uid10_fpDivTest_b_13_nor_q = "1") THEN
                    redist22_fracX_uid10_fpDivTest_b_13_sticky_ena_q <= STD_LOGIC_VECTOR(redist22_fracX_uid10_fpDivTest_b_13_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist22_fracX_uid10_fpDivTest_b_13_enaAnd(LOGICAL,218)
    redist22_fracX_uid10_fpDivTest_b_13_enaAnd_q <= redist22_fracX_uid10_fpDivTest_b_13_sticky_ena_q and en;

    -- redist22_fracX_uid10_fpDivTest_b_13_rdcnt(COUNTER,209)
    -- low=0, high=11, step=1, init=0
    redist22_fracX_uid10_fpDivTest_b_13_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist22_fracX_uid10_fpDivTest_b_13_rdcnt_i <= TO_UNSIGNED(0, 4);
                redist22_fracX_uid10_fpDivTest_b_13_rdcnt_eq <= '0';
            ELSE
                IF (en = "1") THEN
                    IF (redist22_fracX_uid10_fpDivTest_b_13_rdcnt_i = TO_UNSIGNED(10, 4)) THEN
                        redist22_fracX_uid10_fpDivTest_b_13_rdcnt_eq <= '1';
                    ELSE
                        redist22_fracX_uid10_fpDivTest_b_13_rdcnt_eq <= '0';
                    END IF;
                    IF (redist22_fracX_uid10_fpDivTest_b_13_rdcnt_eq = '1') THEN
                        redist22_fracX_uid10_fpDivTest_b_13_rdcnt_i <= redist22_fracX_uid10_fpDivTest_b_13_rdcnt_i + 5;
                    ELSE
                        redist22_fracX_uid10_fpDivTest_b_13_rdcnt_i <= redist22_fracX_uid10_fpDivTest_b_13_rdcnt_i + 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist22_fracX_uid10_fpDivTest_b_13_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist22_fracX_uid10_fpDivTest_b_13_rdcnt_i, 4)));

    -- redist22_fracX_uid10_fpDivTest_b_13_rdmux(MUX,210)
    redist22_fracX_uid10_fpDivTest_b_13_rdmux_s <= en;
    redist22_fracX_uid10_fpDivTest_b_13_rdmux_combproc: PROCESS (redist22_fracX_uid10_fpDivTest_b_13_rdmux_s, redist22_fracX_uid10_fpDivTest_b_13_wraddr_q, redist22_fracX_uid10_fpDivTest_b_13_rdcnt_q)
    BEGIN
        CASE (redist22_fracX_uid10_fpDivTest_b_13_rdmux_s) IS
            WHEN "0" => redist22_fracX_uid10_fpDivTest_b_13_rdmux_q <= redist22_fracX_uid10_fpDivTest_b_13_wraddr_q;
            WHEN "1" => redist22_fracX_uid10_fpDivTest_b_13_rdmux_q <= redist22_fracX_uid10_fpDivTest_b_13_rdcnt_q;
            WHEN OTHERS => redist22_fracX_uid10_fpDivTest_b_13_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- fracX_uid10_fpDivTest(BITSELECT,9)@0
    fracX_uid10_fpDivTest_b <= a(22 downto 0);

    -- redist22_fracX_uid10_fpDivTest_b_13_wraddr(REG,211)
    redist22_fracX_uid10_fpDivTest_b_13_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist22_fracX_uid10_fpDivTest_b_13_wraddr_q <= "1011";
            ELSE
                redist22_fracX_uid10_fpDivTest_b_13_wraddr_q <= STD_LOGIC_VECTOR(redist22_fracX_uid10_fpDivTest_b_13_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist22_fracX_uid10_fpDivTest_b_13_mem(DUALMEM,208)
    redist22_fracX_uid10_fpDivTest_b_13_mem_ia <= STD_LOGIC_VECTOR(fracX_uid10_fpDivTest_b);
    redist22_fracX_uid10_fpDivTest_b_13_mem_aa <= redist22_fracX_uid10_fpDivTest_b_13_wraddr_q;
    redist22_fracX_uid10_fpDivTest_b_13_mem_ab <= redist22_fracX_uid10_fpDivTest_b_13_rdmux_q;
    redist22_fracX_uid10_fpDivTest_b_13_mem_reset0 <= areset;
    redist22_fracX_uid10_fpDivTest_b_13_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 23,
        widthad_b => 4,
        numwords_b => 12,
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
        clocken1 => redist22_fracX_uid10_fpDivTest_b_13_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist22_fracX_uid10_fpDivTest_b_13_mem_reset0,
        clock1 => clk,
        address_a => redist22_fracX_uid10_fpDivTest_b_13_mem_aa,
        data_a => redist22_fracX_uid10_fpDivTest_b_13_mem_ia,
        wren_a => en(0),
        address_b => redist22_fracX_uid10_fpDivTest_b_13_mem_ab,
        q_b => redist22_fracX_uid10_fpDivTest_b_13_mem_iq
    );
    redist22_fracX_uid10_fpDivTest_b_13_mem_q <= redist22_fracX_uid10_fpDivTest_b_13_mem_iq(22 downto 0);

    -- fracXIsZero_uid25_fpDivTest(LOGICAL,24)@13 + 1
    fracXIsZero_uid25_fpDivTest_qi <= "1" WHEN paddingY_uid15_fpDivTest_q = redist22_fracX_uid10_fpDivTest_b_13_mem_q ELSE "0";
    fracXIsZero_uid25_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid25_fpDivTest_qi, xout => fracXIsZero_uid25_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist17_fracXIsZero_uid25_fpDivTest_q_5(DELAY,169)
    redist17_fracXIsZero_uid25_fpDivTest_q_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist17_fracXIsZero_uid25_fpDivTest_q_5_delay_0 <= (others => '0');
                redist17_fracXIsZero_uid25_fpDivTest_q_5_delay_1 <= (others => '0');
                redist17_fracXIsZero_uid25_fpDivTest_q_5_delay_2 <= (others => '0');
                redist17_fracXIsZero_uid25_fpDivTest_q_5_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist17_fracXIsZero_uid25_fpDivTest_q_5_delay_0 <= STD_LOGIC_VECTOR(fracXIsZero_uid25_fpDivTest_q);
                    redist17_fracXIsZero_uid25_fpDivTest_q_5_delay_1 <= redist17_fracXIsZero_uid25_fpDivTest_q_5_delay_0;
                    redist17_fracXIsZero_uid25_fpDivTest_q_5_delay_2 <= redist17_fracXIsZero_uid25_fpDivTest_q_5_delay_1;
                    redist17_fracXIsZero_uid25_fpDivTest_q_5_q <= redist17_fracXIsZero_uid25_fpDivTest_q_5_delay_2;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- expX_uid9_fpDivTest(BITSELECT,8)@0
    expX_uid9_fpDivTest_b <= a(30 downto 23);

    -- expXIsMax_uid24_fpDivTest(LOGICAL,23)@0 + 1
    expXIsMax_uid24_fpDivTest_qi <= "1" WHEN expX_uid9_fpDivTest_b = cstAllOWE_uid18_fpDivTest_q ELSE "0";
    expXIsMax_uid24_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid24_fpDivTest_qi, xout => expXIsMax_uid24_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist18_expXIsMax_uid24_fpDivTest_q_18(DELAY,170)
    redist18_expXIsMax_uid24_fpDivTest_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => expXIsMax_uid24_fpDivTest_q, xout => redist18_expXIsMax_uid24_fpDivTest_q_18_q, ena => en(0), clk => clk, aclr => areset );

    -- excI_x_uid27_fpDivTest(LOGICAL,26)@18
    excI_x_uid27_fpDivTest_q <= redist18_expXIsMax_uid24_fpDivTest_q_18_q and redist17_fracXIsZero_uid25_fpDivTest_q_5_q;

    -- excXIYI_uid96_fpDivTest(LOGICAL,95)@18
    excXIYI_uid96_fpDivTest_q <= excI_x_uid27_fpDivTest_q and excI_y_uid41_fpDivTest_q;

    -- fracXIsNotZero_uid40_fpDivTest(LOGICAL,39)@18
    fracXIsNotZero_uid40_fpDivTest_q <= not (redist11_fracXIsZero_uid39_fpDivTest_q_18_q);

    -- excN_y_uid42_fpDivTest(LOGICAL,41)@18
    excN_y_uid42_fpDivTest_q <= redist12_expXIsMax_uid38_fpDivTest_q_18_q and fracXIsNotZero_uid40_fpDivTest_q;

    -- fracXIsNotZero_uid26_fpDivTest(LOGICAL,25)@18
    fracXIsNotZero_uid26_fpDivTest_q <= not (redist17_fracXIsZero_uid25_fpDivTest_q_5_q);

    -- excN_x_uid28_fpDivTest(LOGICAL,27)@18
    excN_x_uid28_fpDivTest_q <= redist18_expXIsMax_uid24_fpDivTest_q_18_q and fracXIsNotZero_uid26_fpDivTest_q;

    -- cstAllZWE_uid20_fpDivTest(CONSTANT,19)
    cstAllZWE_uid20_fpDivTest_q <= "00000000";

    -- excZ_y_uid37_fpDivTest(LOGICAL,36)@0 + 1
    excZ_y_uid37_fpDivTest_qi <= "1" WHEN expY_uid12_fpDivTest_b = cstAllZWE_uid20_fpDivTest_q ELSE "0";
    excZ_y_uid37_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_y_uid37_fpDivTest_qi, xout => excZ_y_uid37_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist14_excZ_y_uid37_fpDivTest_q_18(DELAY,166)
    redist14_excZ_y_uid37_fpDivTest_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_y_uid37_fpDivTest_q, xout => redist14_excZ_y_uid37_fpDivTest_q_18_q, ena => en(0), clk => clk, aclr => areset );

    -- excZ_x_uid23_fpDivTest(LOGICAL,22)@0 + 1
    excZ_x_uid23_fpDivTest_qi <= "1" WHEN expX_uid9_fpDivTest_b = cstAllZWE_uid20_fpDivTest_q ELSE "0";
    excZ_x_uid23_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_x_uid23_fpDivTest_qi, xout => excZ_x_uid23_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist19_excZ_x_uid23_fpDivTest_q_18(DELAY,171)
    redist19_excZ_x_uid23_fpDivTest_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excZ_x_uid23_fpDivTest_q, xout => redist19_excZ_x_uid23_fpDivTest_q_18_q, ena => en(0), clk => clk, aclr => areset );

    -- excXZYZ_uid95_fpDivTest(LOGICAL,94)@18
    excXZYZ_uid95_fpDivTest_q <= redist19_excZ_x_uid23_fpDivTest_q_18_q and redist14_excZ_y_uid37_fpDivTest_q_18_q;

    -- excRNaN_uid97_fpDivTest(LOGICAL,96)@18
    excRNaN_uid97_fpDivTest_q <= excXZYZ_uid95_fpDivTest_q or excN_x_uid28_fpDivTest_q or excN_y_uid42_fpDivTest_q or excXIYI_uid96_fpDivTest_q;

    -- invExcRNaN_uid108_fpDivTest(LOGICAL,107)@18
    invExcRNaN_uid108_fpDivTest_q <= not (excRNaN_uid97_fpDivTest_q);

    -- signY_uid14_fpDivTest(BITSELECT,13)@0
    signY_uid14_fpDivTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- signX_uid11_fpDivTest(BITSELECT,10)@0
    signX_uid11_fpDivTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- signR_uid46_fpDivTest(LOGICAL,45)@0 + 1
    signR_uid46_fpDivTest_qi <= signX_uid11_fpDivTest_b xor signY_uid14_fpDivTest_b;
    signR_uid46_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid46_fpDivTest_qi, xout => signR_uid46_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist9_signR_uid46_fpDivTest_q_18(DELAY,161)
    redist9_signR_uid46_fpDivTest_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid46_fpDivTest_q, xout => redist9_signR_uid46_fpDivTest_q_18_q, ena => en(0), clk => clk, aclr => areset );

    -- sRPostExc_uid109_fpDivTest(LOGICAL,108)@18 + 1
    sRPostExc_uid109_fpDivTest_qi <= redist9_signR_uid46_fpDivTest_q_18_q and invExcRNaN_uid108_fpDivTest_q;
    sRPostExc_uid109_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => sRPostExc_uid109_fpDivTest_qi, xout => sRPostExc_uid109_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist2_lOAdded_uid58_fpDivTest_q_5_notEnable(LOGICAL,182)
    redist2_lOAdded_uid58_fpDivTest_q_5_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist2_lOAdded_uid58_fpDivTest_q_5_nor(LOGICAL,183)
    redist2_lOAdded_uid58_fpDivTest_q_5_nor_q <= not (redist2_lOAdded_uid58_fpDivTest_q_5_notEnable_q or redist2_lOAdded_uid58_fpDivTest_q_5_sticky_ena_q);

    -- redist2_lOAdded_uid58_fpDivTest_q_5_mem_last(CONSTANT,179)
    redist2_lOAdded_uid58_fpDivTest_q_5_mem_last_q <= "010";

    -- redist2_lOAdded_uid58_fpDivTest_q_5_cmp(LOGICAL,180)
    redist2_lOAdded_uid58_fpDivTest_q_5_cmp_b <= STD_LOGIC_VECTOR("0" & redist2_lOAdded_uid58_fpDivTest_q_5_rdmux_q);
    redist2_lOAdded_uid58_fpDivTest_q_5_cmp_q <= "1" WHEN redist2_lOAdded_uid58_fpDivTest_q_5_mem_last_q = redist2_lOAdded_uid58_fpDivTest_q_5_cmp_b ELSE "0";

    -- redist2_lOAdded_uid58_fpDivTest_q_5_cmpReg(REG,181)
    redist2_lOAdded_uid58_fpDivTest_q_5_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_lOAdded_uid58_fpDivTest_q_5_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist2_lOAdded_uid58_fpDivTest_q_5_cmpReg_q <= STD_LOGIC_VECTOR(redist2_lOAdded_uid58_fpDivTest_q_5_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist2_lOAdded_uid58_fpDivTest_q_5_sticky_ena(REG,184)
    redist2_lOAdded_uid58_fpDivTest_q_5_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_lOAdded_uid58_fpDivTest_q_5_sticky_ena_q <= "0";
            ELSE
                IF (redist2_lOAdded_uid58_fpDivTest_q_5_nor_q = "1") THEN
                    redist2_lOAdded_uid58_fpDivTest_q_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist2_lOAdded_uid58_fpDivTest_q_5_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist2_lOAdded_uid58_fpDivTest_q_5_enaAnd(LOGICAL,185)
    redist2_lOAdded_uid58_fpDivTest_q_5_enaAnd_q <= redist2_lOAdded_uid58_fpDivTest_q_5_sticky_ena_q and en;

    -- redist2_lOAdded_uid58_fpDivTest_q_5_rdcnt(COUNTER,176)
    -- low=0, high=3, step=1, init=0
    redist2_lOAdded_uid58_fpDivTest_q_5_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_lOAdded_uid58_fpDivTest_q_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            ELSE
                IF (en = "1") THEN
                    redist2_lOAdded_uid58_fpDivTest_q_5_rdcnt_i <= redist2_lOAdded_uid58_fpDivTest_q_5_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist2_lOAdded_uid58_fpDivTest_q_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist2_lOAdded_uid58_fpDivTest_q_5_rdcnt_i, 2)));

    -- redist2_lOAdded_uid58_fpDivTest_q_5_rdmux(MUX,177)
    redist2_lOAdded_uid58_fpDivTest_q_5_rdmux_s <= en;
    redist2_lOAdded_uid58_fpDivTest_q_5_rdmux_combproc: PROCESS (redist2_lOAdded_uid58_fpDivTest_q_5_rdmux_s, redist2_lOAdded_uid58_fpDivTest_q_5_wraddr_q, redist2_lOAdded_uid58_fpDivTest_q_5_rdcnt_q)
    BEGIN
        CASE (redist2_lOAdded_uid58_fpDivTest_q_5_rdmux_s) IS
            WHEN "0" => redist2_lOAdded_uid58_fpDivTest_q_5_rdmux_q <= redist2_lOAdded_uid58_fpDivTest_q_5_wraddr_q;
            WHEN "1" => redist2_lOAdded_uid58_fpDivTest_q_5_rdmux_q <= redist2_lOAdded_uid58_fpDivTest_q_5_rdcnt_q;
            WHEN OTHERS => redist2_lOAdded_uid58_fpDivTest_q_5_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- lOAdded_uid58_fpDivTest(BITJOIN,57)@13
    lOAdded_uid58_fpDivTest_q <= VCC_q & redist22_fracX_uid10_fpDivTest_b_13_mem_q;

    -- redist2_lOAdded_uid58_fpDivTest_q_5_wraddr(REG,178)
    redist2_lOAdded_uid58_fpDivTest_q_5_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_lOAdded_uid58_fpDivTest_q_5_wraddr_q <= "11";
            ELSE
                redist2_lOAdded_uid58_fpDivTest_q_5_wraddr_q <= STD_LOGIC_VECTOR(redist2_lOAdded_uid58_fpDivTest_q_5_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_lOAdded_uid58_fpDivTest_q_5_mem(DUALMEM,175)
    redist2_lOAdded_uid58_fpDivTest_q_5_mem_ia <= STD_LOGIC_VECTOR(lOAdded_uid58_fpDivTest_q);
    redist2_lOAdded_uid58_fpDivTest_q_5_mem_aa <= redist2_lOAdded_uid58_fpDivTest_q_5_wraddr_q;
    redist2_lOAdded_uid58_fpDivTest_q_5_mem_ab <= redist2_lOAdded_uid58_fpDivTest_q_5_rdmux_q;
    redist2_lOAdded_uid58_fpDivTest_q_5_mem_reset0 <= areset;
    redist2_lOAdded_uid58_fpDivTest_q_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 24,
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
        clocken1 => redist2_lOAdded_uid58_fpDivTest_q_5_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist2_lOAdded_uid58_fpDivTest_q_5_mem_reset0,
        clock1 => clk,
        address_a => redist2_lOAdded_uid58_fpDivTest_q_5_mem_aa,
        data_a => redist2_lOAdded_uid58_fpDivTest_q_5_mem_ia,
        wren_a => en(0),
        address_b => redist2_lOAdded_uid58_fpDivTest_q_5_mem_ab,
        q_b => redist2_lOAdded_uid58_fpDivTest_q_5_mem_iq
    );
    redist2_lOAdded_uid58_fpDivTest_q_5_mem_q <= redist2_lOAdded_uid58_fpDivTest_q_5_mem_iq(23 downto 0);

    -- oFracXSE_bottomExtension_uid61_fpDivTest(CONSTANT,60)
    oFracXSE_bottomExtension_uid61_fpDivTest_q <= "00";

    -- oFracXSE_mergedSignalTM_uid63_fpDivTest(BITJOIN,62)@18
    oFracXSE_mergedSignalTM_uid63_fpDivTest_q <= redist2_lOAdded_uid58_fpDivTest_q_5_mem_q & oFracXSE_bottomExtension_uid61_fpDivTest_q;

    -- yAddr_uid51_fpDivTest(BITSELECT,50)@0
    yAddr_uid51_fpDivTest_b <= fracY_uid13_fpDivTest_b(22 downto 14);

    -- memoryC2_uid118_invTables_lutmem(DUALMEM,147)@0 + 2
    -- in j@20000000
    memoryC2_uid118_invTables_lutmem_aa <= yAddr_uid51_fpDivTest_b;
    memoryC2_uid118_invTables_lutmem_reset0 <= areset;
    memoryC2_uid118_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 12,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Div_altera_fp_functions_191_psv3jda_memoryC2_uid118_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC2_uid118_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid118_invTables_lutmem_aa,
        q_a => memoryC2_uid118_invTables_lutmem_ir
    );
    memoryC2_uid118_invTables_lutmem_r <= memoryC2_uid118_invTables_lutmem_ir(11 downto 0);

    -- yPE_uid52_fpDivTest(BITSELECT,51)@0
    yPE_uid52_fpDivTest_b <= b(13 downto 0);

    -- redist4_yPE_uid52_fpDivTest_b_2(DELAY,156)
    redist4_yPE_uid52_fpDivTest_b_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist4_yPE_uid52_fpDivTest_b_2_delay_0 <= (others => '0');
                redist4_yPE_uid52_fpDivTest_b_2_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist4_yPE_uid52_fpDivTest_b_2_delay_0 <= STD_LOGIC_VECTOR(yPE_uid52_fpDivTest_b);
                    redist4_yPE_uid52_fpDivTest_b_2_q <= redist4_yPE_uid52_fpDivTest_b_2_delay_0;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- yT1_uid124_invPolyEval(BITSELECT,123)@2
    yT1_uid124_invPolyEval_b <= redist4_yPE_uid52_fpDivTest_b_2_q(13 downto 2);

    -- prodXY_uid140_pT1_uid125_invPolyEval_cma(CHAINMULTADD,149)@2 + 4
    -- out q@7
    prodXY_uid140_pT1_uid125_invPolyEval_cma_reset <= areset;
    prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0 <= en(0) or prodXY_uid140_pT1_uid125_invPolyEval_cma_reset;
    prodXY_uid140_pT1_uid125_invPolyEval_cma_ena1 <= prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0;
    prodXY_uid140_pT1_uid125_invPolyEval_cma_ena2 <= prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0;
    prodXY_uid140_pT1_uid125_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXY_uid140_pT1_uid125_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(yT1_uid124_invPolyEval_b),12);
                    prodXY_uid140_pT1_uid125_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(memoryC2_uid118_invTables_lutmem_r),12);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid140_pT1_uid125_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_ah(0));
    prodXY_uid140_pT1_uid125_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_ch(0));
    prodXY_uid140_pT1_uid125_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m18x18_full",
        clear_type => "sclr",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 12,
        ax_clock => "0",
        ax_width => 12,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 24,
        bx_width => 0,
        by_width => 0,
        result_b_width => 0
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid140_pT1_uid125_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid140_pT1_uid125_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid140_pT1_uid125_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid140_pT1_uid125_invPolyEval_cma_reset,
        clr(1) => prodXY_uid140_pT1_uid125_invPolyEval_cma_reset,
        ay => prodXY_uid140_pT1_uid125_invPolyEval_cma_a0,
        ax => prodXY_uid140_pT1_uid125_invPolyEval_cma_c0,
        resulta => prodXY_uid140_pT1_uid125_invPolyEval_cma_s0
    );
    prodXY_uid140_pT1_uid125_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 24, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid140_pT1_uid125_invPolyEval_cma_s0, xout => prodXY_uid140_pT1_uid125_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid140_pT1_uid125_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_qq(23 downto 0));

    -- osig_uid141_pT1_uid125_invPolyEval(BITSELECT,140)@7
    osig_uid141_pT1_uid125_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_q(23 downto 11));

    -- highBBits_uid127_invPolyEval(BITSELECT,126)@7
    highBBits_uid127_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid141_pT1_uid125_invPolyEval_b(12 downto 1));

    -- redist6_yAddr_uid51_fpDivTest_b_5(DELAY,158)
    redist6_yAddr_uid51_fpDivTest_b_5_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist6_yAddr_uid51_fpDivTest_b_5_delay_0 <= (others => '0');
                redist6_yAddr_uid51_fpDivTest_b_5_delay_1 <= (others => '0');
                redist6_yAddr_uid51_fpDivTest_b_5_delay_2 <= (others => '0');
                redist6_yAddr_uid51_fpDivTest_b_5_delay_3 <= (others => '0');
                redist6_yAddr_uid51_fpDivTest_b_5_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist6_yAddr_uid51_fpDivTest_b_5_delay_0 <= STD_LOGIC_VECTOR(yAddr_uid51_fpDivTest_b);
                    redist6_yAddr_uid51_fpDivTest_b_5_delay_1 <= redist6_yAddr_uid51_fpDivTest_b_5_delay_0;
                    redist6_yAddr_uid51_fpDivTest_b_5_delay_2 <= redist6_yAddr_uid51_fpDivTest_b_5_delay_1;
                    redist6_yAddr_uid51_fpDivTest_b_5_delay_3 <= redist6_yAddr_uid51_fpDivTest_b_5_delay_2;
                    redist6_yAddr_uid51_fpDivTest_b_5_q <= redist6_yAddr_uid51_fpDivTest_b_5_delay_3;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid115_invTables_lutmem(DUALMEM,146)@5 + 2
    -- in j@20000000
    memoryC1_uid115_invTables_lutmem_aa <= redist6_yAddr_uid51_fpDivTest_b_5_q;
    memoryC1_uid115_invTables_lutmem_reset0 <= areset;
    memoryC1_uid115_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 21,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Div_altera_fp_functions_191_psv3jda_memoryC1_uid115_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC1_uid115_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid115_invTables_lutmem_aa,
        q_a => memoryC1_uid115_invTables_lutmem_ir
    );
    memoryC1_uid115_invTables_lutmem_r <= memoryC1_uid115_invTables_lutmem_ir(20 downto 0);

    -- s1sumAHighB_uid128_invPolyEval(ADD,127)@7
    s1sumAHighB_uid128_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid115_invTables_lutmem_r(20)) & memoryC1_uid115_invTables_lutmem_r));
    s1sumAHighB_uid128_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid127_invPolyEval_b(11)) & highBBits_uid127_invPolyEval_b));
    s1sumAHighB_uid128_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid128_invPolyEval_a) + SIGNED(s1sumAHighB_uid128_invPolyEval_b));
    s1sumAHighB_uid128_invPolyEval_q <= s1sumAHighB_uid128_invPolyEval_o(21 downto 0);

    -- lowRangeB_uid126_invPolyEval(BITSELECT,125)@7
    lowRangeB_uid126_invPolyEval_in <= osig_uid141_pT1_uid125_invPolyEval_b(0 downto 0);
    lowRangeB_uid126_invPolyEval_b <= lowRangeB_uid126_invPolyEval_in(0 downto 0);

    -- s1_uid129_invPolyEval(BITJOIN,128)@7
    s1_uid129_invPolyEval_q <= s1sumAHighB_uid128_invPolyEval_q & lowRangeB_uid126_invPolyEval_b;

    -- redist5_yPE_uid52_fpDivTest_b_7_notEnable(LOGICAL,193)
    redist5_yPE_uid52_fpDivTest_b_7_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist5_yPE_uid52_fpDivTest_b_7_nor(LOGICAL,194)
    redist5_yPE_uid52_fpDivTest_b_7_nor_q <= not (redist5_yPE_uid52_fpDivTest_b_7_notEnable_q or redist5_yPE_uid52_fpDivTest_b_7_sticky_ena_q);

    -- redist5_yPE_uid52_fpDivTest_b_7_mem_last(CONSTANT,190)
    redist5_yPE_uid52_fpDivTest_b_7_mem_last_q <= "010";

    -- redist5_yPE_uid52_fpDivTest_b_7_cmp(LOGICAL,191)
    redist5_yPE_uid52_fpDivTest_b_7_cmp_b <= STD_LOGIC_VECTOR("0" & redist5_yPE_uid52_fpDivTest_b_7_rdmux_q);
    redist5_yPE_uid52_fpDivTest_b_7_cmp_q <= "1" WHEN redist5_yPE_uid52_fpDivTest_b_7_mem_last_q = redist5_yPE_uid52_fpDivTest_b_7_cmp_b ELSE "0";

    -- redist5_yPE_uid52_fpDivTest_b_7_cmpReg(REG,192)
    redist5_yPE_uid52_fpDivTest_b_7_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_yPE_uid52_fpDivTest_b_7_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist5_yPE_uid52_fpDivTest_b_7_cmpReg_q <= STD_LOGIC_VECTOR(redist5_yPE_uid52_fpDivTest_b_7_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist5_yPE_uid52_fpDivTest_b_7_sticky_ena(REG,195)
    redist5_yPE_uid52_fpDivTest_b_7_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_yPE_uid52_fpDivTest_b_7_sticky_ena_q <= "0";
            ELSE
                IF (redist5_yPE_uid52_fpDivTest_b_7_nor_q = "1") THEN
                    redist5_yPE_uid52_fpDivTest_b_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist5_yPE_uid52_fpDivTest_b_7_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist5_yPE_uid52_fpDivTest_b_7_enaAnd(LOGICAL,196)
    redist5_yPE_uid52_fpDivTest_b_7_enaAnd_q <= redist5_yPE_uid52_fpDivTest_b_7_sticky_ena_q and en;

    -- redist5_yPE_uid52_fpDivTest_b_7_rdcnt(COUNTER,187)
    -- low=0, high=3, step=1, init=0
    redist5_yPE_uid52_fpDivTest_b_7_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_yPE_uid52_fpDivTest_b_7_rdcnt_i <= TO_UNSIGNED(0, 2);
            ELSE
                IF (en = "1") THEN
                    redist5_yPE_uid52_fpDivTest_b_7_rdcnt_i <= redist5_yPE_uid52_fpDivTest_b_7_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist5_yPE_uid52_fpDivTest_b_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist5_yPE_uid52_fpDivTest_b_7_rdcnt_i, 2)));

    -- redist5_yPE_uid52_fpDivTest_b_7_rdmux(MUX,188)
    redist5_yPE_uid52_fpDivTest_b_7_rdmux_s <= en;
    redist5_yPE_uid52_fpDivTest_b_7_rdmux_combproc: PROCESS (redist5_yPE_uid52_fpDivTest_b_7_rdmux_s, redist5_yPE_uid52_fpDivTest_b_7_wraddr_q, redist5_yPE_uid52_fpDivTest_b_7_rdcnt_q)
    BEGIN
        CASE (redist5_yPE_uid52_fpDivTest_b_7_rdmux_s) IS
            WHEN "0" => redist5_yPE_uid52_fpDivTest_b_7_rdmux_q <= redist5_yPE_uid52_fpDivTest_b_7_wraddr_q;
            WHEN "1" => redist5_yPE_uid52_fpDivTest_b_7_rdmux_q <= redist5_yPE_uid52_fpDivTest_b_7_rdcnt_q;
            WHEN OTHERS => redist5_yPE_uid52_fpDivTest_b_7_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist5_yPE_uid52_fpDivTest_b_7_wraddr(REG,189)
    redist5_yPE_uid52_fpDivTest_b_7_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_yPE_uid52_fpDivTest_b_7_wraddr_q <= "11";
            ELSE
                redist5_yPE_uid52_fpDivTest_b_7_wraddr_q <= STD_LOGIC_VECTOR(redist5_yPE_uid52_fpDivTest_b_7_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_yPE_uid52_fpDivTest_b_7_mem(DUALMEM,186)
    redist5_yPE_uid52_fpDivTest_b_7_mem_ia <= STD_LOGIC_VECTOR(redist4_yPE_uid52_fpDivTest_b_2_q);
    redist5_yPE_uid52_fpDivTest_b_7_mem_aa <= redist5_yPE_uid52_fpDivTest_b_7_wraddr_q;
    redist5_yPE_uid52_fpDivTest_b_7_mem_ab <= redist5_yPE_uid52_fpDivTest_b_7_rdmux_q;
    redist5_yPE_uid52_fpDivTest_b_7_mem_reset0 <= areset;
    redist5_yPE_uid52_fpDivTest_b_7_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 14,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 14,
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
        clocken1 => redist5_yPE_uid52_fpDivTest_b_7_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist5_yPE_uid52_fpDivTest_b_7_mem_reset0,
        clock1 => clk,
        address_a => redist5_yPE_uid52_fpDivTest_b_7_mem_aa,
        data_a => redist5_yPE_uid52_fpDivTest_b_7_mem_ia,
        wren_a => en(0),
        address_b => redist5_yPE_uid52_fpDivTest_b_7_mem_ab,
        q_b => redist5_yPE_uid52_fpDivTest_b_7_mem_iq
    );
    redist5_yPE_uid52_fpDivTest_b_7_mem_q <= redist5_yPE_uid52_fpDivTest_b_7_mem_iq(13 downto 0);

    -- prodXY_uid143_pT2_uid131_invPolyEval_cma(CHAINMULTADD,150)@7 + 4
    -- out q@12
    prodXY_uid143_pT2_uid131_invPolyEval_cma_reset <= areset;
    prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0 <= en(0) or prodXY_uid143_pT2_uid131_invPolyEval_cma_reset;
    prodXY_uid143_pT2_uid131_invPolyEval_cma_ena1 <= prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0;
    prodXY_uid143_pT2_uid131_invPolyEval_cma_ena2 <= prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0;
    prodXY_uid143_pT2_uid131_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXY_uid143_pT2_uid131_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(redist5_yPE_uid52_fpDivTest_b_7_mem_q),14);
                    prodXY_uid143_pT2_uid131_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(s1_uid129_invPolyEval_q),23);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid143_pT2_uid131_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_ah(0));
    prodXY_uid143_pT2_uid131_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_ch(0));
    prodXY_uid143_pT2_uid131_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 14,
        ax_clock => "0",
        ax_width => 23,
        signed_may => "false",
        signed_max => "true",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 37
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid143_pT2_uid131_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid143_pT2_uid131_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid143_pT2_uid131_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid143_pT2_uid131_invPolyEval_cma_reset,
        clr(1) => prodXY_uid143_pT2_uid131_invPolyEval_cma_reset,
        ay => prodXY_uid143_pT2_uid131_invPolyEval_cma_a0,
        ax => prodXY_uid143_pT2_uid131_invPolyEval_cma_c0,
        resulta => prodXY_uid143_pT2_uid131_invPolyEval_cma_s0
    );
    prodXY_uid143_pT2_uid131_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid143_pT2_uid131_invPolyEval_cma_s0, xout => prodXY_uid143_pT2_uid131_invPolyEval_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid143_pT2_uid131_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_qq(36 downto 0));

    -- osig_uid144_pT2_uid131_invPolyEval(BITSELECT,143)@12
    osig_uid144_pT2_uid131_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_q(36 downto 13));

    -- highBBits_uid133_invPolyEval(BITSELECT,132)@12
    highBBits_uid133_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid144_pT2_uid131_invPolyEval_b(23 downto 2));

    -- redist7_yAddr_uid51_fpDivTest_b_10(DELAY,159)
    redist7_yAddr_uid51_fpDivTest_b_10_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist7_yAddr_uid51_fpDivTest_b_10_delay_0 <= (others => '0');
                redist7_yAddr_uid51_fpDivTest_b_10_delay_1 <= (others => '0');
                redist7_yAddr_uid51_fpDivTest_b_10_delay_2 <= (others => '0');
                redist7_yAddr_uid51_fpDivTest_b_10_delay_3 <= (others => '0');
                redist7_yAddr_uid51_fpDivTest_b_10_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist7_yAddr_uid51_fpDivTest_b_10_delay_0 <= STD_LOGIC_VECTOR(redist6_yAddr_uid51_fpDivTest_b_5_q);
                    redist7_yAddr_uid51_fpDivTest_b_10_delay_1 <= redist7_yAddr_uid51_fpDivTest_b_10_delay_0;
                    redist7_yAddr_uid51_fpDivTest_b_10_delay_2 <= redist7_yAddr_uid51_fpDivTest_b_10_delay_1;
                    redist7_yAddr_uid51_fpDivTest_b_10_delay_3 <= redist7_yAddr_uid51_fpDivTest_b_10_delay_2;
                    redist7_yAddr_uid51_fpDivTest_b_10_q <= redist7_yAddr_uid51_fpDivTest_b_10_delay_3;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid112_invTables_lutmem(DUALMEM,145)@10 + 2
    -- in j@20000000
    memoryC0_uid112_invTables_lutmem_aa <= redist7_yAddr_uid51_fpDivTest_b_10_q;
    memoryC0_uid112_invTables_lutmem_reset0 <= areset;
    memoryC0_uid112_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 31,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Div_altera_fp_functions_191_psv3jda_memoryC0_uid112_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => en(0),
        sclr => memoryC0_uid112_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid112_invTables_lutmem_aa,
        q_a => memoryC0_uid112_invTables_lutmem_ir
    );
    memoryC0_uid112_invTables_lutmem_r <= memoryC0_uid112_invTables_lutmem_ir(30 downto 0);

    -- s2sumAHighB_uid134_invPolyEval(ADD,133)@12
    s2sumAHighB_uid134_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => memoryC0_uid112_invTables_lutmem_r(30)) & memoryC0_uid112_invTables_lutmem_r));
    s2sumAHighB_uid134_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid133_invPolyEval_b(21)) & highBBits_uid133_invPolyEval_b));
    s2sumAHighB_uid134_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid134_invPolyEval_a) + SIGNED(s2sumAHighB_uid134_invPolyEval_b));
    s2sumAHighB_uid134_invPolyEval_q <= s2sumAHighB_uid134_invPolyEval_o(31 downto 0);

    -- lowRangeB_uid132_invPolyEval(BITSELECT,131)@12
    lowRangeB_uid132_invPolyEval_in <= osig_uid144_pT2_uid131_invPolyEval_b(1 downto 0);
    lowRangeB_uid132_invPolyEval_b <= lowRangeB_uid132_invPolyEval_in(1 downto 0);

    -- s2_uid135_invPolyEval(BITJOIN,134)@12
    s2_uid135_invPolyEval_q <= s2sumAHighB_uid134_invPolyEval_q & lowRangeB_uid132_invPolyEval_b;

    -- invY_uid54_fpDivTest_merged_bit_select(BITSELECT,151)@12
    invY_uid54_fpDivTest_merged_bit_select_in <= s2_uid135_invPolyEval_q(31 downto 0);
    invY_uid54_fpDivTest_merged_bit_select_b <= invY_uid54_fpDivTest_merged_bit_select_in(30 downto 5);
    invY_uid54_fpDivTest_merged_bit_select_c <= invY_uid54_fpDivTest_merged_bit_select_in(31 downto 31);

    -- redist0_invY_uid54_fpDivTest_merged_bit_select_b_1(DELAY,152)
    redist0_invY_uid54_fpDivTest_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_invY_uid54_fpDivTest_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist0_invY_uid54_fpDivTest_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(invY_uid54_fpDivTest_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma(CHAINMULTADD,148)@13 + 4
    -- out q@18
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset <= areset;
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0 <= en(0) or prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset;
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena1 <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0;
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena2 <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0;
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                IF (en = "1") THEN
                    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ah(0) <= RESIZE(UNSIGNED(redist0_invY_uid54_fpDivTest_merged_bit_select_b_1_q),26);
                    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ch(0) <= RESIZE(UNSIGNED(lOAdded_uid58_fpDivTest_q),24);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ah(0));
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ch(0));
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 26,
        ax_clock => "0",
        ax_width => 24,
        signed_may => "false",
        signed_max => "false",
        input_pipeline_clock => "2",
        second_pipeline_clock => "2",
        output_clock => "1",
        result_a_width => 50
    )
    PORT MAP (
        clk(0) => clk,
        clk(1) => clk,
        clk(2) => clk,
        ena(0) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena0,
        ena(1) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena1,
        ena(2) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ena2,
        clr(0) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset,
        clr(1) => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_reset,
        ay => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0,
        ax => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0,
        resulta => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s0
    );
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 50, depth => 0, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s0, xout => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_q <= STD_LOGIC_VECTOR(prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_qq(49 downto 0));

    -- osig_uid138_prodDivPreNormProd_uid60_fpDivTest(BITSELECT,137)@18
    osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_q(49 downto 24);

    -- updatedY_uid16_fpDivTest(BITJOIN,15)@0
    updatedY_uid16_fpDivTest_q <= GND_q & paddingY_uid15_fpDivTest_q;

    -- fracYZero_uid15_fpDivTest(LOGICAL,16)@0 + 1
    fracYZero_uid15_fpDivTest_a <= STD_LOGIC_VECTOR("0" & fracY_uid13_fpDivTest_b);
    fracYZero_uid15_fpDivTest_qi <= "1" WHEN fracYZero_uid15_fpDivTest_a = updatedY_uid16_fpDivTest_q ELSE "0";
    fracYZero_uid15_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracYZero_uid15_fpDivTest_qi, xout => fracYZero_uid15_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist21_fracYZero_uid15_fpDivTest_q_12(DELAY,173)
    redist21_fracYZero_uid15_fpDivTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracYZero_uid15_fpDivTest_q, xout => redist21_fracYZero_uid15_fpDivTest_q_12_q, ena => en(0), clk => clk, aclr => areset );

    -- fracYPostZ_uid56_fpDivTest(LOGICAL,55)@12 + 1
    fracYPostZ_uid56_fpDivTest_qi <= redist21_fracYZero_uid15_fpDivTest_q_12_q or invY_uid54_fpDivTest_merged_bit_select_c;
    fracYPostZ_uid56_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracYPostZ_uid56_fpDivTest_qi, xout => fracYPostZ_uid56_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist3_fracYPostZ_uid56_fpDivTest_q_6(DELAY,155)
    redist3_fracYPostZ_uid56_fpDivTest_q_6_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_0 <= (others => '0');
                redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_1 <= (others => '0');
                redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_2 <= (others => '0');
                redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_3 <= (others => '0');
                redist3_fracYPostZ_uid56_fpDivTest_q_6_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_0 <= STD_LOGIC_VECTOR(fracYPostZ_uid56_fpDivTest_q);
                    redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_1 <= redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_0;
                    redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_2 <= redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_1;
                    redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_3 <= redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_2;
                    redist3_fracYPostZ_uid56_fpDivTest_q_6_q <= redist3_fracYPostZ_uid56_fpDivTest_q_6_delay_3;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- divValPreNormTrunc_uid66_fpDivTest(MUX,65)@18
    divValPreNormTrunc_uid66_fpDivTest_s <= redist3_fracYPostZ_uid56_fpDivTest_q_6_q;
    divValPreNormTrunc_uid66_fpDivTest_combproc: PROCESS (divValPreNormTrunc_uid66_fpDivTest_s, en, osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b, oFracXSE_mergedSignalTM_uid63_fpDivTest_q)
    BEGIN
        CASE (divValPreNormTrunc_uid66_fpDivTest_s) IS
            WHEN "0" => divValPreNormTrunc_uid66_fpDivTest_q <= osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b;
            WHEN "1" => divValPreNormTrunc_uid66_fpDivTest_q <= oFracXSE_mergedSignalTM_uid63_fpDivTest_q;
            WHEN OTHERS => divValPreNormTrunc_uid66_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- norm_uid67_fpDivTest(BITSELECT,66)@18
    norm_uid67_fpDivTest_b <= STD_LOGIC_VECTOR(divValPreNormTrunc_uid66_fpDivTest_q(25 downto 25));

    -- rndOp_uid75_fpDivTest(BITJOIN,74)@18
    rndOp_uid75_fpDivTest_q <= norm_uid67_fpDivTest_b & paddingY_uid15_fpDivTest_q & VCC_q;

    -- cstBiasM1_uid6_fpDivTest(CONSTANT,5)
    cstBiasM1_uid6_fpDivTest_q <= "01111110";

    -- redist8_expXmY_uid47_fpDivTest_q_18_notEnable(LOGICAL,204)
    redist8_expXmY_uid47_fpDivTest_q_18_notEnable_q <= STD_LOGIC_VECTOR(not (en));

    -- redist8_expXmY_uid47_fpDivTest_q_18_nor(LOGICAL,205)
    redist8_expXmY_uid47_fpDivTest_q_18_nor_q <= not (redist8_expXmY_uid47_fpDivTest_q_18_notEnable_q or redist8_expXmY_uid47_fpDivTest_q_18_sticky_ena_q);

    -- redist8_expXmY_uid47_fpDivTest_q_18_mem_last(CONSTANT,201)
    redist8_expXmY_uid47_fpDivTest_q_18_mem_last_q <= "01110";

    -- redist8_expXmY_uid47_fpDivTest_q_18_cmp(LOGICAL,202)
    redist8_expXmY_uid47_fpDivTest_q_18_cmp_b <= STD_LOGIC_VECTOR("0" & redist8_expXmY_uid47_fpDivTest_q_18_rdmux_q);
    redist8_expXmY_uid47_fpDivTest_q_18_cmp_q <= "1" WHEN redist8_expXmY_uid47_fpDivTest_q_18_mem_last_q = redist8_expXmY_uid47_fpDivTest_q_18_cmp_b ELSE "0";

    -- redist8_expXmY_uid47_fpDivTest_q_18_cmpReg(REG,203)
    redist8_expXmY_uid47_fpDivTest_q_18_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist8_expXmY_uid47_fpDivTest_q_18_cmpReg_q <= "0";
            ELSE
                IF (en = "1") THEN
                    redist8_expXmY_uid47_fpDivTest_q_18_cmpReg_q <= STD_LOGIC_VECTOR(redist8_expXmY_uid47_fpDivTest_q_18_cmp_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist8_expXmY_uid47_fpDivTest_q_18_sticky_ena(REG,206)
    redist8_expXmY_uid47_fpDivTest_q_18_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist8_expXmY_uid47_fpDivTest_q_18_sticky_ena_q <= "0";
            ELSE
                IF (redist8_expXmY_uid47_fpDivTest_q_18_nor_q = "1") THEN
                    redist8_expXmY_uid47_fpDivTest_q_18_sticky_ena_q <= STD_LOGIC_VECTOR(redist8_expXmY_uid47_fpDivTest_q_18_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist8_expXmY_uid47_fpDivTest_q_18_enaAnd(LOGICAL,207)
    redist8_expXmY_uid47_fpDivTest_q_18_enaAnd_q <= redist8_expXmY_uid47_fpDivTest_q_18_sticky_ena_q and en;

    -- redist8_expXmY_uid47_fpDivTest_q_18_rdcnt(COUNTER,198)
    -- low=0, high=15, step=1, init=0
    redist8_expXmY_uid47_fpDivTest_q_18_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist8_expXmY_uid47_fpDivTest_q_18_rdcnt_i <= TO_UNSIGNED(0, 4);
            ELSE
                IF (en = "1") THEN
                    redist8_expXmY_uid47_fpDivTest_q_18_rdcnt_i <= redist8_expXmY_uid47_fpDivTest_q_18_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist8_expXmY_uid47_fpDivTest_q_18_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist8_expXmY_uid47_fpDivTest_q_18_rdcnt_i, 4)));

    -- redist8_expXmY_uid47_fpDivTest_q_18_rdmux(MUX,199)
    redist8_expXmY_uid47_fpDivTest_q_18_rdmux_s <= en;
    redist8_expXmY_uid47_fpDivTest_q_18_rdmux_combproc: PROCESS (redist8_expXmY_uid47_fpDivTest_q_18_rdmux_s, redist8_expXmY_uid47_fpDivTest_q_18_wraddr_q, redist8_expXmY_uid47_fpDivTest_q_18_rdcnt_q)
    BEGIN
        CASE (redist8_expXmY_uid47_fpDivTest_q_18_rdmux_s) IS
            WHEN "0" => redist8_expXmY_uid47_fpDivTest_q_18_rdmux_q <= redist8_expXmY_uid47_fpDivTest_q_18_wraddr_q;
            WHEN "1" => redist8_expXmY_uid47_fpDivTest_q_18_rdmux_q <= redist8_expXmY_uid47_fpDivTest_q_18_rdcnt_q;
            WHEN OTHERS => redist8_expXmY_uid47_fpDivTest_q_18_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expXmY_uid47_fpDivTest(SUB,46)@0 + 1
    expXmY_uid47_fpDivTest_a <= STD_LOGIC_VECTOR("0" & expX_uid9_fpDivTest_b);
    expXmY_uid47_fpDivTest_b <= STD_LOGIC_VECTOR("0" & expY_uid12_fpDivTest_b);
    expXmY_uid47_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expXmY_uid47_fpDivTest_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    expXmY_uid47_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid47_fpDivTest_a) - UNSIGNED(expXmY_uid47_fpDivTest_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    expXmY_uid47_fpDivTest_q <= expXmY_uid47_fpDivTest_o(8 downto 0);

    -- redist8_expXmY_uid47_fpDivTest_q_18_wraddr(REG,200)
    redist8_expXmY_uid47_fpDivTest_q_18_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist8_expXmY_uid47_fpDivTest_q_18_wraddr_q <= "1111";
            ELSE
                redist8_expXmY_uid47_fpDivTest_q_18_wraddr_q <= STD_LOGIC_VECTOR(redist8_expXmY_uid47_fpDivTest_q_18_rdmux_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_expXmY_uid47_fpDivTest_q_18_mem(DUALMEM,197)
    redist8_expXmY_uid47_fpDivTest_q_18_mem_ia <= STD_LOGIC_VECTOR(expXmY_uid47_fpDivTest_q);
    redist8_expXmY_uid47_fpDivTest_q_18_mem_aa <= redist8_expXmY_uid47_fpDivTest_q_18_wraddr_q;
    redist8_expXmY_uid47_fpDivTest_q_18_mem_ab <= redist8_expXmY_uid47_fpDivTest_q_18_rdmux_q;
    redist8_expXmY_uid47_fpDivTest_q_18_mem_reset0 <= areset;
    redist8_expXmY_uid47_fpDivTest_q_18_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 9,
        widthad_b => 4,
        numwords_b => 16,
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
        clocken1 => redist8_expXmY_uid47_fpDivTest_q_18_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist8_expXmY_uid47_fpDivTest_q_18_mem_reset0,
        clock1 => clk,
        address_a => redist8_expXmY_uid47_fpDivTest_q_18_mem_aa,
        data_a => redist8_expXmY_uid47_fpDivTest_q_18_mem_ia,
        wren_a => en(0),
        address_b => redist8_expXmY_uid47_fpDivTest_q_18_mem_ab,
        q_b => redist8_expXmY_uid47_fpDivTest_q_18_mem_iq
    );
    redist8_expXmY_uid47_fpDivTest_q_18_mem_q <= redist8_expXmY_uid47_fpDivTest_q_18_mem_iq(8 downto 0);

    -- expR_uid48_fpDivTest(ADD,47)@18
    expR_uid48_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => redist8_expXmY_uid47_fpDivTest_q_18_mem_q(8)) & redist8_expXmY_uid47_fpDivTest_q_18_mem_q));
    expR_uid48_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & cstBiasM1_uid6_fpDivTest_q));
    expR_uid48_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid48_fpDivTest_a) + SIGNED(expR_uid48_fpDivTest_b));
    expR_uid48_fpDivTest_q <= expR_uid48_fpDivTest_o(9 downto 0);

    -- divValPreNormHigh_uid68_fpDivTest(BITSELECT,67)@18
    divValPreNormHigh_uid68_fpDivTest_in <= divValPreNormTrunc_uid66_fpDivTest_q(24 downto 0);
    divValPreNormHigh_uid68_fpDivTest_b <= divValPreNormHigh_uid68_fpDivTest_in(24 downto 1);

    -- divValPreNormLow_uid69_fpDivTest(BITSELECT,68)@18
    divValPreNormLow_uid69_fpDivTest_in <= divValPreNormTrunc_uid66_fpDivTest_q(23 downto 0);
    divValPreNormLow_uid69_fpDivTest_b <= divValPreNormLow_uid69_fpDivTest_in(23 downto 0);

    -- normFracRnd_uid70_fpDivTest(MUX,69)@18
    normFracRnd_uid70_fpDivTest_s <= norm_uid67_fpDivTest_b;
    normFracRnd_uid70_fpDivTest_combproc: PROCESS (normFracRnd_uid70_fpDivTest_s, en, divValPreNormLow_uid69_fpDivTest_b, divValPreNormHigh_uid68_fpDivTest_b)
    BEGIN
        CASE (normFracRnd_uid70_fpDivTest_s) IS
            WHEN "0" => normFracRnd_uid70_fpDivTest_q <= divValPreNormLow_uid69_fpDivTest_b;
            WHEN "1" => normFracRnd_uid70_fpDivTest_q <= divValPreNormHigh_uid68_fpDivTest_b;
            WHEN OTHERS => normFracRnd_uid70_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracRnd_uid71_fpDivTest(BITJOIN,70)@18
    expFracRnd_uid71_fpDivTest_q <= expR_uid48_fpDivTest_q & normFracRnd_uid70_fpDivTest_q;

    -- expFracPostRnd_uid76_fpDivTest(ADD,75)@18 + 1
    expFracPostRnd_uid76_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => expFracRnd_uid71_fpDivTest_q(33)) & expFracRnd_uid71_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & rndOp_uid75_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expFracPostRnd_uid76_fpDivTest_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    expFracPostRnd_uid76_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid76_fpDivTest_a) + SIGNED(expFracPostRnd_uid76_fpDivTest_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    expFracPostRnd_uid76_fpDivTest_q <= expFracPostRnd_uid76_fpDivTest_o(34 downto 0);

    -- excRPreExc_uid79_fpDivTest(BITSELECT,78)@19
    excRPreExc_uid79_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(31 downto 0);
    excRPreExc_uid79_fpDivTest_b <= excRPreExc_uid79_fpDivTest_in(31 downto 24);

    -- redist1_excRNaN_uid97_fpDivTest_q_1(DELAY,153)
    redist1_excRNaN_uid97_fpDivTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_excRNaN_uid97_fpDivTest_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist1_excRNaN_uid97_fpDivTest_q_1_q <= STD_LOGIC_VECTOR(excRNaN_uid97_fpDivTest_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist13_expXIsMax_uid38_fpDivTest_q_19(DELAY,165)
    redist13_expXIsMax_uid38_fpDivTest_q_19_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist13_expXIsMax_uid38_fpDivTest_q_19_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist13_expXIsMax_uid38_fpDivTest_q_19_q <= STD_LOGIC_VECTOR(redist12_expXIsMax_uid38_fpDivTest_q_18_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- invExpXIsMax_uid43_fpDivTest(LOGICAL,42)@19
    invExpXIsMax_uid43_fpDivTest_q <= not (redist13_expXIsMax_uid38_fpDivTest_q_19_q);

    -- redist15_excZ_y_uid37_fpDivTest_q_19(DELAY,167)
    redist15_excZ_y_uid37_fpDivTest_q_19_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist15_excZ_y_uid37_fpDivTest_q_19_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist15_excZ_y_uid37_fpDivTest_q_19_q <= STD_LOGIC_VECTOR(redist14_excZ_y_uid37_fpDivTest_q_18_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- InvExpXIsZero_uid44_fpDivTest(LOGICAL,43)@19
    InvExpXIsZero_uid44_fpDivTest_q <= not (redist15_excZ_y_uid37_fpDivTest_q_19_q);

    -- excR_y_uid45_fpDivTest(LOGICAL,44)@19
    excR_y_uid45_fpDivTest_q <= InvExpXIsZero_uid44_fpDivTest_q and invExpXIsMax_uid43_fpDivTest_q;

    -- redist16_excI_x_uid27_fpDivTest_q_1(DELAY,168)
    redist16_excI_x_uid27_fpDivTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist16_excI_x_uid27_fpDivTest_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist16_excI_x_uid27_fpDivTest_q_1_q <= STD_LOGIC_VECTOR(excI_x_uid27_fpDivTest_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- excXIYR_uid93_fpDivTest(LOGICAL,92)@19
    excXIYR_uid93_fpDivTest_q <= redist16_excI_x_uid27_fpDivTest_q_1_q and excR_y_uid45_fpDivTest_q;

    -- excXIYZ_uid92_fpDivTest(LOGICAL,91)@19
    excXIYZ_uid92_fpDivTest_q <= redist16_excI_x_uid27_fpDivTest_q_1_q and redist15_excZ_y_uid37_fpDivTest_q_19_q;

    -- expRExt_uid80_fpDivTest(BITSELECT,79)@19
    expRExt_uid80_fpDivTest_b <= STD_LOGIC_VECTOR(expFracPostRnd_uid76_fpDivTest_q(34 downto 24));

    -- expOvf_uid84_fpDivTest(COMPARE,83)@19
    expOvf_uid84_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid80_fpDivTest_b(10)) & expRExt_uid80_fpDivTest_b));
    expOvf_uid84_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstAllOWE_uid18_fpDivTest_q));
    expOvf_uid84_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid84_fpDivTest_a) - SIGNED(expOvf_uid84_fpDivTest_b));
    expOvf_uid84_fpDivTest_n(0) <= not (expOvf_uid84_fpDivTest_o(12));

    -- invExpXIsMax_uid29_fpDivTest(LOGICAL,28)@18
    invExpXIsMax_uid29_fpDivTest_q <= not (redist18_expXIsMax_uid24_fpDivTest_q_18_q);

    -- InvExpXIsZero_uid30_fpDivTest(LOGICAL,29)@18
    InvExpXIsZero_uid30_fpDivTest_q <= not (redist19_excZ_x_uid23_fpDivTest_q_18_q);

    -- excR_x_uid31_fpDivTest(LOGICAL,30)@18 + 1
    excR_x_uid31_fpDivTest_qi <= InvExpXIsZero_uid30_fpDivTest_q and invExpXIsMax_uid29_fpDivTest_q;
    excR_x_uid31_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excR_x_uid31_fpDivTest_qi, xout => excR_x_uid31_fpDivTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excXRYROvf_uid91_fpDivTest(LOGICAL,90)@19
    excXRYROvf_uid91_fpDivTest_q <= excR_x_uid31_fpDivTest_q and excR_y_uid45_fpDivTest_q and expOvf_uid84_fpDivTest_n;

    -- excXRYZ_uid90_fpDivTest(LOGICAL,89)@19
    excXRYZ_uid90_fpDivTest_q <= excR_x_uid31_fpDivTest_q and redist15_excZ_y_uid37_fpDivTest_q_19_q;

    -- excRInf_uid94_fpDivTest(LOGICAL,93)@19
    excRInf_uid94_fpDivTest_q <= excXRYZ_uid90_fpDivTest_q or excXRYROvf_uid91_fpDivTest_q or excXIYZ_uid92_fpDivTest_q or excXIYR_uid93_fpDivTest_q;

    -- redist10_excI_y_uid41_fpDivTest_q_1(DELAY,162)
    redist10_excI_y_uid41_fpDivTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist10_excI_y_uid41_fpDivTest_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist10_excI_y_uid41_fpDivTest_q_1_q <= STD_LOGIC_VECTOR(excI_y_uid41_fpDivTest_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist20_excZ_x_uid23_fpDivTest_q_19(DELAY,172)
    redist20_excZ_x_uid23_fpDivTest_q_19_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist20_excZ_x_uid23_fpDivTest_q_19_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist20_excZ_x_uid23_fpDivTest_q_19_q <= STD_LOGIC_VECTOR(redist19_excZ_x_uid23_fpDivTest_q_18_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- xRegOrZero_uid87_fpDivTest(LOGICAL,86)@19
    xRegOrZero_uid87_fpDivTest_q <= excR_x_uid31_fpDivTest_q or redist20_excZ_x_uid23_fpDivTest_q_19_q;

    -- regOrZeroOverInf_uid88_fpDivTest(LOGICAL,87)@19
    regOrZeroOverInf_uid88_fpDivTest_q <= xRegOrZero_uid87_fpDivTest_q and redist10_excI_y_uid41_fpDivTest_q_1_q;

    -- expUdf_uid81_fpDivTest(COMPARE,80)@19
    expUdf_uid81_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000" & GND_q));
    expUdf_uid81_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid80_fpDivTest_b(10)) & expRExt_uid80_fpDivTest_b));
    expUdf_uid81_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid81_fpDivTest_a) - SIGNED(expUdf_uid81_fpDivTest_b));
    expUdf_uid81_fpDivTest_n(0) <= not (expUdf_uid81_fpDivTest_o(12));

    -- regOverRegWithUf_uid86_fpDivTest(LOGICAL,85)@19
    regOverRegWithUf_uid86_fpDivTest_q <= expUdf_uid81_fpDivTest_n and excR_x_uid31_fpDivTest_q and excR_y_uid45_fpDivTest_q;

    -- zeroOverReg_uid85_fpDivTest(LOGICAL,84)@19
    zeroOverReg_uid85_fpDivTest_q <= redist20_excZ_x_uid23_fpDivTest_q_19_q and excR_y_uid45_fpDivTest_q;

    -- excRZero_uid89_fpDivTest(LOGICAL,88)@19
    excRZero_uid89_fpDivTest_q <= zeroOverReg_uid85_fpDivTest_q or regOverRegWithUf_uid86_fpDivTest_q or regOrZeroOverInf_uid88_fpDivTest_q;

    -- concExc_uid98_fpDivTest(BITJOIN,97)@19
    concExc_uid98_fpDivTest_q <= redist1_excRNaN_uid97_fpDivTest_q_1_q & excRInf_uid94_fpDivTest_q & excRZero_uid89_fpDivTest_q;

    -- excREnc_uid99_fpDivTest(LOOKUP,98)@19
    excREnc_uid99_fpDivTest_combproc: PROCESS (concExc_uid98_fpDivTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid98_fpDivTest_q) IS
            WHEN "000" => excREnc_uid99_fpDivTest_q <= "01";
            WHEN "001" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "010" => excREnc_uid99_fpDivTest_q <= "10";
            WHEN "011" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "100" => excREnc_uid99_fpDivTest_q <= "11";
            WHEN "101" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "110" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "111" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid99_fpDivTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid107_fpDivTest(MUX,106)@19
    expRPostExc_uid107_fpDivTest_s <= excREnc_uid99_fpDivTest_q;
    expRPostExc_uid107_fpDivTest_combproc: PROCESS (expRPostExc_uid107_fpDivTest_s, en, cstAllZWE_uid20_fpDivTest_q, excRPreExc_uid79_fpDivTest_b, cstAllOWE_uid18_fpDivTest_q)
    BEGIN
        CASE (expRPostExc_uid107_fpDivTest_s) IS
            WHEN "00" => expRPostExc_uid107_fpDivTest_q <= cstAllZWE_uid20_fpDivTest_q;
            WHEN "01" => expRPostExc_uid107_fpDivTest_q <= excRPreExc_uid79_fpDivTest_b;
            WHEN "10" => expRPostExc_uid107_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN "11" => expRPostExc_uid107_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN OTHERS => expRPostExc_uid107_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid100_fpDivTest(CONSTANT,99)
    oneFracRPostExc2_uid100_fpDivTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid78_fpDivTest(BITSELECT,77)@19
    fracRPreExc_uid78_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(23 downto 0);
    fracRPreExc_uid78_fpDivTest_b <= fracRPreExc_uid78_fpDivTest_in(23 downto 1);

    -- fracRPostExc_uid103_fpDivTest(MUX,102)@19
    fracRPostExc_uid103_fpDivTest_s <= excREnc_uid99_fpDivTest_q;
    fracRPostExc_uid103_fpDivTest_combproc: PROCESS (fracRPostExc_uid103_fpDivTest_s, en, paddingY_uid15_fpDivTest_q, fracRPreExc_uid78_fpDivTest_b, oneFracRPostExc2_uid100_fpDivTest_q)
    BEGIN
        CASE (fracRPostExc_uid103_fpDivTest_s) IS
            WHEN "00" => fracRPostExc_uid103_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "01" => fracRPostExc_uid103_fpDivTest_q <= fracRPreExc_uid78_fpDivTest_b;
            WHEN "10" => fracRPostExc_uid103_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "11" => fracRPostExc_uid103_fpDivTest_q <= oneFracRPostExc2_uid100_fpDivTest_q;
            WHEN OTHERS => fracRPostExc_uid103_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- divR_uid110_fpDivTest(BITJOIN,109)@19
    divR_uid110_fpDivTest_q <= sRPostExc_uid109_fpDivTest_q & expRPostExc_uid107_fpDivTest_q & fracRPostExc_uid103_fpDivTest_q;

    -- xOut(GPOUT,4)@19
    q <= divR_uid110_fpDivTest_q;

END normal;
