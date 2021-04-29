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

-- VHDL created from Fix_Sqrt_altera_fxp_functions_191_uiuenha
-- VHDL created on Tue Apr 20 22:55:37 2021


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

entity Fix_Sqrt_altera_fxp_functions_191_uiuenha is
    port (
        radical : in std_logic_vector(31 downto 0);  -- ufix32
        en : in std_logic_vector(0 downto 0);  -- ufix1
        result : out std_logic_vector(31 downto 0);  -- ufix32
        clk : in std_logic;
        rst : in std_logic
    );
end Fix_Sqrt_altera_fxp_functions_191_uiuenha;

architecture normal of Fix_Sqrt_altera_fxp_functions_191_uiuenha is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c00_uid7_sqrt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_opinx4_uid8_sqrt_q : STD_LOGIC_VECTOR (33 downto 0);
    signal c01_uid12_sqrt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sB_ms2iszero_uid15_sqrt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sB_ms2notzero_uid16_sqrt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sB_opout_uid18_sqrt_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sM_combine_uid20_sqrt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal sE_cmpge_uid23_sqrt_a : STD_LOGIC_VECTOR (5 downto 0);
    signal sE_cmpge_uid23_sqrt_b : STD_LOGIC_VECTOR (5 downto 0);
    signal sE_cmpge_uid23_sqrt_o : STD_LOGIC_VECTOR (5 downto 0);
    signal sE_cmpge_uid23_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid27_sqrt_q : STD_LOGIC_VECTOR (33 downto 0);
    signal sM_plus2pow_uid28_sqrt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sM_combine_uid30_sqrt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sE_cmpge_uid33_sqrt_a : STD_LOGIC_VECTOR (6 downto 0);
    signal sE_cmpge_uid33_sqrt_b : STD_LOGIC_VECTOR (6 downto 0);
    signal sE_cmpge_uid33_sqrt_o : STD_LOGIC_VECTOR (6 downto 0);
    signal sE_cmpge_uid33_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid37_sqrt_q : STD_LOGIC_VECTOR (32 downto 0);
    signal sM_plus2pow_uid38_sqrt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal sM_combine_uid40_sqrt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal sE_cmpge_uid43_sqrt_a : STD_LOGIC_VECTOR (7 downto 0);
    signal sE_cmpge_uid43_sqrt_b : STD_LOGIC_VECTOR (7 downto 0);
    signal sE_cmpge_uid43_sqrt_o : STD_LOGIC_VECTOR (7 downto 0);
    signal sE_cmpge_uid43_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid47_sqrt_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sM_plus2pow_uid48_sqrt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sM_combine_uid50_sqrt_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sE_cmpge_uid53_sqrt_a : STD_LOGIC_VECTOR (8 downto 0);
    signal sE_cmpge_uid53_sqrt_b : STD_LOGIC_VECTOR (8 downto 0);
    signal sE_cmpge_uid53_sqrt_o : STD_LOGIC_VECTOR (8 downto 0);
    signal sE_cmpge_uid53_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid57_sqrt_q : STD_LOGIC_VECTOR (30 downto 0);
    signal sM_plus2pow_uid58_sqrt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal sM_combine_uid60_sqrt_q : STD_LOGIC_VECTOR (6 downto 0);
    signal sE_cmpge_uid63_sqrt_a : STD_LOGIC_VECTOR (9 downto 0);
    signal sE_cmpge_uid63_sqrt_b : STD_LOGIC_VECTOR (9 downto 0);
    signal sE_cmpge_uid63_sqrt_o : STD_LOGIC_VECTOR (9 downto 0);
    signal sE_cmpge_uid63_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid67_sqrt_q : STD_LOGIC_VECTOR (29 downto 0);
    signal sM_plus2pow_uid68_sqrt_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sM_combine_uid70_sqrt_q : STD_LOGIC_VECTOR (7 downto 0);
    signal sE_cmpge_uid73_sqrt_a : STD_LOGIC_VECTOR (10 downto 0);
    signal sE_cmpge_uid73_sqrt_b : STD_LOGIC_VECTOR (10 downto 0);
    signal sE_cmpge_uid73_sqrt_o : STD_LOGIC_VECTOR (10 downto 0);
    signal sE_cmpge_uid73_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid77_sqrt_q : STD_LOGIC_VECTOR (28 downto 0);
    signal sM_plus2pow_uid78_sqrt_q : STD_LOGIC_VECTOR (6 downto 0);
    signal sM_combine_uid80_sqrt_q : STD_LOGIC_VECTOR (8 downto 0);
    signal sE_cmpge_uid83_sqrt_a : STD_LOGIC_VECTOR (11 downto 0);
    signal sE_cmpge_uid83_sqrt_b : STD_LOGIC_VECTOR (11 downto 0);
    signal sE_cmpge_uid83_sqrt_o : STD_LOGIC_VECTOR (11 downto 0);
    signal sE_cmpge_uid83_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid87_sqrt_q : STD_LOGIC_VECTOR (27 downto 0);
    signal sM_plus2pow_uid88_sqrt_q : STD_LOGIC_VECTOR (7 downto 0);
    signal sM_combine_uid90_sqrt_q : STD_LOGIC_VECTOR (9 downto 0);
    signal sE_cmpge_uid93_sqrt_a : STD_LOGIC_VECTOR (12 downto 0);
    signal sE_cmpge_uid93_sqrt_b : STD_LOGIC_VECTOR (12 downto 0);
    signal sE_cmpge_uid93_sqrt_o : STD_LOGIC_VECTOR (12 downto 0);
    signal sE_cmpge_uid93_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid97_sqrt_q : STD_LOGIC_VECTOR (26 downto 0);
    signal sM_plus2pow_uid98_sqrt_q : STD_LOGIC_VECTOR (8 downto 0);
    signal sM_combine_uid100_sqrt_q : STD_LOGIC_VECTOR (10 downto 0);
    signal sE_cmpge_uid103_sqrt_a : STD_LOGIC_VECTOR (13 downto 0);
    signal sE_cmpge_uid103_sqrt_b : STD_LOGIC_VECTOR (13 downto 0);
    signal sE_cmpge_uid103_sqrt_o : STD_LOGIC_VECTOR (13 downto 0);
    signal sE_cmpge_uid103_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid107_sqrt_q : STD_LOGIC_VECTOR (25 downto 0);
    signal sM_plus2pow_uid108_sqrt_q : STD_LOGIC_VECTOR (9 downto 0);
    signal sM_combine_uid110_sqrt_q : STD_LOGIC_VECTOR (11 downto 0);
    signal sE_cmpge_uid113_sqrt_a : STD_LOGIC_VECTOR (14 downto 0);
    signal sE_cmpge_uid113_sqrt_b : STD_LOGIC_VECTOR (14 downto 0);
    signal sE_cmpge_uid113_sqrt_o : STD_LOGIC_VECTOR (14 downto 0);
    signal sE_cmpge_uid113_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid117_sqrt_q : STD_LOGIC_VECTOR (24 downto 0);
    signal sM_plus2pow_uid118_sqrt_q : STD_LOGIC_VECTOR (10 downto 0);
    signal sM_combine_uid120_sqrt_q : STD_LOGIC_VECTOR (12 downto 0);
    signal sE_cmpge_uid123_sqrt_a : STD_LOGIC_VECTOR (15 downto 0);
    signal sE_cmpge_uid123_sqrt_b : STD_LOGIC_VECTOR (15 downto 0);
    signal sE_cmpge_uid123_sqrt_o : STD_LOGIC_VECTOR (15 downto 0);
    signal sE_cmpge_uid123_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid127_sqrt_q : STD_LOGIC_VECTOR (23 downto 0);
    signal sM_plus2pow_uid128_sqrt_q : STD_LOGIC_VECTOR (11 downto 0);
    signal sM_combine_uid130_sqrt_q : STD_LOGIC_VECTOR (13 downto 0);
    signal sE_cmpge_uid133_sqrt_a : STD_LOGIC_VECTOR (16 downto 0);
    signal sE_cmpge_uid133_sqrt_b : STD_LOGIC_VECTOR (16 downto 0);
    signal sE_cmpge_uid133_sqrt_o : STD_LOGIC_VECTOR (16 downto 0);
    signal sE_cmpge_uid133_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid137_sqrt_q : STD_LOGIC_VECTOR (22 downto 0);
    signal sM_plus2pow_uid138_sqrt_q : STD_LOGIC_VECTOR (12 downto 0);
    signal sM_combine_uid140_sqrt_q : STD_LOGIC_VECTOR (14 downto 0);
    signal sE_cmpge_uid143_sqrt_a : STD_LOGIC_VECTOR (17 downto 0);
    signal sE_cmpge_uid143_sqrt_b : STD_LOGIC_VECTOR (17 downto 0);
    signal sE_cmpge_uid143_sqrt_o : STD_LOGIC_VECTOR (17 downto 0);
    signal sE_cmpge_uid143_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid147_sqrt_q : STD_LOGIC_VECTOR (21 downto 0);
    signal sM_plus2pow_uid148_sqrt_q : STD_LOGIC_VECTOR (13 downto 0);
    signal sM_combine_uid150_sqrt_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sE_cmpge_uid153_sqrt_a : STD_LOGIC_VECTOR (18 downto 0);
    signal sE_cmpge_uid153_sqrt_b : STD_LOGIC_VECTOR (18 downto 0);
    signal sE_cmpge_uid153_sqrt_o : STD_LOGIC_VECTOR (18 downto 0);
    signal sE_cmpge_uid153_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid157_sqrt_q : STD_LOGIC_VECTOR (20 downto 0);
    signal sM_plus2pow_uid158_sqrt_q : STD_LOGIC_VECTOR (14 downto 0);
    signal sM_combine_uid160_sqrt_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sE_cmpge_uid163_sqrt_a : STD_LOGIC_VECTOR (19 downto 0);
    signal sE_cmpge_uid163_sqrt_b : STD_LOGIC_VECTOR (19 downto 0);
    signal sE_cmpge_uid163_sqrt_o : STD_LOGIC_VECTOR (19 downto 0);
    signal sE_cmpge_uid163_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sM_combine_uid167_sqrt_q : STD_LOGIC_VECTOR (19 downto 0);
    signal sM_plus2pow_uid168_sqrt_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sE_cmpCombine_uid170_sqrt_q : STD_LOGIC_VECTOR (17 downto 0);
    signal sE_opinls_uid171_sqrt_in : STD_LOGIC_VECTOR (18 downto 0);
    signal sE_opinls_uid171_sqrt_b : STD_LOGIC_VECTOR (18 downto 0);
    signal sE_cmpge_uid172_sqrt_a : STD_LOGIC_VECTOR (20 downto 0);
    signal sE_cmpge_uid172_sqrt_b : STD_LOGIC_VECTOR (20 downto 0);
    signal sE_cmpge_uid172_sqrt_o : STD_LOGIC_VECTOR (20 downto 0);
    signal sE_cmpge_uid172_sqrt_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sE_result_uid173_sqrt_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sR_resround_uid176_sqrt_a : STD_LOGIC_VECTOR (16 downto 0);
    signal sR_resround_uid176_sqrt_b : STD_LOGIC_VECTOR (16 downto 0);
    signal sR_resround_uid176_sqrt_o : STD_LOGIC_VECTOR (16 downto 0);
    signal sR_resround_uid176_sqrt_q : STD_LOGIC_VECTOR (16 downto 0);
    signal zeropad_uid177_sqrt_q : STD_LOGIC_VECTOR (14 downto 0);
    signal widen_uid178_sqrt_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_a : STD_LOGIC_VECTOR (2 downto 0);
    signal sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_b : STD_LOGIC_VECTOR (2 downto 0);
    signal sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_i : STD_LOGIC_VECTOR (2 downto 0);
    signal sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_a1 : STD_LOGIC_VECTOR (2 downto 0);
    signal sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_b1 : STD_LOGIC_VECTOR (2 downto 0);
    signal sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_o : STD_LOGIC_VECTOR (2 downto 0);
    signal sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_a : STD_LOGIC_VECTOR (4 downto 0);
    signal sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_b : STD_LOGIC_VECTOR (4 downto 0);
    signal sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_i : STD_LOGIC_VECTOR (4 downto 0);
    signal sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_a1 : STD_LOGIC_VECTOR (4 downto 0);
    signal sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_b1 : STD_LOGIC_VECTOR (4 downto 0);
    signal sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_o : STD_LOGIC_VECTOR (4 downto 0);
    signal sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_a : STD_LOGIC_VECTOR (5 downto 0);
    signal sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_b : STD_LOGIC_VECTOR (5 downto 0);
    signal sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_i : STD_LOGIC_VECTOR (5 downto 0);
    signal sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_a1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_b1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_o : STD_LOGIC_VECTOR (5 downto 0);
    signal sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_q : STD_LOGIC_VECTOR (4 downto 0);
    signal sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_a : STD_LOGIC_VECTOR (6 downto 0);
    signal sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_b : STD_LOGIC_VECTOR (6 downto 0);
    signal sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_i : STD_LOGIC_VECTOR (6 downto 0);
    signal sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_a1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_b1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_o : STD_LOGIC_VECTOR (6 downto 0);
    signal sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_a : STD_LOGIC_VECTOR (7 downto 0);
    signal sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_b : STD_LOGIC_VECTOR (7 downto 0);
    signal sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_i : STD_LOGIC_VECTOR (7 downto 0);
    signal sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_a1 : STD_LOGIC_VECTOR (7 downto 0);
    signal sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_b1 : STD_LOGIC_VECTOR (7 downto 0);
    signal sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_o : STD_LOGIC_VECTOR (7 downto 0);
    signal sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_q : STD_LOGIC_VECTOR (6 downto 0);
    signal sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_a : STD_LOGIC_VECTOR (8 downto 0);
    signal sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_b : STD_LOGIC_VECTOR (8 downto 0);
    signal sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_i : STD_LOGIC_VECTOR (8 downto 0);
    signal sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_a1 : STD_LOGIC_VECTOR (8 downto 0);
    signal sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_b1 : STD_LOGIC_VECTOR (8 downto 0);
    signal sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_o : STD_LOGIC_VECTOR (8 downto 0);
    signal sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_q : STD_LOGIC_VECTOR (7 downto 0);
    signal sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_a : STD_LOGIC_VECTOR (9 downto 0);
    signal sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_b : STD_LOGIC_VECTOR (9 downto 0);
    signal sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_i : STD_LOGIC_VECTOR (9 downto 0);
    signal sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_a1 : STD_LOGIC_VECTOR (9 downto 0);
    signal sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_b1 : STD_LOGIC_VECTOR (9 downto 0);
    signal sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_o : STD_LOGIC_VECTOR (9 downto 0);
    signal sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_q : STD_LOGIC_VECTOR (8 downto 0);
    signal sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_a : STD_LOGIC_VECTOR (10 downto 0);
    signal sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_b : STD_LOGIC_VECTOR (10 downto 0);
    signal sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_i : STD_LOGIC_VECTOR (10 downto 0);
    signal sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_a1 : STD_LOGIC_VECTOR (10 downto 0);
    signal sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_b1 : STD_LOGIC_VECTOR (10 downto 0);
    signal sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_o : STD_LOGIC_VECTOR (10 downto 0);
    signal sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_q : STD_LOGIC_VECTOR (9 downto 0);
    signal sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_a : STD_LOGIC_VECTOR (11 downto 0);
    signal sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_b : STD_LOGIC_VECTOR (11 downto 0);
    signal sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_i : STD_LOGIC_VECTOR (11 downto 0);
    signal sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_a1 : STD_LOGIC_VECTOR (11 downto 0);
    signal sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_b1 : STD_LOGIC_VECTOR (11 downto 0);
    signal sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_o : STD_LOGIC_VECTOR (11 downto 0);
    signal sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_q : STD_LOGIC_VECTOR (10 downto 0);
    signal sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_a : STD_LOGIC_VECTOR (12 downto 0);
    signal sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_b : STD_LOGIC_VECTOR (12 downto 0);
    signal sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_i : STD_LOGIC_VECTOR (12 downto 0);
    signal sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_a1 : STD_LOGIC_VECTOR (12 downto 0);
    signal sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_b1 : STD_LOGIC_VECTOR (12 downto 0);
    signal sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_o : STD_LOGIC_VECTOR (12 downto 0);
    signal sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_q : STD_LOGIC_VECTOR (11 downto 0);
    signal sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_a : STD_LOGIC_VECTOR (13 downto 0);
    signal sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_b : STD_LOGIC_VECTOR (13 downto 0);
    signal sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_i : STD_LOGIC_VECTOR (13 downto 0);
    signal sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_a1 : STD_LOGIC_VECTOR (13 downto 0);
    signal sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_b1 : STD_LOGIC_VECTOR (13 downto 0);
    signal sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_o : STD_LOGIC_VECTOR (13 downto 0);
    signal sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_q : STD_LOGIC_VECTOR (12 downto 0);
    signal sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_a : STD_LOGIC_VECTOR (14 downto 0);
    signal sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_b : STD_LOGIC_VECTOR (14 downto 0);
    signal sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_i : STD_LOGIC_VECTOR (14 downto 0);
    signal sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_a1 : STD_LOGIC_VECTOR (14 downto 0);
    signal sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_b1 : STD_LOGIC_VECTOR (14 downto 0);
    signal sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_o : STD_LOGIC_VECTOR (14 downto 0);
    signal sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_q : STD_LOGIC_VECTOR (13 downto 0);
    signal sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_a : STD_LOGIC_VECTOR (15 downto 0);
    signal sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_b : STD_LOGIC_VECTOR (15 downto 0);
    signal sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_i : STD_LOGIC_VECTOR (15 downto 0);
    signal sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_a1 : STD_LOGIC_VECTOR (15 downto 0);
    signal sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_b1 : STD_LOGIC_VECTOR (15 downto 0);
    signal sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_o : STD_LOGIC_VECTOR (15 downto 0);
    signal sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_q : STD_LOGIC_VECTOR (14 downto 0);
    signal sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_a : STD_LOGIC_VECTOR (16 downto 0);
    signal sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_b : STD_LOGIC_VECTOR (16 downto 0);
    signal sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_i : STD_LOGIC_VECTOR (16 downto 0);
    signal sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_a1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_b1 : STD_LOGIC_VECTOR (16 downto 0);
    signal sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_o : STD_LOGIC_VECTOR (16 downto 0);
    signal sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_q : STD_LOGIC_VECTOR (15 downto 0);
    signal sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_a : STD_LOGIC_VECTOR (17 downto 0);
    signal sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_b : STD_LOGIC_VECTOR (17 downto 0);
    signal sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_i : STD_LOGIC_VECTOR (17 downto 0);
    signal sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_a1 : STD_LOGIC_VECTOR (17 downto 0);
    signal sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_b1 : STD_LOGIC_VECTOR (17 downto 0);
    signal sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_o : STD_LOGIC_VECTOR (17 downto 0);
    signal sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_q : STD_LOGIC_VECTOR (16 downto 0);
    signal sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_a : STD_LOGIC_VECTOR (18 downto 0);
    signal sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_b : STD_LOGIC_VECTOR (18 downto 0);
    signal sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_i : STD_LOGIC_VECTOR (18 downto 0);
    signal sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_a1 : STD_LOGIC_VECTOR (18 downto 0);
    signal sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_b1 : STD_LOGIC_VECTOR (18 downto 0);
    signal sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_o : STD_LOGIC_VECTOR (18 downto 0);
    signal sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_q : STD_LOGIC_VECTOR (17 downto 0);
    signal sB_ms2_uid10_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sB_ms2_uid10_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal sM_opls_uid21_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (29 downto 0);
    signal sM_opls_uid21_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal sM_opls_uid31_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (32 downto 0);
    signal sM_opls_uid31_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (27 downto 0);
    signal sM_opls_uid31_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal sM_opls_uid41_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (31 downto 0);
    signal sM_opls_uid41_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (25 downto 0);
    signal sM_opls_uid41_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (5 downto 0);
    signal sM_opls_uid51_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (30 downto 0);
    signal sM_opls_uid51_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (23 downto 0);
    signal sM_opls_uid51_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (6 downto 0);
    signal sM_opls_uid61_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (29 downto 0);
    signal sM_opls_uid61_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (21 downto 0);
    signal sM_opls_uid61_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal sM_opls_uid71_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (28 downto 0);
    signal sM_opls_uid71_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (19 downto 0);
    signal sM_opls_uid71_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (8 downto 0);
    signal sM_opls_uid81_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (27 downto 0);
    signal sM_opls_uid81_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal sM_opls_uid81_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal sM_opls_uid91_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (26 downto 0);
    signal sM_opls_uid91_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal sM_opls_uid91_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal sM_opls_uid101_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (25 downto 0);
    signal sM_opls_uid101_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (13 downto 0);
    signal sM_opls_uid101_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (11 downto 0);
    signal sM_opls_uid111_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (24 downto 0);
    signal sM_opls_uid111_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (11 downto 0);
    signal sM_opls_uid111_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal sM_opls_uid121_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (23 downto 0);
    signal sM_opls_uid121_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal sM_opls_uid121_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal sM_opls_uid131_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (22 downto 0);
    signal sM_opls_uid131_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal sM_opls_uid131_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (14 downto 0);
    signal sM_opls_uid141_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (21 downto 0);
    signal sM_opls_uid141_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal sM_opls_uid141_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal sM_opls_uid151_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (20 downto 0);
    signal sM_opls_uid151_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal sM_opls_uid151_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (16 downto 0);
    signal sM_opls_uid161_sqrt_merged_bit_select_in : STD_LOGIC_VECTOR (19 downto 0);
    signal sM_opls_uid161_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sM_opls_uid161_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (17 downto 0);
    signal sR_resx2lsb_uid174_sqrt_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sR_resx2lsb_uid174_sqrt_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal redist0_sM_opls_uid161_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_sM_opls_uid161_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist2_sM_opls_uid151_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist3_sM_opls_uid151_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist4_sM_opls_uid141_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist5_sM_opls_uid141_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist6_sM_opls_uid131_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist7_sM_opls_uid131_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist8_sM_opls_uid121_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist9_sM_opls_uid121_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist10_sM_opls_uid111_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist11_sM_opls_uid111_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist12_sM_opls_uid101_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist13_sM_opls_uid101_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist14_sM_opls_uid91_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist15_sM_opls_uid91_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist16_sM_opls_uid81_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist17_sM_opls_uid81_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist18_sM_opls_uid71_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist19_sM_opls_uid71_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist20_sM_opls_uid61_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist21_sM_opls_uid61_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist22_sM_opls_uid51_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist23_sM_opls_uid51_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist24_sM_opls_uid41_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist25_sM_opls_uid41_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist26_sM_opls_uid21_sqrt_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal redist27_sM_opls_uid21_sqrt_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist28_sE_opinls_uid171_sqrt_b_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist29_sM_plus2pow_uid168_sqrt_q_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist30_sM_plus2pow_uid158_sqrt_q_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist31_sM_plus2pow_uid148_sqrt_q_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist32_sM_plus2pow_uid138_sqrt_q_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist33_sM_plus2pow_uid128_sqrt_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist34_sM_plus2pow_uid118_sqrt_q_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist35_sM_plus2pow_uid108_sqrt_q_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist36_sM_plus2pow_uid98_sqrt_q_1_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist37_sM_plus2pow_uid88_sqrt_q_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist38_sM_plus2pow_uid78_sqrt_q_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist39_sM_plus2pow_uid68_sqrt_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist40_sM_plus2pow_uid58_sqrt_q_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist41_sE_cmpge_uid43_sqrt_n_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_sM_plus2pow_uid38_sqrt_q_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist43_sM_plus2pow_uid38_sqrt_q_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist44_sM_combine_uid20_sqrt_q_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist45_sB_ms2notzero_uid16_sqrt_q_1_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- zeropad_uid177_sqrt(CONSTANT,176)
    zeropad_uid177_sqrt_q <= "000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- c00_uid7_sqrt(CONSTANT,6)
    c00_uid7_sqrt_q <= "00";

    -- sR_opinx4_uid8_sqrt(BITJOIN,7)@0
    sR_opinx4_uid8_sqrt_q <= radical & c00_uid7_sqrt_q;

    -- sB_ms2_uid10_sqrt_merged_bit_select(BITSELECT,195)@0
    sB_ms2_uid10_sqrt_merged_bit_select_b <= sR_opinx4_uid8_sqrt_q(33 downto 32);
    sB_ms2_uid10_sqrt_merged_bit_select_c <= sR_opinx4_uid8_sqrt_q(31 downto 0);

    -- sB_ms2iszero_uid15_sqrt(LOGICAL,14)@0
    sB_ms2iszero_uid15_sqrt_q <= "1" WHEN sB_ms2_uid10_sqrt_merged_bit_select_b = c00_uid7_sqrt_q ELSE "0";

    -- sB_ms2notzero_uid16_sqrt(LOGICAL,15)@0
    sB_ms2notzero_uid16_sqrt_q <= not (sB_ms2iszero_uid15_sqrt_q);

    -- redist45_sB_ms2notzero_uid16_sqrt_q_1(DELAY,257)
    redist45_sB_ms2notzero_uid16_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist45_sB_ms2notzero_uid16_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist45_sB_ms2notzero_uid16_sqrt_q_1_q <= STD_LOGIC_VECTOR(sB_ms2notzero_uid16_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- c01_uid12_sqrt(CONSTANT,11)
    c01_uid12_sqrt_q <= "01";

    -- sM_combine_uid20_sqrt(BITJOIN,19)@0
    sM_combine_uid20_sqrt_q <= sB_ms2notzero_uid16_sqrt_q & c01_uid12_sqrt_q;

    -- sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged(SUB,179)@0
    sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & sB_ms2_uid10_sqrt_merged_bit_select_b);
    sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_b <= STD_LOGIC_VECTOR("0" & c01_uid12_sqrt_q);
    sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_i <= sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_a;
    sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_a1 <= sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_i;
    sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_b1 <= (others => '0') WHEN sB_ms2notzero_uid16_sqrt_q = "0" ELSE sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_b;
    sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_a1) - UNSIGNED(sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_b1));
    sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_q <= sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_o(1 downto 0);

    -- sB_opout_uid18_sqrt(BITJOIN,17)@0
    sB_opout_uid18_sqrt_q <= sB_decr3_uid13_sqrt_sB_choose_uid17_sqrt_merged_q & sB_ms2_uid10_sqrt_merged_bit_select_c;

    -- sM_opls_uid21_sqrt_merged_bit_select(BITSELECT,196)@0
    sM_opls_uid21_sqrt_merged_bit_select_b <= sB_opout_uid18_sqrt_q(29 downto 0);
    sM_opls_uid21_sqrt_merged_bit_select_c <= sB_opout_uid18_sqrt_q(33 downto 30);

    -- sE_cmpge_uid23_sqrt(COMPARE,22)@0 + 1
    sE_cmpge_uid23_sqrt_a <= STD_LOGIC_VECTOR("00" & sM_opls_uid21_sqrt_merged_bit_select_c);
    sE_cmpge_uid23_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid20_sqrt_q);
    sE_cmpge_uid23_sqrt_clkproc: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                sE_cmpge_uid23_sqrt_o <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    sE_cmpge_uid23_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid23_sqrt_a) - UNSIGNED(sE_cmpge_uid23_sqrt_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    sE_cmpge_uid23_sqrt_n(0) <= not (sE_cmpge_uid23_sqrt_o(5));

    -- sM_plus2pow_uid28_sqrt(BITJOIN,27)@1
    sM_plus2pow_uid28_sqrt_q <= redist45_sB_ms2notzero_uid16_sqrt_q_1_q & sE_cmpge_uid23_sqrt_n;

    -- sM_combine_uid30_sqrt(BITJOIN,29)@1
    sM_combine_uid30_sqrt_q <= sM_plus2pow_uid28_sqrt_q & c01_uid12_sqrt_q;

    -- redist44_sM_combine_uid20_sqrt_q_1(DELAY,256)
    redist44_sM_combine_uid20_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist44_sM_combine_uid20_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist44_sM_combine_uid20_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_combine_uid20_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist27_sM_opls_uid21_sqrt_merged_bit_select_c_1(DELAY,239)
    redist27_sM_opls_uid21_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist27_sM_opls_uid21_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist27_sM_opls_uid21_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid21_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged(SUB,180)@1
    sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist27_sM_opls_uid21_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & redist44_sM_combine_uid20_sqrt_q_1_q);
    sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_i <= sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_a;
    sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_a1 <= sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_i;
    sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid23_sqrt_n = "0" ELSE sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_b;
    sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_b1));
    sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_q <= sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_o(3 downto 0);

    -- redist26_sM_opls_uid21_sqrt_merged_bit_select_b_1(DELAY,238)
    redist26_sM_opls_uid21_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist26_sM_opls_uid21_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist26_sM_opls_uid21_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid21_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid27_sqrt(BITJOIN,26)@1
    sM_combine_uid27_sqrt_q <= sM_decrms1_uid24_sqrt_sM_choosems_uid26_sqrt_merged_q & redist26_sM_opls_uid21_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid31_sqrt_merged_bit_select(BITSELECT,197)@1
    sM_opls_uid31_sqrt_merged_bit_select_in <= sM_combine_uid27_sqrt_q(32 downto 0);
    sM_opls_uid31_sqrt_merged_bit_select_b <= sM_opls_uid31_sqrt_merged_bit_select_in(27 downto 0);
    sM_opls_uid31_sqrt_merged_bit_select_c <= sM_opls_uid31_sqrt_merged_bit_select_in(32 downto 28);

    -- sE_cmpge_uid33_sqrt(COMPARE,32)@1
    sE_cmpge_uid33_sqrt_a <= STD_LOGIC_VECTOR("00" & sM_opls_uid31_sqrt_merged_bit_select_c);
    sE_cmpge_uid33_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid30_sqrt_q);
    sE_cmpge_uid33_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid33_sqrt_a) - UNSIGNED(sE_cmpge_uid33_sqrt_b));
    sE_cmpge_uid33_sqrt_n(0) <= not (sE_cmpge_uid33_sqrt_o(6));

    -- sM_plus2pow_uid38_sqrt(BITJOIN,37)@1
    sM_plus2pow_uid38_sqrt_q <= sM_plus2pow_uid28_sqrt_q & sE_cmpge_uid33_sqrt_n;

    -- redist42_sM_plus2pow_uid38_sqrt_q_1(DELAY,254)
    redist42_sM_plus2pow_uid38_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist42_sM_plus2pow_uid38_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist42_sM_plus2pow_uid38_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid38_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- redist43_sM_plus2pow_uid38_sqrt_q_2(DELAY,255)
    redist43_sM_plus2pow_uid38_sqrt_q_2_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist43_sM_plus2pow_uid38_sqrt_q_2_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist43_sM_plus2pow_uid38_sqrt_q_2_q <= STD_LOGIC_VECTOR(redist42_sM_plus2pow_uid38_sqrt_q_1_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid40_sqrt(BITJOIN,39)@2
    sM_combine_uid40_sqrt_q <= redist42_sM_plus2pow_uid38_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged(SUB,181)@1
    sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & sM_opls_uid31_sqrt_merged_bit_select_c);
    sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid30_sqrt_q);
    sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_i <= sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_a;
    sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_a1 <= sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_i;
    sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid33_sqrt_n = "0" ELSE sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_b;
    sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_b1));
    sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_q <= sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_o(4 downto 0);

    -- sM_combine_uid37_sqrt(BITJOIN,36)@1
    sM_combine_uid37_sqrt_q <= sM_decrms1_uid34_sqrt_sM_choosems_uid36_sqrt_merged_q & sM_opls_uid31_sqrt_merged_bit_select_b;

    -- sM_opls_uid41_sqrt_merged_bit_select(BITSELECT,198)@1
    sM_opls_uid41_sqrt_merged_bit_select_in <= sM_combine_uid37_sqrt_q(31 downto 0);
    sM_opls_uid41_sqrt_merged_bit_select_b <= sM_opls_uid41_sqrt_merged_bit_select_in(25 downto 0);
    sM_opls_uid41_sqrt_merged_bit_select_c <= sM_opls_uid41_sqrt_merged_bit_select_in(31 downto 26);

    -- redist25_sM_opls_uid41_sqrt_merged_bit_select_c_1(DELAY,237)
    redist25_sM_opls_uid41_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist25_sM_opls_uid41_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist25_sM_opls_uid41_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid41_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid43_sqrt(COMPARE,42)@2
    sE_cmpge_uid43_sqrt_a <= STD_LOGIC_VECTOR("00" & redist25_sM_opls_uid41_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid43_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid40_sqrt_q);
    sE_cmpge_uid43_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid43_sqrt_a) - UNSIGNED(sE_cmpge_uid43_sqrt_b));
    sE_cmpge_uid43_sqrt_n(0) <= not (sE_cmpge_uid43_sqrt_o(7));

    -- redist41_sE_cmpge_uid43_sqrt_n_1(DELAY,253)
    redist41_sE_cmpge_uid43_sqrt_n_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist41_sE_cmpge_uid43_sqrt_n_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist41_sE_cmpge_uid43_sqrt_n_1_q <= STD_LOGIC_VECTOR(sE_cmpge_uid43_sqrt_n);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_plus2pow_uid48_sqrt(BITJOIN,47)@3
    sM_plus2pow_uid48_sqrt_q <= redist43_sM_plus2pow_uid38_sqrt_q_2_q & redist41_sE_cmpge_uid43_sqrt_n_1_q;

    -- sM_combine_uid50_sqrt(BITJOIN,49)@3
    sM_combine_uid50_sqrt_q <= sM_plus2pow_uid48_sqrt_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged(SUB,182)@2
    sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist25_sM_opls_uid41_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid40_sqrt_q);
    sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_i <= sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_a;
    sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_a1 <= sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_i;
    sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid43_sqrt_n = "0" ELSE sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_b;
    sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_b1));
    sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_q <= sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_o(5 downto 0);

    -- redist24_sM_opls_uid41_sqrt_merged_bit_select_b_1(DELAY,236)
    redist24_sM_opls_uid41_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist24_sM_opls_uid41_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist24_sM_opls_uid41_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid41_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid47_sqrt(BITJOIN,46)@2
    sM_combine_uid47_sqrt_q <= sM_decrms1_uid44_sqrt_sM_choosems_uid46_sqrt_merged_q & redist24_sM_opls_uid41_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid51_sqrt_merged_bit_select(BITSELECT,199)@2
    sM_opls_uid51_sqrt_merged_bit_select_in <= sM_combine_uid47_sqrt_q(30 downto 0);
    sM_opls_uid51_sqrt_merged_bit_select_b <= sM_opls_uid51_sqrt_merged_bit_select_in(23 downto 0);
    sM_opls_uid51_sqrt_merged_bit_select_c <= sM_opls_uid51_sqrt_merged_bit_select_in(30 downto 24);

    -- redist23_sM_opls_uid51_sqrt_merged_bit_select_c_1(DELAY,235)
    redist23_sM_opls_uid51_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist23_sM_opls_uid51_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist23_sM_opls_uid51_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid51_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid53_sqrt(COMPARE,52)@3
    sE_cmpge_uid53_sqrt_a <= STD_LOGIC_VECTOR("00" & redist23_sM_opls_uid51_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid53_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid50_sqrt_q);
    sE_cmpge_uid53_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid53_sqrt_a) - UNSIGNED(sE_cmpge_uid53_sqrt_b));
    sE_cmpge_uid53_sqrt_n(0) <= not (sE_cmpge_uid53_sqrt_o(8));

    -- sM_plus2pow_uid58_sqrt(BITJOIN,57)@3
    sM_plus2pow_uid58_sqrt_q <= sM_plus2pow_uid48_sqrt_q & sE_cmpge_uid53_sqrt_n;

    -- redist40_sM_plus2pow_uid58_sqrt_q_1(DELAY,252)
    redist40_sM_plus2pow_uid58_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist40_sM_plus2pow_uid58_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist40_sM_plus2pow_uid58_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid58_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid60_sqrt(BITJOIN,59)@4
    sM_combine_uid60_sqrt_q <= redist40_sM_plus2pow_uid58_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged(SUB,183)@3
    sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist23_sM_opls_uid51_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid50_sqrt_q);
    sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_i <= sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_a;
    sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_a1 <= sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_i;
    sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid53_sqrt_n = "0" ELSE sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_b;
    sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_b1));
    sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_q <= sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_o(6 downto 0);

    -- redist22_sM_opls_uid51_sqrt_merged_bit_select_b_1(DELAY,234)
    redist22_sM_opls_uid51_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist22_sM_opls_uid51_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist22_sM_opls_uid51_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid51_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid57_sqrt(BITJOIN,56)@3
    sM_combine_uid57_sqrt_q <= sM_decrms1_uid54_sqrt_sM_choosems_uid56_sqrt_merged_q & redist22_sM_opls_uid51_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid61_sqrt_merged_bit_select(BITSELECT,200)@3
    sM_opls_uid61_sqrt_merged_bit_select_in <= sM_combine_uid57_sqrt_q(29 downto 0);
    sM_opls_uid61_sqrt_merged_bit_select_b <= sM_opls_uid61_sqrt_merged_bit_select_in(21 downto 0);
    sM_opls_uid61_sqrt_merged_bit_select_c <= sM_opls_uid61_sqrt_merged_bit_select_in(29 downto 22);

    -- redist21_sM_opls_uid61_sqrt_merged_bit_select_c_1(DELAY,233)
    redist21_sM_opls_uid61_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist21_sM_opls_uid61_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist21_sM_opls_uid61_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid61_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid63_sqrt(COMPARE,62)@4
    sE_cmpge_uid63_sqrt_a <= STD_LOGIC_VECTOR("00" & redist21_sM_opls_uid61_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid63_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid60_sqrt_q);
    sE_cmpge_uid63_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid63_sqrt_a) - UNSIGNED(sE_cmpge_uid63_sqrt_b));
    sE_cmpge_uid63_sqrt_n(0) <= not (sE_cmpge_uid63_sqrt_o(9));

    -- sM_plus2pow_uid68_sqrt(BITJOIN,67)@4
    sM_plus2pow_uid68_sqrt_q <= redist40_sM_plus2pow_uid58_sqrt_q_1_q & sE_cmpge_uid63_sqrt_n;

    -- redist39_sM_plus2pow_uid68_sqrt_q_1(DELAY,251)
    redist39_sM_plus2pow_uid68_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist39_sM_plus2pow_uid68_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist39_sM_plus2pow_uid68_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid68_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid70_sqrt(BITJOIN,69)@5
    sM_combine_uid70_sqrt_q <= redist39_sM_plus2pow_uid68_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged(SUB,184)@4
    sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist21_sM_opls_uid61_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid60_sqrt_q);
    sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_i <= sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_a;
    sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_a1 <= sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_i;
    sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid63_sqrt_n = "0" ELSE sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_b;
    sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_b1));
    sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_q <= sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_o(7 downto 0);

    -- redist20_sM_opls_uid61_sqrt_merged_bit_select_b_1(DELAY,232)
    redist20_sM_opls_uid61_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist20_sM_opls_uid61_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist20_sM_opls_uid61_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid61_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid67_sqrt(BITJOIN,66)@4
    sM_combine_uid67_sqrt_q <= sM_decrms1_uid64_sqrt_sM_choosems_uid66_sqrt_merged_q & redist20_sM_opls_uid61_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid71_sqrt_merged_bit_select(BITSELECT,201)@4
    sM_opls_uid71_sqrt_merged_bit_select_in <= sM_combine_uid67_sqrt_q(28 downto 0);
    sM_opls_uid71_sqrt_merged_bit_select_b <= sM_opls_uid71_sqrt_merged_bit_select_in(19 downto 0);
    sM_opls_uid71_sqrt_merged_bit_select_c <= sM_opls_uid71_sqrt_merged_bit_select_in(28 downto 20);

    -- redist19_sM_opls_uid71_sqrt_merged_bit_select_c_1(DELAY,231)
    redist19_sM_opls_uid71_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist19_sM_opls_uid71_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist19_sM_opls_uid71_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid71_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid73_sqrt(COMPARE,72)@5
    sE_cmpge_uid73_sqrt_a <= STD_LOGIC_VECTOR("00" & redist19_sM_opls_uid71_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid73_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid70_sqrt_q);
    sE_cmpge_uid73_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid73_sqrt_a) - UNSIGNED(sE_cmpge_uid73_sqrt_b));
    sE_cmpge_uid73_sqrt_n(0) <= not (sE_cmpge_uid73_sqrt_o(10));

    -- sM_plus2pow_uid78_sqrt(BITJOIN,77)@5
    sM_plus2pow_uid78_sqrt_q <= redist39_sM_plus2pow_uid68_sqrt_q_1_q & sE_cmpge_uid73_sqrt_n;

    -- redist38_sM_plus2pow_uid78_sqrt_q_1(DELAY,250)
    redist38_sM_plus2pow_uid78_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist38_sM_plus2pow_uid78_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist38_sM_plus2pow_uid78_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid78_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid80_sqrt(BITJOIN,79)@6
    sM_combine_uid80_sqrt_q <= redist38_sM_plus2pow_uid78_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged(SUB,185)@5
    sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist19_sM_opls_uid71_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid70_sqrt_q);
    sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_i <= sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_a;
    sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_a1 <= sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_i;
    sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid73_sqrt_n = "0" ELSE sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_b;
    sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_b1));
    sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_q <= sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_o(8 downto 0);

    -- redist18_sM_opls_uid71_sqrt_merged_bit_select_b_1(DELAY,230)
    redist18_sM_opls_uid71_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist18_sM_opls_uid71_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist18_sM_opls_uid71_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid71_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid77_sqrt(BITJOIN,76)@5
    sM_combine_uid77_sqrt_q <= sM_decrms1_uid74_sqrt_sM_choosems_uid76_sqrt_merged_q & redist18_sM_opls_uid71_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid81_sqrt_merged_bit_select(BITSELECT,202)@5
    sM_opls_uid81_sqrt_merged_bit_select_in <= sM_combine_uid77_sqrt_q(27 downto 0);
    sM_opls_uid81_sqrt_merged_bit_select_b <= sM_opls_uid81_sqrt_merged_bit_select_in(17 downto 0);
    sM_opls_uid81_sqrt_merged_bit_select_c <= sM_opls_uid81_sqrt_merged_bit_select_in(27 downto 18);

    -- redist17_sM_opls_uid81_sqrt_merged_bit_select_c_1(DELAY,229)
    redist17_sM_opls_uid81_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist17_sM_opls_uid81_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist17_sM_opls_uid81_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid81_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid83_sqrt(COMPARE,82)@6
    sE_cmpge_uid83_sqrt_a <= STD_LOGIC_VECTOR("00" & redist17_sM_opls_uid81_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid83_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid80_sqrt_q);
    sE_cmpge_uid83_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid83_sqrt_a) - UNSIGNED(sE_cmpge_uid83_sqrt_b));
    sE_cmpge_uid83_sqrt_n(0) <= not (sE_cmpge_uid83_sqrt_o(11));

    -- sM_plus2pow_uid88_sqrt(BITJOIN,87)@6
    sM_plus2pow_uid88_sqrt_q <= redist38_sM_plus2pow_uid78_sqrt_q_1_q & sE_cmpge_uid83_sqrt_n;

    -- redist37_sM_plus2pow_uid88_sqrt_q_1(DELAY,249)
    redist37_sM_plus2pow_uid88_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist37_sM_plus2pow_uid88_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist37_sM_plus2pow_uid88_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid88_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid90_sqrt(BITJOIN,89)@7
    sM_combine_uid90_sqrt_q <= redist37_sM_plus2pow_uid88_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged(SUB,186)@6
    sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist17_sM_opls_uid81_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid80_sqrt_q);
    sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_i <= sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_a;
    sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_a1 <= sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_i;
    sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid83_sqrt_n = "0" ELSE sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_b;
    sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_b1));
    sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_q <= sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_o(9 downto 0);

    -- redist16_sM_opls_uid81_sqrt_merged_bit_select_b_1(DELAY,228)
    redist16_sM_opls_uid81_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist16_sM_opls_uid81_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist16_sM_opls_uid81_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid81_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid87_sqrt(BITJOIN,86)@6
    sM_combine_uid87_sqrt_q <= sM_decrms1_uid84_sqrt_sM_choosems_uid86_sqrt_merged_q & redist16_sM_opls_uid81_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid91_sqrt_merged_bit_select(BITSELECT,203)@6
    sM_opls_uid91_sqrt_merged_bit_select_in <= sM_combine_uid87_sqrt_q(26 downto 0);
    sM_opls_uid91_sqrt_merged_bit_select_b <= sM_opls_uid91_sqrt_merged_bit_select_in(15 downto 0);
    sM_opls_uid91_sqrt_merged_bit_select_c <= sM_opls_uid91_sqrt_merged_bit_select_in(26 downto 16);

    -- redist15_sM_opls_uid91_sqrt_merged_bit_select_c_1(DELAY,227)
    redist15_sM_opls_uid91_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist15_sM_opls_uid91_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist15_sM_opls_uid91_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid91_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid93_sqrt(COMPARE,92)@7
    sE_cmpge_uid93_sqrt_a <= STD_LOGIC_VECTOR("00" & redist15_sM_opls_uid91_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid93_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid90_sqrt_q);
    sE_cmpge_uid93_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid93_sqrt_a) - UNSIGNED(sE_cmpge_uid93_sqrt_b));
    sE_cmpge_uid93_sqrt_n(0) <= not (sE_cmpge_uid93_sqrt_o(12));

    -- sM_plus2pow_uid98_sqrt(BITJOIN,97)@7
    sM_plus2pow_uid98_sqrt_q <= redist37_sM_plus2pow_uid88_sqrt_q_1_q & sE_cmpge_uid93_sqrt_n;

    -- redist36_sM_plus2pow_uid98_sqrt_q_1(DELAY,248)
    redist36_sM_plus2pow_uid98_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist36_sM_plus2pow_uid98_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist36_sM_plus2pow_uid98_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid98_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid100_sqrt(BITJOIN,99)@8
    sM_combine_uid100_sqrt_q <= redist36_sM_plus2pow_uid98_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged(SUB,187)@7
    sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist15_sM_opls_uid91_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid90_sqrt_q);
    sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_i <= sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_a;
    sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_a1 <= sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_i;
    sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid93_sqrt_n = "0" ELSE sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_b;
    sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_b1));
    sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_q <= sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_o(10 downto 0);

    -- redist14_sM_opls_uid91_sqrt_merged_bit_select_b_1(DELAY,226)
    redist14_sM_opls_uid91_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist14_sM_opls_uid91_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist14_sM_opls_uid91_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid91_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid97_sqrt(BITJOIN,96)@7
    sM_combine_uid97_sqrt_q <= sM_decrms1_uid94_sqrt_sM_choosems_uid96_sqrt_merged_q & redist14_sM_opls_uid91_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid101_sqrt_merged_bit_select(BITSELECT,204)@7
    sM_opls_uid101_sqrt_merged_bit_select_in <= sM_combine_uid97_sqrt_q(25 downto 0);
    sM_opls_uid101_sqrt_merged_bit_select_b <= sM_opls_uid101_sqrt_merged_bit_select_in(13 downto 0);
    sM_opls_uid101_sqrt_merged_bit_select_c <= sM_opls_uid101_sqrt_merged_bit_select_in(25 downto 14);

    -- redist13_sM_opls_uid101_sqrt_merged_bit_select_c_1(DELAY,225)
    redist13_sM_opls_uid101_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist13_sM_opls_uid101_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist13_sM_opls_uid101_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid101_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid103_sqrt(COMPARE,102)@8
    sE_cmpge_uid103_sqrt_a <= STD_LOGIC_VECTOR("00" & redist13_sM_opls_uid101_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid103_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid100_sqrt_q);
    sE_cmpge_uid103_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid103_sqrt_a) - UNSIGNED(sE_cmpge_uid103_sqrt_b));
    sE_cmpge_uid103_sqrt_n(0) <= not (sE_cmpge_uid103_sqrt_o(13));

    -- sM_plus2pow_uid108_sqrt(BITJOIN,107)@8
    sM_plus2pow_uid108_sqrt_q <= redist36_sM_plus2pow_uid98_sqrt_q_1_q & sE_cmpge_uid103_sqrt_n;

    -- redist35_sM_plus2pow_uid108_sqrt_q_1(DELAY,247)
    redist35_sM_plus2pow_uid108_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist35_sM_plus2pow_uid108_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist35_sM_plus2pow_uid108_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid108_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid110_sqrt(BITJOIN,109)@9
    sM_combine_uid110_sqrt_q <= redist35_sM_plus2pow_uid108_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged(SUB,188)@8
    sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist13_sM_opls_uid101_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid100_sqrt_q);
    sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_i <= sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_a;
    sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_a1 <= sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_i;
    sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid103_sqrt_n = "0" ELSE sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_b;
    sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_b1));
    sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_q <= sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_o(11 downto 0);

    -- redist12_sM_opls_uid101_sqrt_merged_bit_select_b_1(DELAY,224)
    redist12_sM_opls_uid101_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist12_sM_opls_uid101_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist12_sM_opls_uid101_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid101_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid107_sqrt(BITJOIN,106)@8
    sM_combine_uid107_sqrt_q <= sM_decrms1_uid104_sqrt_sM_choosems_uid106_sqrt_merged_q & redist12_sM_opls_uid101_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid111_sqrt_merged_bit_select(BITSELECT,205)@8
    sM_opls_uid111_sqrt_merged_bit_select_in <= sM_combine_uid107_sqrt_q(24 downto 0);
    sM_opls_uid111_sqrt_merged_bit_select_b <= sM_opls_uid111_sqrt_merged_bit_select_in(11 downto 0);
    sM_opls_uid111_sqrt_merged_bit_select_c <= sM_opls_uid111_sqrt_merged_bit_select_in(24 downto 12);

    -- redist11_sM_opls_uid111_sqrt_merged_bit_select_c_1(DELAY,223)
    redist11_sM_opls_uid111_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist11_sM_opls_uid111_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist11_sM_opls_uid111_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid111_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid113_sqrt(COMPARE,112)@9
    sE_cmpge_uid113_sqrt_a <= STD_LOGIC_VECTOR("00" & redist11_sM_opls_uid111_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid113_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid110_sqrt_q);
    sE_cmpge_uid113_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid113_sqrt_a) - UNSIGNED(sE_cmpge_uid113_sqrt_b));
    sE_cmpge_uid113_sqrt_n(0) <= not (sE_cmpge_uid113_sqrt_o(14));

    -- sM_plus2pow_uid118_sqrt(BITJOIN,117)@9
    sM_plus2pow_uid118_sqrt_q <= redist35_sM_plus2pow_uid108_sqrt_q_1_q & sE_cmpge_uid113_sqrt_n;

    -- redist34_sM_plus2pow_uid118_sqrt_q_1(DELAY,246)
    redist34_sM_plus2pow_uid118_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist34_sM_plus2pow_uid118_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist34_sM_plus2pow_uid118_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid118_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid120_sqrt(BITJOIN,119)@10
    sM_combine_uid120_sqrt_q <= redist34_sM_plus2pow_uid118_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged(SUB,189)@9
    sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist11_sM_opls_uid111_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid110_sqrt_q);
    sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_i <= sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_a;
    sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_a1 <= sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_i;
    sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid113_sqrt_n = "0" ELSE sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_b;
    sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_b1));
    sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_q <= sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_o(12 downto 0);

    -- redist10_sM_opls_uid111_sqrt_merged_bit_select_b_1(DELAY,222)
    redist10_sM_opls_uid111_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist10_sM_opls_uid111_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist10_sM_opls_uid111_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid111_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid117_sqrt(BITJOIN,116)@9
    sM_combine_uid117_sqrt_q <= sM_decrms1_uid114_sqrt_sM_choosems_uid116_sqrt_merged_q & redist10_sM_opls_uid111_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid121_sqrt_merged_bit_select(BITSELECT,206)@9
    sM_opls_uid121_sqrt_merged_bit_select_in <= sM_combine_uid117_sqrt_q(23 downto 0);
    sM_opls_uid121_sqrt_merged_bit_select_b <= sM_opls_uid121_sqrt_merged_bit_select_in(9 downto 0);
    sM_opls_uid121_sqrt_merged_bit_select_c <= sM_opls_uid121_sqrt_merged_bit_select_in(23 downto 10);

    -- redist9_sM_opls_uid121_sqrt_merged_bit_select_c_1(DELAY,221)
    redist9_sM_opls_uid121_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist9_sM_opls_uid121_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist9_sM_opls_uid121_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid121_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid123_sqrt(COMPARE,122)@10
    sE_cmpge_uid123_sqrt_a <= STD_LOGIC_VECTOR("00" & redist9_sM_opls_uid121_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid123_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid120_sqrt_q);
    sE_cmpge_uid123_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid123_sqrt_a) - UNSIGNED(sE_cmpge_uid123_sqrt_b));
    sE_cmpge_uid123_sqrt_n(0) <= not (sE_cmpge_uid123_sqrt_o(15));

    -- sM_plus2pow_uid128_sqrt(BITJOIN,127)@10
    sM_plus2pow_uid128_sqrt_q <= redist34_sM_plus2pow_uid118_sqrt_q_1_q & sE_cmpge_uid123_sqrt_n;

    -- redist33_sM_plus2pow_uid128_sqrt_q_1(DELAY,245)
    redist33_sM_plus2pow_uid128_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist33_sM_plus2pow_uid128_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist33_sM_plus2pow_uid128_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid128_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid130_sqrt(BITJOIN,129)@11
    sM_combine_uid130_sqrt_q <= redist33_sM_plus2pow_uid128_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged(SUB,190)@10
    sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist9_sM_opls_uid121_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid120_sqrt_q);
    sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_i <= sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_a;
    sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_a1 <= sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_i;
    sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid123_sqrt_n = "0" ELSE sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_b;
    sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_b1));
    sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_q <= sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_o(13 downto 0);

    -- redist8_sM_opls_uid121_sqrt_merged_bit_select_b_1(DELAY,220)
    redist8_sM_opls_uid121_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist8_sM_opls_uid121_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist8_sM_opls_uid121_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid121_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid127_sqrt(BITJOIN,126)@10
    sM_combine_uid127_sqrt_q <= sM_decrms1_uid124_sqrt_sM_choosems_uid126_sqrt_merged_q & redist8_sM_opls_uid121_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid131_sqrt_merged_bit_select(BITSELECT,207)@10
    sM_opls_uid131_sqrt_merged_bit_select_in <= sM_combine_uid127_sqrt_q(22 downto 0);
    sM_opls_uid131_sqrt_merged_bit_select_b <= sM_opls_uid131_sqrt_merged_bit_select_in(7 downto 0);
    sM_opls_uid131_sqrt_merged_bit_select_c <= sM_opls_uid131_sqrt_merged_bit_select_in(22 downto 8);

    -- redist7_sM_opls_uid131_sqrt_merged_bit_select_c_1(DELAY,219)
    redist7_sM_opls_uid131_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist7_sM_opls_uid131_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist7_sM_opls_uid131_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid131_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid133_sqrt(COMPARE,132)@11
    sE_cmpge_uid133_sqrt_a <= STD_LOGIC_VECTOR("00" & redist7_sM_opls_uid131_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid133_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid130_sqrt_q);
    sE_cmpge_uid133_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid133_sqrt_a) - UNSIGNED(sE_cmpge_uid133_sqrt_b));
    sE_cmpge_uid133_sqrt_n(0) <= not (sE_cmpge_uid133_sqrt_o(16));

    -- sM_plus2pow_uid138_sqrt(BITJOIN,137)@11
    sM_plus2pow_uid138_sqrt_q <= redist33_sM_plus2pow_uid128_sqrt_q_1_q & sE_cmpge_uid133_sqrt_n;

    -- redist32_sM_plus2pow_uid138_sqrt_q_1(DELAY,244)
    redist32_sM_plus2pow_uid138_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist32_sM_plus2pow_uid138_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist32_sM_plus2pow_uid138_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid138_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid140_sqrt(BITJOIN,139)@12
    sM_combine_uid140_sqrt_q <= redist32_sM_plus2pow_uid138_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged(SUB,191)@11
    sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist7_sM_opls_uid131_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid130_sqrt_q);
    sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_i <= sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_a;
    sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_a1 <= sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_i;
    sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid133_sqrt_n = "0" ELSE sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_b;
    sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_b1));
    sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_q <= sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_o(14 downto 0);

    -- redist6_sM_opls_uid131_sqrt_merged_bit_select_b_1(DELAY,218)
    redist6_sM_opls_uid131_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist6_sM_opls_uid131_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist6_sM_opls_uid131_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid131_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid137_sqrt(BITJOIN,136)@11
    sM_combine_uid137_sqrt_q <= sM_decrms1_uid134_sqrt_sM_choosems_uid136_sqrt_merged_q & redist6_sM_opls_uid131_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid141_sqrt_merged_bit_select(BITSELECT,208)@11
    sM_opls_uid141_sqrt_merged_bit_select_in <= sM_combine_uid137_sqrt_q(21 downto 0);
    sM_opls_uid141_sqrt_merged_bit_select_b <= sM_opls_uid141_sqrt_merged_bit_select_in(5 downto 0);
    sM_opls_uid141_sqrt_merged_bit_select_c <= sM_opls_uid141_sqrt_merged_bit_select_in(21 downto 6);

    -- redist5_sM_opls_uid141_sqrt_merged_bit_select_c_1(DELAY,217)
    redist5_sM_opls_uid141_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist5_sM_opls_uid141_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist5_sM_opls_uid141_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid141_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid143_sqrt(COMPARE,142)@12
    sE_cmpge_uid143_sqrt_a <= STD_LOGIC_VECTOR("00" & redist5_sM_opls_uid141_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid143_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid140_sqrt_q);
    sE_cmpge_uid143_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid143_sqrt_a) - UNSIGNED(sE_cmpge_uid143_sqrt_b));
    sE_cmpge_uid143_sqrt_n(0) <= not (sE_cmpge_uid143_sqrt_o(17));

    -- sM_plus2pow_uid148_sqrt(BITJOIN,147)@12
    sM_plus2pow_uid148_sqrt_q <= redist32_sM_plus2pow_uid138_sqrt_q_1_q & sE_cmpge_uid143_sqrt_n;

    -- redist31_sM_plus2pow_uid148_sqrt_q_1(DELAY,243)
    redist31_sM_plus2pow_uid148_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist31_sM_plus2pow_uid148_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist31_sM_plus2pow_uid148_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid148_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid150_sqrt(BITJOIN,149)@13
    sM_combine_uid150_sqrt_q <= redist31_sM_plus2pow_uid148_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged(SUB,192)@12
    sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist5_sM_opls_uid141_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid140_sqrt_q);
    sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_i <= sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_a;
    sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_a1 <= sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_i;
    sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid143_sqrt_n = "0" ELSE sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_b;
    sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_b1));
    sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_q <= sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_o(15 downto 0);

    -- redist4_sM_opls_uid141_sqrt_merged_bit_select_b_1(DELAY,216)
    redist4_sM_opls_uid141_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist4_sM_opls_uid141_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist4_sM_opls_uid141_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid141_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid147_sqrt(BITJOIN,146)@12
    sM_combine_uid147_sqrt_q <= sM_decrms1_uid144_sqrt_sM_choosems_uid146_sqrt_merged_q & redist4_sM_opls_uid141_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid151_sqrt_merged_bit_select(BITSELECT,209)@12
    sM_opls_uid151_sqrt_merged_bit_select_in <= sM_combine_uid147_sqrt_q(20 downto 0);
    sM_opls_uid151_sqrt_merged_bit_select_b <= sM_opls_uid151_sqrt_merged_bit_select_in(3 downto 0);
    sM_opls_uid151_sqrt_merged_bit_select_c <= sM_opls_uid151_sqrt_merged_bit_select_in(20 downto 4);

    -- redist3_sM_opls_uid151_sqrt_merged_bit_select_c_1(DELAY,215)
    redist3_sM_opls_uid151_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist3_sM_opls_uid151_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist3_sM_opls_uid151_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid151_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid153_sqrt(COMPARE,152)@13
    sE_cmpge_uid153_sqrt_a <= STD_LOGIC_VECTOR("00" & redist3_sM_opls_uid151_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid153_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid150_sqrt_q);
    sE_cmpge_uid153_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid153_sqrt_a) - UNSIGNED(sE_cmpge_uid153_sqrt_b));
    sE_cmpge_uid153_sqrt_n(0) <= not (sE_cmpge_uid153_sqrt_o(18));

    -- sM_plus2pow_uid158_sqrt(BITJOIN,157)@13
    sM_plus2pow_uid158_sqrt_q <= redist31_sM_plus2pow_uid148_sqrt_q_1_q & sE_cmpge_uid153_sqrt_n;

    -- redist30_sM_plus2pow_uid158_sqrt_q_1(DELAY,242)
    redist30_sM_plus2pow_uid158_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist30_sM_plus2pow_uid158_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist30_sM_plus2pow_uid158_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid158_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid160_sqrt(BITJOIN,159)@14
    sM_combine_uid160_sqrt_q <= redist30_sM_plus2pow_uid158_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged(SUB,193)@13
    sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist3_sM_opls_uid151_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid150_sqrt_q);
    sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_i <= sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_a;
    sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_a1 <= sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_i;
    sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid153_sqrt_n = "0" ELSE sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_b;
    sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_b1));
    sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_q <= sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_o(16 downto 0);

    -- redist2_sM_opls_uid151_sqrt_merged_bit_select_b_1(DELAY,214)
    redist2_sM_opls_uid151_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist2_sM_opls_uid151_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist2_sM_opls_uid151_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid151_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid157_sqrt(BITJOIN,156)@13
    sM_combine_uid157_sqrt_q <= sM_decrms1_uid154_sqrt_sM_choosems_uid156_sqrt_merged_q & redist2_sM_opls_uid151_sqrt_merged_bit_select_b_1_q;

    -- sM_opls_uid161_sqrt_merged_bit_select(BITSELECT,210)@13
    sM_opls_uid161_sqrt_merged_bit_select_in <= sM_combine_uid157_sqrt_q(19 downto 0);
    sM_opls_uid161_sqrt_merged_bit_select_b <= sM_opls_uid161_sqrt_merged_bit_select_in(1 downto 0);
    sM_opls_uid161_sqrt_merged_bit_select_c <= sM_opls_uid161_sqrt_merged_bit_select_in(19 downto 2);

    -- redist1_sM_opls_uid161_sqrt_merged_bit_select_c_1(DELAY,213)
    redist1_sM_opls_uid161_sqrt_merged_bit_select_c_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist1_sM_opls_uid161_sqrt_merged_bit_select_c_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist1_sM_opls_uid161_sqrt_merged_bit_select_c_1_q <= STD_LOGIC_VECTOR(sM_opls_uid161_sqrt_merged_bit_select_c);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid163_sqrt(COMPARE,162)@14
    sE_cmpge_uid163_sqrt_a <= STD_LOGIC_VECTOR("00" & redist1_sM_opls_uid161_sqrt_merged_bit_select_c_1_q);
    sE_cmpge_uid163_sqrt_b <= STD_LOGIC_VECTOR("000" & sM_combine_uid160_sqrt_q);
    sE_cmpge_uid163_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid163_sqrt_a) - UNSIGNED(sE_cmpge_uid163_sqrt_b));
    sE_cmpge_uid163_sqrt_n(0) <= not (sE_cmpge_uid163_sqrt_o(19));

    -- sM_plus2pow_uid168_sqrt(BITJOIN,167)@14
    sM_plus2pow_uid168_sqrt_q <= redist30_sM_plus2pow_uid158_sqrt_q_1_q & sE_cmpge_uid163_sqrt_n;

    -- redist29_sM_plus2pow_uid168_sqrt_q_1(DELAY,241)
    redist29_sM_plus2pow_uid168_sqrt_q_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist29_sM_plus2pow_uid168_sqrt_q_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist29_sM_plus2pow_uid168_sqrt_q_1_q <= STD_LOGIC_VECTOR(sM_plus2pow_uid168_sqrt_q);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpCombine_uid170_sqrt(BITJOIN,169)@15
    sE_cmpCombine_uid170_sqrt_q <= redist29_sM_plus2pow_uid168_sqrt_q_1_q & c01_uid12_sqrt_q;

    -- sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged(SUB,194)@14
    sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_a <= STD_LOGIC_VECTOR("0" & redist1_sM_opls_uid161_sqrt_merged_bit_select_c_1_q);
    sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_b <= STD_LOGIC_VECTOR("00" & sM_combine_uid160_sqrt_q);
    sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_i <= sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_a;
    sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_a1 <= sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_i;
    sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_b1 <= (others => '0') WHEN sE_cmpge_uid163_sqrt_n = "0" ELSE sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_b;
    sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_a1) - UNSIGNED(sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_b1));
    sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_q <= sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_o(17 downto 0);

    -- redist0_sM_opls_uid161_sqrt_merged_bit_select_b_1(DELAY,212)
    redist0_sM_opls_uid161_sqrt_merged_bit_select_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist0_sM_opls_uid161_sqrt_merged_bit_select_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist0_sM_opls_uid161_sqrt_merged_bit_select_b_1_q <= STD_LOGIC_VECTOR(sM_opls_uid161_sqrt_merged_bit_select_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sM_combine_uid167_sqrt(BITJOIN,166)@14
    sM_combine_uid167_sqrt_q <= sM_decrms1_uid164_sqrt_sM_choosems_uid166_sqrt_merged_q & redist0_sM_opls_uid161_sqrt_merged_bit_select_b_1_q;

    -- sE_opinls_uid171_sqrt(BITSELECT,170)@14
    sE_opinls_uid171_sqrt_in <= sM_combine_uid167_sqrt_q(18 downto 0);
    sE_opinls_uid171_sqrt_b <= sE_opinls_uid171_sqrt_in(18 downto 0);

    -- redist28_sE_opinls_uid171_sqrt_b_1(DELAY,240)
    redist28_sE_opinls_uid171_sqrt_b_1_clkproc_0: PROCESS (clk)
    BEGIN
        IF (clk'EVENT AND clk = '1') THEN
            IF (rst = '1') THEN
                redist28_sE_opinls_uid171_sqrt_b_1_q <= (others => '0');
            ELSE
                IF (en = "1") THEN
                    redist28_sE_opinls_uid171_sqrt_b_1_q <= STD_LOGIC_VECTOR(sE_opinls_uid171_sqrt_b);
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- sE_cmpge_uid172_sqrt(COMPARE,171)@15
    sE_cmpge_uid172_sqrt_a <= STD_LOGIC_VECTOR("00" & redist28_sE_opinls_uid171_sqrt_b_1_q);
    sE_cmpge_uid172_sqrt_b <= STD_LOGIC_VECTOR("000" & sE_cmpCombine_uid170_sqrt_q);
    sE_cmpge_uid172_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sE_cmpge_uid172_sqrt_a) - UNSIGNED(sE_cmpge_uid172_sqrt_b));
    sE_cmpge_uid172_sqrt_n(0) <= not (sE_cmpge_uid172_sqrt_o(20));

    -- sE_result_uid173_sqrt(BITJOIN,172)@15
    sE_result_uid173_sqrt_q <= redist29_sM_plus2pow_uid168_sqrt_q_1_q & sE_cmpge_uid172_sqrt_n;

    -- sR_resx2lsb_uid174_sqrt_merged_bit_select(BITSELECT,211)@15
    sR_resx2lsb_uid174_sqrt_merged_bit_select_b <= sE_result_uid173_sqrt_q(0 downto 0);
    sR_resx2lsb_uid174_sqrt_merged_bit_select_c <= sE_result_uid173_sqrt_q(16 downto 1);

    -- sR_resround_uid176_sqrt(ADD,175)@15
    sR_resround_uid176_sqrt_a <= STD_LOGIC_VECTOR("0000000000000000" & sR_resx2lsb_uid174_sqrt_merged_bit_select_b);
    sR_resround_uid176_sqrt_b <= STD_LOGIC_VECTOR("0" & sR_resx2lsb_uid174_sqrt_merged_bit_select_c);
    sR_resround_uid176_sqrt_o <= STD_LOGIC_VECTOR(UNSIGNED(sR_resround_uid176_sqrt_a) + UNSIGNED(sR_resround_uid176_sqrt_b));
    sR_resround_uid176_sqrt_q <= sR_resround_uid176_sqrt_o(16 downto 0);

    -- widen_uid178_sqrt(BITJOIN,177)@15
    widen_uid178_sqrt_q <= zeropad_uid177_sqrt_q & sR_resround_uid176_sqrt_q;

    -- out_rsrvd_fix(GPOUT,4)@15
    result <= widen_uid178_sqrt_q;

END normal;
