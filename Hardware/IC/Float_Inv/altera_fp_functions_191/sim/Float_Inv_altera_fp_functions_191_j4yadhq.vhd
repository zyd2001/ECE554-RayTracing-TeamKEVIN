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

-- VHDL created from Float_Inv_altera_fp_functions_191_j4yadhq
-- VHDL created on Fri Apr 23 00:22:00 2021


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

entity Float_Inv_altera_fp_functions_191_j4yadhq is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end Float_Inv_altera_fp_functions_191_j4yadhq;

architecture normal of Float_Inv_altera_fp_functions_191_j4yadhq is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpInverseTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid7_fpInverseTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal singX_uid8_fpInverseTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid9_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWF_uid10_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstNaNWF_uid11_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid12_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cst2BiasM1_uid13_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cst2Bias_uid14_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid21_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid22_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid23_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid23_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid24_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid25_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid25_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid26_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid27_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid28_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid29_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid30_fpInverseTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal updatedY_uid32_fpInverseTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsZero_uid31_fpInverseTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsZero_uid31_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid31_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal y_uid34_fpInverseTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal y_uid34_fpInverseTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRCompExt_uid39_fpInverseTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid39_fpInverseTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid39_fpInverseTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid39_fpInverseTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRComp_uid40_fpInverseTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRComp_uid40_fpInverseTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal udf_uid41_fpInverseTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal udf_uid41_fpInverseTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpInverseRes_uid44_fpInverseTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal fxpInverseRes_uid44_fpInverseTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fxpInverseResFrac_uid46_fpInverseTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fxpInverseResFrac_uid46_fpInverseTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRCalc_uid47_fpInverseTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRCalc_uid47_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xRegAndUdf_uid49_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegAndUdf_uid49_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIOrXRUdf_uid50_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid51_fpInverseTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid52_fpInverseTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid54_fpInverseTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid54_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid55_fpInverseTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid55_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid56_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid57_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid57_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid58_fpInverseTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yT1_uid72_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal lowRangeB_uid74_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid74_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid75_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal s1sumAHighB_uid76_invPolyEval_a : STD_LOGIC_VECTOR (20 downto 0);
    signal s1sumAHighB_uid76_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal s1sumAHighB_uid76_invPolyEval_o : STD_LOGIC_VECTOR (20 downto 0);
    signal s1sumAHighB_uid76_invPolyEval_q : STD_LOGIC_VECTOR (20 downto 0);
    signal s1_uid77_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal lowRangeB_uid80_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid80_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid81_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal s2sumAHighB_uid82_invPolyEval_a : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid82_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid82_invPolyEval_o : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid82_invPolyEval_q : STD_LOGIC_VECTOR (29 downto 0);
    signal s2_uid83_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal osig_uid86_pT1_uid73_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid89_pT2_uid79_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_i : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_a1 : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_b1 : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_q : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid60_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid60_inverseTables_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid63_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid63_inverseTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid66_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid66_inverseTables_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_reset : std_logic;
    type prodXY_uid85_pT1_uid73_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(11 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_ah : prodXY_uid85_pT1_uid73_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of prodXY_uid85_pT1_uid73_invPolyEval_cma_ah : signal is true;
    type prodXY_uid85_pT1_uid73_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(11 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_ch : prodXY_uid85_pT1_uid73_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid85_pT1_uid73_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (11 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_qq : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid85_pT1_uid73_invPolyEval_cma_ena2 : std_logic;
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_reset : std_logic;
    type prodXY_uid88_pT2_uid79_invPolyEval_cma_ahtype is array(NATURAL range <>) of UNSIGNED(14 downto 0);
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_ah : prodXY_uid88_pT2_uid79_invPolyEval_cma_ahtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid88_pT2_uid79_invPolyEval_cma_ah : signal is true;
    type prodXY_uid88_pT2_uid79_invPolyEval_cma_chtype is array(NATURAL range <>) of SIGNED(21 downto 0);
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_ch : prodXY_uid88_pT2_uid79_invPolyEval_cma_chtype(0 to 0);
    attribute preserve_syn_only of prodXY_uid88_pT2_uid79_invPolyEval_cma_ch : signal is true;
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_c0 : STD_LOGIC_VECTOR (21 downto 0);
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_s0 : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid88_pT2_uid79_invPolyEval_cma_ena2 : std_logic;
    signal yAddr_uid36_fpInverseTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid36_fpInverseTest_merged_bit_select_c : STD_LOGIC_VECTOR (14 downto 0);
    signal redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_delay_0 : STD_LOGIC_VECTOR (14 downto 0);
    signal redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_delay_1 : STD_LOGIC_VECTOR (14 downto 0);
    signal redist4_memoryC2_uid66_inverseTables_lutmem_r_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist5_lowRangeB_uid74_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_fracXIsZero_uid31_fpInverseTest_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_excN_x_uid26_fpInverseTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_fracXIsZero_uid23_fpInverseTest_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_excZ_x_uid21_fpInverseTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_singX_uid8_fpInverseTest_b_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_outputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_reset0 : std_logic;
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_i : signal is true;
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_eq : signal is true;
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_sticky_ena_q : signal is true;
    signal redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_outputreg0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_reset0 : std_logic;
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_i : signal is true;
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_eq : signal is true;
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_sticky_ena_q : signal is true;
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_outputreg0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_reset0 : std_logic;
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_ia : STD_LOGIC_VECTOR (14 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_iq : STD_LOGIC_VECTOR (14 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve_syn_only of redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_i : signal is true;
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_eq : signal is true;
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_sticky_ena_q : signal is true;
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_mem_reset0 : std_logic;
    signal redist11_expX_uid6_fpInverseTest_b_16_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve_syn_only of redist11_expX_uid6_fpInverseTest_b_16_rdcnt_i : signal is true;
    signal redist11_expX_uid6_fpInverseTest_b_16_rdcnt_eq : std_logic;
    attribute preserve_syn_only of redist11_expX_uid6_fpInverseTest_b_16_rdcnt_eq : signal is true;
    signal redist11_expX_uid6_fpInverseTest_b_16_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_expX_uid6_fpInverseTest_b_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist11_expX_uid6_fpInverseTest_b_16_sticky_ena_q : signal is true;
    signal redist11_expX_uid6_fpInverseTest_b_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- fracX_uid7_fpInverseTest(BITSELECT,6)@0
    fracX_uid7_fpInverseTest_b <= a(22 downto 0);

    -- cstAllZWF_uid10_fpInverseTest(CONSTANT,9)
    cstAllZWF_uid10_fpInverseTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid23_fpInverseTest(LOGICAL,22)@0 + 1
    fracXIsZero_uid23_fpInverseTest_qi <= "1" WHEN cstAllZWF_uid10_fpInverseTest_q = fracX_uid7_fpInverseTest_b ELSE "0";
    fracXIsZero_uid23_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid23_fpInverseTest_qi, xout => fracXIsZero_uid23_fpInverseTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist8_fracXIsZero_uid23_fpInverseTest_q_16(DELAY,105)
    redist8_fracXIsZero_uid23_fpInverseTest_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid23_fpInverseTest_q, xout => redist8_fracXIsZero_uid23_fpInverseTest_q_16_q, clk => clk, aclr => areset, ena => '1' );

    -- fracXIsNotZero_uid24_fpInverseTest(LOGICAL,23)@16
    fracXIsNotZero_uid24_fpInverseTest_q <= not (redist8_fracXIsZero_uid23_fpInverseTest_q_16_q);

    -- cstAllOWE_uid9_fpInverseTest(CONSTANT,8)
    cstAllOWE_uid9_fpInverseTest_q <= "11111111";

    -- redist11_expX_uid6_fpInverseTest_b_16_notEnable(LOGICAL,148)
    redist11_expX_uid6_fpInverseTest_b_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist11_expX_uid6_fpInverseTest_b_16_nor(LOGICAL,149)
    redist11_expX_uid6_fpInverseTest_b_16_nor_q <= not (redist11_expX_uid6_fpInverseTest_b_16_notEnable_q or redist11_expX_uid6_fpInverseTest_b_16_sticky_ena_q);

    -- redist11_expX_uid6_fpInverseTest_b_16_mem_last(CONSTANT,145)
    redist11_expX_uid6_fpInverseTest_b_16_mem_last_q <= "01101";

    -- redist11_expX_uid6_fpInverseTest_b_16_cmp(LOGICAL,146)
    redist11_expX_uid6_fpInverseTest_b_16_cmp_b <= STD_LOGIC_VECTOR("0" & redist11_expX_uid6_fpInverseTest_b_16_rdcnt_q);
    redist11_expX_uid6_fpInverseTest_b_16_cmp_q <= "1" WHEN redist11_expX_uid6_fpInverseTest_b_16_mem_last_q = redist11_expX_uid6_fpInverseTest_b_16_cmp_b ELSE "0";

    -- redist11_expX_uid6_fpInverseTest_b_16_cmpReg(REG,147)
    redist11_expX_uid6_fpInverseTest_b_16_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_expX_uid6_fpInverseTest_b_16_cmpReg_q <= "0";
            ELSE
                redist11_expX_uid6_fpInverseTest_b_16_cmpReg_q <= STD_LOGIC_VECTOR(redist11_expX_uid6_fpInverseTest_b_16_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_expX_uid6_fpInverseTest_b_16_sticky_ena(REG,150)
    redist11_expX_uid6_fpInverseTest_b_16_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_expX_uid6_fpInverseTest_b_16_sticky_ena_q <= "0";
            ELSE
                IF (redist11_expX_uid6_fpInverseTest_b_16_nor_q = "1") THEN
                    redist11_expX_uid6_fpInverseTest_b_16_sticky_ena_q <= STD_LOGIC_VECTOR(redist11_expX_uid6_fpInverseTest_b_16_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist11_expX_uid6_fpInverseTest_b_16_enaAnd(LOGICAL,151)
    redist11_expX_uid6_fpInverseTest_b_16_enaAnd_q <= redist11_expX_uid6_fpInverseTest_b_16_sticky_ena_q and VCC_q;

    -- redist11_expX_uid6_fpInverseTest_b_16_rdcnt(COUNTER,143)
    -- low=0, high=14, step=1, init=0
    redist11_expX_uid6_fpInverseTest_b_16_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_expX_uid6_fpInverseTest_b_16_rdcnt_i <= TO_UNSIGNED(0, 4);
                redist11_expX_uid6_fpInverseTest_b_16_rdcnt_eq <= '0';
            ELSE
                IF (redist11_expX_uid6_fpInverseTest_b_16_rdcnt_i = TO_UNSIGNED(13, 4)) THEN
                    redist11_expX_uid6_fpInverseTest_b_16_rdcnt_eq <= '1';
                ELSE
                    redist11_expX_uid6_fpInverseTest_b_16_rdcnt_eq <= '0';
                END IF;
                IF (redist11_expX_uid6_fpInverseTest_b_16_rdcnt_eq = '1') THEN
                    redist11_expX_uid6_fpInverseTest_b_16_rdcnt_i <= redist11_expX_uid6_fpInverseTest_b_16_rdcnt_i + 2;
                ELSE
                    redist11_expX_uid6_fpInverseTest_b_16_rdcnt_i <= redist11_expX_uid6_fpInverseTest_b_16_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist11_expX_uid6_fpInverseTest_b_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist11_expX_uid6_fpInverseTest_b_16_rdcnt_i, 4)));

    -- expX_uid6_fpInverseTest(BITSELECT,5)@0
    expX_uid6_fpInverseTest_b <= a(30 downto 23);

    -- redist11_expX_uid6_fpInverseTest_b_16_wraddr(REG,144)
    redist11_expX_uid6_fpInverseTest_b_16_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist11_expX_uid6_fpInverseTest_b_16_wraddr_q <= "1110";
            ELSE
                redist11_expX_uid6_fpInverseTest_b_16_wraddr_q <= STD_LOGIC_VECTOR(redist11_expX_uid6_fpInverseTest_b_16_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_expX_uid6_fpInverseTest_b_16_mem(DUALMEM,142)
    redist11_expX_uid6_fpInverseTest_b_16_mem_ia <= STD_LOGIC_VECTOR(expX_uid6_fpInverseTest_b);
    redist11_expX_uid6_fpInverseTest_b_16_mem_aa <= redist11_expX_uid6_fpInverseTest_b_16_wraddr_q;
    redist11_expX_uid6_fpInverseTest_b_16_mem_ab <= redist11_expX_uid6_fpInverseTest_b_16_rdcnt_q;
    redist11_expX_uid6_fpInverseTest_b_16_mem_reset0 <= areset;
    redist11_expX_uid6_fpInverseTest_b_16_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 15,
        width_b => 8,
        widthad_b => 4,
        numwords_b => 15,
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
        clocken1 => redist11_expX_uid6_fpInverseTest_b_16_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist11_expX_uid6_fpInverseTest_b_16_mem_reset0,
        clock1 => clk,
        address_a => redist11_expX_uid6_fpInverseTest_b_16_mem_aa,
        data_a => redist11_expX_uid6_fpInverseTest_b_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist11_expX_uid6_fpInverseTest_b_16_mem_ab,
        q_b => redist11_expX_uid6_fpInverseTest_b_16_mem_iq
    );
    redist11_expX_uid6_fpInverseTest_b_16_mem_q <= redist11_expX_uid6_fpInverseTest_b_16_mem_iq(7 downto 0);

    -- expXIsMax_uid22_fpInverseTest(LOGICAL,21)@16
    expXIsMax_uid22_fpInverseTest_q <= "1" WHEN redist11_expX_uid6_fpInverseTest_b_16_mem_q = cstAllOWE_uid9_fpInverseTest_q ELSE "0";

    -- excN_x_uid26_fpInverseTest(LOGICAL,25)@16
    excN_x_uid26_fpInverseTest_q <= expXIsMax_uid22_fpInverseTest_q and fracXIsNotZero_uid24_fpInverseTest_q;

    -- invExcRNaN_uid56_fpInverseTest(LOGICAL,55)@16
    invExcRNaN_uid56_fpInverseTest_q <= not (excN_x_uid26_fpInverseTest_q);

    -- singX_uid8_fpInverseTest(BITSELECT,7)@0
    singX_uid8_fpInverseTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- redist10_singX_uid8_fpInverseTest_b_16(DELAY,107)
    redist10_singX_uid8_fpInverseTest_b_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => singX_uid8_fpInverseTest_b, xout => redist10_singX_uid8_fpInverseTest_b_16_q, clk => clk, aclr => areset, ena => '1' );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signR_uid57_fpInverseTest(LOGICAL,56)@16 + 1
    signR_uid57_fpInverseTest_qi <= redist10_singX_uid8_fpInverseTest_b_16_q and invExcRNaN_uid56_fpInverseTest_q;
    signR_uid57_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => signR_uid57_fpInverseTest_qi, xout => signR_uid57_fpInverseTest_q, clk => clk, aclr => areset, ena => '1' );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cst2BiasM1_uid13_fpInverseTest(CONSTANT,12)
    cst2BiasM1_uid13_fpInverseTest_q <= "11111101";

    -- expRCompExt_uid39_fpInverseTest(SUB,38)@16
    expRCompExt_uid39_fpInverseTest_a <= STD_LOGIC_VECTOR("0" & cst2BiasM1_uid13_fpInverseTest_q);
    expRCompExt_uid39_fpInverseTest_b <= STD_LOGIC_VECTOR("0" & redist11_expX_uid6_fpInverseTest_b_16_mem_q);
    expRCompExt_uid39_fpInverseTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompExt_uid39_fpInverseTest_a) - UNSIGNED(expRCompExt_uid39_fpInverseTest_b));
    expRCompExt_uid39_fpInverseTest_q <= expRCompExt_uid39_fpInverseTest_o(8 downto 0);

    -- expRComp_uid40_fpInverseTest(BITSELECT,39)@16
    expRComp_uid40_fpInverseTest_in <= expRCompExt_uid39_fpInverseTest_q(7 downto 0);
    expRComp_uid40_fpInverseTest_b <= expRComp_uid40_fpInverseTest_in(7 downto 0);

    -- updatedY_uid32_fpInverseTest(BITJOIN,31)@0
    updatedY_uid32_fpInverseTest_q <= GND_q & cstAllZWF_uid10_fpInverseTest_q;

    -- fracXIsZero_uid31_fpInverseTest(LOGICAL,32)@0 + 1
    fracXIsZero_uid31_fpInverseTest_a <= STD_LOGIC_VECTOR("0" & fracX_uid7_fpInverseTest_b);
    fracXIsZero_uid31_fpInverseTest_qi <= "1" WHEN fracXIsZero_uid31_fpInverseTest_a = updatedY_uid32_fpInverseTest_q ELSE "0";
    fracXIsZero_uid31_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid31_fpInverseTest_qi, xout => fracXIsZero_uid31_fpInverseTest_q, clk => clk, aclr => areset, ena => '1' );

    -- redist6_fracXIsZero_uid31_fpInverseTest_q_16(DELAY,103)
    redist6_fracXIsZero_uid31_fpInverseTest_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => fracXIsZero_uid31_fpInverseTest_q, xout => redist6_fracXIsZero_uid31_fpInverseTest_q_16_q, clk => clk, aclr => areset, ena => '1' );

    -- cst2Bias_uid14_fpInverseTest(CONSTANT,13)
    cst2Bias_uid14_fpInverseTest_q <= "11111110";

    -- expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged(SUB,90)@16 + 1
    expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_a <= STD_LOGIC_VECTOR("0" & cst2Bias_uid14_fpInverseTest_q);
    expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_b <= STD_LOGIC_VECTOR("0" & redist11_expX_uid6_fpInverseTest_b_16_mem_q);
    expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_i <= "0" & expRComp_uid40_fpInverseTest_b;
    expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_a1 <= expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_i WHEN redist6_fracXIsZero_uid31_fpInverseTest_q_16_q = "0" ELSE expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_a;
    expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_b1 <= (others => '0') WHEN redist6_fracXIsZero_uid31_fpInverseTest_q_16_q = "0" ELSE expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_b;
    expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_o <= (others => '0');
            ELSE
                expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_a1) - UNSIGNED(expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_b1));
            END IF;
        END IF;
    END PROCESS;
    expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_q <= expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_o(7 downto 0);

    -- cstAllZWE_uid12_fpInverseTest(CONSTANT,11)
    cstAllZWE_uid12_fpInverseTest_q <= "00000000";

    -- redist7_excN_x_uid26_fpInverseTest_q_1(DELAY,104)
    redist7_excN_x_uid26_fpInverseTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist7_excN_x_uid26_fpInverseTest_q_1_q <= (others => '0');
            ELSE
                redist7_excN_x_uid26_fpInverseTest_q_1_q <= STD_LOGIC_VECTOR(excN_x_uid26_fpInverseTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- excZ_x_uid21_fpInverseTest(LOGICAL,20)@16
    excZ_x_uid21_fpInverseTest_q <= "1" WHEN redist11_expX_uid6_fpInverseTest_b_16_mem_q = cstAllZWE_uid12_fpInverseTest_q ELSE "0";

    -- redist9_excZ_x_uid21_fpInverseTest_q_1(DELAY,106)
    redist9_excZ_x_uid21_fpInverseTest_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist9_excZ_x_uid21_fpInverseTest_q_1_q <= (others => '0');
            ELSE
                redist9_excZ_x_uid21_fpInverseTest_q_1_q <= STD_LOGIC_VECTOR(excZ_x_uid21_fpInverseTest_q);
            END IF;
        END IF;
    END PROCESS;

    -- udf_uid41_fpInverseTest(BITSELECT,40)@16
    udf_uid41_fpInverseTest_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => expRCompExt_uid39_fpInverseTest_q(8)) & expRCompExt_uid39_fpInverseTest_q));
    udf_uid41_fpInverseTest_b <= STD_LOGIC_VECTOR(udf_uid41_fpInverseTest_in(9 downto 9));

    -- invExpXIsMax_uid27_fpInverseTest(LOGICAL,26)@16
    invExpXIsMax_uid27_fpInverseTest_q <= not (expXIsMax_uid22_fpInverseTest_q);

    -- InvExpXIsZero_uid28_fpInverseTest(LOGICAL,27)@16
    InvExpXIsZero_uid28_fpInverseTest_q <= not (excZ_x_uid21_fpInverseTest_q);

    -- excR_x_uid29_fpInverseTest(LOGICAL,28)@16
    excR_x_uid29_fpInverseTest_q <= InvExpXIsZero_uid28_fpInverseTest_q and invExpXIsMax_uid27_fpInverseTest_q;

    -- xRegAndUdf_uid49_fpInverseTest(LOGICAL,48)@16 + 1
    xRegAndUdf_uid49_fpInverseTest_qi <= excR_x_uid29_fpInverseTest_q and udf_uid41_fpInverseTest_b;
    xRegAndUdf_uid49_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => xRegAndUdf_uid49_fpInverseTest_qi, xout => xRegAndUdf_uid49_fpInverseTest_q, clk => clk, aclr => areset, ena => '1' );

    -- excI_x_uid25_fpInverseTest(LOGICAL,24)@16 + 1
    excI_x_uid25_fpInverseTest_qi <= expXIsMax_uid22_fpInverseTest_q and redist8_fracXIsZero_uid23_fpInverseTest_q_16_q;
    excI_x_uid25_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "SYNC", phase => 0, modulus => 1 )
    PORT MAP ( xin => excI_x_uid25_fpInverseTest_qi, xout => excI_x_uid25_fpInverseTest_q, clk => clk, aclr => areset, ena => '1' );

    -- xIOrXRUdf_uid50_fpInverseTest(LOGICAL,49)@17
    xIOrXRUdf_uid50_fpInverseTest_q <= excI_x_uid25_fpInverseTest_q or xRegAndUdf_uid49_fpInverseTest_q;

    -- excSelBits_uid51_fpInverseTest(BITJOIN,50)@17
    excSelBits_uid51_fpInverseTest_q <= redist7_excN_x_uid26_fpInverseTest_q_1_q & redist9_excZ_x_uid21_fpInverseTest_q_1_q & xIOrXRUdf_uid50_fpInverseTest_q;

    -- outMuxSelEnc_uid52_fpInverseTest(LOOKUP,51)@17
    outMuxSelEnc_uid52_fpInverseTest_combproc: PROCESS (excSelBits_uid51_fpInverseTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excSelBits_uid51_fpInverseTest_q) IS
            WHEN "000" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN "001" => outMuxSelEnc_uid52_fpInverseTest_q <= "00";
            WHEN "010" => outMuxSelEnc_uid52_fpInverseTest_q <= "10";
            WHEN "011" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN "100" => outMuxSelEnc_uid52_fpInverseTest_q <= "11";
            WHEN "101" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN "110" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN "111" => outMuxSelEnc_uid52_fpInverseTest_q <= "01";
            WHEN OTHERS => -- unreachable
                           outMuxSelEnc_uid52_fpInverseTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid55_fpInverseTest(MUX,54)@17
    expRPostExc_uid55_fpInverseTest_s <= outMuxSelEnc_uid52_fpInverseTest_q;
    expRPostExc_uid55_fpInverseTest_combproc: PROCESS (expRPostExc_uid55_fpInverseTest_s, cstAllZWE_uid12_fpInverseTest_q, expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_q, cstAllOWE_uid9_fpInverseTest_q)
    BEGIN
        CASE (expRPostExc_uid55_fpInverseTest_s) IS
            WHEN "00" => expRPostExc_uid55_fpInverseTest_q <= cstAllZWE_uid12_fpInverseTest_q;
            WHEN "01" => expRPostExc_uid55_fpInverseTest_q <= expRCompYIsOneExt_uid42_fpInverseTest_expRCalc_uid48_fpInverseTest_merged_q;
            WHEN "10" => expRPostExc_uid55_fpInverseTest_q <= cstAllOWE_uid9_fpInverseTest_q;
            WHEN "11" => expRPostExc_uid55_fpInverseTest_q <= cstAllOWE_uid9_fpInverseTest_q;
            WHEN OTHERS => expRPostExc_uid55_fpInverseTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstNaNWF_uid11_fpInverseTest(CONSTANT,10)
    cstNaNWF_uid11_fpInverseTest_q <= "00000000000000000000001";

    -- oFracX_uid30_fpInverseTest(BITJOIN,29)@0
    oFracX_uid30_fpInverseTest_q <= VCC_q & fracX_uid7_fpInverseTest_b;

    -- y_uid34_fpInverseTest(BITSELECT,33)@0
    y_uid34_fpInverseTest_in <= oFracX_uid30_fpInverseTest_q(22 downto 0);
    y_uid34_fpInverseTest_b <= y_uid34_fpInverseTest_in(22 downto 0);

    -- yAddr_uid36_fpInverseTest_merged_bit_select(BITSELECT,96)@0
    yAddr_uid36_fpInverseTest_merged_bit_select_b <= y_uid34_fpInverseTest_b(22 downto 15);
    yAddr_uid36_fpInverseTest_merged_bit_select_c <= y_uid34_fpInverseTest_b(14 downto 0);

    -- memoryC2_uid66_inverseTables_lutmem(DUALMEM,93)@0 + 2
    -- in j@20000000
    memoryC2_uid66_inverseTables_lutmem_aa <= yAddr_uid36_fpInverseTest_merged_bit_select_b;
    memoryC2_uid66_inverseTables_lutmem_reset0 <= areset;
    memoryC2_uid66_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Inv_altera_fp_functions_191_j4yadhq_memoryC2_uid66_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC2_uid66_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid66_inverseTables_lutmem_aa,
        q_a => memoryC2_uid66_inverseTables_lutmem_ir
    );
    memoryC2_uid66_inverseTables_lutmem_r <= memoryC2_uid66_inverseTables_lutmem_ir(11 downto 0);

    -- redist4_memoryC2_uid66_inverseTables_lutmem_r_1(DELAY,101)
    redist4_memoryC2_uid66_inverseTables_lutmem_r_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist4_memoryC2_uid66_inverseTables_lutmem_r_1_q <= (others => '0');
            ELSE
                redist4_memoryC2_uid66_inverseTables_lutmem_r_1_q <= STD_LOGIC_VECTOR(memoryC2_uid66_inverseTables_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3(DELAY,99)
    redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_delay_0 <= (others => '0');
                redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_delay_1 <= (others => '0');
                redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_q <= (others => '0');
            ELSE
                redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_delay_0 <= STD_LOGIC_VECTOR(yAddr_uid36_fpInverseTest_merged_bit_select_c);
                redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_delay_1 <= redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_delay_0;
                redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_q <= redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_delay_1;
            END IF;
        END IF;
    END PROCESS;

    -- yT1_uid72_invPolyEval(BITSELECT,71)@3
    yT1_uid72_invPolyEval_b <= redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_q(14 downto 3);

    -- prodXY_uid85_pT1_uid73_invPolyEval_cma(CHAINMULTADD,94)@3 + 5
    -- out q@9
    prodXY_uid85_pT1_uid73_invPolyEval_cma_reset <= areset;
    prodXY_uid85_pT1_uid73_invPolyEval_cma_ena0 <= '1';
    prodXY_uid85_pT1_uid73_invPolyEval_cma_ena1 <= prodXY_uid85_pT1_uid73_invPolyEval_cma_ena0;
    prodXY_uid85_pT1_uid73_invPolyEval_cma_ena2 <= prodXY_uid85_pT1_uid73_invPolyEval_cma_ena0;
    prodXY_uid85_pT1_uid73_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                prodXY_uid85_pT1_uid73_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(yT1_uid72_invPolyEval_b),12);
                prodXY_uid85_pT1_uid73_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(redist4_memoryC2_uid66_inverseTables_lutmem_r_1_q),12);
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid85_pT1_uid73_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid85_pT1_uid73_invPolyEval_cma_ah(0));
    prodXY_uid85_pT1_uid73_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid85_pT1_uid73_invPolyEval_cma_ch(0));
    prodXY_uid85_pT1_uid73_invPolyEval_cma_DSP0 : fourteennm_mac
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
        ena(0) => prodXY_uid85_pT1_uid73_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid85_pT1_uid73_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid85_pT1_uid73_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid85_pT1_uid73_invPolyEval_cma_reset,
        clr(1) => prodXY_uid85_pT1_uid73_invPolyEval_cma_reset,
        ay => prodXY_uid85_pT1_uid73_invPolyEval_cma_a0,
        ax => prodXY_uid85_pT1_uid73_invPolyEval_cma_c0,
        resulta => prodXY_uid85_pT1_uid73_invPolyEval_cma_s0
    );
    prodXY_uid85_pT1_uid73_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid85_pT1_uid73_invPolyEval_cma_s0, xout => prodXY_uid85_pT1_uid73_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    prodXY_uid85_pT1_uid73_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid85_pT1_uid73_invPolyEval_cma_qq(23 downto 0));

    -- osig_uid86_pT1_uid73_invPolyEval(BITSELECT,85)@9
    osig_uid86_pT1_uid73_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid85_pT1_uid73_invPolyEval_cma_q(23 downto 11));

    -- highBBits_uid75_invPolyEval(BITSELECT,74)@9
    highBBits_uid75_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid86_pT1_uid73_invPolyEval_b(12 downto 1));

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_notEnable(LOGICAL,116)
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_nor(LOGICAL,117)
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_nor_q <= not (redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_notEnable_q or redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_sticky_ena_q);

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_last(CONSTANT,113)
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_last_q <= "011";

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_cmp(LOGICAL,114)
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_cmp_q <= "1" WHEN redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_last_q = redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_q ELSE "0";

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_cmpReg(REG,115)
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_cmpReg_q <= "0";
            ELSE
                redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_cmpReg_q <= STD_LOGIC_VECTOR(redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_sticky_ena(REG,118)
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_sticky_ena_q <= "0";
            ELSE
                IF (redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_nor_q = "1") THEN
                    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_enaAnd(LOGICAL,119)
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_enaAnd_q <= redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_sticky_ena_q and VCC_q;

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt(COUNTER,111)
    -- low=0, high=4, step=1, init=0
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_eq <= '0';
            ELSE
                IF (redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_eq <= '1';
                ELSE
                    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_eq <= '0';
                END IF;
                IF (redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_eq = '1') THEN
                    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_i <= redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_i + 4;
                ELSE
                    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_i <= redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_i, 3)));

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_wraddr(REG,112)
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_wraddr_q <= "100";
            ELSE
                redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_wraddr_q <= STD_LOGIC_VECTOR(redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem(DUALMEM,110)
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_ia <= STD_LOGIC_VECTOR(yAddr_uid36_fpInverseTest_merged_bit_select_b);
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_aa <= redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_wraddr_q;
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_ab <= redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_rdcnt_q;
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_reset0 <= areset;
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_dmem : altera_syncram
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
        clocken1 => redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_reset0,
        clock1 => clk,
        address_a => redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_aa,
        data_a => redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_ab,
        q_b => redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_iq
    );
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_q <= redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_iq(7 downto 0);

    -- redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_outputreg0(DELAY,109)
    redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_outputreg0_q <= (others => '0');
            ELSE
                redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_outputreg0_q <= STD_LOGIC_VECTOR(redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC1_uid63_inverseTables_lutmem(DUALMEM,92)@7 + 2
    -- in j@20000000
    memoryC1_uid63_inverseTables_lutmem_aa <= redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_outputreg0_q;
    memoryC1_uid63_inverseTables_lutmem_reset0 <= areset;
    memoryC1_uid63_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_sclr_a => "SCLEAR",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "Float_Inv_altera_fp_functions_191_j4yadhq_memoryC1_uid63_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC1_uid63_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid63_inverseTables_lutmem_aa,
        q_a => memoryC1_uid63_inverseTables_lutmem_ir
    );
    memoryC1_uid63_inverseTables_lutmem_r <= memoryC1_uid63_inverseTables_lutmem_ir(19 downto 0);

    -- s1sumAHighB_uid76_invPolyEval(ADD,75)@9 + 1
    s1sumAHighB_uid76_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => memoryC1_uid63_inverseTables_lutmem_r(19)) & memoryC1_uid63_inverseTables_lutmem_r));
    s1sumAHighB_uid76_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 12 => highBBits_uid75_invPolyEval_b(11)) & highBBits_uid75_invPolyEval_b));
    s1sumAHighB_uid76_invPolyEval_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                s1sumAHighB_uid76_invPolyEval_o <= (others => '0');
            ELSE
                s1sumAHighB_uid76_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid76_invPolyEval_a) + SIGNED(s1sumAHighB_uid76_invPolyEval_b));
            END IF;
        END IF;
    END PROCESS;
    s1sumAHighB_uid76_invPolyEval_q <= s1sumAHighB_uid76_invPolyEval_o(20 downto 0);

    -- lowRangeB_uid74_invPolyEval(BITSELECT,73)@9
    lowRangeB_uid74_invPolyEval_in <= osig_uid86_pT1_uid73_invPolyEval_b(0 downto 0);
    lowRangeB_uid74_invPolyEval_b <= lowRangeB_uid74_invPolyEval_in(0 downto 0);

    -- redist5_lowRangeB_uid74_invPolyEval_b_1(DELAY,102)
    redist5_lowRangeB_uid74_invPolyEval_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist5_lowRangeB_uid74_invPolyEval_b_1_q <= (others => '0');
            ELSE
                redist5_lowRangeB_uid74_invPolyEval_b_1_q <= STD_LOGIC_VECTOR(lowRangeB_uid74_invPolyEval_b);
            END IF;
        END IF;
    END PROCESS;

    -- s1_uid77_invPolyEval(BITJOIN,76)@10
    s1_uid77_invPolyEval_q <= s1sumAHighB_uid76_invPolyEval_q & redist5_lowRangeB_uid74_invPolyEval_b_1_q;

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_notEnable(LOGICAL,138)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_nor(LOGICAL,139)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_nor_q <= not (redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_notEnable_q or redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_sticky_ena_q);

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_last(CONSTANT,135)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_last_q <= "011";

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_cmp(LOGICAL,136)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_cmp_q <= "1" WHEN redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_last_q = redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_q ELSE "0";

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_cmpReg(REG,137)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_cmpReg_q <= "0";
            ELSE
                redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_cmpReg_q <= STD_LOGIC_VECTOR(redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_sticky_ena(REG,140)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_sticky_ena_q <= "0";
            ELSE
                IF (redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_nor_q = "1") THEN
                    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_enaAnd(LOGICAL,141)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_enaAnd_q <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_sticky_ena_q and VCC_q;

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt(COUNTER,133)
    -- low=0, high=4, step=1, init=0
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_eq <= '0';
            ELSE
                IF (redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_eq <= '1';
                ELSE
                    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_eq <= '0';
                END IF;
                IF (redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_eq = '1') THEN
                    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_i <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_i + 4;
                ELSE
                    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_i <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_i, 3)));

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_wraddr(REG,134)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_wraddr_q <= "100";
            ELSE
                redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_wraddr_q <= STD_LOGIC_VECTOR(redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem(DUALMEM,132)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_ia <= STD_LOGIC_VECTOR(redist2_yAddr_uid36_fpInverseTest_merged_bit_select_c_3_q);
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_aa <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_wraddr_q;
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_ab <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_rdcnt_q;
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_reset0 <= areset;
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 15,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 15,
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
        clocken1 => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_reset0,
        clock1 => clk,
        address_a => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_aa,
        data_a => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_ab,
        q_b => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_iq
    );
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_q <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_iq(14 downto 0);

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_outputreg0(DELAY,131)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_outputreg0_q <= (others => '0');
            ELSE
                redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_outputreg0_q <= STD_LOGIC_VECTOR(redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- prodXY_uid88_pT2_uid79_invPolyEval_cma(CHAINMULTADD,95)@10 + 5
    -- out q@16
    prodXY_uid88_pT2_uid79_invPolyEval_cma_reset <= areset;
    prodXY_uid88_pT2_uid79_invPolyEval_cma_ena0 <= '1';
    prodXY_uid88_pT2_uid79_invPolyEval_cma_ena1 <= prodXY_uid88_pT2_uid79_invPolyEval_cma_ena0;
    prodXY_uid88_pT2_uid79_invPolyEval_cma_ena2 <= prodXY_uid88_pT2_uid79_invPolyEval_cma_ena0;
    prodXY_uid88_pT2_uid79_invPolyEval_cma_chainmultadd_hyper: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (false) THEN
            ELSE
                prodXY_uid88_pT2_uid79_invPolyEval_cma_ah(0) <= RESIZE(UNSIGNED(redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_10_outputreg0_q),15);
                prodXY_uid88_pT2_uid79_invPolyEval_cma_ch(0) <= RESIZE(SIGNED(s1_uid77_invPolyEval_q),22);
            END IF;
        END IF;
    END PROCESS;

    prodXY_uid88_pT2_uid79_invPolyEval_cma_a0 <= STD_LOGIC_VECTOR(prodXY_uid88_pT2_uid79_invPolyEval_cma_ah(0));
    prodXY_uid88_pT2_uid79_invPolyEval_cma_c0 <= STD_LOGIC_VECTOR(prodXY_uid88_pT2_uid79_invPolyEval_cma_ch(0));
    prodXY_uid88_pT2_uid79_invPolyEval_cma_DSP0 : fourteennm_mac
    GENERIC MAP (
        operation_mode => "m27x27",
        clear_type => "sclr",
        use_chainadder => "false",
        ay_scan_in_clock => "0",
        ay_scan_in_width => 15,
        ax_clock => "0",
        ax_width => 22,
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
        ena(0) => prodXY_uid88_pT2_uid79_invPolyEval_cma_ena0,
        ena(1) => prodXY_uid88_pT2_uid79_invPolyEval_cma_ena1,
        ena(2) => prodXY_uid88_pT2_uid79_invPolyEval_cma_ena2,
        clr(0) => prodXY_uid88_pT2_uid79_invPolyEval_cma_reset,
        clr(1) => prodXY_uid88_pT2_uid79_invPolyEval_cma_reset,
        ay => prodXY_uid88_pT2_uid79_invPolyEval_cma_a0,
        ax => prodXY_uid88_pT2_uid79_invPolyEval_cma_c0,
        resulta => prodXY_uid88_pT2_uid79_invPolyEval_cma_s0
    );
    prodXY_uid88_pT2_uid79_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 1, reset_kind => "NONE", phase => 0, modulus => 1 )
    PORT MAP ( xin => prodXY_uid88_pT2_uid79_invPolyEval_cma_s0, xout => prodXY_uid88_pT2_uid79_invPolyEval_cma_qq, clk => clk, aclr => areset, ena => '1' );
    prodXY_uid88_pT2_uid79_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid88_pT2_uid79_invPolyEval_cma_qq(36 downto 0));

    -- osig_uid89_pT2_uid79_invPolyEval(BITSELECT,88)@16
    osig_uid89_pT2_uid79_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid88_pT2_uid79_invPolyEval_cma_q(36 downto 14));

    -- highBBits_uid81_invPolyEval(BITSELECT,80)@16
    highBBits_uid81_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid89_pT2_uid79_invPolyEval_b(22 downto 2));

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_notEnable(LOGICAL,127)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_nor(LOGICAL,128)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_nor_q <= not (redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_notEnable_q or redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_sticky_ena_q);

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_last(CONSTANT,124)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_last_q <= "011";

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_cmp(LOGICAL,125)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_cmp_q <= "1" WHEN redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_last_q = redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_q ELSE "0";

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_cmpReg(REG,126)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_cmpReg_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_cmpReg_q <= "0";
            ELSE
                redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_cmpReg_q <= STD_LOGIC_VECTOR(redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_sticky_ena(REG,129)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_sticky_ena_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_sticky_ena_q <= "0";
            ELSE
                IF (redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_nor_q = "1") THEN
                    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_sticky_ena_q <= STD_LOGIC_VECTOR(redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_cmpReg_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_enaAnd(LOGICAL,130)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_enaAnd_q <= redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_sticky_ena_q and VCC_q;

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt(COUNTER,122)
    -- low=0, high=4, step=1, init=0
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_i <= TO_UNSIGNED(0, 3);
                redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_eq <= '0';
            ELSE
                IF (redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_eq <= '1';
                ELSE
                    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_eq <= '0';
                END IF;
                IF (redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_eq = '1') THEN
                    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_i <= redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_i + 4;
                ELSE
                    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_i <= redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_i, 3)));

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_wraddr(REG,123)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_wraddr_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_wraddr_q <= "100";
            ELSE
                redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_wraddr_q <= STD_LOGIC_VECTOR(redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem(DUALMEM,121)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_ia <= STD_LOGIC_VECTOR(redist0_yAddr_uid36_fpInverseTest_merged_bit_select_b_7_outputreg0_q);
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_aa <= redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_wraddr_q;
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_ab <= redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_rdcnt_q;
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_reset0 <= areset;
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_dmem : altera_syncram
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
        clocken1 => redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        sclr => redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_reset0,
        clock1 => clk,
        address_a => redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_aa,
        data_a => redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_ab,
        q_b => redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_iq
    );
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_q <= redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_iq(7 downto 0);

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_outputreg0(DELAY,120)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_outputreg0_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_outputreg0_q <= (others => '0');
            ELSE
                redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_outputreg0_q <= STD_LOGIC_VECTOR(redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_mem_q);
            END IF;
        END IF;
    END PROCESS;

    -- memoryC0_uid60_inverseTables_lutmem(DUALMEM,91)@14 + 2
    -- in j@20000000
    memoryC0_uid60_inverseTables_lutmem_aa <= redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_14_outputreg0_q;
    memoryC0_uid60_inverseTables_lutmem_reset0 <= areset;
    memoryC0_uid60_inverseTables_lutmem_dmem : altera_syncram
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
        init_file => "Float_Inv_altera_fp_functions_191_j4yadhq_memoryC0_uid60_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Stratix 10"
    )
    PORT MAP (
        clocken0 => '1',
        sclr => memoryC0_uid60_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid60_inverseTables_lutmem_aa,
        q_a => memoryC0_uid60_inverseTables_lutmem_ir
    );
    memoryC0_uid60_inverseTables_lutmem_r <= memoryC0_uid60_inverseTables_lutmem_ir(28 downto 0);

    -- s2sumAHighB_uid82_invPolyEval(ADD,81)@16
    s2sumAHighB_uid82_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid60_inverseTables_lutmem_r(28)) & memoryC0_uid60_inverseTables_lutmem_r));
    s2sumAHighB_uid82_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 21 => highBBits_uid81_invPolyEval_b(20)) & highBBits_uid81_invPolyEval_b));
    s2sumAHighB_uid82_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid82_invPolyEval_a) + SIGNED(s2sumAHighB_uid82_invPolyEval_b));
    s2sumAHighB_uid82_invPolyEval_q <= s2sumAHighB_uid82_invPolyEval_o(29 downto 0);

    -- lowRangeB_uid80_invPolyEval(BITSELECT,79)@16
    lowRangeB_uid80_invPolyEval_in <= osig_uid89_pT2_uid79_invPolyEval_b(1 downto 0);
    lowRangeB_uid80_invPolyEval_b <= lowRangeB_uid80_invPolyEval_in(1 downto 0);

    -- s2_uid83_invPolyEval(BITJOIN,82)@16
    s2_uid83_invPolyEval_q <= s2sumAHighB_uid82_invPolyEval_q & lowRangeB_uid80_invPolyEval_b;

    -- fxpInverseRes_uid44_fpInverseTest(BITSELECT,43)@16
    fxpInverseRes_uid44_fpInverseTest_in <= s2_uid83_invPolyEval_q(28 downto 0);
    fxpInverseRes_uid44_fpInverseTest_b <= fxpInverseRes_uid44_fpInverseTest_in(28 downto 5);

    -- fxpInverseResFrac_uid46_fpInverseTest(BITSELECT,45)@16
    fxpInverseResFrac_uid46_fpInverseTest_in <= fxpInverseRes_uid44_fpInverseTest_b(22 downto 0);
    fxpInverseResFrac_uid46_fpInverseTest_b <= fxpInverseResFrac_uid46_fpInverseTest_in(22 downto 0);

    -- fracRCalc_uid47_fpInverseTest(MUX,46)@16 + 1
    fracRCalc_uid47_fpInverseTest_s <= redist6_fracXIsZero_uid31_fpInverseTest_q_16_q;
    fracRCalc_uid47_fpInverseTest_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (areset = '1') THEN
                fracRCalc_uid47_fpInverseTest_q <= (others => '0');
            ELSE
                CASE (fracRCalc_uid47_fpInverseTest_s) IS
                    WHEN "0" => fracRCalc_uid47_fpInverseTest_q <= fxpInverseResFrac_uid46_fpInverseTest_b;
                    WHEN "1" => fracRCalc_uid47_fpInverseTest_q <= cstAllZWF_uid10_fpInverseTest_q;
                    WHEN OTHERS => fracRCalc_uid47_fpInverseTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid54_fpInverseTest(MUX,53)@17
    fracRPostExc_uid54_fpInverseTest_s <= outMuxSelEnc_uid52_fpInverseTest_q;
    fracRPostExc_uid54_fpInverseTest_combproc: PROCESS (fracRPostExc_uid54_fpInverseTest_s, cstAllZWF_uid10_fpInverseTest_q, fracRCalc_uid47_fpInverseTest_q, cstNaNWF_uid11_fpInverseTest_q)
    BEGIN
        CASE (fracRPostExc_uid54_fpInverseTest_s) IS
            WHEN "00" => fracRPostExc_uid54_fpInverseTest_q <= cstAllZWF_uid10_fpInverseTest_q;
            WHEN "01" => fracRPostExc_uid54_fpInverseTest_q <= fracRCalc_uid47_fpInverseTest_q;
            WHEN "10" => fracRPostExc_uid54_fpInverseTest_q <= cstAllZWF_uid10_fpInverseTest_q;
            WHEN "11" => fracRPostExc_uid54_fpInverseTest_q <= cstNaNWF_uid11_fpInverseTest_q;
            WHEN OTHERS => fracRPostExc_uid54_fpInverseTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid58_fpInverseTest(BITJOIN,57)@17
    R_uid58_fpInverseTest_q <= signR_uid57_fpInverseTest_q & expRPostExc_uid55_fpInverseTest_q & fracRPostExc_uid54_fpInverseTest_q;

    -- xOut(GPOUT,4)@17
    q <= R_uid58_fpInverseTest_q;

END normal;
