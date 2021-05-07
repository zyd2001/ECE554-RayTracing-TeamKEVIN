// Copyright (C) 2019  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// VENDOR "Altera"
// PROGRAM "Quartus Prime"
// VERSION "Version 19.2.0 Build 57 06/24/2019 Patches 0.01dc SJ Pro Edition"

// DATE "05/07/2021 03:57:04"

// 
// Device: Altera 1SX280HN2F43E2VG Package FBGA1760
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module ItoF (
	q,
	clk,
	areset,
	en,
	a)/* synthesis synthesis_greybox=0 */;
output 	[31:0] q;
input 	clk;
input 	areset;
input 	[0:0] en;
input 	[31:0] a;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_aadd_3_a1_sumout;
wire fp_functions_0_aadd_3_a2;
wire fp_functions_0_aadd_4_a1_sumout;
wire fp_functions_0_aadd_5_a1_sumout;
wire fp_functions_0_aadd_3_a6_sumout;
wire fp_functions_0_aadd_3_a7;
wire fp_functions_0_aadd_3_a11_sumout;
wire fp_functions_0_aadd_3_a12;
wire fp_functions_0_aadd_3_a16_sumout;
wire fp_functions_0_aadd_3_a17;
wire fp_functions_0_aadd_3_a21_sumout;
wire fp_functions_0_aadd_3_a22;
wire fp_functions_0_aadd_3_a26_sumout;
wire fp_functions_0_aadd_3_a27;
wire fp_functions_0_aadd_3_a31_sumout;
wire fp_functions_0_aadd_3_a32;
wire fp_functions_0_aadd_3_a36_sumout;
wire fp_functions_0_aadd_3_a37;
wire fp_functions_0_aadd_3_a41_sumout;
wire fp_functions_0_aadd_3_a42;
wire fp_functions_0_aadd_3_a46_sumout;
wire fp_functions_0_aadd_3_a47;
wire fp_functions_0_aadd_3_a51_sumout;
wire fp_functions_0_aadd_3_a52;
wire fp_functions_0_aadd_3_a56_sumout;
wire fp_functions_0_aadd_3_a57;
wire fp_functions_0_aadd_3_a61_sumout;
wire fp_functions_0_aadd_3_a62;
wire fp_functions_0_aadd_3_a66_sumout;
wire fp_functions_0_aadd_3_a67;
wire fp_functions_0_aadd_3_a71_sumout;
wire fp_functions_0_aadd_3_a72;
wire fp_functions_0_aadd_3_a76_sumout;
wire fp_functions_0_aadd_3_a77;
wire fp_functions_0_aadd_3_a81_sumout;
wire fp_functions_0_aadd_3_a82;
wire fp_functions_0_aadd_3_a86_sumout;
wire fp_functions_0_aadd_3_a87;
wire fp_functions_0_aadd_3_a91_sumout;
wire fp_functions_0_aadd_3_a92;
wire fp_functions_0_aadd_3_a96_sumout;
wire fp_functions_0_aadd_3_a97;
wire fp_functions_0_aadd_3_a101_sumout;
wire fp_functions_0_aadd_3_a102;
wire fp_functions_0_aadd_3_a106_sumout;
wire fp_functions_0_aadd_3_a107;
wire fp_functions_0_aadd_3_a111_sumout;
wire fp_functions_0_aadd_3_a112;
wire fp_functions_0_aadd_3_a116_sumout;
wire fp_functions_0_aadd_3_a117;
wire fp_functions_0_aadd_3_a121_sumout;
wire fp_functions_0_aadd_3_a122;
wire fp_functions_0_aadd_3_a126_sumout;
wire fp_functions_0_aadd_3_a127;
wire fp_functions_0_aadd_3_a131_sumout;
wire fp_functions_0_aadd_3_a132;
wire fp_functions_0_aadd_3_a136_sumout;
wire fp_functions_0_aadd_3_a137;
wire fp_functions_0_aadd_3_a141_sumout;
wire fp_functions_0_aadd_3_a142;
wire fp_functions_0_aadd_3_a146_sumout;
wire fp_functions_0_aadd_3_a147;
wire fp_functions_0_aadd_3_a151_sumout;
wire fp_functions_0_aadd_3_a152;
wire fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_q_a0_a_aq;
wire fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q_a0_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a1_a_aq;
wire fp_functions_0_aadd_3_a157_cout;
wire fp_functions_0_aadd_4_a7_cout;
wire fp_functions_0_aadd_5_a7_cout;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a2_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a3_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a4_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a5_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a6_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a7_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a8_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a9_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a10_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a11_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a12_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a13_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a15_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a16_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a17_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a18_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a19_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a20_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a21_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a22_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a23_a_aq;
wire fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a0_a_aq;
wire fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a1_a_aq;
wire fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a2_a_aq;
wire fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a3_a_aq;
wire fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a4_a_aq;
wire fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a5_a_aq;
wire fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a6_a_aq;
wire fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a7_a_aq;
wire fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_delay_1_a0_a_aq;
wire fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_delay_0_a0_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a2_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a8_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a4_a_aq;
wire fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a26_a_aq;
wire fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a30_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a27_a_aq;
wire fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a31_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a25_a_aq;
wire fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a29_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a5_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a1_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a7_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a3_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_aq;
wire fp_functions_0_asticky_uid20_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_aadd_4_a12_cout;
wire fp_functions_0_aadd_5_a12_cout;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a9_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a11_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a12_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a13_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a14_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a15_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a16_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a17_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a18_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a19_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a20_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a22_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a23_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a24_a_aq;
wire fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a28_a_aq;
wire fp_functions_0_aredist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq;
wire fp_functions_0_aredist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq;
wire fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_delay_0_a0_a_aq;
wire fp_functions_0_aadd_0_a1_sumout;
wire fp_functions_0_aadd_0_a2;
wire fp_functions_0_aadd_0_a6_sumout;
wire fp_functions_0_aadd_0_a7;
wire fp_functions_0_aadd_0_a11_sumout;
wire fp_functions_0_aadd_0_a12;
wire fp_functions_0_aadd_0_a16_sumout;
wire fp_functions_0_aadd_0_a17;
wire fp_functions_0_aadd_0_a21_sumout;
wire fp_functions_0_aadd_0_a22;
wire fp_functions_0_aadd_0_a26_sumout;
wire fp_functions_0_aadd_0_a27;
wire fp_functions_0_aadd_0_a31_sumout;
wire fp_functions_0_aadd_0_a32;
wire fp_functions_0_aadd_0_a36_sumout;
wire fp_functions_0_aadd_0_a37;
wire fp_functions_0_aadd_0_a41_sumout;
wire fp_functions_0_aadd_0_a42;
wire fp_functions_0_aadd_0_a46_sumout;
wire fp_functions_0_aadd_0_a47;
wire fp_functions_0_aadd_0_a51_sumout;
wire fp_functions_0_aadd_0_a52;
wire fp_functions_0_aadd_0_a56_sumout;
wire fp_functions_0_aadd_0_a57;
wire fp_functions_0_aadd_0_a61_sumout;
wire fp_functions_0_aadd_0_a62;
wire fp_functions_0_aadd_0_a66_sumout;
wire fp_functions_0_aadd_0_a67;
wire fp_functions_0_aadd_0_a71_sumout;
wire fp_functions_0_aadd_0_a72;
wire fp_functions_0_aadd_0_a76_sumout;
wire fp_functions_0_aadd_0_a77;
wire fp_functions_0_aadd_0_a81_sumout;
wire fp_functions_0_aadd_0_a82;
wire fp_functions_0_aadd_0_a86_sumout;
wire fp_functions_0_aadd_0_a87;
wire fp_functions_0_aadd_0_a91_sumout;
wire fp_functions_0_aadd_0_a92;
wire fp_functions_0_aadd_0_a96_sumout;
wire fp_functions_0_aadd_0_a97;
wire fp_functions_0_aadd_0_a101_sumout;
wire fp_functions_0_aadd_0_a102;
wire fp_functions_0_aadd_0_a106_sumout;
wire fp_functions_0_aadd_0_a107;
wire fp_functions_0_aadd_0_a111_sumout;
wire fp_functions_0_aadd_0_a112;
wire fp_functions_0_aadd_0_a116_sumout;
wire fp_functions_0_aadd_0_a117;
wire fp_functions_0_aadd_0_a121_sumout;
wire fp_functions_0_aadd_0_a122;
wire fp_functions_0_aadd_0_a126_sumout;
wire fp_functions_0_aadd_0_a127;
wire fp_functions_0_aadd_0_a131_sumout;
wire fp_functions_0_aadd_0_a132;
wire fp_functions_0_aadd_0_a136_sumout;
wire fp_functions_0_aadd_0_a137;
wire fp_functions_0_aadd_0_a141_sumout;
wire fp_functions_0_aadd_0_a142;
wire fp_functions_0_aadd_0_a146_sumout;
wire fp_functions_0_aadd_0_a147;
wire fp_functions_0_aadd_0_a151_sumout;
wire fp_functions_0_aadd_0_a152;
wire fp_functions_0_aadd_0_a156_sumout;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq;
wire fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a0_a_aq;
wire fp_functions_0_aadd_3_a161_sumout;
wire fp_functions_0_aadd_4_a17_cout;
wire fp_functions_0_aadd_5_a17_cout;
wire fp_functions_0_aadd_4_a22_cout;
wire fp_functions_0_aadd_5_a22_cout;
wire fp_functions_0_aadd_4_a27_cout;
wire fp_functions_0_aadd_5_a27_cout;
wire fp_functions_0_aadd_4_a32_cout;
wire fp_functions_0_aadd_5_a32_cout;
wire fp_functions_0_aadd_4_a37_cout;
wire fp_functions_0_aadd_5_a37_cout;
wire fp_functions_0_aadd_4_a42_cout;
wire fp_functions_0_aadd_5_a42_cout;
wire fp_functions_0_aadd_4_a47_cout;
wire fp_functions_0_aadd_5_a47_cout;
wire fp_functions_0_ai1423_a23_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a0_a_a0_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a1_a_a1_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a2_a_a2_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a3_a_a3_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a4_a_a4_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a5_a_a5_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a6_a_a6_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a7_a_a7_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a8_a_a8_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a9_a_a9_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a10_a_a10_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a11_a_a11_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a12_a_a12_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a13_a_a13_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a14_a_a14_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a15_a_a15_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a16_a_a16_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a17_a_a17_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a18_a_a18_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a19_a_a19_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a20_a_a20_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a21_a_a21_combout;
wire fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a22_a_a22_combout;
wire fp_functions_0_aMux_7_a2_combout;
wire fp_functions_0_aMux_6_a2_combout;
wire fp_functions_0_aMux_5_a2_combout;
wire fp_functions_0_aMux_4_a2_combout;
wire fp_functions_0_aMux_3_a2_combout;
wire fp_functions_0_aMux_2_a2_combout;
wire fp_functions_0_aMux_1_a2_combout;
wire fp_functions_0_aMux_0_a2_combout;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout;
wire fp_functions_0_areduce_nor_4_acombout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a0_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a0_combout;
wire fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0_combout;
wire fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a1_combout;
wire fp_functions_0_ai1423_a0_combout;
wire fp_functions_0_aexpFracR_uid24_fxpToFPTest_b_a0_a_a0_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a2_combout;
wire fp_functions_0_ai1423_a1_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a3_combout;
wire fp_functions_0_ai1423_a2_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a4_combout;
wire fp_functions_0_ai1423_a3_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a5_combout;
wire fp_functions_0_ai1423_a4_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a6_combout;
wire fp_functions_0_ai1423_a5_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a7_combout;
wire fp_functions_0_ai1423_a6_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a8_combout;
wire fp_functions_0_ai1423_a7_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a9_combout;
wire fp_functions_0_ai1423_a8_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a10_combout;
wire fp_functions_0_ai1423_a9_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a11_combout;
wire fp_functions_0_ai1423_a10_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a12_combout;
wire fp_functions_0_ai1423_a11_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a13_combout;
wire fp_functions_0_ai1423_a12_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a14_combout;
wire fp_functions_0_ai1423_a13_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a15_combout;
wire fp_functions_0_ai1423_a14_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a16_combout;
wire fp_functions_0_ai1423_a15_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a17_combout;
wire fp_functions_0_ai1423_a16_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a18_combout;
wire fp_functions_0_ai1423_a17_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a19_combout;
wire fp_functions_0_ai1423_a18_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a20_combout;
wire fp_functions_0_ai1423_a19_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a21_combout;
wire fp_functions_0_ai1423_a20_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a22_combout;
wire fp_functions_0_ai1423_a21_combout;
wire fp_functions_0_aadd_1_a0_combout;
wire fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a0_combout;
wire fp_functions_0_aadd_2_a0_combout;
wire fp_functions_0_aadd_2_a1_combout;
wire fp_functions_0_aadd_2_a2_combout;
wire fp_functions_0_aadd_2_a3_combout;
wire fp_functions_0_aadd_2_a4_combout;
wire fp_functions_0_aadd_2_a5_combout;
wire fp_functions_0_areduce_nor_0_a0_combout;
wire fp_functions_0_areduce_nor_0_a1_combout;
wire fp_functions_0_areduce_nor_0_a2_combout;
wire fp_functions_0_areduce_nor_0_a3_combout;
wire fp_functions_0_areduce_nor_0_a4_combout;
wire fp_functions_0_areduce_nor_0_a5_combout;
wire fp_functions_0_areduce_nor_0_acombout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout;
wire fp_functions_0_areduce_nor_1_acombout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a16_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a18_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a19_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a20_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a21_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a22_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a23_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a24_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a25_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a26_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a27_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a28_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a29_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a30_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a31_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a32_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a33_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a34_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0_combout;
wire fp_functions_0_ai905_a0_combout;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a35_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a36_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a7_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a8_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a37_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a38_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a39_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a9_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a40_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a41_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a42_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14_combout;
wire fp_functions_0_areduce_nor_3_acombout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a43_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a44_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a16_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a17_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_a45_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a46_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a18_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a19_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a47_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a20_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a21_combout;
wire fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a23_combout;
wire fp_functions_0_ai1423_a22_combout;
wire fp_functions_0_areduce_or_0_a0_combout;
wire fp_functions_0_areduce_or_0_a1_combout;
wire fp_functions_0_areduce_or_0_a2_combout;
wire fp_functions_0_areduce_or_0_a3_combout;
wire fp_functions_0_ai905_a1_combout;
wire fp_functions_0_ai905_a2_combout;
wire fp_functions_0_ai905_a3_combout;
wire fp_functions_0_ai905_a4_combout;
wire fp_functions_0_ai905_a5_combout;
wire fp_functions_0_ai905_a6_combout;
wire fp_functions_0_ai905_a7_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_a48_combout;
wire fp_functions_0_ai905_a8_combout;
wire fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2_combout;
wire fp_functions_0_ai905_a9_combout;
wire fp_functions_0_ai905_a10_combout;
wire fp_functions_0_ai905_a11_combout;
wire fp_functions_0_ai905_a12_combout;
wire fp_functions_0_ai905_a13_combout;
wire fp_functions_0_ai905_a14_combout;
wire fp_functions_0_ai905_a15_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a22_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a23_combout;
wire fp_functions_0_areduce_nor_2_acombout;
wire fp_functions_0_aadd_2_a5_wirecell_combout;


fourteennm_ff fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q_a0_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_3_a1(
	.dataa(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a1_a_aq),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a157_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a1_sumout),
	.cout(fp_functions_0_aadd_3_a2),
	.shareout());
defparam fp_functions_0_aadd_3_a1.extended_lut = "off";
defparam fp_functions_0_aadd_3_a1.lut_mask = 64'h0000000000005555;
defparam fp_functions_0_aadd_3_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a7_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_4_a1_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_4_a1.extended_lut = "off";
defparam fp_functions_0_aadd_4_a1.lut_mask = 64'h0000000000000000;
defparam fp_functions_0_aadd_4_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a7_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_5_a1_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_5_a1.extended_lut = "off";
defparam fp_functions_0_aadd_5_a1.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_5_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a6(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a2_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a2),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a6_sumout),
	.cout(fp_functions_0_aadd_3_a7),
	.shareout());
defparam fp_functions_0_aadd_3_a6.extended_lut = "off";
defparam fp_functions_0_aadd_3_a6.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a11(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a3_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a7),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a11_sumout),
	.cout(fp_functions_0_aadd_3_a12),
	.shareout());
defparam fp_functions_0_aadd_3_a11.extended_lut = "off";
defparam fp_functions_0_aadd_3_a11.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a16(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a4_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a12),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a16_sumout),
	.cout(fp_functions_0_aadd_3_a17),
	.shareout());
defparam fp_functions_0_aadd_3_a16.extended_lut = "off";
defparam fp_functions_0_aadd_3_a16.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a21(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a5_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a17),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a21_sumout),
	.cout(fp_functions_0_aadd_3_a22),
	.shareout());
defparam fp_functions_0_aadd_3_a21.extended_lut = "off";
defparam fp_functions_0_aadd_3_a21.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a26(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a6_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a22),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a26_sumout),
	.cout(fp_functions_0_aadd_3_a27),
	.shareout());
defparam fp_functions_0_aadd_3_a26.extended_lut = "off";
defparam fp_functions_0_aadd_3_a26.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a26.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a31(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a7_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a27),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a31_sumout),
	.cout(fp_functions_0_aadd_3_a32),
	.shareout());
defparam fp_functions_0_aadd_3_a31.extended_lut = "off";
defparam fp_functions_0_aadd_3_a31.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a31.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a36(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a8_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a32),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a36_sumout),
	.cout(fp_functions_0_aadd_3_a37),
	.shareout());
defparam fp_functions_0_aadd_3_a36.extended_lut = "off";
defparam fp_functions_0_aadd_3_a36.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a36.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a41(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a9_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a37),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a41_sumout),
	.cout(fp_functions_0_aadd_3_a42),
	.shareout());
defparam fp_functions_0_aadd_3_a41.extended_lut = "off";
defparam fp_functions_0_aadd_3_a41.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a41.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a46(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a10_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a42),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a46_sumout),
	.cout(fp_functions_0_aadd_3_a47),
	.shareout());
defparam fp_functions_0_aadd_3_a46.extended_lut = "off";
defparam fp_functions_0_aadd_3_a46.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a46.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a51(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a11_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a47),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a51_sumout),
	.cout(fp_functions_0_aadd_3_a52),
	.shareout());
defparam fp_functions_0_aadd_3_a51.extended_lut = "off";
defparam fp_functions_0_aadd_3_a51.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a51.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a56(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a12_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a52),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a56_sumout),
	.cout(fp_functions_0_aadd_3_a57),
	.shareout());
defparam fp_functions_0_aadd_3_a56.extended_lut = "off";
defparam fp_functions_0_aadd_3_a56.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a56.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a61(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a13_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a57),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a61_sumout),
	.cout(fp_functions_0_aadd_3_a62),
	.shareout());
defparam fp_functions_0_aadd_3_a61.extended_lut = "off";
defparam fp_functions_0_aadd_3_a61.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a61.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a66(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a62),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a66_sumout),
	.cout(fp_functions_0_aadd_3_a67),
	.shareout());
defparam fp_functions_0_aadd_3_a66.extended_lut = "off";
defparam fp_functions_0_aadd_3_a66.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a66.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a71(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a15_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a67),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a71_sumout),
	.cout(fp_functions_0_aadd_3_a72),
	.shareout());
defparam fp_functions_0_aadd_3_a71.extended_lut = "off";
defparam fp_functions_0_aadd_3_a71.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a71.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a76(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a16_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a72),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a76_sumout),
	.cout(fp_functions_0_aadd_3_a77),
	.shareout());
defparam fp_functions_0_aadd_3_a76.extended_lut = "off";
defparam fp_functions_0_aadd_3_a76.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a76.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a81(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a17_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a77),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a81_sumout),
	.cout(fp_functions_0_aadd_3_a82),
	.shareout());
defparam fp_functions_0_aadd_3_a81.extended_lut = "off";
defparam fp_functions_0_aadd_3_a81.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a81.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a86(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a18_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a82),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a86_sumout),
	.cout(fp_functions_0_aadd_3_a87),
	.shareout());
defparam fp_functions_0_aadd_3_a86.extended_lut = "off";
defparam fp_functions_0_aadd_3_a86.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a86.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a91(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a19_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a87),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a91_sumout),
	.cout(fp_functions_0_aadd_3_a92),
	.shareout());
defparam fp_functions_0_aadd_3_a91.extended_lut = "off";
defparam fp_functions_0_aadd_3_a91.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a91.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a96(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a20_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a92),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a96_sumout),
	.cout(fp_functions_0_aadd_3_a97),
	.shareout());
defparam fp_functions_0_aadd_3_a96.extended_lut = "off";
defparam fp_functions_0_aadd_3_a96.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a96.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a101(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a21_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a97),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a101_sumout),
	.cout(fp_functions_0_aadd_3_a102),
	.shareout());
defparam fp_functions_0_aadd_3_a101.extended_lut = "off";
defparam fp_functions_0_aadd_3_a101.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a101.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a106(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a22_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a102),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a106_sumout),
	.cout(fp_functions_0_aadd_3_a107),
	.shareout());
defparam fp_functions_0_aadd_3_a106.extended_lut = "off";
defparam fp_functions_0_aadd_3_a106.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a106.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a111(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a23_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a107),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a111_sumout),
	.cout(fp_functions_0_aadd_3_a112),
	.shareout());
defparam fp_functions_0_aadd_3_a111.extended_lut = "off";
defparam fp_functions_0_aadd_3_a111.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a111.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a116(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a0_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a112),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a116_sumout),
	.cout(fp_functions_0_aadd_3_a117),
	.shareout());
defparam fp_functions_0_aadd_3_a116.extended_lut = "off";
defparam fp_functions_0_aadd_3_a116.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a116.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a121(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a1_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a117),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a121_sumout),
	.cout(fp_functions_0_aadd_3_a122),
	.shareout());
defparam fp_functions_0_aadd_3_a121.extended_lut = "off";
defparam fp_functions_0_aadd_3_a121.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a121.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a126(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a2_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a122),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a126_sumout),
	.cout(fp_functions_0_aadd_3_a127),
	.shareout());
defparam fp_functions_0_aadd_3_a126.extended_lut = "off";
defparam fp_functions_0_aadd_3_a126.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a126.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a131(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a3_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a127),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a131_sumout),
	.cout(fp_functions_0_aadd_3_a132),
	.shareout());
defparam fp_functions_0_aadd_3_a131.extended_lut = "off";
defparam fp_functions_0_aadd_3_a131.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a131.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a136(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a4_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a132),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a136_sumout),
	.cout(fp_functions_0_aadd_3_a137),
	.shareout());
defparam fp_functions_0_aadd_3_a136.extended_lut = "off";
defparam fp_functions_0_aadd_3_a136.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a136.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a141(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a5_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a137),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a141_sumout),
	.cout(fp_functions_0_aadd_3_a142),
	.shareout());
defparam fp_functions_0_aadd_3_a141.extended_lut = "off";
defparam fp_functions_0_aadd_3_a141.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a141.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a146(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a6_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a142),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a146_sumout),
	.cout(fp_functions_0_aadd_3_a147),
	.shareout());
defparam fp_functions_0_aadd_3_a146.extended_lut = "off";
defparam fp_functions_0_aadd_3_a146.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a146.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a151(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a7_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a147),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a151_sumout),
	.cout(fp_functions_0_aadd_3_a152),
	.shareout());
defparam fp_functions_0_aadd_3_a151.extended_lut = "off";
defparam fp_functions_0_aadd_3_a151.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_3_a151.shared_arith = "off";

fourteennm_ff fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_delay_1_a0_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_q_a0_a_aq));
defparam fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_delay_0_a0_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q_a0_a_aq));
defparam fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a1_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a1_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a1_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_3_a157(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_aq),
	.datad(!fp_functions_0_aexpFracR_uid24_fxpToFPTest_b_a0_a_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a157_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a157.extended_lut = "off";
defparam fp_functions_0_aadd_3_a157.lut_mask = 64'h00000000000F0FF0;
defparam fp_functions_0_aadd_3_a157.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a7(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a12_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a7_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a7.extended_lut = "off";
defparam fp_functions_0_aadd_4_a7.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_4_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a7(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a12_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a7_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a7.extended_lut = "off";
defparam fp_functions_0_aadd_5_a7.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_5_a7.shared_arith = "off";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a2_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a1_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a2_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a2_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a3_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a3_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a4_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a3_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a4_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a5_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a4_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a5_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a5_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a6_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a5_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a6_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a6_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a7_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a6_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a7_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a7_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a8_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a7_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a8_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a8_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a8_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a9_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a8_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a9_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a9_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a9_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a10_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a9_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a10_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a11_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a10_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a11_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a11_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a11_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a12_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a11_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a12_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a12_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a12_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a13_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a12_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a13_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a13_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a13_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a13_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a15_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a14_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a15_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a15_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a15_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a16_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a15_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a16_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a16_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a16_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a17_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a16_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a17_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a17_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a17_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a18_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a17_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a18_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a18_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a18_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a19_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a18_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a19_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a19_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a19_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a20_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a19_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a20_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a20_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a20_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a21_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a20_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a21_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a21_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a21_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a22_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a21_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a22_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a22_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a22_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a23_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a23_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a23_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a23_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a23_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a0_a(
	.clk(clk),
	.d(fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a0_a_aq));
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a1_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a1_a_aq));
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a1_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a2_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a2_a_aq));
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a2_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a3_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a3_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a3_a_aq));
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a4_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a4_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a4_a_aq));
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a5_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a5_wirecell_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a5_a_aq));
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a5_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a6_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a5_wirecell_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a6_a_aq));
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a6_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a7_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a5_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a7_a_aq));
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_aexpPreRnd_uid14_fxpToFPTest_o_a7_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_delay_1_a0_a(
	.clk(clk),
	.d(fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_delay_0_a0_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_delay_1_a0_a_aq));
defparam fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_delay_1_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_delay_1_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_delay_0_a0_a(
	.clk(clk),
	.d(fp_functions_0_areduce_nor_0_acombout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_delay_0_a0_a_aq));
defparam fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_delay_0_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_delay_0_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a2_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a2_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a2_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a8_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a8_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a8_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a8_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a4_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a4_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_areduce_nor_3_acombout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a26_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a17_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a26_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a26_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a26_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a30_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a30_a_aq));
defparam fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a30_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a30_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a27_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a19_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a27_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a27_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a27_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a31_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a31_a_aq));
defparam fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a31_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a31_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a25_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a21_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a25_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a25_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a25_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a29_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a9_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a29_a_aq));
defparam fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a29_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a29_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a5_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a5_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a5_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a1_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a1_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a1_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a7_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a7_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a7_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a3_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a3_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_ai1423_a22_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_asticky_uid20_fxpToFPTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_areduce_or_0_a3_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_asticky_uid20_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_asticky_uid20_fxpToFPTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_asticky_uid20_fxpToFPTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_4_a12(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a161_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a17_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a12_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a12.extended_lut = "off";
defparam fp_functions_0_aadd_4_a12.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_4_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a12(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a161_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a17_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a12_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a12.extended_lut = "off";
defparam fp_functions_0_aadd_5_a12.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_5_a12.shared_arith = "off";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a9_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a1_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a9_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a9_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a9_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a11_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a3_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a11_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a11_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a11_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a12_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a4_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a12_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a12_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a12_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a13_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a5_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a13_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a13_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a13_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a14_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a6_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a14_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a14_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a14_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a15_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a7_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a15_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a15_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a15_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a16_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a8_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a16_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a16_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a16_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a17_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a9_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a17_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a17_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a17_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a18_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a10_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a18_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a18_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a18_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a19_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a11_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a19_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a19_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a19_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a20_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a12_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a20_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a20_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a20_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a13_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a22_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a14_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a22_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a22_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a22_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a23_a(
	.clk(clk),
	.d(fp_functions_0_ai905_a15_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a23_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a23_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a23_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a24_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a23_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a24_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a24_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a24_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a28_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a8_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a28_a_aq));
defparam fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a28_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a28_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_areduce_nor_2_acombout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq));
defparam fp_functions_0_aredist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_areduce_nor_1_acombout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq));
defparam fp_functions_0_aredist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_delay_0_a0_a(
	.clk(clk),
	.d(a[31]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_delay_0_a0_a_aq));
defparam fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_delay_0_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_delay_0_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a1(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[0]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a1_sumout),
	.cout(fp_functions_0_aadd_0_a2),
	.shareout());
defparam fp_functions_0_aadd_0_a1.extended_lut = "off";
defparam fp_functions_0_aadd_0_a1.lut_mask = 64'h0000000050500F0F;
defparam fp_functions_0_aadd_0_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a6(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[1]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a2),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a6_sumout),
	.cout(fp_functions_0_aadd_0_a7),
	.shareout());
defparam fp_functions_0_aadd_0_a6.extended_lut = "off";
defparam fp_functions_0_aadd_0_a6.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a11(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[2]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a7),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a11_sumout),
	.cout(fp_functions_0_aadd_0_a12),
	.shareout());
defparam fp_functions_0_aadd_0_a11.extended_lut = "off";
defparam fp_functions_0_aadd_0_a11.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a16(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[3]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a12),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a16_sumout),
	.cout(fp_functions_0_aadd_0_a17),
	.shareout());
defparam fp_functions_0_aadd_0_a16.extended_lut = "off";
defparam fp_functions_0_aadd_0_a16.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a21(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[4]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a17),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a21_sumout),
	.cout(fp_functions_0_aadd_0_a22),
	.shareout());
defparam fp_functions_0_aadd_0_a21.extended_lut = "off";
defparam fp_functions_0_aadd_0_a21.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a26(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[5]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a22),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a26_sumout),
	.cout(fp_functions_0_aadd_0_a27),
	.shareout());
defparam fp_functions_0_aadd_0_a26.extended_lut = "off";
defparam fp_functions_0_aadd_0_a26.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a26.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a31(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[11]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a112),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a31_sumout),
	.cout(fp_functions_0_aadd_0_a32),
	.shareout());
defparam fp_functions_0_aadd_0_a31.extended_lut = "off";
defparam fp_functions_0_aadd_0_a31.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a31.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a36(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[12]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a32),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a36_sumout),
	.cout(fp_functions_0_aadd_0_a37),
	.shareout());
defparam fp_functions_0_aadd_0_a36.extended_lut = "off";
defparam fp_functions_0_aadd_0_a36.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a36.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a41(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[13]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a37),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a41_sumout),
	.cout(fp_functions_0_aadd_0_a42),
	.shareout());
defparam fp_functions_0_aadd_0_a41.extended_lut = "off";
defparam fp_functions_0_aadd_0_a41.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a41.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a46(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[14]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a42),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a46_sumout),
	.cout(fp_functions_0_aadd_0_a47),
	.shareout());
defparam fp_functions_0_aadd_0_a46.extended_lut = "off";
defparam fp_functions_0_aadd_0_a46.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a46.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a51(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[16]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a117),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a51_sumout),
	.cout(fp_functions_0_aadd_0_a52),
	.shareout());
defparam fp_functions_0_aadd_0_a51.extended_lut = "off";
defparam fp_functions_0_aadd_0_a51.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a51.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a56(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[21]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a132),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a56_sumout),
	.cout(fp_functions_0_aadd_0_a57),
	.shareout());
defparam fp_functions_0_aadd_0_a56.extended_lut = "off";
defparam fp_functions_0_aadd_0_a56.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a56.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a61(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[22]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a57),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a61_sumout),
	.cout(fp_functions_0_aadd_0_a62),
	.shareout());
defparam fp_functions_0_aadd_0_a61.extended_lut = "off";
defparam fp_functions_0_aadd_0_a61.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a61.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a66(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[23]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a62),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a66_sumout),
	.cout(fp_functions_0_aadd_0_a67),
	.shareout());
defparam fp_functions_0_aadd_0_a66.extended_lut = "off";
defparam fp_functions_0_aadd_0_a66.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a66.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a71(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[24]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a67),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a71_sumout),
	.cout(fp_functions_0_aadd_0_a72),
	.shareout());
defparam fp_functions_0_aadd_0_a71.extended_lut = "off";
defparam fp_functions_0_aadd_0_a71.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a71.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a76(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[26]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a137),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a76_sumout),
	.cout(fp_functions_0_aadd_0_a77),
	.shareout());
defparam fp_functions_0_aadd_0_a76.extended_lut = "off";
defparam fp_functions_0_aadd_0_a76.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a76.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a81(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[28]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a142),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a81_sumout),
	.cout(fp_functions_0_aadd_0_a82),
	.shareout());
defparam fp_functions_0_aadd_0_a81.extended_lut = "off";
defparam fp_functions_0_aadd_0_a81.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a81.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a86(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[18]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a122),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a86_sumout),
	.cout(fp_functions_0_aadd_0_a87),
	.shareout());
defparam fp_functions_0_aadd_0_a86.extended_lut = "off";
defparam fp_functions_0_aadd_0_a86.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a86.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a91(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[8]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a102),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a91_sumout),
	.cout(fp_functions_0_aadd_0_a92),
	.shareout());
defparam fp_functions_0_aadd_0_a91.extended_lut = "off";
defparam fp_functions_0_aadd_0_a91.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a91.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a96(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[6]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a27),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a96_sumout),
	.cout(fp_functions_0_aadd_0_a97),
	.shareout());
defparam fp_functions_0_aadd_0_a96.extended_lut = "off";
defparam fp_functions_0_aadd_0_a96.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a96.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a101(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[7]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a97),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a101_sumout),
	.cout(fp_functions_0_aadd_0_a102),
	.shareout());
defparam fp_functions_0_aadd_0_a101.extended_lut = "off";
defparam fp_functions_0_aadd_0_a101.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a101.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a106(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[9]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a92),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a106_sumout),
	.cout(fp_functions_0_aadd_0_a107),
	.shareout());
defparam fp_functions_0_aadd_0_a106.extended_lut = "off";
defparam fp_functions_0_aadd_0_a106.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a106.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a111(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[10]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a107),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a111_sumout),
	.cout(fp_functions_0_aadd_0_a112),
	.shareout());
defparam fp_functions_0_aadd_0_a111.extended_lut = "off";
defparam fp_functions_0_aadd_0_a111.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a111.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a116(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[15]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a47),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a116_sumout),
	.cout(fp_functions_0_aadd_0_a117),
	.shareout());
defparam fp_functions_0_aadd_0_a116.extended_lut = "off";
defparam fp_functions_0_aadd_0_a116.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a116.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a121(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[17]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a52),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a121_sumout),
	.cout(fp_functions_0_aadd_0_a122),
	.shareout());
defparam fp_functions_0_aadd_0_a121.extended_lut = "off";
defparam fp_functions_0_aadd_0_a121.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a121.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a126(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[19]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a87),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a126_sumout),
	.cout(fp_functions_0_aadd_0_a127),
	.shareout());
defparam fp_functions_0_aadd_0_a126.extended_lut = "off";
defparam fp_functions_0_aadd_0_a126.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a126.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a131(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[20]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a127),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a131_sumout),
	.cout(fp_functions_0_aadd_0_a132),
	.shareout());
defparam fp_functions_0_aadd_0_a131.extended_lut = "off";
defparam fp_functions_0_aadd_0_a131.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a131.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a136(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[25]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a72),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a136_sumout),
	.cout(fp_functions_0_aadd_0_a137),
	.shareout());
defparam fp_functions_0_aadd_0_a136.extended_lut = "off";
defparam fp_functions_0_aadd_0_a136.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a136.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a141(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[27]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a77),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a141_sumout),
	.cout(fp_functions_0_aadd_0_a142),
	.shareout());
defparam fp_functions_0_aadd_0_a141.extended_lut = "off";
defparam fp_functions_0_aadd_0_a141.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a141.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a146(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[29]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a82),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a146_sumout),
	.cout(fp_functions_0_aadd_0_a147),
	.shareout());
defparam fp_functions_0_aadd_0_a146.extended_lut = "off";
defparam fp_functions_0_aadd_0_a146.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a146.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a151(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[30]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a147),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a151_sumout),
	.cout(fp_functions_0_aadd_0_a152),
	.shareout());
defparam fp_functions_0_aadd_0_a151.extended_lut = "off";
defparam fp_functions_0_aadd_0_a151.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a151.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a156(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a152),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a156_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_0_a156.extended_lut = "off";
defparam fp_functions_0_aadd_0_a156.lut_mask = 64'h0000000000000000;
defparam fp_functions_0_aadd_0_a156.shared_arith = "off";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a96_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a66_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a71_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a76_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a141_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a126_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a121_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a51_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a86_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a131_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a136_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a56_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a61_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a146_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a151_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a156_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a81_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a36_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a41_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a116_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a31_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a111_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a106_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a46_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a91_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a11_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a1_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a21_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a26_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a101_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a16_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a6_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq));
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a0_a_aq));
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_3_a161(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a152),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a161_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_3_a161.extended_lut = "off";
defparam fp_functions_0_aadd_3_a161.lut_mask = 64'h0000000000000000;
defparam fp_functions_0_aadd_3_a161.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a17(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a151_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a22_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a17_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a17.extended_lut = "off";
defparam fp_functions_0_aadd_4_a17.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_4_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a17(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a151_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a22_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a17_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a17.extended_lut = "off";
defparam fp_functions_0_aadd_5_a17.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_5_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a22(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a146_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a27_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a22_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a22.extended_lut = "off";
defparam fp_functions_0_aadd_4_a22.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_4_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a22(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a146_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a27_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a22_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a22.extended_lut = "off";
defparam fp_functions_0_aadd_5_a22.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_5_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a27(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a141_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a32_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a27_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a27.extended_lut = "off";
defparam fp_functions_0_aadd_4_a27.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_4_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a27(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a141_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a32_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a27_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a27.extended_lut = "off";
defparam fp_functions_0_aadd_5_a27.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_5_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a32(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a136_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a37_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a32_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a32.extended_lut = "off";
defparam fp_functions_0_aadd_4_a32.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_4_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a32(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a136_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a37_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a32_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a32.extended_lut = "off";
defparam fp_functions_0_aadd_5_a32.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_5_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a37(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a131_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a42_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a37_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a37.extended_lut = "off";
defparam fp_functions_0_aadd_4_a37.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_4_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a37(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a131_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a42_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a37_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a37.extended_lut = "off";
defparam fp_functions_0_aadd_5_a37.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_5_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a42(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a126_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a47_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a42_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a42.extended_lut = "off";
defparam fp_functions_0_aadd_4_a42.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_4_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a42(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a126_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_5_a47_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a42_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a42.extended_lut = "off";
defparam fp_functions_0_aadd_5_a42.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_5_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a47(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a121_sumout),
	.datad(!fp_functions_0_aadd_3_a116_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a47_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a47.extended_lut = "off";
defparam fp_functions_0_aadd_4_a47.lut_mask = 64'h00000000000F0FF0;
defparam fp_functions_0_aadd_4_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a47(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_3_a121_sumout),
	.datad(!fp_functions_0_aadd_3_a116_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_5_a47_cout),
	.shareout());
defparam fp_functions_0_aadd_5_a47.extended_lut = "off";
defparam fp_functions_0_aadd_5_a47.lut_mask = 64'h00000000F0000FF0;
defparam fp_functions_0_aadd_5_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a23(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0_combout),
	.datab(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a0_combout),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a24_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a26_a_aq),
	.datae(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a22_combout),
	.dataf(!fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a28_a_aq),
	.datag(!fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a30_a_aq),
	.datah(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a23_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a23.extended_lut = "on";
defparam fp_functions_0_ai1423_a23.lut_mask = 64'h04778CFF04778CFF;
defparam fp_functions_0_ai1423_a23.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a0_a_a0(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a1_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a0_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a0_a_a0.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a0_a_a0.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a1_a_a1(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a6_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a1_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a1_a_a1.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a1_a_a1.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a1_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a2_a_a2(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a11_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a2_a_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a2_a_a2.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a2_a_a2.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a2_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a3_a_a3(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a16_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a3_a_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a3_a_a3.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a3_a_a3.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a3_a_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a4_a_a4(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a21_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a4_a_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a4_a_a4.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a4_a_a4.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a4_a_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a5_a_a5(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a26_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a5_a_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a5_a_a5.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a5_a_a5.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a5_a_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a6_a_a6(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a31_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a6_a_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a6_a_a6.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a6_a_a6.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a6_a_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a7_a_a7(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a36_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a7_a_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a7_a_a7.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a7_a_a7.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a7_a_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a8_a_a8(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a41_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a8_a_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a8_a_a8.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a8_a_a8.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a8_a_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a9_a_a9(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a46_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a9_a_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a9_a_a9.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a9_a_a9.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a9_a_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a10_a_a10(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a51_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a10_a_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a10_a_a10.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a10_a_a10.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a10_a_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a11_a_a11(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a56_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a11_a_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a11_a_a11.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a11_a_a11.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a11_a_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a12_a_a12(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a61_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a12_a_a12_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a12_a_a12.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a12_a_a12.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a12_a_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a13_a_a13(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a66_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a13_a_a13_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a13_a_a13.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a13_a_a13.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a13_a_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a14_a_a14(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a71_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a14_a_a14_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a14_a_a14.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a14_a_a14.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a14_a_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a15_a_a15(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a76_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a15_a_a15_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a15_a_a15.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a15_a_a15.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a15_a_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a16_a_a16(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a81_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a16_a_a16_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a16_a_a16.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a16_a_a16.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a16_a_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a17_a_a17(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a86_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a17_a_a17_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a17_a_a17.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a17_a_a17.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a17_a_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a18_a_a18(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a91_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a18_a_a18_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a18_a_a18.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a18_a_a18.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a18_a_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a19_a_a19(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a96_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a19_a_a19_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a19_a_a19.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a19_a_a19.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a19_a_a19.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a20_a_a20(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a101_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a20_a_a20_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a20_a_a20.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a20_a_a20.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a20_a_a20.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a21_a_a21(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a106_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a21_a_a21_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a21_a_a21.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a21_a_a21.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a21_a_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a22_a_a22(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a111_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a22_a_a22_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a22_a_a22.extended_lut = "off";
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a22_a_a22.lut_mask = 64'h0020002000200020;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a22_a_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_7_a2(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a116_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_7_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_7_a2.extended_lut = "off";
defparam fp_functions_0_aMux_7_a2.lut_mask = 64'h0F2F0F2F0F2F0F2F;
defparam fp_functions_0_aMux_7_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_6_a2(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a121_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_6_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_6_a2.extended_lut = "off";
defparam fp_functions_0_aMux_6_a2.lut_mask = 64'h0F2F0F2F0F2F0F2F;
defparam fp_functions_0_aMux_6_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_5_a2(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a126_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_5_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_5_a2.extended_lut = "off";
defparam fp_functions_0_aMux_5_a2.lut_mask = 64'h0F2F0F2F0F2F0F2F;
defparam fp_functions_0_aMux_5_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_4_a2(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a131_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_4_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_4_a2.extended_lut = "off";
defparam fp_functions_0_aMux_4_a2.lut_mask = 64'h0F2F0F2F0F2F0F2F;
defparam fp_functions_0_aMux_4_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_3_a2(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a136_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_3_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_3_a2.extended_lut = "off";
defparam fp_functions_0_aMux_3_a2.lut_mask = 64'h0F2F0F2F0F2F0F2F;
defparam fp_functions_0_aMux_3_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_2_a2(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a141_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_2_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_2_a2.extended_lut = "off";
defparam fp_functions_0_aMux_2_a2.lut_mask = 64'h0F2F0F2F0F2F0F2F;
defparam fp_functions_0_aMux_2_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_1_a2(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a146_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_1_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_1_a2.extended_lut = "off";
defparam fp_functions_0_aMux_1_a2.lut_mask = 64'h0F2F0F2F0F2F0F2F;
defparam fp_functions_0_aMux_1_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_0_a2(
	.dataa(!fp_functions_0_ainIsZero_uid12_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aadd_3_a151_sumout),
	.datac(!fp_functions_0_aadd_4_a1_sumout),
	.datad(!fp_functions_0_aadd_5_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_0_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_0_a2.extended_lut = "off";
defparam fp_functions_0_aMux_0_a2.lut_mask = 64'h0F2F0F2F0F2F0F2F;
defparam fp_functions_0_aMux_0_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0(
	.dataa(!areset),
	.datab(!en[0]),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0.extended_lut = "off";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0.lut_mask = 64'h7777777777777777;
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_4(
	.dataa(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a26_a_aq),
	.datac(!fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a30_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a27_a_aq),
	.datae(!fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a31_a_aq),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_4_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_4.extended_lut = "off";
defparam fp_functions_0_areduce_nor_4.lut_mask = 64'hE4A04400E4A04400;
defparam fp_functions_0_areduce_nor_4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a0(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a2_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a8_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a4_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a0.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a0.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a0(
	.dataa(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a27_a_aq),
	.datac(!fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a31_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a0.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a0.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0(
	.dataa(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a26_a_aq),
	.datac(!fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a30_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a25_a_aq),
	.datae(!fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a29_a_aq),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0.extended_lut = "off";
defparam fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0.lut_mask = 64'h0044A0E40044A0E4;
defparam fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1(
	.dataa(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a0_combout),
	.datab(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1.extended_lut = "off";
defparam fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a1(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a5_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a1_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a7_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a3_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a1.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a1.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a0(
	.dataa(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a0_combout),
	.datab(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a0.extended_lut = "off";
defparam fp_functions_0_ai1423_a0.lut_mask = 64'h4747474747474747;
defparam fp_functions_0_ai1423_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexpFracR_uid24_fxpToFPTest_b_a0_a_a0(
	.dataa(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a1_a_aq),
	.datab(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_aq),
	.datac(!fp_functions_0_asticky_uid20_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexpFracR_uid24_fxpToFPTest_b_a0_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexpFracR_uid24_fxpToFPTest_b_a0_a_a0.extended_lut = "off";
defparam fp_functions_0_aexpFracR_uid24_fxpToFPTest_b_a0_a_a0.lut_mask = 64'hDFDFDFDFDFDFDFDF;
defparam fp_functions_0_aexpFracR_uid24_fxpToFPTest_b_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a2(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a7_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a3_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a9_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a5_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a2.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a2.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a1(
	.dataa(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a0_combout),
	.datab(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a2_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a1.extended_lut = "off";
defparam fp_functions_0_ai1423_a1.lut_mask = 64'h1D1D1D1D1D1D1D1D;
defparam fp_functions_0_ai1423_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a3(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a8_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a4_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a3.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a3.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a2(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a2_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a3_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a2.extended_lut = "off";
defparam fp_functions_0_ai1423_a2.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a4(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a9_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a5_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a11_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a7_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a4.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a4.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a3(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a3_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a4_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a3.extended_lut = "off";
defparam fp_functions_0_ai1423_a3.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a5(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a12_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a8_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a5.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a5.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a4(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a4_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a5_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a4.extended_lut = "off";
defparam fp_functions_0_ai1423_a4.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a6(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a11_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a7_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a13_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a9_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a6.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a6.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a5(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a5_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a6_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a5.extended_lut = "off";
defparam fp_functions_0_ai1423_a5.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a7(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a12_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a8_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a14_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a7.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a7.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a6(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a6_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a7_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a6.extended_lut = "off";
defparam fp_functions_0_ai1423_a6.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a8(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a13_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a9_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a15_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a11_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a8.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a8.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a7(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a7_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a8_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a7.extended_lut = "off";
defparam fp_functions_0_ai1423_a7.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a9(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a14_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a16_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a12_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a9.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a9.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a8(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a8_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a9_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a8.extended_lut = "off";
defparam fp_functions_0_ai1423_a8.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a10(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a15_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a11_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a17_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a13_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a10.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a10.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a9(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a9_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a10_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a9.extended_lut = "off";
defparam fp_functions_0_ai1423_a9.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a11(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a16_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a12_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a18_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a14_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a11.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a11.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a10(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a10_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a11_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a10.extended_lut = "off";
defparam fp_functions_0_ai1423_a10.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a12(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a17_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a13_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a19_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a15_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a12_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a12.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a12.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a11(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a11_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a12_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a11.extended_lut = "off";
defparam fp_functions_0_ai1423_a11.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a13(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a18_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a14_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a20_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a16_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a13_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a13.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a13.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a12(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a12_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a13_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a12_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a12.extended_lut = "off";
defparam fp_functions_0_ai1423_a12.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a14(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a19_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a15_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a17_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a14_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a14.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a14.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a13(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a13_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a14_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a13_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a13.extended_lut = "off";
defparam fp_functions_0_ai1423_a13.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a15(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a20_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a16_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a22_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a18_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a15_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a15.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a15.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a14(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a14_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a15_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a14_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a14.extended_lut = "off";
defparam fp_functions_0_ai1423_a14.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a16(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a17_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a23_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a19_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a16_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a16.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a16.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a15(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a15_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a16_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a15_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a15.extended_lut = "off";
defparam fp_functions_0_ai1423_a15.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a17(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a22_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a18_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a24_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a20_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a17_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a17.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a17.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a16(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a16_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a17_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a16_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a16.extended_lut = "off";
defparam fp_functions_0_ai1423_a16.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a18(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a23_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a19_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a25_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a18_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a18.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a18.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a17(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a17_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a18_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a17_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a17.extended_lut = "off";
defparam fp_functions_0_ai1423_a17.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a19(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a24_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a20_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a26_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a22_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a19_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a19.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a19.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a19.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a18(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a18_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a19_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a18_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a18.extended_lut = "off";
defparam fp_functions_0_ai1423_a18.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a20(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a25_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a27_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a23_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a20_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a20.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a20.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a20.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a19(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a19_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a20_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a19_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a19.extended_lut = "off";
defparam fp_functions_0_ai1423_a19.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a19.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a21(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a26_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a22_a_aq),
	.datac(!fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a28_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a24_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a21_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a21.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a21.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a20(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a20_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a21_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a20_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a20.extended_lut = "off";
defparam fp_functions_0_ai1423_a20.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a20.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a22(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a27_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a23_a_aq),
	.datac(!fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a29_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a25_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a22_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a22.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a22.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a21(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a21_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a22_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a21_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a21.extended_lut = "off";
defparam fp_functions_0_ai1423_a21.lut_mask = 64'h1B1B1B1B1B1B1B1B;
defparam fp_functions_0_ai1423_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a0(
	.dataa(!fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q_a0_a_aq),
	.datab(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a31_a_aq),
	.datad(!fp_functions_0_aredist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datae(!fp_functions_0_aredist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aadd_1_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_1_a0.extended_lut = "off";
defparam fp_functions_0_aadd_1_a0.lut_mask = 64'h5155555551555555;
defparam fp_functions_0_aadd_1_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a0(
	.dataa(!fp_functions_0_aadd_1_a0_combout),
	.datab(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a0.extended_lut = "off";
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a0.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a0(
	.dataa(!fp_functions_0_areduce_nor_4_acombout),
	.datab(!fp_functions_0_aadd_1_a0_combout),
	.datac(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aadd_2_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_2_a0.extended_lut = "off";
defparam fp_functions_0_aadd_2_a0.lut_mask = 64'hB7B7B7B7B7B7B7B7;
defparam fp_functions_0_aadd_2_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a1(
	.dataa(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a0_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0_combout),
	.datad(!fp_functions_0_aadd_1_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aadd_2_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_2_a1.extended_lut = "off";
defparam fp_functions_0_aadd_2_a1.lut_mask = 64'h2000200020002000;
defparam fp_functions_0_aadd_2_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a2(
	.dataa(!fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q_a0_a_aq),
	.datab(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aadd_2_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aadd_2_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_2_a2.extended_lut = "off";
defparam fp_functions_0_aadd_2_a2.lut_mask = 64'hD2D2D2D2D2D2D2D2;
defparam fp_functions_0_aadd_2_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a3(
	.dataa(!fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q_a0_a_aq),
	.datab(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aredist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datad(!fp_functions_0_aadd_2_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aadd_2_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_2_a3.extended_lut = "off";
defparam fp_functions_0_aadd_2_a3.lut_mask = 64'hF5D7F5D7F5D7F5D7;
defparam fp_functions_0_aadd_2_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a4(
	.dataa(!fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q_a0_a_aq),
	.datab(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aredist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datad(!fp_functions_0_aredist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datae(!fp_functions_0_aadd_2_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aadd_2_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_2_a4.extended_lut = "off";
defparam fp_functions_0_aadd_2_a4.lut_mask = 64'hFF55FD57FF55FD57;
defparam fp_functions_0_aadd_2_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a5(
	.dataa(!fp_functions_0_aredist5_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_2_q_a0_a_aq),
	.datab(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aredist3_vCount_uid56_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datad(!fp_functions_0_aredist4_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datae(!fp_functions_0_aadd_2_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aadd_2_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_2_a5.extended_lut = "off";
defparam fp_functions_0_aadd_2_a5.lut_mask = 64'hAAAAAAA8AAAAAAA8;
defparam fp_functions_0_aadd_2_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a0(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_aadd_0_a16_sumout),
	.datae(!fp_functions_0_aadd_0_a21_sumout),
	.dataf(!fp_functions_0_aadd_0_a26_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a0.lut_mask = 64'h8000000000000000;
defparam fp_functions_0_areduce_nor_0_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a1(
	.dataa(!fp_functions_0_areduce_nor_0_a0_combout),
	.datab(!fp_functions_0_aadd_0_a31_sumout),
	.datac(!fp_functions_0_aadd_0_a36_sumout),
	.datad(!fp_functions_0_aadd_0_a41_sumout),
	.datae(!fp_functions_0_aadd_0_a46_sumout),
	.dataf(!fp_functions_0_aadd_0_a51_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a1.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a1.lut_mask = 64'h4000000000000000;
defparam fp_functions_0_areduce_nor_0_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a2(
	.dataa(!fp_functions_0_areduce_nor_0_a1_combout),
	.datab(!fp_functions_0_aadd_0_a56_sumout),
	.datac(!fp_functions_0_aadd_0_a61_sumout),
	.datad(!fp_functions_0_aadd_0_a66_sumout),
	.datae(!fp_functions_0_aadd_0_a71_sumout),
	.dataf(!fp_functions_0_aadd_0_a76_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a2.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a2.lut_mask = 64'h4000000000000000;
defparam fp_functions_0_areduce_nor_0_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a3(
	.dataa(!fp_functions_0_aadd_0_a96_sumout),
	.datab(!fp_functions_0_aadd_0_a101_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a3.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a3.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_areduce_nor_0_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a4(
	.dataa(!fp_functions_0_aadd_0_a91_sumout),
	.datab(!fp_functions_0_areduce_nor_0_a3_combout),
	.datac(!fp_functions_0_aadd_0_a106_sumout),
	.datad(!fp_functions_0_aadd_0_a111_sumout),
	.datae(!fp_functions_0_aadd_0_a116_sumout),
	.dataf(!fp_functions_0_aadd_0_a121_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a4.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a4.lut_mask = 64'h2000000000000000;
defparam fp_functions_0_areduce_nor_0_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a5(
	.dataa(!fp_functions_0_aadd_0_a86_sumout),
	.datab(!fp_functions_0_areduce_nor_0_a4_combout),
	.datac(!fp_functions_0_aadd_0_a126_sumout),
	.datad(!fp_functions_0_aadd_0_a131_sumout),
	.datae(!fp_functions_0_aadd_0_a136_sumout),
	.dataf(!fp_functions_0_aadd_0_a141_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a5.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a5.lut_mask = 64'h2000000000000000;
defparam fp_functions_0_areduce_nor_0_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0(
	.dataa(!fp_functions_0_areduce_nor_0_a2_combout),
	.datab(!fp_functions_0_aadd_0_a81_sumout),
	.datac(!fp_functions_0_areduce_nor_0_a5_combout),
	.datad(!fp_functions_0_aadd_0_a146_sumout),
	.datae(!fp_functions_0_aadd_0_a151_sumout),
	.dataf(!fp_functions_0_aadd_0_a156_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0.lut_mask = 64'h0400000000000000;
defparam fp_functions_0_areduce_nor_0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq),
	.datac(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq),
	.datad(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_aq),
	.datac(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_aq),
	.datad(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq),
	.datac(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a_aq),
	.datad(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq),
	.datac(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq),
	.datad(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_1(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_1_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_1.extended_lut = "off";
defparam fp_functions_0_areduce_nor_1.lut_mask = 64'h0001000100010001;
defparam fp_functions_0_areduce_nor_1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a16(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a16_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a16.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a16.lut_mask = 64'hAAAAAAAAAAAAAAA8;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a18(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a18_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a18.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a18.lut_mask = 64'hAAAAAAAAAAAAAAA8;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a19(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a19_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a19.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a19.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a19.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a20(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a20_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a20.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a20.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a20.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a21(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a19_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a20_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a21_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a21.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a21.lut_mask = 64'hAAAAAAAAAAAAAAA8;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a22(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a22_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a22.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a22.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a23(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a23_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a23.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a23.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a23.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a24(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a22_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a23_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a24_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a24.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a24.lut_mask = 64'hAAAAAAAAAAAAAAA8;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a24.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a16_combout),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a18_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a21_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a24_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5.lut_mask = 64'h0001000100010001;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a25(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a25_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a25.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a25.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a25.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a26(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a22_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a25_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a26_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a26.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a26.lut_mask = 64'hAAAAAAAAAAAAAAA8;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a26.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a27(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a27_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a27.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a27.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a28(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a28_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a28.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a28.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a28.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a29(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a27_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a28_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a29_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a29.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a29.lut_mask = 64'hAAAAAAAAAAAAAAA8;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a29.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a30(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a30_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a30.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a30.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a30.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a31(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a19_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a30_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a31_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a31.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a31.lut_mask = 64'hAAAAAAAAAAAAAAA8;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a31.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a32(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a32_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a32.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a32.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a33(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a33_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a33.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a33.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a33.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a34(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a32_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a33_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a34_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a34.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a34.lut_mask = 64'hAAAAAAAAAAAAAAA8;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a34.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a26_combout),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a29_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a31_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a34_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6.lut_mask = 64'h0001000100010001;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0(
	.dataa(!areset),
	.datab(!fp_functions_0_areduce_nor_1_acombout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0.extended_lut = "off";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0.lut_mask = 64'h777F777F777F777F;
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a0(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a0.extended_lut = "off";
defparam fp_functions_0_ai905_a0.lut_mask = 64'h5553555355535553;
defparam fp_functions_0_ai905_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1(
	.dataa(!areset),
	.datab(!fp_functions_0_areduce_nor_1_acombout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1.extended_lut = "off";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1.lut_mask = 64'h7777777777777777;
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a10_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a35(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a35_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a35.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a35.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a35.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a36(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a27_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a35_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a36_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a36.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a36.lut_mask = 64'hAAAAAAAAAAAAAAA8;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a36.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a7(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a21_combout),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a24_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a7.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a7.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a8(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a16_combout),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a18_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a36_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a7_combout),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a8.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a8.lut_mask = 64'hAAAAAABAAAAAAABA;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a37(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a37_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a37.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a37.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a38(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a38_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a38.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a38.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a38.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a39(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a37_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a38_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a39_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a39.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a39.lut_mask = 64'hAAAAAAAAAAAAAAA8;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a39.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a9(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a16_combout),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a18_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a39_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a7_combout),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a9.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a9.lut_mask = 64'hCCCCCCDCCCCCCCDC;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a40(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a37_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a40_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a40.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a40.lut_mask = 64'h0000000000000004;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a40.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a26_combout),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a29_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a40_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a31_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a34_combout),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.dataf(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11.lut_mask = 64'hF0F0F0F0F0F0F0F7;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a16_combout),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a18_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a41(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a41_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a41.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a41.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a41.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a42(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a32_combout),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a42_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a42.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a42.lut_mask = 64'h0001000100010001;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a41_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a42_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a24_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13.lut_mask = 64'h0057005700570057;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a21_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14.lut_mask = 64'hAAABAAABAAABAAAB;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3(
	.dataa(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a8_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a9_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a11_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_3_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_3.extended_lut = "off";
defparam fp_functions_0_areduce_nor_3.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_areduce_nor_3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a31_combout),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a34_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a43(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a43_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a43.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a43.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a43.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a44(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a44_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a44.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a44.lut_mask = 64'h0000000800000008;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a44.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a16(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a43_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a44_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a29_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a16_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a16.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a16.lut_mask = 64'h0057005700570057;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a17(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a26_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a16_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a17_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a17.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a17.lut_mask = 64'hAAABAAABAAABAAAB;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_a45(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_a45_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_a45.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_a45.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_a45.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a46(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a13_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a46_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a46.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a46.lut_mask = 64'h0000000800000008;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a46.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a18(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_a45_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a46_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a21_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a18_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a18.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a18.lut_mask = 64'h0057005700570057;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a19(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a24_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a18_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a19_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a19.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a19.lut_mask = 64'hAAABAAABAAABAAAB;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a19.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a47(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a47_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a47.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a47.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a20(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a47_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a46_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a26_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a20_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a20.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a20.lut_mask = 64'h0057005700570057;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a20.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a21(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a29_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a15_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a20_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a21_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a21.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a21.lut_mask = 64'hAAABAAABAAABAAAB;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a23(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a4_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a0_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a6_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a2_a_aq),
	.datae(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_areduce_nor_4_acombout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a23_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a23.extended_lut = "off";
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a23.lut_mask = 64'h0F0F00FF55553333;
defparam fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a23.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1423_a22(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a1_combout),
	.datac(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a23_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1423_a22_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1423_a22.extended_lut = "off";
defparam fp_functions_0_ai1423_a22.lut_mask = 64'h2727272727272727;
defparam fp_functions_0_ai1423_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_or_0_a0(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a26_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a27_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a1_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a0_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_or_0_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_or_0_a0.extended_lut = "off";
defparam fp_functions_0_areduce_or_0_a0.lut_mask = 64'hF888F888F888F888;
defparam fp_functions_0_areduce_or_0_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_or_0_a1(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a4_a_aq),
	.datab(!fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a30_a_aq),
	.datac(!fp_functions_0_aredist2_vStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a31_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a5_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_or_0_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_or_0_a1.extended_lut = "off";
defparam fp_functions_0_areduce_or_0_a1.lut_mask = 64'hEAC0EAC0EAC0EAC0;
defparam fp_functions_0_areduce_or_0_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_or_0_a2(
	.dataa(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a2_a_aq),
	.datab(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a1_a_aq),
	.datac(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a3_a_aq),
	.datad(!fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a0_a_aq),
	.datae(!fp_functions_0_areduce_or_0_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_or_0_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_or_0_a2.extended_lut = "off";
defparam fp_functions_0_areduce_or_0_a2.lut_mask = 64'h0000800000008000;
defparam fp_functions_0_areduce_or_0_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_or_0_a3(
	.dataa(!fp_functions_0_avCount_uid63_lzcShifterZ1_uid10_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(!fp_functions_0_areduce_or_0_a0_combout),
	.datac(!fp_functions_0_areduce_or_0_a2_combout),
	.datad(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datae(!fp_functions_0_avStagei_uid74_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_a23_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_or_0_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_or_0_a3.extended_lut = "off";
defparam fp_functions_0_areduce_or_0_a3.lut_mask = 64'hECECFFECECECFFEC;
defparam fp_functions_0_areduce_or_0_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a1(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a1.extended_lut = "off";
defparam fp_functions_0_ai905_a1.lut_mask = 64'h5553555355535553;
defparam fp_functions_0_ai905_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a2(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a2.extended_lut = "off";
defparam fp_functions_0_ai905_a2.lut_mask = 64'h5553555355535553;
defparam fp_functions_0_ai905_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a3(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a3.extended_lut = "off";
defparam fp_functions_0_ai905_a3.lut_mask = 64'h5553555355535553;
defparam fp_functions_0_ai905_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a4(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a4.extended_lut = "off";
defparam fp_functions_0_ai905_a4.lut_mask = 64'h5553555355535553;
defparam fp_functions_0_ai905_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a5(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a5.extended_lut = "off";
defparam fp_functions_0_ai905_a5.lut_mask = 64'h5553555355535553;
defparam fp_functions_0_ai905_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a6(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a_aq),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a6.extended_lut = "off";
defparam fp_functions_0_ai905_a6.lut_mask = 64'h3335333533353335;
defparam fp_functions_0_ai905_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a7(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a_aq),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a7.extended_lut = "off";
defparam fp_functions_0_ai905_a7.lut_mask = 64'h5553555355535553;
defparam fp_functions_0_ai905_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_a48(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_a48_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_a48.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_a48.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_a48.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a8(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_a48_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a44_combout),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.dataf(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a8.extended_lut = "off";
defparam fp_functions_0_ai905_a8.lut_mask = 64'h555F555F555F3333;
defparam fp_functions_0_ai905_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2(
	.dataa(!areset),
	.datab(!fp_functions_0_areduce_nor_1_acombout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2.extended_lut = "off";
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2.lut_mask = 64'h5557555755575557;
defparam fp_functions_0_aredist1_rVStage_uid62_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_c_1_q_a21_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a9(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a47_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a46_combout),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.dataf(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a9.extended_lut = "off";
defparam fp_functions_0_ai905_a9.lut_mask = 64'h555F555F555F3333;
defparam fp_functions_0_ai905_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a10(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a43_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a44_combout),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.dataf(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a10.extended_lut = "off";
defparam fp_functions_0_ai905_a10.lut_mask = 64'h555F555F555F3333;
defparam fp_functions_0_ai905_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a11(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_a45_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_a46_combout),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.dataf(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a11.extended_lut = "off";
defparam fp_functions_0_ai905_a11.lut_mask = 64'h555F555F555F3333;
defparam fp_functions_0_ai905_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a12(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a36_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a12_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a12.extended_lut = "off";
defparam fp_functions_0_ai905_a12.lut_mask = 64'hCCC5CCC5CCC5CCC5;
defparam fp_functions_0_ai905_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a13(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a39_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a13_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a13.extended_lut = "off";
defparam fp_functions_0_ai905_a13.lut_mask = 64'hCCC5CCC5CCC5CCC5;
defparam fp_functions_0_ai905_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a14(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a40_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a14_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a14.extended_lut = "off";
defparam fp_functions_0_ai905_a14.lut_mask = 64'h5F5F5F335F5F5F33;
defparam fp_functions_0_ai905_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai905_a15(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a_aq),
	.datab(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_a41_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a42_combout),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.dataf(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai905_a15_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai905_a15.extended_lut = "off";
defparam fp_functions_0_ai905_a15.lut_mask = 64'h555F555F555F3333;
defparam fp_functions_0_ai905_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a22(
	.dataa(!fp_functions_0_avStagei_uid46_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_a48_combout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_a44_combout),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a31_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a22_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a22.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a22.lut_mask = 64'h0057005700570057;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a23(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a34_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a10_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a22_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a23_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a23.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a23.lut_mask = 64'hAAABAAABAAABAAAB;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a23.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_2(
	.dataa(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a5_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a6_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_2_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_2.extended_lut = "off";
defparam fp_functions_0_areduce_nor_2.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_areduce_nor_2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a5_wirecell(
	.dataa(!fp_functions_0_aadd_2_a5_combout),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aadd_2_a5_wirecell_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_2_a5_wirecell.extended_lut = "off";
defparam fp_functions_0_aadd_2_a5_wirecell.lut_mask = 64'hAAAAAAAAAAAAAAAA;
defparam fp_functions_0_aadd_2_a5_wirecell.shared_arith = "off";

assign q[30] = fp_functions_0_aMux_0_a2_combout;

assign q[29] = fp_functions_0_aMux_1_a2_combout;

assign q[28] = fp_functions_0_aMux_2_a2_combout;

assign q[27] = fp_functions_0_aMux_3_a2_combout;

assign q[26] = fp_functions_0_aMux_4_a2_combout;

assign q[25] = fp_functions_0_aMux_5_a2_combout;

assign q[24] = fp_functions_0_aMux_6_a2_combout;

assign q[23] = fp_functions_0_aMux_7_a2_combout;

assign q[0] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a0_a_a0_combout;

assign q[10] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a10_a_a10_combout;

assign q[11] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a11_a_a11_combout;

assign q[12] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a12_a_a12_combout;

assign q[13] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a13_a_a13_combout;

assign q[14] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a14_a_a14_combout;

assign q[15] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a15_a_a15_combout;

assign q[16] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a16_a_a16_combout;

assign q[17] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a17_a_a17_combout;

assign q[18] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a18_a_a18_combout;

assign q[19] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a19_a_a19_combout;

assign q[1] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a1_a_a1_combout;

assign q[20] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a20_a_a20_combout;

assign q[21] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a21_a_a21_combout;

assign q[22] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a22_a_a22_combout;

assign q[2] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a2_a_a2_combout;

assign q[3] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a3_a_a3_combout;

assign q[4] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a4_a_a4_combout;

assign q[5] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a5_a_a5_combout;

assign q[6] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a6_a_a6_combout;

assign q[7] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a7_a_a7_combout;

assign q[8] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a8_a_a8_combout;

assign q[9] = fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a9_a_a9_combout;

assign q[31] = fp_functions_0_aredist6_signX_uid6_fxpToFPTest_b_3_q_a0_a_aq;

endmodule
