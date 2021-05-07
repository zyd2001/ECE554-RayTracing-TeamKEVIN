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

// DATE "05/07/2021 03:54:52"

// 
// Device: Altera 1SX280HN2F43E2VG Package FBGA1760
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module FtoI (
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

wire fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq;
wire fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a0_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a1_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a2_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a3_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a4_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a5_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a6_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a7_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a8_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a9_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a11_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a12_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a13_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a14_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a15_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a16_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a17_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a18_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a19_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a20_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a21_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a22_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a23_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a24_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a25_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a26_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a27_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a28_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a29_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a30_a_aq;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a31_a_aq;
wire fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq;
wire fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_aredist1_excN_x_uid16_fpToFxPTest_q_1_q_a0_a_aq;
wire fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a_aq;
wire fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_aadd_4_a1_sumout;
wire fp_functions_0_aadd_2_a1_sumout;
wire fp_functions_0_aadd_2_a2;
wire fp_functions_0_aadd_2_a6_sumout;
wire fp_functions_0_aadd_2_a7;
wire fp_functions_0_aadd_2_a11_sumout;
wire fp_functions_0_aadd_2_a12;
wire fp_functions_0_aadd_2_a16_sumout;
wire fp_functions_0_aadd_2_a17;
wire fp_functions_0_aadd_2_a21_sumout;
wire fp_functions_0_aadd_2_a22;
wire fp_functions_0_aadd_2_a26_sumout;
wire fp_functions_0_aadd_2_a27;
wire fp_functions_0_aadd_2_a31_sumout;
wire fp_functions_0_aadd_2_a32;
wire fp_functions_0_aadd_2_a36_sumout;
wire fp_functions_0_aadd_2_a37;
wire fp_functions_0_aadd_2_a41_sumout;
wire fp_functions_0_aadd_2_a42;
wire fp_functions_0_aadd_2_a46_sumout;
wire fp_functions_0_aadd_2_a47;
wire fp_functions_0_aadd_2_a51_sumout;
wire fp_functions_0_aadd_2_a52;
wire fp_functions_0_aadd_2_a56_sumout;
wire fp_functions_0_aadd_2_a57;
wire fp_functions_0_aadd_2_a61_sumout;
wire fp_functions_0_aadd_2_a62;
wire fp_functions_0_aadd_2_a66_sumout;
wire fp_functions_0_aadd_2_a67;
wire fp_functions_0_aadd_2_a71_sumout;
wire fp_functions_0_aadd_2_a72;
wire fp_functions_0_aadd_2_a76_sumout;
wire fp_functions_0_aadd_2_a77;
wire fp_functions_0_aadd_2_a81_sumout;
wire fp_functions_0_aadd_2_a82;
wire fp_functions_0_aadd_2_a86_sumout;
wire fp_functions_0_aadd_2_a87;
wire fp_functions_0_aadd_2_a91_sumout;
wire fp_functions_0_aadd_2_a92;
wire fp_functions_0_aadd_2_a96_sumout;
wire fp_functions_0_aadd_2_a97;
wire fp_functions_0_aadd_2_a101_sumout;
wire fp_functions_0_aadd_2_a102;
wire fp_functions_0_aadd_2_a106_sumout;
wire fp_functions_0_aadd_2_a107;
wire fp_functions_0_aadd_2_a111_sumout;
wire fp_functions_0_aadd_2_a112;
wire fp_functions_0_aadd_2_a116_sumout;
wire fp_functions_0_aadd_2_a117;
wire fp_functions_0_aadd_2_a121_sumout;
wire fp_functions_0_aadd_2_a122;
wire fp_functions_0_aadd_2_a126_sumout;
wire fp_functions_0_aadd_2_a127;
wire fp_functions_0_aadd_2_a131_sumout;
wire fp_functions_0_aadd_2_a132;
wire fp_functions_0_aadd_2_a136_sumout;
wire fp_functions_0_aadd_2_a137;
wire fp_functions_0_aadd_2_a141_sumout;
wire fp_functions_0_aadd_2_a142;
wire fp_functions_0_aadd_2_a146_sumout;
wire fp_functions_0_aadd_2_a147;
wire fp_functions_0_aadd_2_a151_sumout;
wire fp_functions_0_aadd_2_a152;
wire fp_functions_0_aadd_2_a156_sumout;
wire fp_functions_0_aadd_2_a157;
wire fp_functions_0_aadd_3_a1_sumout;
wire fp_functions_0_aadd_5_a1_sumout;
wire fp_functions_0_aadd_2_a161_sumout;
wire fp_functions_0_aadd_4_a7_cout;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a0_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a16_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a17_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a19_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a20_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a21_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a22_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a23_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a24_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a25_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a26_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a27_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a28_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a29_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a30_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a31_a_aq;
wire fp_functions_0_aadd_3_a7_cout;
wire fp_functions_0_aadd_5_a7_cout;
wire fp_functions_0_aadd_4_a12_cout;
wire fp_functions_0_aadd_0_a1_sumout;
wire fp_functions_0_aadd_0_a2;
wire fp_functions_0_aadd_0_a6_sumout;
wire fp_functions_0_aadd_0_a7;
wire fp_functions_0_aadd_0_a11_sumout;
wire fp_functions_0_aadd_0_a12;
wire fp_functions_0_aadd_0_a16_sumout;
wire fp_functions_0_aadd_0_a17;
wire fp_functions_0_aadd_1_a1_sumout;
wire fp_functions_0_aadd_3_a12_cout;
wire fp_functions_0_aadd_5_a12_cout;
wire fp_functions_0_aadd_4_a17_cout;
wire fp_functions_0_aadd_0_a22_cout;
wire fp_functions_0_aadd_0_a26_sumout;
wire fp_functions_0_aadd_1_a7_cout;
wire fp_functions_0_aadd_3_a17_cout;
wire fp_functions_0_aadd_5_a17_cout;
wire fp_functions_0_aadd_4_a22_cout;
wire fp_functions_0_aadd_0_a32_cout;
wire fp_functions_0_aadd_0_a36_sumout;
wire fp_functions_0_aadd_0_a37;
wire fp_functions_0_aadd_1_a12_cout;
wire fp_functions_0_aadd_3_a22_cout;
wire fp_functions_0_aadd_5_a22_cout;
wire fp_functions_0_aadd_4_a27_cout;
wire fp_functions_0_aadd_0_a42_cout;
wire fp_functions_0_aadd_0_a46_sumout;
wire fp_functions_0_aadd_0_a47;
wire fp_functions_0_aadd_1_a17_cout;
wire fp_functions_0_aadd_3_a27_cout;
wire fp_functions_0_aadd_5_a27_cout;
wire fp_functions_0_aadd_4_a32_cout;
wire fp_functions_0_aadd_0_a51_sumout;
wire fp_functions_0_aadd_0_a52;
wire fp_functions_0_aadd_1_a22_cout;
wire fp_functions_0_aadd_3_a32_cout;
wire fp_functions_0_aadd_5_a32_cout;
wire fp_functions_0_aadd_4_a37_cout;
wire fp_functions_0_aadd_1_a27_cout;
wire fp_functions_0_aadd_3_a37_cout;
wire fp_functions_0_aadd_5_a37_cout;
wire fp_functions_0_aadd_4_a42_cout;
wire fp_functions_0_aadd_1_a32_cout;
wire fp_functions_0_aadd_3_a42_cout;
wire fp_functions_0_aadd_5_a42_cout;
wire fp_functions_0_aadd_4_a47_cout;
wire fp_functions_0_aadd_1_a37_cout;
wire fp_functions_0_aadd_3_a47_cout;
wire fp_functions_0_aadd_5_a47_cout;
wire fp_functions_0_aadd_4_a52_cout;
wire fp_functions_0_aadd_1_a42_cout;
wire fp_functions_0_aadd_4_a57_cout;
wire fp_functions_0_aadd_1_a47_cout;
wire fp_functions_0_aadd_4_a62_cout;
wire fp_functions_0_aadd_1_a52_cout;
wire fp_functions_0_aadd_4_a67_cout;
wire fp_functions_0_aadd_1_a57_cout;
wire fp_functions_0_aadd_4_a72_cout;
wire fp_functions_0_aadd_4_a77_cout;
wire fp_functions_0_aadd_4_a82_cout;
wire fp_functions_0_aadd_4_a87_cout;
wire fp_functions_0_aadd_4_a92_cout;
wire fp_functions_0_aadd_4_a97_cout;
wire fp_functions_0_aadd_4_a102_cout;
wire fp_functions_0_aadd_4_a107_cout;
wire fp_functions_0_aadd_4_a112_cout;
wire fp_functions_0_aadd_4_a117_cout;
wire fp_functions_0_aadd_4_a122_cout;
wire fp_functions_0_aadd_4_a127_cout;
wire fp_functions_0_aadd_4_a132_cout;
wire fp_functions_0_aadd_4_a137_cout;
wire fp_functions_0_aadd_4_a142_cout;
wire fp_functions_0_aadd_4_a147_cout;
wire fp_functions_0_aadd_4_a152_cout;
wire fp_functions_0_aadd_4_a157_cout;
wire fp_functions_0_aadd_4_a162_cout;
wire fp_functions_0_aadd_4_a167_cout;
wire fp_functions_0_aadd_4_a172_cout;
wire fp_functions_0_aMux_40_a0_combout;
wire fp_functions_0_aMux_20_a0_combout;
wire fp_functions_0_aMux_24_a1_combout;
wire fp_functions_0_aMux_8_a0_combout;
wire fp_functions_0_aMux_16_a0_combout;
wire fp_functions_0_aMux_21_a0_combout;
wire fp_functions_0_aMux_17_a0_combout;
wire fp_functions_0_aMux_45_a1_combout;
wire fp_functions_0_aMux_9_a0_combout;
wire fp_functions_0_aMux_5_a0_combout;
wire fp_functions_0_aMux_13_a0_combout;
wire fp_functions_0_ai901_a2_combout;
wire fp_functions_0_aMux_47_a2_combout;
wire fp_functions_0_aMux_3_a1_combout;
wire fp_functions_0_aMux_23_a0_combout;
wire fp_functions_0_aMux_19_a0_combout;
wire fp_functions_0_aMux_18_a0_combout;
wire fp_functions_0_aMux_46_a2_combout;
wire fp_functions_0_aMux_22_a0_combout;
wire fp_functions_0_aMux_129_a0_combout;
wire fp_functions_0_aMux_129_a1_combout;
wire fp_functions_0_aMux_129_a2_combout;
wire fp_functions_0_aMux_129_a3_combout;
wire fp_functions_0_aMux_129_a4_combout;
wire fp_functions_0_aMux_129_a5_combout;
wire fp_functions_0_aMux_129_a6_combout;
wire fp_functions_0_aMux_129_a7_combout;
wire fp_functions_0_aMux_129_a8_combout;
wire fp_functions_0_aMux_129_a9_combout;
wire fp_functions_0_aMux_129_a10_combout;
wire fp_functions_0_aMux_129_a11_combout;
wire fp_functions_0_aMux_129_a12_combout;
wire fp_functions_0_aMux_129_a13_combout;
wire fp_functions_0_aMux_129_a14_combout;
wire fp_functions_0_aMux_129_a15_combout;
wire fp_functions_0_aMux_129_a16_combout;
wire fp_functions_0_aMux_129_a17_combout;
wire fp_functions_0_aMux_129_a18_combout;
wire fp_functions_0_aMux_129_a19_combout;
wire fp_functions_0_aMux_129_a20_combout;
wire fp_functions_0_aMux_129_a21_combout;
wire fp_functions_0_aMux_129_a22_combout;
wire fp_functions_0_aMux_129_a23_combout;
wire fp_functions_0_aMux_129_a24_combout;
wire fp_functions_0_aMux_129_a25_combout;
wire fp_functions_0_aMux_129_a26_combout;
wire fp_functions_0_aMux_129_a27_combout;
wire fp_functions_0_aMux_129_a28_combout;
wire fp_functions_0_aMux_129_a29_combout;
wire fp_functions_0_aMux_129_a30_combout;
wire fp_functions_0_aMux_129_a31_combout;
wire fp_functions_0_ai1678_a0_combout;
wire fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout;
wire fp_functions_0_ai1678_a1_combout;
wire fp_functions_0_areduce_nor_1_a0_combout;
wire fp_functions_0_areduce_nor_1_acombout;
wire fp_functions_0_areduce_nor_0_a0_combout;
wire fp_functions_0_areduce_nor_0_a1_combout;
wire fp_functions_0_areduce_nor_0_a2_combout;
wire fp_functions_0_areduce_nor_0_a3_combout;
wire fp_functions_0_areduce_nor_0_acombout;
wire fp_functions_0_aexcI_x_uid15_fpToFxPTest_qi_a0_a_acombout;
wire fp_functions_0_aexcN_x_uid16_fpToFxPTest_q_a0_a_acombout;
wire fp_functions_0_asignX_uid29_fpToFxPTest_qi_a0_a_acombout;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a2_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a3_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a4_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a5_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a7_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a8_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a9_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a10_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a11_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a13_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a14_a_aq;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a15_a_aq;
wire fp_functions_0_areduce_nor_2_a0_combout;
wire fp_functions_0_areduce_nor_2_acombout;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout;
wire fp_functions_0_ai933_a0_combout;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a1_combout;
wire fp_functions_0_aMux_1_a0_combout;
wire fp_functions_0_ai933_a1_combout;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a_a2_combout;
wire fp_functions_0_aMux_14_a0_combout;
wire fp_functions_0_aMux_6_a0_combout;
wire fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a0_combout;
wire fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a1_combout;
wire fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a2_combout;
wire fp_functions_0_aMux_2_a0_combout;
wire fp_functions_0_aMux_2_a1_combout;
wire fp_functions_0_aMux_46_a0_combout;
wire fp_functions_0_aMux_10_a0_combout;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a3_combout;
wire fp_functions_0_aMux_46_a1_combout;
wire fp_functions_0_ai933_a2_combout;
wire fp_functions_0_ai933_a3_combout;
wire fp_functions_0_ai933_a4_combout;
wire fp_functions_0_ai933_a5_combout;
wire fp_functions_0_ai901_a0_combout;
wire fp_functions_0_ai901_a1_combout;
wire fp_functions_0_aMux_7_a0_combout;
wire fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a3_combout;
wire fp_functions_0_aMux_15_a0_combout;
wire fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a4_combout;
wire fp_functions_0_aMux_47_a0_combout;
wire fp_functions_0_aMux_11_a0_combout;
wire fp_functions_0_aMux_47_a1_combout;
wire fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a5_combout;
wire fp_functions_0_aMux_44_a0_combout;
wire fp_functions_0_aMux_1_a1_combout;
wire fp_functions_0_ai933_a6_combout;
wire fp_functions_0_aMux_25_a2_combout;
wire fp_functions_0_ai933_a7_combout;
wire fp_functions_0_ai933_a8_combout;
wire fp_functions_0_aMux_44_a1_combout;
wire fp_functions_0_aMux_44_a2_combout;
wire fp_functions_0_aMux_4_a0_combout;
wire fp_functions_0_aMux_44_a3_combout;
wire fp_functions_0_aMux_12_a0_combout;
wire fp_functions_0_aMux_44_a4_combout;
wire fp_functions_0_aMux_44_a5_combout;
wire fp_functions_0_ai933_a9_combout;
wire fp_functions_0_ai933_a10_combout;
wire fp_functions_0_aMux_15_a1_combout;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a4_combout;
wire fp_functions_0_aMux_41_a0_combout;
wire fp_functions_0_aMux_7_a1_combout;
wire fp_functions_0_aMux_3_a0_combout;
wire fp_functions_0_aMux_11_a1_combout;
wire fp_functions_0_aMux_43_a0_combout;
wire fp_functions_0_ai933_a11_combout;
wire fp_functions_0_ai933_a12_combout;
wire fp_functions_0_ai933_a13_combout;
wire fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout;
wire fp_functions_0_aMux_6_a1_combout;
wire fp_functions_0_aMux_2_a2_combout;
wire fp_functions_0_aMux_10_a1_combout;
wire fp_functions_0_aMux_42_a0_combout;
wire fp_functions_0_ai933_a14_combout;
wire fp_functions_0_ai933_a15_combout;
wire fp_functions_0_aMux_14_a1_combout;
wire fp_functions_0_ai933_a16_combout;
wire fp_functions_0_ai933_a17_combout;
wire fp_functions_0_ai933_a18_combout;
wire fp_functions_0_ai933_a19_combout;
wire fp_functions_0_ai933_a20_combout;
wire fp_functions_0_ai933_a21_combout;
wire fp_functions_0_aMux_41_a1_combout;
wire fp_functions_0_ai933_a22_combout;
wire fp_functions_0_aMux_4_a1_combout;
wire fp_functions_0_ai933_a23_combout;
wire fp_functions_0_aMux_12_a1_combout;
wire fp_functions_0_ai933_a24_combout;
wire fp_functions_0_ai933_a25_combout;
wire fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a6_combout;
wire fp_functions_0_aMux_39_a0_combout;
wire fp_functions_0_aMux_39_a1_combout;
wire fp_functions_0_aMux_39_a2_combout;
wire fp_functions_0_ai933_a26_combout;
wire fp_functions_0_ai933_a27_combout;
wire fp_functions_0_ai933_a28_combout;
wire fp_functions_0_ai933_a29_combout;
wire fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a7_combout;
wire fp_functions_0_ai933_a30_combout;
wire fp_functions_0_aMux_38_a0_combout;
wire fp_functions_0_ai933_a31_combout;
wire fp_functions_0_ai933_a32_combout;
wire fp_functions_0_ai933_a33_combout;
wire fp_functions_0_ai933_a34_combout;
wire fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a8_combout;
wire fp_functions_0_aMux_37_a0_combout;
wire fp_functions_0_ai933_a35_combout;
wire fp_functions_0_ai933_a36_combout;
wire fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a9_combout;
wire fp_functions_0_aMux_36_a0_combout;
wire fp_functions_0_ai933_a37_combout;
wire fp_functions_0_ai933_a38_combout;
wire fp_functions_0_aMux_35_a0_combout;
wire fp_functions_0_ai933_a39_combout;
wire fp_functions_0_aMux_34_a0_combout;
wire fp_functions_0_ai933_a40_combout;
wire fp_functions_0_aMux_33_a0_combout;
wire fp_functions_0_ai933_a41_combout;
wire fp_functions_0_aMux_32_a0_combout;
wire fp_functions_0_ai933_a42_combout;
wire fp_functions_0_ai933_a43_combout;
wire fp_functions_0_ai933_a44_combout;
wire fp_functions_0_aMux_45_a0_combout;
wire fp_functions_0_ai933_a45_combout;
wire fp_functions_0_ai933_a46_combout;
wire fp_functions_0_ai933_a47_combout;


fourteennm_ff fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a(
	.clk(clk),
	.d(fp_functions_0_ai1678_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq));
defparam fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_ai1678_a1_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq));
defparam fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a1_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a0_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a1_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a6_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a1_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a1_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a2_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a11_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a2_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a2_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a3_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a16_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a3_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a4_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a21_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a4_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a5_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a26_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a5_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a5_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a6_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a31_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a6_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a6_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a7_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a36_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a7_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a7_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a8_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a41_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a8_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a8_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a8_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a9_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a46_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a9_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a9_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a9_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a51_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a11_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a56_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a11_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a11_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a11_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a12_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a61_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a12_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a12_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a12_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a13_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a66_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a13_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a13_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a13_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a14_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a71_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a14_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a14_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a14_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a15_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a76_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a15_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a15_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a15_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a16_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a81_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a16_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a16_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a16_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a17_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a86_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a17_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a17_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a17_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a18_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a91_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a18_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a18_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a18_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a19_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a96_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a19_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a19_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a19_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a20_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a101_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a20_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a20_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a20_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a21_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a106_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a21_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a21_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a21_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a22_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a111_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a22_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a22_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a22_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a23_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a116_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a23_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a23_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a23_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a24_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a121_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a24_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a24_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a24_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a25_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a126_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a25_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a25_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a25_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a26_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a131_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a26_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a26_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a26_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a27_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a136_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a27_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a27_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a27_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a28_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a141_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a28_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a28_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a28_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a29_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a146_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a29_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a29_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a29_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a30_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a151_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a30_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a30_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a30_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a31_a(
	.clk(clk),
	.d(fp_functions_0_aadd_2_a156_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a31_a_aq));
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a31_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a31_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a(
	.clk(clk),
	.d(fp_functions_0_aadd_3_a1_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq));
defparam fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_aexcI_x_uid15_fpToFxPTest_qi_a0_a_acombout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_excN_x_uid16_fpToFxPTest_q_1_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_aexcN_x_uid16_fpToFxPTest_q_a0_a_acombout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_excN_x_uid16_fpToFxPTest_q_1_q_a0_a_aq));
defparam fp_functions_0_aredist1_excN_x_uid16_fpToFxPTest_q_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_excN_x_uid16_fpToFxPTest_q_1_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a(
	.clk(clk),
	.d(fp_functions_0_aadd_5_a1_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a_aq));
defparam fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_asignX_uid29_fpToFxPTest_qi_a0_a_acombout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq));
defparam fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_4_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a161_sumout),
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
defparam fp_functions_0_aadd_4_a1.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_4_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a1(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_aq),
	.datad(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a0_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a1_sumout),
	.cout(fp_functions_0_aadd_2_a2),
	.shareout());
defparam fp_functions_0_aadd_2_a1.extended_lut = "off";
defparam fp_functions_0_aadd_2_a1.lut_mask = 64'h00000000500A0FF0;
defparam fp_functions_0_aadd_2_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a6(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a2_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a2),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a6_sumout),
	.cout(fp_functions_0_aadd_2_a7),
	.shareout());
defparam fp_functions_0_aadd_2_a6.extended_lut = "off";
defparam fp_functions_0_aadd_2_a6.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a11(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a3_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a7),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a11_sumout),
	.cout(fp_functions_0_aadd_2_a12),
	.shareout());
defparam fp_functions_0_aadd_2_a11.extended_lut = "off";
defparam fp_functions_0_aadd_2_a11.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a16(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a4_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a12),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a16_sumout),
	.cout(fp_functions_0_aadd_2_a17),
	.shareout());
defparam fp_functions_0_aadd_2_a16.extended_lut = "off";
defparam fp_functions_0_aadd_2_a16.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a21(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a5_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a17),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a21_sumout),
	.cout(fp_functions_0_aadd_2_a22),
	.shareout());
defparam fp_functions_0_aadd_2_a21.extended_lut = "off";
defparam fp_functions_0_aadd_2_a21.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a26(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a22),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a26_sumout),
	.cout(fp_functions_0_aadd_2_a27),
	.shareout());
defparam fp_functions_0_aadd_2_a26.extended_lut = "off";
defparam fp_functions_0_aadd_2_a26.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a26.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a31(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a7_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a27),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a31_sumout),
	.cout(fp_functions_0_aadd_2_a32),
	.shareout());
defparam fp_functions_0_aadd_2_a31.extended_lut = "off";
defparam fp_functions_0_aadd_2_a31.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a31.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a36(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a8_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a32),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a36_sumout),
	.cout(fp_functions_0_aadd_2_a37),
	.shareout());
defparam fp_functions_0_aadd_2_a36.extended_lut = "off";
defparam fp_functions_0_aadd_2_a36.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a36.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a41(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a9_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a37),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a41_sumout),
	.cout(fp_functions_0_aadd_2_a42),
	.shareout());
defparam fp_functions_0_aadd_2_a41.extended_lut = "off";
defparam fp_functions_0_aadd_2_a41.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a41.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a46(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a10_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a42),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a46_sumout),
	.cout(fp_functions_0_aadd_2_a47),
	.shareout());
defparam fp_functions_0_aadd_2_a46.extended_lut = "off";
defparam fp_functions_0_aadd_2_a46.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a46.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a51(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a11_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a47),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a51_sumout),
	.cout(fp_functions_0_aadd_2_a52),
	.shareout());
defparam fp_functions_0_aadd_2_a51.extended_lut = "off";
defparam fp_functions_0_aadd_2_a51.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a51.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a56(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a52),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a56_sumout),
	.cout(fp_functions_0_aadd_2_a57),
	.shareout());
defparam fp_functions_0_aadd_2_a56.extended_lut = "off";
defparam fp_functions_0_aadd_2_a56.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a56.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a61(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a13_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a57),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a61_sumout),
	.cout(fp_functions_0_aadd_2_a62),
	.shareout());
defparam fp_functions_0_aadd_2_a61.extended_lut = "off";
defparam fp_functions_0_aadd_2_a61.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a61.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a66(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a14_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a62),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a66_sumout),
	.cout(fp_functions_0_aadd_2_a67),
	.shareout());
defparam fp_functions_0_aadd_2_a66.extended_lut = "off";
defparam fp_functions_0_aadd_2_a66.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a66.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a71(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a15_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a67),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a71_sumout),
	.cout(fp_functions_0_aadd_2_a72),
	.shareout());
defparam fp_functions_0_aadd_2_a71.extended_lut = "off";
defparam fp_functions_0_aadd_2_a71.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a71.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a76(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a16_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a72),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a76_sumout),
	.cout(fp_functions_0_aadd_2_a77),
	.shareout());
defparam fp_functions_0_aadd_2_a76.extended_lut = "off";
defparam fp_functions_0_aadd_2_a76.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a76.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a81(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a17_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a77),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a81_sumout),
	.cout(fp_functions_0_aadd_2_a82),
	.shareout());
defparam fp_functions_0_aadd_2_a81.extended_lut = "off";
defparam fp_functions_0_aadd_2_a81.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a81.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a86(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a82),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a86_sumout),
	.cout(fp_functions_0_aadd_2_a87),
	.shareout());
defparam fp_functions_0_aadd_2_a86.extended_lut = "off";
defparam fp_functions_0_aadd_2_a86.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a86.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a91(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a19_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a87),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a91_sumout),
	.cout(fp_functions_0_aadd_2_a92),
	.shareout());
defparam fp_functions_0_aadd_2_a91.extended_lut = "off";
defparam fp_functions_0_aadd_2_a91.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a91.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a96(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a20_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a92),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a96_sumout),
	.cout(fp_functions_0_aadd_2_a97),
	.shareout());
defparam fp_functions_0_aadd_2_a96.extended_lut = "off";
defparam fp_functions_0_aadd_2_a96.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a96.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a101(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a21_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a97),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a101_sumout),
	.cout(fp_functions_0_aadd_2_a102),
	.shareout());
defparam fp_functions_0_aadd_2_a101.extended_lut = "off";
defparam fp_functions_0_aadd_2_a101.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a101.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a106(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a22_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a102),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a106_sumout),
	.cout(fp_functions_0_aadd_2_a107),
	.shareout());
defparam fp_functions_0_aadd_2_a106.extended_lut = "off";
defparam fp_functions_0_aadd_2_a106.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a106.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a111(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a23_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a107),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a111_sumout),
	.cout(fp_functions_0_aadd_2_a112),
	.shareout());
defparam fp_functions_0_aadd_2_a111.extended_lut = "off";
defparam fp_functions_0_aadd_2_a111.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a111.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a116(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a24_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a112),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a116_sumout),
	.cout(fp_functions_0_aadd_2_a117),
	.shareout());
defparam fp_functions_0_aadd_2_a116.extended_lut = "off";
defparam fp_functions_0_aadd_2_a116.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a116.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a121(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a25_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a117),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a121_sumout),
	.cout(fp_functions_0_aadd_2_a122),
	.shareout());
defparam fp_functions_0_aadd_2_a121.extended_lut = "off";
defparam fp_functions_0_aadd_2_a121.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a121.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a126(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a26_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a122),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a126_sumout),
	.cout(fp_functions_0_aadd_2_a127),
	.shareout());
defparam fp_functions_0_aadd_2_a126.extended_lut = "off";
defparam fp_functions_0_aadd_2_a126.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a126.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a131(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a27_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a127),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a131_sumout),
	.cout(fp_functions_0_aadd_2_a132),
	.shareout());
defparam fp_functions_0_aadd_2_a131.extended_lut = "off";
defparam fp_functions_0_aadd_2_a131.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a131.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a136(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a28_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a132),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a136_sumout),
	.cout(fp_functions_0_aadd_2_a137),
	.shareout());
defparam fp_functions_0_aadd_2_a136.extended_lut = "off";
defparam fp_functions_0_aadd_2_a136.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a136.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a141(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a29_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a137),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a141_sumout),
	.cout(fp_functions_0_aadd_2_a142),
	.shareout());
defparam fp_functions_0_aadd_2_a141.extended_lut = "off";
defparam fp_functions_0_aadd_2_a141.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a141.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a146(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a30_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a142),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a146_sumout),
	.cout(fp_functions_0_aadd_2_a147),
	.shareout());
defparam fp_functions_0_aadd_2_a146.extended_lut = "off";
defparam fp_functions_0_aadd_2_a146.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a146.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a151(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a31_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a147),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a151_sumout),
	.cout(fp_functions_0_aadd_2_a152),
	.shareout());
defparam fp_functions_0_aadd_2_a151.extended_lut = "off";
defparam fp_functions_0_aadd_2_a151.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_2_a151.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a156(
	.dataa(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a152),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a156_sumout),
	.cout(fp_functions_0_aadd_2_a157),
	.shareout());
defparam fp_functions_0_aadd_2_a156.extended_lut = "off";
defparam fp_functions_0_aadd_2_a156.lut_mask = 64'h0000000000005555;
defparam fp_functions_0_aadd_2_a156.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a7_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_3_a1_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_3_a1.extended_lut = "off";
defparam fp_functions_0_aadd_3_a1.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_3_a1.shared_arith = "off";

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

fourteennm_lcell_comb fp_functions_0_aadd_2_a161(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a157),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a161_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_2_a161.extended_lut = "off";
defparam fp_functions_0_aadd_2_a161.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_2_a161.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a7(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a161_sumout),
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
defparam fp_functions_0_aadd_4_a7.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_4_a7.shared_arith = "off";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_ai901_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a0_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a16_a(
	.clk(clk),
	.d(fp_functions_0_aMux_47_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a16_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a16_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a16_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a17_a(
	.clk(clk),
	.d(fp_functions_0_aMux_46_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a17_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a17_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a17_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a(
	.clk(clk),
	.d(fp_functions_0_aMux_45_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a19_a(
	.clk(clk),
	.d(fp_functions_0_aMux_44_a5_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a19_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a19_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a19_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a20_a(
	.clk(clk),
	.d(fp_functions_0_aMux_43_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a20_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a20_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a20_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a21_a(
	.clk(clk),
	.d(fp_functions_0_aMux_42_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a21_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a21_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a21_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a22_a(
	.clk(clk),
	.d(fp_functions_0_aMux_41_a1_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a22_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a22_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a22_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a23_a(
	.clk(clk),
	.d(fp_functions_0_aMux_40_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a23_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a23_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a23_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a24_a(
	.clk(clk),
	.d(fp_functions_0_aMux_39_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a24_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a24_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a24_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a25_a(
	.clk(clk),
	.d(fp_functions_0_aMux_38_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a25_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a25_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a25_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a26_a(
	.clk(clk),
	.d(fp_functions_0_aMux_37_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a26_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a26_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a26_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a27_a(
	.clk(clk),
	.d(fp_functions_0_aMux_36_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a27_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a27_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a27_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a28_a(
	.clk(clk),
	.d(fp_functions_0_aMux_35_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a28_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a28_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a28_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a29_a(
	.clk(clk),
	.d(fp_functions_0_aMux_34_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a29_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a29_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a29_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a30_a(
	.clk(clk),
	.d(fp_functions_0_aMux_33_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a30_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a30_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a30_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a31_a(
	.clk(clk),
	.d(fp_functions_0_aMux_32_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a31_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a31_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a31_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_3_a7(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[30]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a12_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a7_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a7.extended_lut = "off";
defparam fp_functions_0_aadd_3_a7.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_3_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a7(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[30]),
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
defparam fp_functions_0_aadd_5_a7.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_5_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a12(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a156_sumout),
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
defparam fp_functions_0_aadd_4_a12.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_4_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[25]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a22_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a1_sumout),
	.cout(fp_functions_0_aadd_0_a2),
	.shareout());
defparam fp_functions_0_aadd_0_a1.extended_lut = "off";
defparam fp_functions_0_aadd_0_a1.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_0_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a6(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[26]),
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
defparam fp_functions_0_aadd_0_a6.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_0_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a11(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[27]),
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
defparam fp_functions_0_aadd_0_a11.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_0_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a16(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[28]),
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
defparam fp_functions_0_aadd_0_a16.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_0_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a1(
	.dataa(!fp_functions_0_aadd_0_a26_sumout),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a7_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_1_a1_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_1_a1.extended_lut = "off";
defparam fp_functions_0_aadd_1_a1.lut_mask = 64'h000000000000AAAA;
defparam fp_functions_0_aadd_1_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a12(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[29]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a17_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a12_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a12.extended_lut = "off";
defparam fp_functions_0_aadd_3_a12.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_3_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a12(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[29]),
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
defparam fp_functions_0_aadd_5_a12.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_5_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a17(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a151_sumout),
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
defparam fp_functions_0_aadd_4_a17.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a22(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[24]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a32_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a22_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a22.extended_lut = "off";
defparam fp_functions_0_aadd_0_a22.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_0_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a26(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a37),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a26_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_0_a26.extended_lut = "off";
defparam fp_functions_0_aadd_0_a26.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_0_a26.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a7(
	.dataa(!fp_functions_0_aadd_0_a26_sumout),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a12_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a7_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a7.extended_lut = "off";
defparam fp_functions_0_aadd_1_a7.lut_mask = 64'h000000005555AAAA;
defparam fp_functions_0_aadd_1_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a17(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[28]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a22_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a17_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a17.extended_lut = "off";
defparam fp_functions_0_aadd_3_a17.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_3_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a17(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[28]),
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
defparam fp_functions_0_aadd_5_a17.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_5_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a22(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a146_sumout),
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
defparam fp_functions_0_aadd_4_a22.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a32(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a42_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a32_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a32.extended_lut = "off";
defparam fp_functions_0_aadd_0_a32.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_0_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a36(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a47),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a36_sumout),
	.cout(fp_functions_0_aadd_0_a37),
	.shareout());
defparam fp_functions_0_aadd_0_a36.extended_lut = "off";
defparam fp_functions_0_aadd_0_a36.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_0_a36.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a12(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a36_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a17_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a12_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a12.extended_lut = "off";
defparam fp_functions_0_aadd_1_a12.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a22(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[27]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a27_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a22_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a22.extended_lut = "off";
defparam fp_functions_0_aadd_3_a22.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_3_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a22(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[27]),
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
defparam fp_functions_0_aadd_5_a22.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_5_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a27(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a141_sumout),
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
defparam fp_functions_0_aadd_4_a27.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a42(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a42_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a42.extended_lut = "off";
defparam fp_functions_0_aadd_0_a42.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_0_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a46(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[30]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a52),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a46_sumout),
	.cout(fp_functions_0_aadd_0_a47),
	.shareout());
defparam fp_functions_0_aadd_0_a46.extended_lut = "off";
defparam fp_functions_0_aadd_0_a46.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_0_a46.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a17(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a46_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a22_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a17_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a17.extended_lut = "off";
defparam fp_functions_0_aadd_1_a17.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a27(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[26]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a32_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a27_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a27.extended_lut = "off";
defparam fp_functions_0_aadd_3_a27.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_3_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a27(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[26]),
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
defparam fp_functions_0_aadd_5_a27.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_5_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a32(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a136_sumout),
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
defparam fp_functions_0_aadd_4_a32.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a51(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[29]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a17),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a51_sumout),
	.cout(fp_functions_0_aadd_0_a52),
	.shareout());
defparam fp_functions_0_aadd_0_a51.extended_lut = "off";
defparam fp_functions_0_aadd_0_a51.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_0_a51.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a22(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a51_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a27_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a22_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a22.extended_lut = "off";
defparam fp_functions_0_aadd_1_a22.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a32(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[25]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a37_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a32_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a32.extended_lut = "off";
defparam fp_functions_0_aadd_3_a32.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_3_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a32(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[25]),
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
defparam fp_functions_0_aadd_5_a32.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_5_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a37(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a131_sumout),
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
defparam fp_functions_0_aadd_4_a37.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a27(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a16_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a32_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a27_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a27.extended_lut = "off";
defparam fp_functions_0_aadd_1_a27.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_1_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a37(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[24]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a42_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a37_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a37.extended_lut = "off";
defparam fp_functions_0_aadd_3_a37.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_3_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a37(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[24]),
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
defparam fp_functions_0_aadd_5_a37.lut_mask = 64'h0000000000000F0F;
defparam fp_functions_0_aadd_5_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a42(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a126_sumout),
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
defparam fp_functions_0_aadd_4_a42.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a32(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a37_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a32_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a32.extended_lut = "off";
defparam fp_functions_0_aadd_1_a32.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a42(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[23]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_3_a47_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a42_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a42.extended_lut = "off";
defparam fp_functions_0_aadd_3_a42.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_3_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a42(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[23]),
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
defparam fp_functions_0_aadd_5_a42.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_5_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a47(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a121_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a52_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a47_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a47.extended_lut = "off";
defparam fp_functions_0_aadd_4_a47.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a37(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a6_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a42_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a37_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a37.extended_lut = "off";
defparam fp_functions_0_aadd_1_a37.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_3_a47(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_3_a47_cout),
	.shareout());
defparam fp_functions_0_aadd_3_a47.extended_lut = "off";
defparam fp_functions_0_aadd_3_a47.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_3_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_5_a47(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
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
defparam fp_functions_0_aadd_5_a47.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_5_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a52(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a116_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a57_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a52_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a52.extended_lut = "off";
defparam fp_functions_0_aadd_4_a52.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a52.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a42(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a47_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a42_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a42.extended_lut = "off";
defparam fp_functions_0_aadd_1_a42.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a57(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a111_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a62_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a57_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a57.extended_lut = "off";
defparam fp_functions_0_aadd_4_a57.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a57.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a47(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[24]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a52_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a47_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a47.extended_lut = "off";
defparam fp_functions_0_aadd_1_a47.lut_mask = 64'h000000000F0FF0F0;
defparam fp_functions_0_aadd_1_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a62(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a106_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a67_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a62_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a62.extended_lut = "off";
defparam fp_functions_0_aadd_4_a62.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a62.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a52(
	.dataa(gnd),
	.datab(gnd),
	.datac(!a[23]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_1_a57_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a52_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a52.extended_lut = "off";
defparam fp_functions_0_aadd_1_a52.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_1_a52.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a67(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a101_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a72_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a67_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a67.extended_lut = "off";
defparam fp_functions_0_aadd_4_a67.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a67.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_1_a57(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_1_a57_cout),
	.shareout());
defparam fp_functions_0_aadd_1_a57.extended_lut = "off";
defparam fp_functions_0_aadd_1_a57.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_1_a57.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a72(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a96_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a77_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a72_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a72.extended_lut = "off";
defparam fp_functions_0_aadd_4_a72.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a72.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a77(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a91_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a82_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a77_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a77.extended_lut = "off";
defparam fp_functions_0_aadd_4_a77.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a77.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a82(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a86_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a87_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a82_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a82.extended_lut = "off";
defparam fp_functions_0_aadd_4_a82.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a82.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a87(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a81_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a92_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a87_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a87.extended_lut = "off";
defparam fp_functions_0_aadd_4_a87.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a87.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a92(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a76_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a97_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a92_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a92.extended_lut = "off";
defparam fp_functions_0_aadd_4_a92.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a92.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a97(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a71_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a102_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a97_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a97.extended_lut = "off";
defparam fp_functions_0_aadd_4_a97.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a97.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a102(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a66_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a107_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a102_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a102.extended_lut = "off";
defparam fp_functions_0_aadd_4_a102.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a102.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a107(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a61_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a112_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a107_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a107.extended_lut = "off";
defparam fp_functions_0_aadd_4_a107.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a107.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a112(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a56_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a117_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a112_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a112.extended_lut = "off";
defparam fp_functions_0_aadd_4_a112.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a112.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a117(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a51_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a122_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a117_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a117.extended_lut = "off";
defparam fp_functions_0_aadd_4_a117.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a117.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a122(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a46_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a127_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a122_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a122.extended_lut = "off";
defparam fp_functions_0_aadd_4_a122.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a122.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a127(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a41_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a132_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a127_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a127.extended_lut = "off";
defparam fp_functions_0_aadd_4_a127.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a127.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a132(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a36_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a137_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a132_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a132.extended_lut = "off";
defparam fp_functions_0_aadd_4_a132.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a132.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a137(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a31_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a142_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a137_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a137.extended_lut = "off";
defparam fp_functions_0_aadd_4_a137.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a137.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a142(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a26_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a147_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a142_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a142.extended_lut = "off";
defparam fp_functions_0_aadd_4_a142.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a142.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a147(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a21_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a152_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a147_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a147.extended_lut = "off";
defparam fp_functions_0_aadd_4_a147.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a147.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a152(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a16_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a157_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a152_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a152.extended_lut = "off";
defparam fp_functions_0_aadd_4_a152.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a152.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a157(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a11_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a162_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a157_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a157.extended_lut = "off";
defparam fp_functions_0_aadd_4_a157.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a157.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a162(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a6_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a167_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a162_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a162.extended_lut = "off";
defparam fp_functions_0_aadd_4_a162.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a162.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a167(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_2_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_4_a172_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a167_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a167.extended_lut = "off";
defparam fp_functions_0_aadd_4_a167.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_4_a167.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_4_a172(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_4_a172_cout),
	.shareout());
defparam fp_functions_0_aadd_4_a172.extended_lut = "off";
defparam fp_functions_0_aadd_4_a172.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_4_a172.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_40_a0(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_1_a1_sumout),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_aMux_1_a0_combout),
	.datae(!fp_functions_0_aMux_8_a0_combout),
	.dataf(!fp_functions_0_areduce_nor_2_acombout),
	.datag(!fp_functions_0_aMux_4_a1_combout),
	.datah(!fp_functions_0_aadd_0_a6_sumout),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_40_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_40_a0.extended_lut = "on";
defparam fp_functions_0_aMux_40_a0.lut_mask = 64'h00010E0F00220C2E;
defparam fp_functions_0_aMux_40_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_20_a0(
	.dataa(!a[4]),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!a[5]),
	.datae(!a[3]),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!a[6]),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_20_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_20_a0.extended_lut = "on";
defparam fp_functions_0_aMux_20_a0.lut_mask = 64'h0407F4F70003FCFF;
defparam fp_functions_0_aMux_20_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_24_a1(
	.dataa(!fp_functions_0_aadd_1_a1_sumout),
	.datab(!a[0]),
	.datac(!a[2]),
	.datad(!a[1]),
	.datae(!a[23]),
	.dataf(!fp_functions_0_areduce_nor_2_a0_combout),
	.datag(!a[30]),
	.datah(!a[24]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_24_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_24_a1.extended_lut = "on";
defparam fp_functions_0_aMux_24_a1.lut_mask = 64'h0111000005050055;
defparam fp_functions_0_aMux_24_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_8_a0(
	.dataa(!a[16]),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!a[17]),
	.datae(!a[15]),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!a[18]),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_8_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_8_a0.extended_lut = "on";
defparam fp_functions_0_aMux_8_a0.lut_mask = 64'h0407F4F70003FCFF;
defparam fp_functions_0_aMux_8_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_16_a0(
	.dataa(!a[8]),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!a[9]),
	.datae(!a[7]),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!a[10]),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_16_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_16_a0.extended_lut = "on";
defparam fp_functions_0_aMux_16_a0.lut_mask = 64'h0407F4F70003FCFF;
defparam fp_functions_0_aMux_16_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_21_a0(
	.dataa(!a[3]),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!a[4]),
	.datae(!a[2]),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!a[5]),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_21_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_21_a0.extended_lut = "on";
defparam fp_functions_0_aMux_21_a0.lut_mask = 64'h0407F4F70003FCFF;
defparam fp_functions_0_aMux_21_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_17_a0(
	.dataa(!a[7]),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!a[8]),
	.datae(!a[6]),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!a[9]),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_17_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_17_a0.extended_lut = "on";
defparam fp_functions_0_aMux_17_a0.lut_mask = 64'h0407F4F70003FCFF;
defparam fp_functions_0_aMux_17_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_45_a1(
	.dataa(!a[10]),
	.datab(!fp_functions_0_aadd_0_a1_sumout),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!fp_functions_0_aMux_1_a1_combout),
	.datae(!fp_functions_0_areduce_nor_2_acombout),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!fp_functions_0_aMux_9_a0_combout),
	.datah(!fp_functions_0_aadd_0_a6_sumout),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_45_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_45_a1.extended_lut = "on";
defparam fp_functions_0_aMux_45_a1.lut_mask = 64'h0000505300035053;
defparam fp_functions_0_aMux_45_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_9_a0(
	.dataa(!a[15]),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!a[16]),
	.datae(!a[14]),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!a[17]),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_9_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_9_a0.extended_lut = "on";
defparam fp_functions_0_aMux_9_a0.lut_mask = 64'h0407F4F70003FCFF;
defparam fp_functions_0_aMux_9_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_5_a0(
	.dataa(!a[19]),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!a[20]),
	.datae(!a[18]),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!a[21]),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_5_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_5_a0.extended_lut = "on";
defparam fp_functions_0_aMux_5_a0.lut_mask = 64'h0407F4F70003FCFF;
defparam fp_functions_0_aMux_5_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_13_a0(
	.dataa(!a[11]),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!a[12]),
	.datae(!a[10]),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!a[13]),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_13_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_13_a0.extended_lut = "on";
defparam fp_functions_0_aMux_13_a0.lut_mask = 64'h0407F4F70003FCFF;
defparam fp_functions_0_aMux_13_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai901_a2(
	.dataa(!fp_functions_0_aadd_0_a16_sumout),
	.datab(!fp_functions_0_aadd_0_a11_sumout),
	.datac(!fp_functions_0_aMux_47_a2_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(!fp_functions_0_ai901_a1_combout),
	.dataf(gnd),
	.datag(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a0_a_aq),
	.datah(!en[0]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai901_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai901_a2.extended_lut = "on";
defparam fp_functions_0_ai901_a2.lut_mask = 64'h00FFFFFF0002FFFF;
defparam fp_functions_0_ai901_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_47_a2(
	.dataa(!fp_functions_0_aadd_1_a1_sumout),
	.datab(!fp_functions_0_aMux_47_a1_combout),
	.datac(!fp_functions_0_aMux_3_a1_combout),
	.datad(!fp_functions_0_aadd_0_a6_sumout),
	.datae(!fp_functions_0_aMux_47_a0_combout),
	.dataf(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a4_combout),
	.datag(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a3_combout),
	.datah(!fp_functions_0_aadd_0_a1_sumout),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_47_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_47_a2.extended_lut = "on";
defparam fp_functions_0_aMux_47_a2.lut_mask = 64'h3777FFFF3337FFFF;
defparam fp_functions_0_aMux_47_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_3_a1(
	.dataa(!a[20]),
	.datab(!a[21]),
	.datac(!a[24]),
	.datad(!a[22]),
	.datae(!a[30]),
	.dataf(!a[24]),
	.datag(!fp_functions_0_areduce_nor_2_a0_combout),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_3_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_3_a1.extended_lut = "on";
defparam fp_functions_0_aMux_3_a1.lut_mask = 64'h0F3F3F3F505F505F;
defparam fp_functions_0_aMux_3_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_23_a0(
	.dataa(!a[1]),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!a[2]),
	.datae(!a[0]),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!a[3]),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_23_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_23_a0.extended_lut = "on";
defparam fp_functions_0_aMux_23_a0.lut_mask = 64'h0407F4F70003FCFF;
defparam fp_functions_0_aMux_23_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_19_a0(
	.dataa(!a[5]),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!a[6]),
	.datae(!a[4]),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!a[7]),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_19_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_19_a0.extended_lut = "on";
defparam fp_functions_0_aMux_19_a0.lut_mask = 64'h0407F4F70003FCFF;
defparam fp_functions_0_aMux_19_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_18_a0(
	.dataa(!a[6]),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!a[7]),
	.datae(!a[5]),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!a[8]),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_18_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_18_a0.extended_lut = "on";
defparam fp_functions_0_aMux_18_a0.lut_mask = 64'h0407F4F70003FCFF;
defparam fp_functions_0_aMux_18_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_46_a2(
	.dataa(!fp_functions_0_aMux_46_a1_combout),
	.datab(!fp_functions_0_aMux_46_a0_combout),
	.datac(!fp_functions_0_aadd_0_a1_sumout),
	.datad(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a2_combout),
	.datae(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a0_combout),
	.dataf(!fp_functions_0_areduce_nor_2_acombout),
	.datag(!a[9]),
	.datah(!fp_functions_0_aadd_1_a1_sumout),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_46_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_46_a2.extended_lut = "on";
defparam fp_functions_0_aMux_46_a2.lut_mask = 64'h777F777F77F7F7F7;
defparam fp_functions_0_aMux_46_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_22_a0(
	.dataa(!a[2]),
	.datab(!a[24]),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!a[3]),
	.datae(!a[1]),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(!a[4]),
	.datah(!a[23]),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_22_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_22_a0.extended_lut = "on";
defparam fp_functions_0_aMux_22_a0.lut_mask = 64'h0407F4F70003FCFF;
defparam fp_functions_0_aMux_22_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a0(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a0_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a0.extended_lut = "off";
defparam fp_functions_0_aMux_129_a0.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a1(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a1_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a1.extended_lut = "off";
defparam fp_functions_0_aMux_129_a1.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a2(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a2_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a2.extended_lut = "off";
defparam fp_functions_0_aMux_129_a2.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a3(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a3_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a3.extended_lut = "off";
defparam fp_functions_0_aMux_129_a3.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a4(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a4_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a4.extended_lut = "off";
defparam fp_functions_0_aMux_129_a4.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a5(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a5_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a5.extended_lut = "off";
defparam fp_functions_0_aMux_129_a5.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a6(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a6_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a6.extended_lut = "off";
defparam fp_functions_0_aMux_129_a6.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a7(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a7_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a7.extended_lut = "off";
defparam fp_functions_0_aMux_129_a7.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a8(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a8_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a8.extended_lut = "off";
defparam fp_functions_0_aMux_129_a8.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a9(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a9_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a9.extended_lut = "off";
defparam fp_functions_0_aMux_129_a9.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a10(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a10.extended_lut = "off";
defparam fp_functions_0_aMux_129_a10.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a11(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a11_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a11.extended_lut = "off";
defparam fp_functions_0_aMux_129_a11.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a12(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a12_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a12_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a12.extended_lut = "off";
defparam fp_functions_0_aMux_129_a12.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a13(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a13_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a13_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a13.extended_lut = "off";
defparam fp_functions_0_aMux_129_a13.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a14(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a14_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a14_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a14.extended_lut = "off";
defparam fp_functions_0_aMux_129_a14.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a15(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a15_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a15_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a15.extended_lut = "off";
defparam fp_functions_0_aMux_129_a15.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a16(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a16_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a16_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a16.extended_lut = "off";
defparam fp_functions_0_aMux_129_a16.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a17(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a17_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a17_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a17.extended_lut = "off";
defparam fp_functions_0_aMux_129_a17.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a18(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a18_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a18_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a18.extended_lut = "off";
defparam fp_functions_0_aMux_129_a18.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a19(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a19_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a19_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a19.extended_lut = "off";
defparam fp_functions_0_aMux_129_a19.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a19.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a20(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a20_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a20_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a20.extended_lut = "off";
defparam fp_functions_0_aMux_129_a20.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a20.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a21(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a21_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a21_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a21.extended_lut = "off";
defparam fp_functions_0_aMux_129_a21.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a22(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a22_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a22_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a22.extended_lut = "off";
defparam fp_functions_0_aMux_129_a22.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a23(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a23_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a23_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a23.extended_lut = "off";
defparam fp_functions_0_aMux_129_a23.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a23.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a24(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a24_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a24_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a24.extended_lut = "off";
defparam fp_functions_0_aMux_129_a24.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a24.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a25(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a25_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a25_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a25.extended_lut = "off";
defparam fp_functions_0_aMux_129_a25.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a25.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a26(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a26_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a26_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a26.extended_lut = "off";
defparam fp_functions_0_aMux_129_a26.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a26.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a27(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a27_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a27_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a27.extended_lut = "off";
defparam fp_functions_0_aMux_129_a27.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a28(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a28_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a28_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a28.extended_lut = "off";
defparam fp_functions_0_aMux_129_a28.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a28.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a29(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a29_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a29_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a29.extended_lut = "off";
defparam fp_functions_0_aMux_129_a29.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a29.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a30(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a30_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a30_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a30.extended_lut = "off";
defparam fp_functions_0_aMux_129_a30.lut_mask = 64'h2A2A2A2A2A2A2A2A;
defparam fp_functions_0_aMux_129_a30.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_129_a31(
	.dataa(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a1_a_aq),
	.datab(!fp_functions_0_amuxSel_uid54_fpToFxPTest_q_a0_a_aq),
	.datac(!fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a31_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_129_a31_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_129_a31.extended_lut = "off";
defparam fp_functions_0_aMux_129_a31.lut_mask = 64'h4C4C4C4C4C4C4C4C;
defparam fp_functions_0_aMux_129_a31.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1678_a0(
	.dataa(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datab(!fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aredist1_excN_x_uid16_fpToFxPTest_q_1_q_a0_a_aq),
	.datad(!fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a_aq),
	.datae(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1678_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1678_a0.extended_lut = "off";
defparam fp_functions_0_ai1678_a0.lut_mask = 64'hAAAAFFBFAAAAFFFF;
defparam fp_functions_0_ai1678_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0(
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
	.combout(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0.extended_lut = "off";
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0.lut_mask = 64'h7777777777777777;
defparam fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1678_a1(
	.dataa(!fp_functions_0_audf_uid33_fpToFxPTest_o_a10_a_aq),
	.datab(!fp_functions_0_aexcI_x_uid15_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.datac(!fp_functions_0_aredist1_excN_x_uid16_fpToFxPTest_q_1_q_a0_a_aq),
	.datad(!fp_functions_0_aovfExpRange_uid31_fpToFxPTest_o_a10_a_aq),
	.datae(!fp_functions_0_asignX_uid29_fpToFxPTest_delay_adelay_signals_a0_a_a0_a_aq),
	.dataf(!fp_functions_0_aadd_4_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1678_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1678_a1.extended_lut = "off";
defparam fp_functions_0_ai1678_a1.lut_mask = 64'hFFBFAAAAFFFFAAAA;
defparam fp_functions_0_ai1678_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_1_a0(
	.dataa(!a[28]),
	.datab(!a[27]),
	.datac(!a[26]),
	.datad(!a[25]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_1_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_1_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_1_a0.lut_mask = 64'h0001000100010001;
defparam fp_functions_0_areduce_nor_1_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_1(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[24]),
	.datad(!a[23]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
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
defparam fp_functions_0_areduce_nor_1.lut_mask = 64'h0000000100000001;
defparam fp_functions_0_areduce_nor_1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a0(
	.dataa(!a[18]),
	.datab(!a[19]),
	.datac(!a[20]),
	.datad(!a[21]),
	.datae(!a[22]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a0.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_0_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a1(
	.dataa(!a[0]),
	.datab(!a[1]),
	.datac(!a[2]),
	.datad(!a[3]),
	.datae(!a[4]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a1.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a1.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_0_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a2(
	.dataa(!a[6]),
	.datab(!a[7]),
	.datac(!a[8]),
	.datad(!a[9]),
	.datae(!a[10]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a2.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a2.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_0_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a3(
	.dataa(!a[12]),
	.datab(!a[13]),
	.datac(!a[14]),
	.datad(!a[15]),
	.datae(!a[16]),
	.dataf(!a[17]),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a3.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a3.lut_mask = 64'h8000000000000000;
defparam fp_functions_0_areduce_nor_0_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0(
	.dataa(!a[5]),
	.datab(!a[11]),
	.datac(!fp_functions_0_areduce_nor_0_a0_combout),
	.datad(!fp_functions_0_areduce_nor_0_a1_combout),
	.datae(!fp_functions_0_areduce_nor_0_a2_combout),
	.dataf(!fp_functions_0_areduce_nor_0_a3_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0.lut_mask = 64'h0000000000000008;
defparam fp_functions_0_areduce_nor_0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcI_x_uid15_fpToFxPTest_qi_a0_a(
	.dataa(!fp_functions_0_areduce_nor_1_acombout),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcI_x_uid15_fpToFxPTest_qi_a0_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_qi_a0_a.extended_lut = "off";
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_qi_a0_a.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_aexcI_x_uid15_fpToFxPTest_qi_a0_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcN_x_uid16_fpToFxPTest_q_a0_a(
	.dataa(!fp_functions_0_areduce_nor_1_acombout),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcN_x_uid16_fpToFxPTest_q_a0_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcN_x_uid16_fpToFxPTest_q_a0_a.extended_lut = "off";
defparam fp_functions_0_aexcN_x_uid16_fpToFxPTest_q_a0_a.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_aexcN_x_uid16_fpToFxPTest_q_a0_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_asignX_uid29_fpToFxPTest_qi_a0_a(
	.dataa(!a[31]),
	.datab(!fp_functions_0_aexcN_x_uid16_fpToFxPTest_q_a0_a_acombout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_asignX_uid29_fpToFxPTest_qi_a0_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_asignX_uid29_fpToFxPTest_qi_a0_a.extended_lut = "off";
defparam fp_functions_0_asignX_uid29_fpToFxPTest_qi_a0_a.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_asignX_uid29_fpToFxPTest_qi_a0_a.shared_arith = "off";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a5_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a2_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a8_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a2_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a2_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a3_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a10_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a3_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a4_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a12_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a4_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a5_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a18_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a5_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a5_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a22_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a7_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a25_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a7_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a7_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a8_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a29_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a8_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a8_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a8_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a9_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a34_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a9_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a9_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a9_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a10_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a36_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a10_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a11_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a38_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a11_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a11_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a11_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a39_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a13_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a40_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a13_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a13_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a13_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a14_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a41_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a14_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a14_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a14_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a15_a(
	.clk(clk),
	.d(fp_functions_0_ai933_a44_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_sPostRnd_uid49_fpToFxPTest_b_1_q_a10_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a15_a_aq));
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a15_a.is_wysiwyg = "true";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a15_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_areduce_nor_2_a0(
	.dataa(!a[29]),
	.datab(!a[28]),
	.datac(!a[27]),
	.datad(!a[26]),
	.datae(!a[25]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_2_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_2_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_2_a0.lut_mask = 64'h7FFFFFFF7FFFFFFF;
defparam fp_functions_0_areduce_nor_2_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_2(
	.dataa(!a[30]),
	.datab(!a[24]),
	.datac(!a[23]),
	.datad(!fp_functions_0_areduce_nor_2_a0_combout),
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
defparam fp_functions_0_areduce_nor_2.lut_mask = 64'h7FFF7FFF7FFF7FFF;
defparam fp_functions_0_areduce_nor_2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0(
	.dataa(!areset),
	.datab(!fp_functions_0_aadd_0_a16_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0.extended_lut = "off";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a0(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a0.extended_lut = "off";
defparam fp_functions_0_ai933_a0.lut_mask = 64'h0000000F0000000F;
defparam fp_functions_0_ai933_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a1(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a1.extended_lut = "off";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a1.lut_mask = 64'hF4C4F4C4F4C4F4C4;
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_1_a0(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_1_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_1_a0.extended_lut = "off";
defparam fp_functions_0_aMux_1_a0.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_aMux_1_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a1(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[0]),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a1_combout),
	.dataf(!fp_functions_0_aMux_22_a0_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a1.extended_lut = "off";
defparam fp_functions_0_ai933_a1.lut_mask = 64'h00000004FFFF0004;
defparam fp_functions_0_ai933_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a_a2(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_1_a1_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a_a2.extended_lut = "off";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a_a2.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_14_a0(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[10]),
	.datad(!a[11]),
	.datae(!a[12]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_14_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_14_a0.extended_lut = "off";
defparam fp_functions_0_aMux_14_a0.lut_mask = 64'h08194C5D08194C5D;
defparam fp_functions_0_aMux_14_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_6_a0(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[18]),
	.datad(!a[19]),
	.datae(!a[20]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_6_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_6_a0.extended_lut = "off";
defparam fp_functions_0_aMux_6_a0.lut_mask = 64'h08194C5D08194C5D;
defparam fp_functions_0_aMux_6_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a0(
	.dataa(!a[17]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aadd_0_a6_sumout),
	.datad(!fp_functions_0_aMux_6_a0_combout),
	.datae(!fp_functions_0_areduce_nor_2_acombout),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a0.extended_lut = "off";
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a0.lut_mask = 64'h000005050000010F;
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a1(
	.dataa(!a[30]),
	.datab(!a[24]),
	.datac(!a[23]),
	.datad(!fp_functions_0_aadd_0_a6_sumout),
	.datae(!fp_functions_0_areduce_nor_2_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a1.extended_lut = "off";
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a1.lut_mask = 64'h7F00FF007F00FF00;
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a2(
	.dataa(!a[9]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_14_a0_combout),
	.datad(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a1_combout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a2.extended_lut = "off";
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a2.lut_mask = 64'h0055001F0055001F;
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_2_a0(
	.dataa(!a[30]),
	.datab(!a[24]),
	.datac(!a[23]),
	.datad(!a[21]),
	.datae(!fp_functions_0_areduce_nor_2_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_2_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_2_a0.extended_lut = "off";
defparam fp_functions_0_aMux_2_a0.lut_mask = 64'h007F00FF007F00FF;
defparam fp_functions_0_aMux_2_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_2_a1(
	.dataa(!a[30]),
	.datab(!a[24]),
	.datac(!a[23]),
	.datad(!a[22]),
	.datae(!fp_functions_0_areduce_nor_2_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_2_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_2_a1.extended_lut = "off";
defparam fp_functions_0_aMux_2_a1.lut_mask = 64'h034303C3034303C3;
defparam fp_functions_0_aMux_2_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_46_a0(
	.dataa(!a[23]),
	.datab(!fp_functions_0_aadd_0_a1_sumout),
	.datac(!fp_functions_0_aadd_0_a6_sumout),
	.datad(!fp_functions_0_aMux_2_a0_combout),
	.datae(!fp_functions_0_aMux_2_a1_combout),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_46_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_46_a0.extended_lut = "off";
defparam fp_functions_0_aMux_46_a0.lut_mask = 64'h0000000000010303;
defparam fp_functions_0_aMux_46_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_10_a0(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[14]),
	.datad(!a[15]),
	.datae(!a[16]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_10_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_10_a0.extended_lut = "off";
defparam fp_functions_0_aMux_10_a0.lut_mask = 64'h08194C5D08194C5D;
defparam fp_functions_0_aMux_10_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a3(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a3.extended_lut = "off";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a3.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_46_a1(
	.dataa(!a[13]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_10_a0_combout),
	.datad(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a3_combout),
	.datae(!fp_functions_0_areduce_nor_2_acombout),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_46_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_46_a1.extended_lut = "off";
defparam fp_functions_0_aMux_46_a1.lut_mask = 64'h000000000000001F;
defparam fp_functions_0_aMux_46_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a2(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_areduce_nor_2_acombout),
	.datae(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a2.extended_lut = "off";
defparam fp_functions_0_ai933_a2.lut_mask = 64'h0000000000000010;
defparam fp_functions_0_ai933_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a3(
	.dataa(!fp_functions_0_aMux_18_a0_combout),
	.datab(!fp_functions_0_ai933_a2_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a3.extended_lut = "off";
defparam fp_functions_0_ai933_a3.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_ai933_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a4(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a4.extended_lut = "off";
defparam fp_functions_0_ai933_a4.lut_mask = 64'h0000006000000060;
defparam fp_functions_0_ai933_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a5(
	.dataa(!fp_functions_0_areduce_nor_2_acombout),
	.datab(!fp_functions_0_ai933_a0_combout),
	.datac(!fp_functions_0_ai933_a1_combout),
	.datad(!fp_functions_0_aMux_46_a2_combout),
	.datae(!fp_functions_0_ai933_a3_combout),
	.dataf(!fp_functions_0_ai933_a4_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a5.extended_lut = "off";
defparam fp_functions_0_ai933_a5.lut_mask = 64'h0033FFFF0537FFFF;
defparam fp_functions_0_ai933_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai901_a0(
	.dataa(!en[0]),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_aadd_0_a16_sumout),
	.datae(!fp_functions_0_areduce_nor_2_acombout),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai901_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai901_a0.extended_lut = "off";
defparam fp_functions_0_ai901_a0.lut_mask = 64'h0000000000001000;
defparam fp_functions_0_ai901_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai901_a1(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_ai901_a0_combout),
	.datac(!fp_functions_0_aMux_19_a0_combout),
	.datad(!fp_functions_0_aMux_23_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai901_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai901_a1.extended_lut = "off";
defparam fp_functions_0_ai901_a1.lut_mask = 64'h0123012301230123;
defparam fp_functions_0_ai901_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_7_a0(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[17]),
	.datad(!a[18]),
	.datae(!a[19]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_7_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_7_a0.extended_lut = "off";
defparam fp_functions_0_aMux_7_a0.lut_mask = 64'h08194C5D08194C5D;
defparam fp_functions_0_aMux_7_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a3(
	.dataa(!a[16]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aadd_0_a6_sumout),
	.datad(!fp_functions_0_aMux_7_a0_combout),
	.datae(!fp_functions_0_areduce_nor_2_acombout),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a3.extended_lut = "off";
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a3.lut_mask = 64'h000005050000010F;
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_15_a0(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[9]),
	.datad(!a[10]),
	.datae(!a[11]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_15_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_15_a0.extended_lut = "off";
defparam fp_functions_0_aMux_15_a0.lut_mask = 64'h08194C5D08194C5D;
defparam fp_functions_0_aMux_15_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a4(
	.dataa(!a[8]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_15_a0_combout),
	.datad(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a1_combout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a4.extended_lut = "off";
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a4.lut_mask = 64'h0055001F0055001F;
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_47_a0(
	.dataa(!a[8]),
	.datab(gnd),
	.datac(gnd),
	.datad(!fp_functions_0_areduce_nor_2_acombout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_47_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_47_a0.extended_lut = "off";
defparam fp_functions_0_aMux_47_a0.lut_mask = 64'h0055000000550000;
defparam fp_functions_0_aMux_47_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_11_a0(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[13]),
	.datad(!a[14]),
	.datae(!a[15]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_11_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_11_a0.extended_lut = "off";
defparam fp_functions_0_aMux_11_a0.lut_mask = 64'h08194C5D08194C5D;
defparam fp_functions_0_aMux_11_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_47_a1(
	.dataa(!a[12]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_11_a0_combout),
	.datad(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a3_combout),
	.datae(!fp_functions_0_areduce_nor_2_acombout),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_47_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_47_a1.extended_lut = "off";
defparam fp_functions_0_aMux_47_a1.lut_mask = 64'h000000000000001F;
defparam fp_functions_0_aMux_47_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a5(
	.dataa(!fp_functions_0_aadd_0_a6_sumout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aMux_13_a0_combout),
	.datad(!fp_functions_0_aMux_5_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a5.extended_lut = "off";
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a5.lut_mask = 64'h0213021302130213;
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_44_a0(
	.dataa(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a3_combout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_44_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_44_a0.extended_lut = "off";
defparam fp_functions_0_aMux_44_a0.lut_mask = 64'h0101010101010101;
defparam fp_functions_0_aMux_44_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_1_a1(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[22]),
	.datad(!fp_functions_0_areduce_nor_2_acombout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_1_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_1_a1.extended_lut = "off";
defparam fp_functions_0_aMux_1_a1.lut_mask = 64'h000F448A000F448A;
defparam fp_functions_0_aMux_1_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a6(
	.dataa(!fp_functions_0_aMux_17_a0_combout),
	.datab(!fp_functions_0_ai933_a2_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a6.extended_lut = "off";
defparam fp_functions_0_ai933_a6.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_ai933_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_25_a2(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[0]),
	.datad(!a[1]),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_25_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_25_a2.extended_lut = "off";
defparam fp_functions_0_aMux_25_a2.lut_mask = 64'h0000014500000145;
defparam fp_functions_0_aMux_25_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a7(
	.dataa(!fp_functions_0_areduce_nor_2_acombout),
	.datab(!fp_functions_0_aMux_25_a2_combout),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a1_combout),
	.datad(!fp_functions_0_aMux_21_a0_combout),
	.datae(!fp_functions_0_ai933_a4_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a7.extended_lut = "off";
defparam fp_functions_0_ai933_a7.lut_mask = 64'h0000035300000353;
defparam fp_functions_0_ai933_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a8(
	.dataa(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a_a2_combout),
	.datab(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a5_combout),
	.datac(!fp_functions_0_ai933_a0_combout),
	.datad(!fp_functions_0_aMux_45_a1_combout),
	.datae(!fp_functions_0_ai933_a6_combout),
	.dataf(!fp_functions_0_ai933_a7_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a8.extended_lut = "off";
defparam fp_functions_0_ai933_a8.lut_mask = 64'h010FFFFFFFFFFFFF;
defparam fp_functions_0_ai933_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_44_a1(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_44_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_44_a1.extended_lut = "off";
defparam fp_functions_0_aMux_44_a1.lut_mask = 64'h0202020202020202;
defparam fp_functions_0_aMux_44_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_44_a2(
	.dataa(!a[11]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aadd_0_a1_sumout),
	.datad(!fp_functions_0_aadd_0_a6_sumout),
	.datae(!fp_functions_0_areduce_nor_2_acombout),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_44_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_44_a2.extended_lut = "off";
defparam fp_functions_0_aMux_44_a2.lut_mask = 64'h0000555500030003;
defparam fp_functions_0_aMux_44_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_4_a0(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[20]),
	.datad(!a[21]),
	.datae(!a[22]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_4_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_4_a0.extended_lut = "off";
defparam fp_functions_0_aMux_4_a0.lut_mask = 64'h08194C5D08194C5D;
defparam fp_functions_0_aMux_4_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_44_a3(
	.dataa(!a[19]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_4_a0_combout),
	.datad(!fp_functions_0_areduce_nor_2_acombout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_44_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_44_a3.extended_lut = "off";
defparam fp_functions_0_aMux_44_a3.lut_mask = 64'h0055001F0055001F;
defparam fp_functions_0_aMux_44_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_12_a0(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[12]),
	.datad(!a[13]),
	.datae(!a[14]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_12_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_12_a0.extended_lut = "off";
defparam fp_functions_0_aMux_12_a0.lut_mask = 64'h08194C5D08194C5D;
defparam fp_functions_0_aMux_12_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_44_a4(
	.dataa(!a[11]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aadd_0_a1_sumout),
	.datad(!fp_functions_0_aMux_12_a0_combout),
	.datae(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a1_combout),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_44_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_44_a4.extended_lut = "off";
defparam fp_functions_0_aMux_44_a4.lut_mask = 64'h00000000000010F0;
defparam fp_functions_0_aMux_44_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_44_a5(
	.dataa(!fp_functions_0_aMux_44_a0_combout),
	.datab(!fp_functions_0_aMux_44_a1_combout),
	.datac(!fp_functions_0_aMux_8_a0_combout),
	.datad(!fp_functions_0_aMux_44_a2_combout),
	.datae(!fp_functions_0_aMux_44_a3_combout),
	.dataf(!fp_functions_0_aMux_44_a4_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_44_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_44_a5.extended_lut = "off";
defparam fp_functions_0_aMux_44_a5.lut_mask = 64'h05FF37FFFFFFFFFF;
defparam fp_functions_0_aMux_44_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a9(
	.dataa(!fp_functions_0_areduce_nor_2_acombout),
	.datab(!fp_functions_0_aMux_24_a1_combout),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a1_combout),
	.datad(!fp_functions_0_aMux_20_a0_combout),
	.datae(!fp_functions_0_ai933_a4_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a9.extended_lut = "off";
defparam fp_functions_0_ai933_a9.lut_mask = 64'h0000035300000353;
defparam fp_functions_0_ai933_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a10(
	.dataa(!fp_functions_0_aMux_16_a0_combout),
	.datab(!fp_functions_0_ai933_a0_combout),
	.datac(!fp_functions_0_ai933_a2_combout),
	.datad(!fp_functions_0_aMux_44_a5_combout),
	.datae(!fp_functions_0_ai933_a9_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a10.extended_lut = "off";
defparam fp_functions_0_ai933_a10.lut_mask = 64'h0537FFFF0537FFFF;
defparam fp_functions_0_ai933_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_15_a1(
	.dataa(!a[8]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_15_a0_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_15_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_15_a1.extended_lut = "off";
defparam fp_functions_0_aMux_15_a1.lut_mask = 64'hAAE0AAE0AAE0AAE0;
defparam fp_functions_0_aMux_15_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a4(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a4.extended_lut = "off";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a4.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_41_a0(
	.dataa(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a4_combout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_41_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_41_a0.extended_lut = "off";
defparam fp_functions_0_aMux_41_a0.lut_mask = 64'h3131313131313131;
defparam fp_functions_0_aMux_41_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_7_a1(
	.dataa(!a[16]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_7_a0_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_7_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_7_a1.extended_lut = "off";
defparam fp_functions_0_aMux_7_a1.lut_mask = 64'hAAE0AAE0AAE0AAE0;
defparam fp_functions_0_aMux_7_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_3_a0(
	.dataa(!a[20]),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aMux_3_a1_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_3_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_3_a0.extended_lut = "off";
defparam fp_functions_0_aMux_3_a0.lut_mask = 64'h110F110F110F110F;
defparam fp_functions_0_aMux_3_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_11_a1(
	.dataa(!a[12]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_11_a0_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_11_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_11_a1.extended_lut = "off";
defparam fp_functions_0_aMux_11_a1.lut_mask = 64'hAAE0AAE0AAE0AAE0;
defparam fp_functions_0_aMux_11_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_43_a0(
	.dataa(!fp_functions_0_aMux_44_a0_combout),
	.datab(!fp_functions_0_aMux_44_a1_combout),
	.datac(!fp_functions_0_aMux_41_a0_combout),
	.datad(!fp_functions_0_aMux_7_a1_combout),
	.datae(!fp_functions_0_aMux_3_a0_combout),
	.dataf(!fp_functions_0_aMux_11_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_43_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_43_a0.extended_lut = "off";
defparam fp_functions_0_aMux_43_a0.lut_mask = 64'h5F0F7F3F55007733;
defparam fp_functions_0_aMux_43_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a11(
	.dataa(!fp_functions_0_areduce_nor_2_acombout),
	.datab(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a1_combout),
	.datac(!fp_functions_0_aMux_19_a0_combout),
	.datad(!fp_functions_0_aMux_23_a0_combout),
	.datae(!fp_functions_0_ai933_a4_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a11.extended_lut = "off";
defparam fp_functions_0_ai933_a11.lut_mask = 64'h0000041500000415;
defparam fp_functions_0_ai933_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a12(
	.dataa(!fp_functions_0_aMux_15_a1_combout),
	.datab(!fp_functions_0_ai933_a0_combout),
	.datac(!fp_functions_0_aMux_43_a0_combout),
	.datad(!fp_functions_0_ai933_a2_combout),
	.datae(!fp_functions_0_ai933_a11_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a12_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a12.extended_lut = "off";
defparam fp_functions_0_ai933_a12.lut_mask = 64'h03ABFFFF03ABFFFF;
defparam fp_functions_0_ai933_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a13(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[0]),
	.datad(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a4_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a13_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a13.extended_lut = "off";
defparam fp_functions_0_ai933_a13.lut_mask = 64'h0004000400040004;
defparam fp_functions_0_ai933_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5(
	.dataa(!fp_functions_0_aadd_0_a11_sumout),
	.datab(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5.extended_lut = "off";
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5.lut_mask = 64'hFDFDFDFDFDFDFDFD;
defparam fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_6_a1(
	.dataa(!a[17]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_6_a0_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_6_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_6_a1.extended_lut = "off";
defparam fp_functions_0_aMux_6_a1.lut_mask = 64'hAAE0AAE0AAE0AAE0;
defparam fp_functions_0_aMux_6_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_2_a2(
	.dataa(!a[23]),
	.datab(!fp_functions_0_aMux_2_a0_combout),
	.datac(!fp_functions_0_aMux_2_a1_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
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
defparam fp_functions_0_aMux_2_a2.lut_mask = 64'hCCE0CCE0CCE0CCE0;
defparam fp_functions_0_aMux_2_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_10_a1(
	.dataa(!a[13]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_10_a0_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_10_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_10_a1.extended_lut = "off";
defparam fp_functions_0_aMux_10_a1.lut_mask = 64'hAAE0AAE0AAE0AAE0;
defparam fp_functions_0_aMux_10_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_42_a0(
	.dataa(!fp_functions_0_aMux_44_a0_combout),
	.datab(!fp_functions_0_aMux_44_a1_combout),
	.datac(!fp_functions_0_aMux_41_a0_combout),
	.datad(!fp_functions_0_aMux_6_a1_combout),
	.datae(!fp_functions_0_aMux_2_a2_combout),
	.dataf(!fp_functions_0_aMux_10_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_42_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_42_a0.extended_lut = "off";
defparam fp_functions_0_aMux_42_a0.lut_mask = 64'h7F3F5F0F77335500;
defparam fp_functions_0_aMux_42_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a14(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_areduce_nor_2_acombout),
	.datae(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a14_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a14.extended_lut = "off";
defparam fp_functions_0_ai933_a14.lut_mask = 64'h0000000000000020;
defparam fp_functions_0_ai933_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a15(
	.dataa(!fp_functions_0_aMux_18_a0_combout),
	.datab(!fp_functions_0_ai933_a14_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a15_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a15.extended_lut = "off";
defparam fp_functions_0_ai933_a15.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_ai933_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_14_a1(
	.dataa(!a[9]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_14_a0_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_14_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_14_a1.extended_lut = "off";
defparam fp_functions_0_aMux_14_a1.lut_mask = 64'hAAE0AAE0AAE0AAE0;
defparam fp_functions_0_aMux_14_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a16(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(gnd),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a16_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a16.extended_lut = "off";
defparam fp_functions_0_ai933_a16.lut_mask = 64'h0000005000000050;
defparam fp_functions_0_ai933_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a17(
	.dataa(!fp_functions_0_aadd_0_a6_sumout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aMux_14_a1_combout),
	.datad(!fp_functions_0_aMux_22_a0_combout),
	.datae(!fp_functions_0_ai933_a16_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a17_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a17.extended_lut = "off";
defparam fp_functions_0_ai933_a17.lut_mask = 64'h0000103200001032;
defparam fp_functions_0_ai933_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a18(
	.dataa(!fp_functions_0_ai933_a13_combout),
	.datab(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a18_a_a5_combout),
	.datac(!fp_functions_0_aMux_42_a0_combout),
	.datad(!fp_functions_0_ai933_a15_combout),
	.datae(!fp_functions_0_ai933_a17_combout),
	.dataf(!fp_functions_0_ai933_a0_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a18_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a18.extended_lut = "off";
defparam fp_functions_0_ai933_a18.lut_mask = 64'h44FFFFFF4FFFFFFF;
defparam fp_functions_0_ai933_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a19(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a19_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a19.extended_lut = "off";
defparam fp_functions_0_ai933_a19.lut_mask = 64'h0000008000000080;
defparam fp_functions_0_ai933_a19.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a20(
	.dataa(!fp_functions_0_aMux_17_a0_combout),
	.datab(!fp_functions_0_ai933_a14_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a20_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a20.extended_lut = "off";
defparam fp_functions_0_ai933_a20.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_ai933_a20.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a21(
	.dataa(!fp_functions_0_aadd_0_a6_sumout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aMux_13_a0_combout),
	.datad(!fp_functions_0_aMux_21_a0_combout),
	.datae(!fp_functions_0_ai933_a16_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a21_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a21.extended_lut = "off";
defparam fp_functions_0_ai933_a21.lut_mask = 64'h0000012300000123;
defparam fp_functions_0_ai933_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_41_a1(
	.dataa(!fp_functions_0_aMux_44_a0_combout),
	.datab(!fp_functions_0_aMux_44_a1_combout),
	.datac(!fp_functions_0_aMux_41_a0_combout),
	.datad(!fp_functions_0_aMux_5_a0_combout),
	.datae(!fp_functions_0_aMux_9_a0_combout),
	.dataf(!fp_functions_0_aMux_1_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_41_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_41_a1.extended_lut = "off";
defparam fp_functions_0_aMux_41_a1.lut_mask = 64'h00550F5F33773F7F;
defparam fp_functions_0_aMux_41_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a22(
	.dataa(!fp_functions_0_aMux_25_a2_combout),
	.datab(!fp_functions_0_ai933_a19_combout),
	.datac(!fp_functions_0_ai933_a20_combout),
	.datad(!fp_functions_0_ai933_a0_combout),
	.datae(!fp_functions_0_ai933_a21_combout),
	.dataf(!fp_functions_0_aMux_41_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a22_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a22.extended_lut = "off";
defparam fp_functions_0_ai933_a22.lut_mask = 64'h1F1FFFFF1FFFFFFF;
defparam fp_functions_0_ai933_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_4_a1(
	.dataa(!a[19]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_4_a0_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_4_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_4_a1.extended_lut = "off";
defparam fp_functions_0_aMux_4_a1.lut_mask = 64'h551F551F551F551F;
defparam fp_functions_0_aMux_4_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a23(
	.dataa(!fp_functions_0_aMux_16_a0_combout),
	.datab(!fp_functions_0_ai933_a14_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a23_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a23.extended_lut = "off";
defparam fp_functions_0_ai933_a23.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_ai933_a23.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_12_a1(
	.dataa(!a[11]),
	.datab(!fp_functions_0_aMux_1_a0_combout),
	.datac(!fp_functions_0_aMux_12_a0_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_12_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_12_a1.extended_lut = "off";
defparam fp_functions_0_aMux_12_a1.lut_mask = 64'hAAE0AAE0AAE0AAE0;
defparam fp_functions_0_aMux_12_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a24(
	.dataa(!fp_functions_0_aadd_0_a6_sumout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aMux_12_a1_combout),
	.datad(!fp_functions_0_aMux_20_a0_combout),
	.datae(!fp_functions_0_ai933_a16_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a24_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a24.extended_lut = "off";
defparam fp_functions_0_ai933_a24.lut_mask = 64'h0000103200001032;
defparam fp_functions_0_ai933_a24.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a25(
	.dataa(!fp_functions_0_aMux_24_a1_combout),
	.datab(!fp_functions_0_ai933_a19_combout),
	.datac(!fp_functions_0_aMux_40_a0_combout),
	.datad(!fp_functions_0_ai933_a23_combout),
	.datae(!fp_functions_0_ai933_a0_combout),
	.dataf(!fp_functions_0_ai933_a24_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a25_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a25.extended_lut = "off";
defparam fp_functions_0_ai933_a25.lut_mask = 64'h11FF1FFFFFFFFFFF;
defparam fp_functions_0_ai933_a25.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a6(
	.dataa(!fp_functions_0_aadd_0_a6_sumout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aMux_11_a1_combout),
	.datad(!fp_functions_0_aMux_19_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a6.extended_lut = "off";
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a6.lut_mask = 64'h1032103210321032;
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_39_a0(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_39_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_39_a0.extended_lut = "off";
defparam fp_functions_0_aMux_39_a0.lut_mask = 64'h0404040404040404;
defparam fp_functions_0_aMux_39_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_39_a1(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_39_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_39_a1.extended_lut = "off";
defparam fp_functions_0_aMux_39_a1.lut_mask = 64'h0F080F080F080F08;
defparam fp_functions_0_aMux_39_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_39_a2(
	.dataa(!fp_functions_0_aMux_39_a0_combout),
	.datab(!fp_functions_0_aMux_7_a1_combout),
	.datac(!fp_functions_0_aMux_3_a0_combout),
	.datad(!fp_functions_0_aMux_39_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_39_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_39_a2.extended_lut = "off";
defparam fp_functions_0_aMux_39_a2.lut_mask = 64'h05CD05CD05CD05CD;
defparam fp_functions_0_aMux_39_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a26(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a26_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a26.extended_lut = "off";
defparam fp_functions_0_ai933_a26.lut_mask = 64'hF080F080F080F080;
defparam fp_functions_0_ai933_a26.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a27(
	.dataa(!fp_functions_0_areduce_nor_2_acombout),
	.datab(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!fp_functions_0_aMux_23_a0_combout),
	.datae(!fp_functions_0_ai933_a26_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a27_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a27.extended_lut = "off";
defparam fp_functions_0_ai933_a27.lut_mask = 64'h0000000100000001;
defparam fp_functions_0_ai933_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a28(
	.dataa(!fp_functions_0_aMux_15_a1_combout),
	.datab(!fp_functions_0_ai933_a14_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a28_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a28.extended_lut = "off";
defparam fp_functions_0_ai933_a28.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_ai933_a28.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a29(
	.dataa(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a6_combout),
	.datab(!fp_functions_0_aMux_39_a2_combout),
	.datac(!fp_functions_0_ai933_a27_combout),
	.datad(!fp_functions_0_ai933_a16_combout),
	.datae(!fp_functions_0_ai933_a28_combout),
	.dataf(!fp_functions_0_ai933_a0_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a29_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a29.extended_lut = "off";
defparam fp_functions_0_ai933_a29.lut_mask = 64'h0F5FFFFF3F7FFFFF;
defparam fp_functions_0_ai933_a29.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a7(
	.dataa(!fp_functions_0_aadd_0_a6_sumout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aMux_10_a1_combout),
	.datad(!fp_functions_0_aMux_18_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a7.extended_lut = "off";
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a7.lut_mask = 64'h1032103210321032;
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a30(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a11_sumout),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a30_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a30.extended_lut = "off";
defparam fp_functions_0_ai933_a30.lut_mask = 64'h0004000400040004;
defparam fp_functions_0_ai933_a30.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_38_a0(
	.dataa(!fp_functions_0_aMux_39_a0_combout),
	.datab(!fp_functions_0_aMux_6_a1_combout),
	.datac(!fp_functions_0_aMux_2_a2_combout),
	.datad(!fp_functions_0_aMux_39_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_38_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_38_a0.extended_lut = "off";
defparam fp_functions_0_aMux_38_a0.lut_mask = 64'h50DC50DC50DC50DC;
defparam fp_functions_0_aMux_38_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a31(
	.dataa(gnd),
	.datab(!fp_functions_0_aadd_0_a11_sumout),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a31_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a31.extended_lut = "off";
defparam fp_functions_0_ai933_a31.lut_mask = 64'h0003000300030003;
defparam fp_functions_0_ai933_a31.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a32(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a11_sumout),
	.datac(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a32_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a32.extended_lut = "off";
defparam fp_functions_0_ai933_a32.lut_mask = 64'h0008000800080008;
defparam fp_functions_0_ai933_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a33(
	.dataa(!fp_functions_0_aadd_0_a6_sumout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aMux_14_a1_combout),
	.datad(!fp_functions_0_aMux_22_a0_combout),
	.datae(!fp_functions_0_ai933_a32_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a33_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a33.extended_lut = "off";
defparam fp_functions_0_ai933_a33.lut_mask = 64'h0000103200001032;
defparam fp_functions_0_ai933_a33.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a34(
	.dataa(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a7_combout),
	.datab(!fp_functions_0_ai933_a30_combout),
	.datac(!fp_functions_0_aMux_38_a0_combout),
	.datad(!fp_functions_0_ai933_a31_combout),
	.datae(!fp_functions_0_ai933_a33_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a34_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a34.extended_lut = "off";
defparam fp_functions_0_ai933_a34.lut_mask = 64'h111FFFFF111FFFFF;
defparam fp_functions_0_ai933_a34.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a8(
	.dataa(!fp_functions_0_aadd_0_a6_sumout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aMux_9_a0_combout),
	.datad(!fp_functions_0_aMux_17_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a8.extended_lut = "off";
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a8.lut_mask = 64'h0123012301230123;
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_37_a0(
	.dataa(!fp_functions_0_aMux_39_a0_combout),
	.datab(!fp_functions_0_aMux_5_a0_combout),
	.datac(!fp_functions_0_aMux_39_a1_combout),
	.datad(!fp_functions_0_aMux_1_a1_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_37_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_37_a0.extended_lut = "off";
defparam fp_functions_0_aMux_37_a0.lut_mask = 64'h0357035703570357;
defparam fp_functions_0_aMux_37_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a35(
	.dataa(!fp_functions_0_aadd_0_a6_sumout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aMux_13_a0_combout),
	.datad(!fp_functions_0_aMux_21_a0_combout),
	.datae(!fp_functions_0_ai933_a32_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a35_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a35.extended_lut = "off";
defparam fp_functions_0_ai933_a35.lut_mask = 64'h0000012300000123;
defparam fp_functions_0_ai933_a35.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a36(
	.dataa(!fp_functions_0_ai933_a30_combout),
	.datab(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a8_combout),
	.datac(!fp_functions_0_ai933_a31_combout),
	.datad(!fp_functions_0_aMux_37_a0_combout),
	.datae(!fp_functions_0_ai933_a35_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a36_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a36.extended_lut = "off";
defparam fp_functions_0_ai933_a36.lut_mask = 64'h111FFFFF111FFFFF;
defparam fp_functions_0_ai933_a36.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a9(
	.dataa(!fp_functions_0_aadd_0_a6_sumout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aMux_8_a0_combout),
	.datad(!fp_functions_0_aMux_16_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a9.extended_lut = "off";
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a9.lut_mask = 64'h0123012301230123;
defparam fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_36_a0(
	.dataa(!fp_functions_0_aMux_1_a0_combout),
	.datab(!fp_functions_0_aadd_0_a1_sumout),
	.datac(!fp_functions_0_aadd_0_a6_sumout),
	.datad(!fp_functions_0_areduce_nor_2_acombout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(!fp_functions_0_aMux_4_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_36_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_36_a0.extended_lut = "off";
defparam fp_functions_0_aMux_36_a0.lut_mask = 64'h0000001000FF00D0;
defparam fp_functions_0_aMux_36_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a37(
	.dataa(!fp_functions_0_aadd_0_a6_sumout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_aMux_12_a1_combout),
	.datad(!fp_functions_0_aMux_20_a0_combout),
	.datae(!fp_functions_0_ai933_a32_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a37_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a37.extended_lut = "off";
defparam fp_functions_0_ai933_a37.lut_mask = 64'h0000103200001032;
defparam fp_functions_0_ai933_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a38(
	.dataa(!fp_functions_0_ai933_a30_combout),
	.datab(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a9_combout),
	.datac(!fp_functions_0_aMux_36_a0_combout),
	.datad(!fp_functions_0_ai933_a31_combout),
	.datae(!fp_functions_0_ai933_a37_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a38_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a38.extended_lut = "off";
defparam fp_functions_0_ai933_a38.lut_mask = 64'h111FFFFF111FFFFF;
defparam fp_functions_0_ai933_a38.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_35_a0(
	.dataa(!a[20]),
	.datab(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a4_combout),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_aMux_3_a1_combout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_35_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_35_a0.extended_lut = "off";
defparam fp_functions_0_aMux_35_a0.lut_mask = 64'h0505003305050033;
defparam fp_functions_0_aMux_35_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a39(
	.dataa(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a3_combout),
	.datab(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a4_combout),
	.datac(!fp_functions_0_ai933_a32_combout),
	.datad(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a6_combout),
	.datae(!fp_functions_0_ai933_a30_combout),
	.dataf(!fp_functions_0_ai933_a47_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a39_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a39.extended_lut = "off";
defparam fp_functions_0_ai933_a39.lut_mask = 64'h000F777FFFFFFFFF;
defparam fp_functions_0_ai933_a39.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_34_a0(
	.dataa(!a[23]),
	.datab(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a4_combout),
	.datac(!fp_functions_0_aMux_2_a0_combout),
	.datad(!fp_functions_0_aMux_2_a1_combout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_34_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_34_a0.extended_lut = "off";
defparam fp_functions_0_aMux_34_a0.lut_mask = 64'h0F0F01330F0F0133;
defparam fp_functions_0_aMux_34_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a40(
	.dataa(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a0_combout),
	.datab(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a2_combout),
	.datac(!fp_functions_0_ai933_a32_combout),
	.datad(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a7_combout),
	.datae(!fp_functions_0_ai933_a30_combout),
	.dataf(!fp_functions_0_ai933_a46_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a40_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a40.extended_lut = "off";
defparam fp_functions_0_ai933_a40.lut_mask = 64'h000F777FFFFFFFFF;
defparam fp_functions_0_ai933_a40.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_33_a0(
	.dataa(!a[24]),
	.datab(!a[23]),
	.datac(!a[22]),
	.datad(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a4_combout),
	.datae(!fp_functions_0_areduce_nor_2_acombout),
	.dataf(!fp_functions_0_aadd_1_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_33_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_33_a0.extended_lut = "off";
defparam fp_functions_0_aMux_33_a0.lut_mask = 64'h00000F0F0044008A;
defparam fp_functions_0_aMux_33_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a41(
	.dataa(!fp_functions_0_ai933_a32_combout),
	.datab(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a5_combout),
	.datac(!fp_functions_0_ai933_a30_combout),
	.datad(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a8_combout),
	.datae(!fp_functions_0_ai933_a45_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a41_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a41.extended_lut = "off";
defparam fp_functions_0_ai933_a41.lut_mask = 64'h0357FFFF0357FFFF;
defparam fp_functions_0_ai933_a41.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_32_a0(
	.dataa(!fp_functions_0_aMux_1_a0_combout),
	.datab(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a1_a_a4_combout),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_32_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_32_a0.extended_lut = "off";
defparam fp_functions_0_aMux_32_a0.lut_mask = 64'h0F010F010F010F01;
defparam fp_functions_0_aMux_32_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a42(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a11_sumout),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.datae(!fp_functions_0_aadd_1_a1_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a42_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a42.extended_lut = "off";
defparam fp_functions_0_ai933_a42.lut_mask = 64'h0000000700000007;
defparam fp_functions_0_ai933_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a43(
	.dataa(!a[7]),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_aadd_1_a1_sumout),
	.datae(!fp_functions_0_aMux_4_a1_combout),
	.dataf(!fp_functions_0_aMux_12_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a43_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a43.extended_lut = "off";
defparam fp_functions_0_ai933_a43.lut_mask = 64'h50C050F050005030;
defparam fp_functions_0_ai933_a43.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a44(
	.dataa(!fp_functions_0_aMux_32_a0_combout),
	.datab(!fp_functions_0_ai933_a32_combout),
	.datac(!fp_functions_0_ai933_a42_combout),
	.datad(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a9_combout),
	.datae(!fp_functions_0_ai933_a31_combout),
	.dataf(!fp_functions_0_ai933_a43_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a44_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a44.extended_lut = "off";
defparam fp_functions_0_ai933_a44.lut_mask = 64'h003355770F3F5F7F;
defparam fp_functions_0_ai933_a44.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_45_a0(
	.dataa(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a12_a_a2_combout),
	.datab(!fp_functions_0_arightShiftStage1_uid81_rightShiferNoStickyOut_uid42_fpToFxPTest_s_a1_a_a5_combout),
	.datac(!fp_functions_0_aMux_45_a1_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aMux_45_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aMux_45_a0.extended_lut = "off";
defparam fp_functions_0_aMux_45_a0.lut_mask = 64'h1F1F1F1F1F1F1F1F;
defparam fp_functions_0_aMux_45_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a45(
	.dataa(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.datab(!fp_functions_0_aadd_1_a1_sumout),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_aMux_33_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a45_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a45.extended_lut = "off";
defparam fp_functions_0_ai933_a45.lut_mask = 64'h0001000100010001;
defparam fp_functions_0_ai933_a45.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a46(
	.dataa(!fp_functions_0_arightShiftStage2_uid88_rightShiferNoStickyOut_uid42_fpToFxPTest_q_a6_a_a0_combout),
	.datab(!fp_functions_0_aadd_1_a1_sumout),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_aMux_34_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a46_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a46.extended_lut = "off";
defparam fp_functions_0_ai933_a46.lut_mask = 64'h0001000100010001;
defparam fp_functions_0_ai933_a46.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai933_a47(
	.dataa(!fp_functions_0_aadd_0_a16_sumout),
	.datab(!areset),
	.datac(!fp_functions_0_aadd_1_a1_sumout),
	.datad(!fp_functions_0_aadd_0_a11_sumout),
	.datae(!fp_functions_0_aMux_35_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai933_a47_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai933_a47.extended_lut = "off";
defparam fp_functions_0_ai933_a47.lut_mask = 64'h0000000800000008;
defparam fp_functions_0_ai933_a47.shared_arith = "off";

assign q[0] = fp_functions_0_aMux_129_a0_combout;

assign q[10] = fp_functions_0_aMux_129_a10_combout;

assign q[11] = fp_functions_0_aMux_129_a11_combout;

assign q[12] = fp_functions_0_aMux_129_a12_combout;

assign q[13] = fp_functions_0_aMux_129_a13_combout;

assign q[14] = fp_functions_0_aMux_129_a14_combout;

assign q[15] = fp_functions_0_aMux_129_a15_combout;

assign q[16] = fp_functions_0_aMux_129_a16_combout;

assign q[17] = fp_functions_0_aMux_129_a17_combout;

assign q[18] = fp_functions_0_aMux_129_a18_combout;

assign q[19] = fp_functions_0_aMux_129_a19_combout;

assign q[1] = fp_functions_0_aMux_129_a1_combout;

assign q[20] = fp_functions_0_aMux_129_a20_combout;

assign q[21] = fp_functions_0_aMux_129_a21_combout;

assign q[22] = fp_functions_0_aMux_129_a22_combout;

assign q[23] = fp_functions_0_aMux_129_a23_combout;

assign q[24] = fp_functions_0_aMux_129_a24_combout;

assign q[25] = fp_functions_0_aMux_129_a25_combout;

assign q[26] = fp_functions_0_aMux_129_a26_combout;

assign q[27] = fp_functions_0_aMux_129_a27_combout;

assign q[28] = fp_functions_0_aMux_129_a28_combout;

assign q[29] = fp_functions_0_aMux_129_a29_combout;

assign q[2] = fp_functions_0_aMux_129_a2_combout;

assign q[30] = fp_functions_0_aMux_129_a30_combout;

assign q[31] = fp_functions_0_aMux_129_a31_combout;

assign q[3] = fp_functions_0_aMux_129_a3_combout;

assign q[4] = fp_functions_0_aMux_129_a4_combout;

assign q[5] = fp_functions_0_aMux_129_a5_combout;

assign q[6] = fp_functions_0_aMux_129_a6_combout;

assign q[7] = fp_functions_0_aMux_129_a7_combout;

assign q[8] = fp_functions_0_aMux_129_a8_combout;

assign q[9] = fp_functions_0_aMux_129_a9_combout;

endmodule
