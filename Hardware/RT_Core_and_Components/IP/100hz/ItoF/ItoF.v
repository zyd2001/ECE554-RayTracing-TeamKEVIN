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

// DATE "05/07/2021 03:31:07"

// 
// Device: Altera 1SX280HN2F43E2VG Package FBGA1760
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module ItoF (
	q,
	areset,
	clk,
	en,
	a)/* synthesis synthesis_greybox=0 */;
output 	[31:0] q;
input 	areset;
input 	clk;
input 	[0:0] en;
input 	[31:0] a;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

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
wire fp_functions_0_aredist3_signX_uid6_fxpToFPTest_b_2_q_a0_a_aq;
wire fp_functions_0_aredist2_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq;
wire fp_functions_0_aredist1_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_aq;
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
wire fp_functions_0_aredist3_signX_uid6_fxpToFPTest_b_2_delay_0_a0_a_aq;
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
wire fp_functions_0_aadd_0_a151_sumout;
wire fp_functions_0_aadd_0_a152;
wire fp_functions_0_aadd_0_a156_sumout;
wire fp_functions_0_aadd_0_a157;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_aq;
wire fp_functions_0_asticky_uid20_fxpToFPTest_delay_adelay_signals_a0_a_a0_a_aq;
wire fp_functions_0_aadd_4_a12_cout;
wire fp_functions_0_aadd_5_a12_cout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a_aq;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_aq;
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
wire fp_functions_0_ai1225_a3_cout;
wire fp_functions_0_ai1225_a7_sumout;
wire fp_functions_0_ai1225_a8;
wire fp_functions_0_ai1225_a12_sumout;
wire fp_functions_0_ai1225_a13;
wire fp_functions_0_ai1225_a17_sumout;
wire fp_functions_0_ai1225_a18;
wire fp_functions_0_ai1225_a22_sumout;
wire fp_functions_0_ai1225_a23;
wire fp_functions_0_ai1225_a27_sumout;
wire fp_functions_0_ai1225_a28;
wire fp_functions_0_ai1225_a32_sumout;
wire fp_functions_0_ai1225_a33;
wire fp_functions_0_ai1225_a37_sumout;
wire fp_functions_0_ai1225_a38;
wire fp_functions_0_ai1225_a42_sumout;
wire fp_functions_0_ai1225_a43;
wire fp_functions_0_ai1225_a47_sumout;
wire fp_functions_0_ai1225_a48;
wire fp_functions_0_ai1225_a52_sumout;
wire fp_functions_0_ai1225_a53;
wire fp_functions_0_ai1225_a57_sumout;
wire fp_functions_0_ai1225_a58;
wire fp_functions_0_ai1225_a62_sumout;
wire fp_functions_0_ai1225_a63;
wire fp_functions_0_ai1225_a67_sumout;
wire fp_functions_0_ai1225_a68;
wire fp_functions_0_ai1225_a72_sumout;
wire fp_functions_0_ai1225_a73;
wire fp_functions_0_ai1225_a77_sumout;
wire fp_functions_0_ai1225_a78;
wire fp_functions_0_ai1225_a82_sumout;
wire fp_functions_0_ai1225_a83;
wire fp_functions_0_ai1225_a87_sumout;
wire fp_functions_0_ai1225_a88;
wire fp_functions_0_ai1225_a92_sumout;
wire fp_functions_0_ai1225_a93;
wire fp_functions_0_ai1225_a97_sumout;
wire fp_functions_0_ai1225_a103_cout;
wire fp_functions_0_ai1225_a107_sumout;
wire fp_functions_0_ai1225_a108;
wire fp_functions_0_ai1225_a112_sumout;
wire fp_functions_0_ai1225_a113;
wire fp_functions_0_ai1225_a117_sumout;
wire fp_functions_0_ai1225_a118;
wire fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a6_a_a1_sumout;
wire fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a6_a_a2;
wire fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a5_a_a6_sumout;
wire fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a5_a_a7;
wire fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a4_a_a11_sumout;
wire fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a4_a_a12;
wire fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a3_a_a16_sumout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a27_cout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a31_sumout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a32;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a36_sumout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a37;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a41_sumout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a47_cout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a51_sumout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a52;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a56_sumout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a57;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a61_sumout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a67_cout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a71_sumout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a72;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a76_sumout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a77;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a81_sumout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a87_cout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a91_sumout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a92;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a96_sumout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a97;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a101_sumout;
wire fp_functions_0_ai1201_a0_combout;
wire fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq;
wire fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq;
wire fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq;
wire fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq;
wire fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq;
wire fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq;
wire fp_functions_0_areduce_nor_5_a0_combout;
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
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a8_combout;
wire fp_functions_0_areduce_nor_2_acombout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a9_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a10_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a11_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a15_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a16_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a17_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a18_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout;
wire fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_a0_combout;
wire fp_functions_0_ai1125_a0_combout;
wire fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout;
wire fp_functions_0_ai1125_a1_combout;
wire fp_functions_0_areduce_nor_3_a0_combout;
wire fp_functions_0_areduce_nor_3_acombout;
wire fp_functions_0_ai1125_a2_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a19_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a20_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a21_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a22_combout;
wire fp_functions_0_areduce_nor_4_acombout;
wire fp_functions_0_ai1125_a3_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a5_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a23_combout;
wire fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0_combout;
wire fp_functions_0_ai1125_a4_combout;
wire fp_functions_0_areduce_nor_0_a0_combout;
wire fp_functions_0_areduce_nor_0_a1_combout;
wire fp_functions_0_areduce_nor_0_a2_combout;
wire fp_functions_0_areduce_nor_0_a3_combout;
wire fp_functions_0_ai718_a1_combout;
wire fp_functions_0_ai718_a2_combout;
wire fp_functions_0_ai718_a3_combout;
wire fp_functions_0_ai718_a4_combout;
wire fp_functions_0_areduce_nor_0_acombout;
wire fp_functions_0_areduce_nor_1_a0_combout;
wire fp_functions_0_ai714_a1_combout;
wire fp_functions_0_ai714_a2_combout;
wire fp_functions_0_ai718_a5_combout;
wire fp_functions_0_ai719_a1_combout;
wire fp_functions_0_ai716_a1_combout;
wire fp_functions_0_ai715_a1_combout;
wire fp_functions_0_ai715_a2_combout;
wire fp_functions_0_ai713_a1_combout;
wire fp_functions_0_ai713_a2_combout;
wire fp_functions_0_ai718_a6_combout;
wire fp_functions_0_ai718_a7_combout;
wire fp_functions_0_ai719_a2_combout;
wire fp_functions_0_ai720_a1_combout;
wire fp_functions_0_ai717_a1_combout;
wire fp_functions_0_ai718_a8_combout;
wire fp_functions_0_ai721_a1_combout;
wire fp_functions_0_ai721_a2_combout;
wire fp_functions_0_ai724_a1_combout;
wire fp_functions_0_ai718_a9_combout;
wire fp_functions_0_ai724_a2_combout;
wire fp_functions_0_ai718_a10_combout;
wire fp_functions_0_ai725_a1_combout;
wire fp_functions_0_ai718_a11_combout;
wire fp_functions_0_ai725_a2_combout;
wire fp_functions_0_ai722_a1_combout;
wire fp_functions_0_ai722_a2_combout;
wire fp_functions_0_ai723_a1_combout;
wire fp_functions_0_ai723_a2_combout;
wire fp_functions_0_ai726_a1_combout;
wire fp_functions_0_ai726_a2_combout;
wire fp_functions_0_ai727_a1_combout;
wire fp_functions_0_ai718_a12_combout;
wire fp_functions_0_ai727_a2_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a6_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a7_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a8_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a9_combout;
wire fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout;
wire fp_functions_0_aexpFracR_uid24_fxpToFPTest_b_a0_a_a0_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a10_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a11_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a12_combout;
wire fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a24_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a13_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a14_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a15_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a16_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a18_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a19_combout;
wire fp_functions_0_ai1225_a0_combout;
wire fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a20_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a21_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_a22_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a23_combout;
wire fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_a24_combout;
wire fp_functions_0_areduce_or_0_a0_combout;
wire fp_functions_0_areduce_or_0_a1_combout;
wire fp_functions_0_ai728_a1_combout;
wire fp_functions_0_ai728_a2_combout;
wire fp_functions_0_ai1125_a5_combout;


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
	.datac(!fp_functions_0_aadd_2_a1_sumout),
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
	.datac(!fp_functions_0_aadd_2_a6_sumout),
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
	.datac(!fp_functions_0_aadd_2_a11_sumout),
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
	.datac(!fp_functions_0_aadd_2_a16_sumout),
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
	.datac(!fp_functions_0_aadd_2_a21_sumout),
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
	.datac(!fp_functions_0_aadd_2_a26_sumout),
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
	.datac(!fp_functions_0_aadd_2_a31_sumout),
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
	.datac(!fp_functions_0_aadd_2_a36_sumout),
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

fourteennm_ff fp_functions_0_aredist3_signX_uid6_fxpToFPTest_b_2_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_aredist3_signX_uid6_fxpToFPTest_b_2_delay_0_a0_a_aq),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist3_signX_uid6_fxpToFPTest_b_2_q_a0_a_aq));
defparam fp_functions_0_aredist3_signX_uid6_fxpToFPTest_b_2_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist3_signX_uid6_fxpToFPTest_b_2_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist2_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_areduce_nor_0_acombout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist2_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq));
defparam fp_functions_0_aredist2_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist2_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist1_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_areduce_nor_1_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist1_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq));
defparam fp_functions_0_aredist1_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist1_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a(
	.clk(clk),
	.d(fp_functions_0_ai714_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a(
	.clk(clk),
	.d(fp_functions_0_ai716_a1_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a(
	.clk(clk),
	.d(fp_functions_0_ai715_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a(
	.clk(clk),
	.d(fp_functions_0_ai713_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a(
	.clk(clk),
	.d(fp_functions_0_ai718_a6_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a(
	.clk(clk),
	.d(fp_functions_0_ai719_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a(
	.clk(clk),
	.d(fp_functions_0_ai720_a1_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a(
	.clk(clk),
	.d(fp_functions_0_ai717_a1_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a(
	.clk(clk),
	.d(fp_functions_0_ai721_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a(
	.clk(clk),
	.d(fp_functions_0_ai724_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a(
	.clk(clk),
	.d(fp_functions_0_ai725_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a(
	.clk(clk),
	.d(fp_functions_0_ai722_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a(
	.clk(clk),
	.d(fp_functions_0_ai723_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a(
	.clk(clk),
	.d(fp_functions_0_ai726_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a(
	.clk(clk),
	.d(fp_functions_0_ai727_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a1_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a112_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
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
	.d(fp_functions_0_ai1225_a107_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a2_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a2_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a3_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a97_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a3_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a4_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a92_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a4_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a5_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a87_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a5_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a5_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a6_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a82_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a6_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a6_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a7_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a77_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a7_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a7_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a8_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a72_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a8_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a8_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a8_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a9_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a67_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a9_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a9_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a9_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a10_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a62_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a10_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a11_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a57_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a11_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a11_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a11_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a12_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a52_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a12_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a12_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a12_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a13_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a47_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a13_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a13_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a13_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a42_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a14_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a15_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a37_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a15_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a15_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a15_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a16_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a32_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a16_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a16_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a16_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a17_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a27_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a17_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a17_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a17_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a18_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a22_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a18_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a18_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a18_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a19_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a17_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a19_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a19_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a19_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a20_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a12_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a20_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a20_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a20_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a21_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a7_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a21_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a21_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a21_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a22_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a22_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a22_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a22_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a23_a(
	.clk(clk),
	.d(fp_functions_0_ai1201_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(vcc),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a23_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a23_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a23_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_2_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq),
	.datad(gnd),
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
defparam fp_functions_0_aadd_2_a1.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_2_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a6(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq),
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
defparam fp_functions_0_aadd_2_a6.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_2_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a11(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq),
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
defparam fp_functions_0_aadd_2_a11.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_2_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a16(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq),
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
defparam fp_functions_0_aadd_2_a16.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_2_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a21(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq),
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
defparam fp_functions_0_aadd_2_a21.lut_mask = 64'h00000000F0F00F0F;
defparam fp_functions_0_aadd_2_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a26(
	.dataa(gnd),
	.datab(gnd),
	.datac(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
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
defparam fp_functions_0_aadd_2_a26.lut_mask = 64'h000000000000F0F0;
defparam fp_functions_0_aadd_2_a26.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a31(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
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
defparam fp_functions_0_aadd_2_a31.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_2_a31.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_2_a36(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_2_a32),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_2_a36_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_2_a36.extended_lut = "off";
defparam fp_functions_0_aadd_2_a36.lut_mask = 64'h0000000000000000;
defparam fp_functions_0_aadd_2_a36.shared_arith = "off";

fourteennm_ff fp_functions_0_aredist3_signX_uid6_fxpToFPTest_b_2_delay_0_a0_a(
	.clk(clk),
	.d(a[31]),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist3_signX_uid6_fxpToFPTest_b_2_delay_0_a0_a_aq));
defparam fp_functions_0_aredist3_signX_uid6_fxpToFPTest_b_2_delay_0_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist3_signX_uid6_fxpToFPTest_b_2_delay_0_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_aadd_0_a1(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[6]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a57),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a1_sumout),
	.cout(fp_functions_0_aadd_0_a2),
	.shareout());
defparam fp_functions_0_aadd_0_a1.extended_lut = "off";
defparam fp_functions_0_aadd_0_a1.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a6(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[7]),
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
	.datac(!a[8]),
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
	.datac(!a[9]),
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
	.datac(!a[10]),
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
	.datac(!a[12]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a62),
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
	.datac(!a[2]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a42),
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
	.datac(!a[0]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a36_sumout),
	.cout(fp_functions_0_aadd_0_a37),
	.shareout());
defparam fp_functions_0_aadd_0_a36.extended_lut = "off";
defparam fp_functions_0_aadd_0_a36.lut_mask = 64'h0000000050500F0F;
defparam fp_functions_0_aadd_0_a36.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a41(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[1]),
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
	.datac(!a[3]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a32),
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
	.datac(!a[4]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a47),
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
	.datac(!a[5]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a52),
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
	.datac(!a[11]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a22),
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
	.datac(!a[13]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a27),
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
	.datac(!a[14]),
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
	.datac(!a[15]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a72),
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
	.datac(!a[26]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a132),
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
	.datac(!a[20]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a107),
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
	.datac(!a[16]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a77),
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
	.datac(!a[17]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a92),
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
	.datac(!a[18]),
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
	.datac(!a[19]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a102),
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
	.datac(!a[21]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a87),
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
	.datac(!a[22]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a112),
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
	.datac(!a[23]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a117),
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
	.datac(!a[24]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a122),
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
	.datac(!a[25]),
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
	.datac(!a[27]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a82),
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
	.datac(!a[28]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a137),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a141_sumout),
	.cout(fp_functions_0_aadd_0_a142),
	.shareout());
defparam fp_functions_0_aadd_0_a141.extended_lut = "off";
defparam fp_functions_0_aadd_0_a141.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a141.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a146(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a157),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a146_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_0_a146.extended_lut = "off";
defparam fp_functions_0_aadd_0_a146.lut_mask = 64'h0000000000000000;
defparam fp_functions_0_aadd_0_a146.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a151(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[29]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a142),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a151_sumout),
	.cout(fp_functions_0_aadd_0_a152),
	.shareout());
defparam fp_functions_0_aadd_0_a151.extended_lut = "off";
defparam fp_functions_0_aadd_0_a151.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a151.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a156(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[30]),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a152),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a156_sumout),
	.cout(fp_functions_0_aadd_0_a157),
	.shareout());
defparam fp_functions_0_aadd_0_a156.extended_lut = "off";
defparam fp_functions_0_aadd_0_a156.lut_mask = 64'h0000000000005A5A;
defparam fp_functions_0_aadd_0_a156.shared_arith = "off";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a41_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a56_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a46_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a6_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a31_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a1_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a11_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a51_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a36_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_ai1225_a117_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_aq));
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_asticky_uid20_fxpToFPTest_delay_adelay_signals_a0_a_a0_a(
	.clk(clk),
	.d(fp_functions_0_areduce_or_0_a1_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
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

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a16_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a21_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a61_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a26_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a66_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a71_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a(
	.clk(clk),
	.d(fp_functions_0_aadd_0_a76_sumout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a(
	.clk(clk),
	.d(fp_functions_0_ai728_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(areset),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_aq));
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a.is_wysiwyg = "true";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a.power_up = "dont_care";

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

fourteennm_lcell_comb fp_functions_0_ai1225_a3(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a15_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_ai1225_a3_cout),
	.shareout());
defparam fp_functions_0_ai1225_a3.extended_lut = "off";
defparam fp_functions_0_ai1225_a3.lut_mask = 64'h0000000004150000;
defparam fp_functions_0_ai1225_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a7(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a14_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a16_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a3_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a7_sumout),
	.cout(fp_functions_0_ai1225_a8),
	.shareout());
defparam fp_functions_0_ai1225_a7.extended_lut = "off";
defparam fp_functions_0_ai1225_a7.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a12(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a13_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a15_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a8),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a12_sumout),
	.cout(fp_functions_0_ai1225_a13),
	.shareout());
defparam fp_functions_0_ai1225_a12.extended_lut = "off";
defparam fp_functions_0_ai1225_a12.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a17(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a101_sumout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a14_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a13),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a17_sumout),
	.cout(fp_functions_0_ai1225_a18),
	.shareout());
defparam fp_functions_0_ai1225_a17.extended_lut = "off";
defparam fp_functions_0_ai1225_a17.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a22(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a81_sumout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a13_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a18),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a22_sumout),
	.cout(fp_functions_0_ai1225_a23),
	.shareout());
defparam fp_functions_0_ai1225_a22.extended_lut = "off";
defparam fp_functions_0_ai1225_a22.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a27(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a61_sumout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a101_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a23),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a27_sumout),
	.cout(fp_functions_0_ai1225_a28),
	.shareout());
defparam fp_functions_0_ai1225_a27.extended_lut = "off";
defparam fp_functions_0_ai1225_a27.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a32(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a41_sumout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a81_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a28),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a32_sumout),
	.cout(fp_functions_0_ai1225_a33),
	.shareout());
defparam fp_functions_0_ai1225_a32.extended_lut = "off";
defparam fp_functions_0_ai1225_a32.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a37(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a96_sumout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a61_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a33),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a37_sumout),
	.cout(fp_functions_0_ai1225_a38),
	.shareout());
defparam fp_functions_0_ai1225_a37.extended_lut = "off";
defparam fp_functions_0_ai1225_a37.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a42(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a76_sumout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a41_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a38),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a42_sumout),
	.cout(fp_functions_0_ai1225_a43),
	.shareout());
defparam fp_functions_0_ai1225_a42.extended_lut = "off";
defparam fp_functions_0_ai1225_a42.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a47(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a56_sumout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a96_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a43),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a47_sumout),
	.cout(fp_functions_0_ai1225_a48),
	.shareout());
defparam fp_functions_0_ai1225_a47.extended_lut = "off";
defparam fp_functions_0_ai1225_a47.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a52(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a36_sumout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a76_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a48),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a52_sumout),
	.cout(fp_functions_0_ai1225_a53),
	.shareout());
defparam fp_functions_0_ai1225_a52.extended_lut = "off";
defparam fp_functions_0_ai1225_a52.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a52.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a57(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a91_sumout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a56_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a53),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a57_sumout),
	.cout(fp_functions_0_ai1225_a58),
	.shareout());
defparam fp_functions_0_ai1225_a57.extended_lut = "off";
defparam fp_functions_0_ai1225_a57.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a57.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a62(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a71_sumout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a36_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a58),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a62_sumout),
	.cout(fp_functions_0_ai1225_a63),
	.shareout());
defparam fp_functions_0_ai1225_a62.extended_lut = "off";
defparam fp_functions_0_ai1225_a62.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a62.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a67(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a51_sumout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a91_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a63),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a67_sumout),
	.cout(fp_functions_0_ai1225_a68),
	.shareout());
defparam fp_functions_0_ai1225_a67.extended_lut = "off";
defparam fp_functions_0_ai1225_a67.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a67.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a72(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a31_sumout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a71_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a68),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a72_sumout),
	.cout(fp_functions_0_ai1225_a73),
	.shareout());
defparam fp_functions_0_ai1225_a72.extended_lut = "off";
defparam fp_functions_0_ai1225_a72.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a72.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a77(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a12_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a51_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a73),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a77_sumout),
	.cout(fp_functions_0_ai1225_a78),
	.shareout());
defparam fp_functions_0_ai1225_a77.extended_lut = "off";
defparam fp_functions_0_ai1225_a77.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a77.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a82(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a11_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a31_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a78),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a82_sumout),
	.cout(fp_functions_0_ai1225_a83),
	.shareout());
defparam fp_functions_0_ai1225_a82.extended_lut = "off";
defparam fp_functions_0_ai1225_a82.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a82.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a87(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a10_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a12_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a83),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a87_sumout),
	.cout(fp_functions_0_ai1225_a88),
	.shareout());
defparam fp_functions_0_ai1225_a87.extended_lut = "off";
defparam fp_functions_0_ai1225_a87.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a87.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a92(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a9_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a11_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a88),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a92_sumout),
	.cout(fp_functions_0_ai1225_a93),
	.shareout());
defparam fp_functions_0_ai1225_a92.extended_lut = "off";
defparam fp_functions_0_ai1225_a92.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a92.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a97(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a7_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a10_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a93),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a97_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1225_a97.extended_lut = "off";
defparam fp_functions_0_ai1225_a97.lut_mask = 64'h000000000000082A;
defparam fp_functions_0_ai1225_a97.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a103(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a7_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a10_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_ai1225_a103_cout),
	.shareout());
defparam fp_functions_0_ai1225_a103.extended_lut = "off";
defparam fp_functions_0_ai1225_a103.lut_mask = 64'h0000000004150000;
defparam fp_functions_0_ai1225_a103.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a107(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a8_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a9_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a103_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a107_sumout),
	.cout(fp_functions_0_ai1225_a108),
	.shareout());
defparam fp_functions_0_ai1225_a107.extended_lut = "off";
defparam fp_functions_0_ai1225_a107.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a107.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a112(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a6_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a7_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a108),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a112_sumout),
	.cout(fp_functions_0_ai1225_a113),
	.shareout());
defparam fp_functions_0_ai1225_a112.extended_lut = "off";
defparam fp_functions_0_ai1225_a112.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a112.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a117(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a20_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a8_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a113),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_ai1225_a117_sumout),
	.cout(fp_functions_0_ai1225_a118),
	.shareout());
defparam fp_functions_0_ai1225_a117.extended_lut = "off";
defparam fp_functions_0_ai1225_a117.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_ai1225_a117.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a6_a_a1(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_a24_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a6_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_ai1225_a118),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a6_a_a1_sumout),
	.cout(fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a6_a_a2),
	.shareout());
defparam fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a6_a_a1.extended_lut = "off";
defparam fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a6_a_a1.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a6_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a5_a_a6(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_a22_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a20_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a6_a_a2),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a5_a_a6_sumout),
	.cout(fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a5_a_a7),
	.shareout());
defparam fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a5_a_a6.extended_lut = "off";
defparam fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a5_a_a6.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a5_a_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a4_a_a11(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a23_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_a24_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a5_a_a7),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a4_a_a11_sumout),
	.cout(fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a4_a_a12),
	.shareout());
defparam fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a4_a_a11.extended_lut = "off";
defparam fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a4_a_a11.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a4_a_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a3_a_a16(
	.dataa(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1_combout),
	.datab(!fp_functions_0_areduce_nor_4_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a21_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_a22_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a4_a_a12),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a3_a_a16_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a3_a_a16.extended_lut = "off";
defparam fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a3_a_a16.lut_mask = 64'h000000000000082A;
defparam fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a3_a_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a27(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a27_cout),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a27.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a27.lut_mask = 64'h0000000004150000;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a31(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a27_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a31_sumout),
	.cout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a32),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a31.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a31.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a31.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a36(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a32),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a36_sumout),
	.cout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a37),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a36.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a36.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a36.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a41(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a37),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a41_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a41.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a41.lut_mask = 64'h000000000000082A;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a41.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a47(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a47_cout),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a47.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a47.lut_mask = 64'h0000000004150000;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a51(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a47_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a51_sumout),
	.cout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a52),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a51.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a51.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a51.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a56(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a52),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a56_sumout),
	.cout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a57),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a56.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a56.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a56.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a61(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a57),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a61_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a61.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a61.lut_mask = 64'h000000000000082A;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a61.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a67(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a67_cout),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a67.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a67.lut_mask = 64'h0000000004150000;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a67.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a71(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a67_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a71_sumout),
	.cout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a72),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a71.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a71.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a71.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a76(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a72),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a76_sumout),
	.cout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a77),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a76.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a76.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a76.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a81(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a77),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a81_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a81.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a81.lut_mask = 64'h000000000000082A;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a81.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a87(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a87_cout),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a87.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a87.lut_mask = 64'h0000000004150000;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a87.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a91(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a87_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a91_sumout),
	.cout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a92),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a91.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a91.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a91.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a96(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a92),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a96_sumout),
	.cout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a97),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a96.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a96.lut_mask = 64'h000000000415082A;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a96.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a101(
	.dataa(!fp_functions_0_areduce_nor_3_acombout),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a97),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a101_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a101.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a101.lut_mask = 64'h000000000000082A;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a101.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1201_a0(
	.dataa(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a18_combout),
	.datab(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a5_combout),
	.datac(!en[0]),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17_combout),
	.datae(!fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a23_a_aq),
	.dataf(!en[0]),
	.datag(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a16_combout),
	.datah(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a19_combout),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1201_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1201_a0.extended_lut = "on";
defparam fp_functions_0_ai1201_a0.lut_mask = 64'h0109F1F9050DF5FD;
defparam fp_functions_0_ai1201_a0.shared_arith = "off";

fourteennm_ff fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a(
	.clk(clk),
	.d(fp_functions_0_ai1125_a0_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq));
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a.is_wysiwyg = "true";
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a(
	.clk(clk),
	.d(fp_functions_0_ai1125_a1_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq));
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a.is_wysiwyg = "true";
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a(
	.clk(clk),
	.d(fp_functions_0_ai1125_a5_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq));
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a.is_wysiwyg = "true";
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a(
	.clk(clk),
	.d(fp_functions_0_ai1125_a2_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq));
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a.is_wysiwyg = "true";
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a(
	.clk(clk),
	.d(fp_functions_0_ai1125_a3_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq));
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a.is_wysiwyg = "true";
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a.power_up = "dont_care";

fourteennm_ff fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a(
	.clk(clk),
	.d(fp_functions_0_ai1125_a4_combout),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sclr1(gnd),
	.q(fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq));
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a.is_wysiwyg = "true";
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a.power_up = "dont_care";

fourteennm_lcell_comb fp_functions_0_areduce_nor_5_a0(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq),
	.datab(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq),
	.datac(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq),
	.datad(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq),
	.datae(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_5_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_5_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_5_a0.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_5_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a0_a_a0(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a1_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a0_a_a0.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a1_a_a1(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a6_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a1_a_a1.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a1_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a2_a_a2(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a11_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a2_a_a2.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a2_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a3_a_a3(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a16_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a3_a_a3.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a3_a_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a4_a_a4(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a21_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a4_a_a4.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a4_a_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a5_a_a5(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a26_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a5_a_a5.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a5_a_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a6_a_a6(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a31_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a6_a_a6.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a6_a_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a7_a_a7(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a36_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a7_a_a7.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a7_a_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a8_a_a8(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a41_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a8_a_a8.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a8_a_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a9_a_a9(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a46_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a9_a_a9.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a9_a_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a10_a_a10(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a51_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a10_a_a10.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a10_a_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a11_a_a11(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a56_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a11_a_a11.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a11_a_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a12_a_a12(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a61_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a12_a_a12.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a12_a_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a13_a_a13(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a66_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a13_a_a13.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a13_a_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a14_a_a14(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a71_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a14_a_a14.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a14_a_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a15_a_a15(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a76_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a15_a_a15.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a15_a_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a16_a_a16(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a81_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a16_a_a16.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a16_a_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a17_a_a17(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a86_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a17_a_a17.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a17_a_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a18_a_a18(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a91_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a18_a_a18.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a18_a_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a19_a_a19(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a96_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a19_a_a19.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a19_a_a19.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a20_a_a20(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a101_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a20_a_a20.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a20_a_a20.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a21_a_a21(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a106_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a21_a_a21.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a21_a_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a22_a_a22(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a111_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a22_a_a22.lut_mask = 64'h00000E0000000E00;
defparam fp_functions_0_aoutRes_uid40_fxpToFPTest_q_a22_a_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_7_a2(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a116_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aMux_7_a2.lut_mask = 64'h00FF0EFF00FF0EFF;
defparam fp_functions_0_aMux_7_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_6_a2(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a121_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aMux_6_a2.lut_mask = 64'h00FF0EFF00FF0EFF;
defparam fp_functions_0_aMux_6_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_5_a2(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a126_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aMux_5_a2.lut_mask = 64'h00FF0EFF00FF0EFF;
defparam fp_functions_0_aMux_5_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_4_a2(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a131_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aMux_4_a2.lut_mask = 64'h00FF0EFF00FF0EFF;
defparam fp_functions_0_aMux_4_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_3_a2(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a136_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aMux_3_a2.lut_mask = 64'h00FF0EFF00FF0EFF;
defparam fp_functions_0_aMux_3_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_2_a2(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a141_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aMux_2_a2.lut_mask = 64'h00FF0EFF00FF0EFF;
defparam fp_functions_0_aMux_2_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_1_a2(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a146_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aMux_1_a2.lut_mask = 64'h00FF0EFF00FF0EFF;
defparam fp_functions_0_aMux_1_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aMux_0_a2(
	.dataa(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aadd_3_a151_sumout),
	.datad(!fp_functions_0_aadd_4_a1_sumout),
	.datae(!fp_functions_0_aadd_5_a1_sumout),
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
defparam fp_functions_0_aMux_0_a2.lut_mask = 64'h00FF0EFF00FF0EFF;
defparam fp_functions_0_aMux_0_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a8(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a8.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a8.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_2(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a8_combout),
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
defparam fp_functions_0_areduce_nor_2.lut_mask = 64'h0000800000008000;
defparam fp_functions_0_areduce_nor_2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a9(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a9.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a9.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a10(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a10.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a10.lut_mask = 64'h8000000000000000;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a11(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a9_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a10_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a11.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a11.lut_mask = 64'hA8A8A8A8A8A8A8A8;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_aq),
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
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13.lut_mask = 64'h8000000000000000;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13_combout),
	.datad(gnd),
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
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14.lut_mask = 64'hA8A8A8A8A8A8A8A8;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a15(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a15_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a15.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a15.lut_mask = 64'h8000000000000000;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a16(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a19_a_aq),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a15_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a16_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a16.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a16.lut_mask = 64'hCCC4CCC4CCC4CCC4;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a17(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a17_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a17.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a17.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a18(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a18_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a18.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a18.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a17_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a18_combout),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a10_combout),
	.dataf(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4.lut_mask = 64'h8888808088008000;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_a0(
	.dataa(!fp_functions_0_areduce_nor_2_acombout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a11_combout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_a0.extended_lut = "off";
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_a0.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1125_a0(
	.dataa(!areset),
	.datab(!fp_functions_0_aredist2_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1125_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1125_a0.extended_lut = "off";
defparam fp_functions_0_ai1125_a0.lut_mask = 64'h2222222222222222;
defparam fp_functions_0_ai1125_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0(
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
	.combout(fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0.extended_lut = "off";
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0.lut_mask = 64'h7777777777777777;
defparam fp_functions_0_aredist0_fracRnd_uid15_fxpToFPTest_merged_bit_select_b_1_q_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1125_a1(
	.dataa(!areset),
	.datab(!fp_functions_0_aredist2_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datac(!fp_functions_0_aredist1_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1125_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1125_a1.extended_lut = "off";
defparam fp_functions_0_ai1125_a1.lut_mask = 64'h0808080808080808;
defparam fp_functions_0_ai1125_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3_a0(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a9_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a12_combout),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a10_combout),
	.dataf(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_3_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_3_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_3_a0.lut_mask = 64'h8888808088008000;
defparam fp_functions_0_areduce_nor_3_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3(
	.dataa(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.datab(!fp_functions_0_areduce_nor_3_a0_combout),
	.datac(gnd),
	.datad(gnd),
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
defparam fp_functions_0_areduce_nor_3.lut_mask = 64'h1111111111111111;
defparam fp_functions_0_areduce_nor_3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1125_a2(
	.dataa(!areset),
	.datab(!fp_functions_0_aredist2_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datac(!fp_functions_0_aredist1_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datad(!fp_functions_0_areduce_nor_3_acombout),
	.datae(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1125_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1125_a2.extended_lut = "off";
defparam fp_functions_0_ai1125_a2.lut_mask = 64'h008800A8008800A8;
defparam fp_functions_0_ai1125_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a19(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a17_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a10_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a19_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a19.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a19.lut_mask = 64'hA8A8A8A8A8A8A8A8;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a19.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a20(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a18_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a13_combout),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a20_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a20.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a20.lut_mask = 64'hA8A8A8A8A8A8A8A8;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a20.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a21(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_aq),
	.datad(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq),
	.datae(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq),
	.dataf(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_aq),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a21_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a21.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a21.lut_mask = 64'h8000000000000000;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a22(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a18_a_aq),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a21_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a22_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a22.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a22.lut_mask = 64'hAAA2AAA2AAA2AAA2;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_4(
	.dataa(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a11_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a16_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a19_combout),
	.datae(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a20_combout),
	.dataf(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a22_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_4_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_4.extended_lut = "off";
defparam fp_functions_0_areduce_nor_4.lut_mask = 64'hFFAAFFBBFFAAFFBA;
defparam fp_functions_0_areduce_nor_4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1125_a3(
	.dataa(!areset),
	.datab(!fp_functions_0_aredist2_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datac(!fp_functions_0_aredist1_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datad(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_a0_combout),
	.datae(!fp_functions_0_areduce_nor_4_acombout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1125_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1125_a3.extended_lut = "off";
defparam fp_functions_0_ai1125_a3.lut_mask = 64'h88A8000088A80000;
defparam fp_functions_0_ai1125_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a5(
	.dataa(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a11_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a16_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a5.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a5.lut_mask = 64'hAABAAABAAABAAABA;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a23(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a17_a_aq),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a21_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a23_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a23.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a23.lut_mask = 64'hCCC4CCC4CCC4CCC4;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a23.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0(
	.dataa(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a19_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a20_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a22_combout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a23_combout),
	.datae(!fp_functions_0_areduce_nor_3_a0_combout),
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
defparam fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0.lut_mask = 64'h4444454444444544;
defparam fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1125_a4(
	.dataa(!areset),
	.datab(!fp_functions_0_aredist2_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datac(!fp_functions_0_aredist1_vCount_uid49_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a5_combout),
	.datae(!fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a0_combout),
	.dataf(!fp_functions_0_avCountFinal_uid86_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_a0_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1125_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1125_a4.extended_lut = "off";
defparam fp_functions_0_ai1125_a4.lut_mask = 64'h88000000A8000000;
defparam fp_functions_0_ai1125_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a0(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a6_sumout),
	.datac(!fp_functions_0_aadd_0_a11_sumout),
	.datad(!fp_functions_0_aadd_0_a16_sumout),
	.datae(!fp_functions_0_aadd_0_a21_sumout),
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
	.dataa(!fp_functions_0_aadd_0_a36_sumout),
	.datab(!fp_functions_0_aadd_0_a41_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
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
defparam fp_functions_0_areduce_nor_0_a1.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_areduce_nor_0_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a2(
	.dataa(!fp_functions_0_aadd_0_a31_sumout),
	.datab(!fp_functions_0_areduce_nor_0_a1_combout),
	.datac(!fp_functions_0_aadd_0_a46_sumout),
	.datad(!fp_functions_0_aadd_0_a51_sumout),
	.datae(!fp_functions_0_aadd_0_a56_sumout),
	.dataf(!fp_functions_0_aadd_0_a61_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a2.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a2.lut_mask = 64'h2000000000000000;
defparam fp_functions_0_areduce_nor_0_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a3(
	.dataa(!fp_functions_0_areduce_nor_0_a0_combout),
	.datab(!fp_functions_0_aadd_0_a26_sumout),
	.datac(!fp_functions_0_areduce_nor_0_a2_combout),
	.datad(!fp_functions_0_aadd_0_a66_sumout),
	.datae(!fp_functions_0_aadd_0_a71_sumout),
	.dataf(!fp_functions_0_aadd_0_a76_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0_a3.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0_a3.lut_mask = 64'h0400000000000000;
defparam fp_functions_0_areduce_nor_0_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai718_a1(
	.dataa(!fp_functions_0_aadd_0_a91_sumout),
	.datab(!fp_functions_0_aadd_0_a96_sumout),
	.datac(!fp_functions_0_aadd_0_a101_sumout),
	.datad(!fp_functions_0_aadd_0_a106_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai718_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai718_a1.extended_lut = "off";
defparam fp_functions_0_ai718_a1.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_ai718_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai718_a2(
	.dataa(!fp_functions_0_aadd_0_a86_sumout),
	.datab(!fp_functions_0_ai718_a1_combout),
	.datac(!fp_functions_0_aadd_0_a111_sumout),
	.datad(!fp_functions_0_aadd_0_a116_sumout),
	.datae(!fp_functions_0_aadd_0_a121_sumout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai718_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai718_a2.extended_lut = "off";
defparam fp_functions_0_ai718_a2.lut_mask = 64'h2000000020000000;
defparam fp_functions_0_ai718_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai718_a3(
	.dataa(!fp_functions_0_aadd_0_a126_sumout),
	.datab(!fp_functions_0_aadd_0_a131_sumout),
	.datac(!fp_functions_0_aadd_0_a136_sumout),
	.datad(!fp_functions_0_aadd_0_a141_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai718_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai718_a3.extended_lut = "off";
defparam fp_functions_0_ai718_a3.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_ai718_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai718_a4(
	.dataa(!fp_functions_0_aadd_0_a151_sumout),
	.datab(!fp_functions_0_aadd_0_a156_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai718_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai718_a4.extended_lut = "off";
defparam fp_functions_0_ai718_a4.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_ai718_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0(
	.dataa(!fp_functions_0_areduce_nor_0_a3_combout),
	.datab(!fp_functions_0_aadd_0_a81_sumout),
	.datac(!fp_functions_0_ai718_a2_combout),
	.datad(!fp_functions_0_ai718_a3_combout),
	.datae(!fp_functions_0_aadd_0_a146_sumout),
	.dataf(!fp_functions_0_ai718_a4_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0.lut_mask = 64'h0000000000040000;
defparam fp_functions_0_areduce_nor_0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_1_a0(
	.dataa(!fp_functions_0_aadd_0_a81_sumout),
	.datab(!fp_functions_0_ai718_a2_combout),
	.datac(!fp_functions_0_aadd_0_a151_sumout),
	.datad(!fp_functions_0_ai718_a3_combout),
	.datae(!fp_functions_0_aadd_0_a156_sumout),
	.dataf(!fp_functions_0_aadd_0_a146_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_1_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_1_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_1_a0.lut_mask = 64'h0020000000000000;
defparam fp_functions_0_areduce_nor_1_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai714_a1(
	.dataa(!fp_functions_0_aadd_0_a71_sumout),
	.datab(!fp_functions_0_aadd_0_a151_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai714_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai714_a1.extended_lut = "off";
defparam fp_functions_0_ai714_a1.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_ai714_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai714_a2(
	.dataa(!fp_functions_0_aadd_0_a81_sumout),
	.datab(!fp_functions_0_ai718_a2_combout),
	.datac(!fp_functions_0_ai718_a3_combout),
	.datad(!fp_functions_0_aadd_0_a156_sumout),
	.datae(!fp_functions_0_ai714_a1_combout),
	.dataf(!fp_functions_0_aadd_0_a146_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai714_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai714_a2.extended_lut = "off";
defparam fp_functions_0_ai714_a2.lut_mask = 64'h00FF02FF00FF00FF;
defparam fp_functions_0_ai714_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai718_a5(
	.dataa(!fp_functions_0_aadd_0_a126_sumout),
	.datab(!fp_functions_0_aadd_0_a131_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai718_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai718_a5.extended_lut = "off";
defparam fp_functions_0_ai718_a5.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_ai718_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai719_a1(
	.dataa(!fp_functions_0_aadd_0_a81_sumout),
	.datab(!fp_functions_0_aadd_0_a151_sumout),
	.datac(!fp_functions_0_aadd_0_a156_sumout),
	.datad(!fp_functions_0_aadd_0_a146_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai719_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai719_a1.extended_lut = "off";
defparam fp_functions_0_ai719_a1.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_ai719_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai716_a1(
	.dataa(!fp_functions_0_aadd_0_a26_sumout),
	.datab(!fp_functions_0_ai718_a5_combout),
	.datac(!fp_functions_0_ai718_a2_combout),
	.datad(!fp_functions_0_aadd_0_a136_sumout),
	.datae(!fp_functions_0_aadd_0_a141_sumout),
	.dataf(!fp_functions_0_ai719_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai716_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai716_a1.extended_lut = "off";
defparam fp_functions_0_ai716_a1.lut_mask = 64'h0000FFFF0100FFFF;
defparam fp_functions_0_ai716_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai715_a1(
	.dataa(!fp_functions_0_aadd_0_a66_sumout),
	.datab(!fp_functions_0_aadd_0_a156_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai715_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai715_a1.extended_lut = "off";
defparam fp_functions_0_ai715_a1.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_ai715_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai715_a2(
	.dataa(!fp_functions_0_aadd_0_a81_sumout),
	.datab(!fp_functions_0_ai718_a2_combout),
	.datac(!fp_functions_0_aadd_0_a151_sumout),
	.datad(!fp_functions_0_ai718_a3_combout),
	.datae(!fp_functions_0_aadd_0_a146_sumout),
	.dataf(!fp_functions_0_ai715_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai715_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai715_a2.extended_lut = "off";
defparam fp_functions_0_ai715_a2.lut_mask = 64'h0F0F0F0F0F2F0F0F;
defparam fp_functions_0_ai715_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai713_a1(
	.dataa(!fp_functions_0_aadd_0_a76_sumout),
	.datab(!fp_functions_0_aadd_0_a81_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai713_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai713_a1.extended_lut = "off";
defparam fp_functions_0_ai713_a1.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_ai713_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai713_a2(
	.dataa(!fp_functions_0_ai718_a2_combout),
	.datab(!fp_functions_0_ai713_a1_combout),
	.datac(!fp_functions_0_aadd_0_a151_sumout),
	.datad(!fp_functions_0_ai718_a3_combout),
	.datae(!fp_functions_0_aadd_0_a156_sumout),
	.dataf(!fp_functions_0_aadd_0_a146_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai713_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai713_a2.extended_lut = "off";
defparam fp_functions_0_ai713_a2.lut_mask = 64'h00100000FFFFFFFF;
defparam fp_functions_0_ai713_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai718_a6(
	.dataa(!fp_functions_0_aadd_0_a21_sumout),
	.datab(!fp_functions_0_aadd_0_a81_sumout),
	.datac(!fp_functions_0_ai718_a2_combout),
	.datad(!fp_functions_0_ai718_a3_combout),
	.datae(!fp_functions_0_aadd_0_a146_sumout),
	.dataf(!fp_functions_0_ai718_a4_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai718_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai718_a6.extended_lut = "off";
defparam fp_functions_0_ai718_a6.lut_mask = 64'h3333333333373333;
defparam fp_functions_0_ai718_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai718_a7(
	.dataa(!fp_functions_0_aadd_0_a136_sumout),
	.datab(!fp_functions_0_aadd_0_a141_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai718_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai718_a7.extended_lut = "off";
defparam fp_functions_0_ai718_a7.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_ai718_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai719_a2(
	.dataa(!fp_functions_0_aadd_0_a16_sumout),
	.datab(!fp_functions_0_aadd_0_a126_sumout),
	.datac(!fp_functions_0_aadd_0_a131_sumout),
	.datad(!fp_functions_0_ai718_a2_combout),
	.datae(!fp_functions_0_ai718_a7_combout),
	.dataf(!fp_functions_0_ai719_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai719_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai719_a2.extended_lut = "off";
defparam fp_functions_0_ai719_a2.lut_mask = 64'h0F0F0F0F0F0F0F4F;
defparam fp_functions_0_ai719_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai720_a1(
	.dataa(!fp_functions_0_aadd_0_a11_sumout),
	.datab(!fp_functions_0_aadd_0_a126_sumout),
	.datac(!fp_functions_0_aadd_0_a131_sumout),
	.datad(!fp_functions_0_ai718_a2_combout),
	.datae(!fp_functions_0_ai718_a7_combout),
	.dataf(!fp_functions_0_ai719_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai720_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai720_a1.extended_lut = "off";
defparam fp_functions_0_ai720_a1.lut_mask = 64'h3333333333333373;
defparam fp_functions_0_ai720_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai717_a1(
	.dataa(!fp_functions_0_aadd_0_a61_sumout),
	.datab(!fp_functions_0_ai718_a5_combout),
	.datac(!fp_functions_0_ai718_a2_combout),
	.datad(!fp_functions_0_aadd_0_a136_sumout),
	.datae(!fp_functions_0_aadd_0_a141_sumout),
	.dataf(!fp_functions_0_ai719_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai717_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai717_a1.extended_lut = "off";
defparam fp_functions_0_ai717_a1.lut_mask = 64'h00FF00FF01FF00FF;
defparam fp_functions_0_ai717_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai718_a8(
	.dataa(!fp_functions_0_aadd_0_a86_sumout),
	.datab(!fp_functions_0_aadd_0_a111_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai718_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai718_a8.extended_lut = "off";
defparam fp_functions_0_ai718_a8.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_ai718_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai721_a1(
	.dataa(!fp_functions_0_aadd_0_a6_sumout),
	.datab(!fp_functions_0_aadd_0_a116_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai721_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai721_a1.extended_lut = "off";
defparam fp_functions_0_ai721_a1.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_ai721_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai721_a2(
	.dataa(!fp_functions_0_ai718_a1_combout),
	.datab(!fp_functions_0_ai718_a8_combout),
	.datac(!fp_functions_0_aadd_0_a121_sumout),
	.datad(!fp_functions_0_ai721_a1_combout),
	.datae(!fp_functions_0_ai718_a3_combout),
	.dataf(!fp_functions_0_ai719_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai721_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai721_a2.extended_lut = "off";
defparam fp_functions_0_ai721_a2.lut_mask = 64'h0F0F0F0F0F0F0F1F;
defparam fp_functions_0_ai721_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai724_a1(
	.dataa(!fp_functions_0_aadd_0_a51_sumout),
	.datab(!fp_functions_0_aadd_0_a111_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai724_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai724_a1.extended_lut = "off";
defparam fp_functions_0_ai724_a1.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_ai724_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai718_a9(
	.dataa(!fp_functions_0_aadd_0_a116_sumout),
	.datab(!fp_functions_0_aadd_0_a121_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai718_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai718_a9.extended_lut = "off";
defparam fp_functions_0_ai718_a9.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_ai718_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai724_a2(
	.dataa(!fp_functions_0_aadd_0_a86_sumout),
	.datab(!fp_functions_0_ai718_a1_combout),
	.datac(!fp_functions_0_ai724_a1_combout),
	.datad(!fp_functions_0_ai718_a9_combout),
	.datae(!fp_functions_0_ai718_a3_combout),
	.dataf(!fp_functions_0_ai719_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai724_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai724_a2.extended_lut = "off";
defparam fp_functions_0_ai724_a2.lut_mask = 64'h5555555555555557;
defparam fp_functions_0_ai724_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai718_a10(
	.dataa(!fp_functions_0_aadd_0_a91_sumout),
	.datab(!fp_functions_0_aadd_0_a96_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai718_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai718_a10.extended_lut = "off";
defparam fp_functions_0_ai718_a10.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_ai718_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai725_a1(
	.dataa(!fp_functions_0_aadd_0_a46_sumout),
	.datab(!fp_functions_0_aadd_0_a101_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai725_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai725_a1.extended_lut = "off";
defparam fp_functions_0_ai725_a1.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_ai725_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai718_a11(
	.dataa(!fp_functions_0_aadd_0_a86_sumout),
	.datab(!fp_functions_0_aadd_0_a111_sumout),
	.datac(!fp_functions_0_aadd_0_a116_sumout),
	.datad(!fp_functions_0_aadd_0_a121_sumout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai718_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai718_a11.extended_lut = "off";
defparam fp_functions_0_ai718_a11.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_ai718_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai725_a2(
	.dataa(!fp_functions_0_ai718_a10_combout),
	.datab(!fp_functions_0_aadd_0_a106_sumout),
	.datac(!fp_functions_0_ai725_a1_combout),
	.datad(!fp_functions_0_ai718_a11_combout),
	.datae(!fp_functions_0_ai718_a3_combout),
	.dataf(!fp_functions_0_ai719_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai725_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai725_a2.extended_lut = "off";
defparam fp_functions_0_ai725_a2.lut_mask = 64'h3333333333333337;
defparam fp_functions_0_ai725_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai722_a1(
	.dataa(!fp_functions_0_aadd_0_a1_sumout),
	.datab(!fp_functions_0_aadd_0_a121_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai722_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai722_a1.extended_lut = "off";
defparam fp_functions_0_ai722_a1.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_ai722_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai722_a2(
	.dataa(!fp_functions_0_ai718_a1_combout),
	.datab(!fp_functions_0_ai718_a8_combout),
	.datac(!fp_functions_0_aadd_0_a116_sumout),
	.datad(!fp_functions_0_ai722_a1_combout),
	.datae(!fp_functions_0_ai718_a3_combout),
	.dataf(!fp_functions_0_ai719_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai722_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai722_a2.extended_lut = "off";
defparam fp_functions_0_ai722_a2.lut_mask = 64'h0F0F0F0F0F0F0F1F;
defparam fp_functions_0_ai722_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai723_a1(
	.dataa(!fp_functions_0_aadd_0_a56_sumout),
	.datab(!fp_functions_0_aadd_0_a86_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai723_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai723_a1.extended_lut = "off";
defparam fp_functions_0_ai723_a1.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_ai723_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai723_a2(
	.dataa(!fp_functions_0_ai718_a1_combout),
	.datab(!fp_functions_0_aadd_0_a111_sumout),
	.datac(!fp_functions_0_ai723_a1_combout),
	.datad(!fp_functions_0_ai718_a9_combout),
	.datae(!fp_functions_0_ai718_a3_combout),
	.dataf(!fp_functions_0_ai719_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai723_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai723_a2.extended_lut = "off";
defparam fp_functions_0_ai723_a2.lut_mask = 64'h3333333333333337;
defparam fp_functions_0_ai723_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai726_a1(
	.dataa(!fp_functions_0_aadd_0_a31_sumout),
	.datab(!fp_functions_0_aadd_0_a106_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai726_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai726_a1.extended_lut = "off";
defparam fp_functions_0_ai726_a1.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_ai726_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai726_a2(
	.dataa(!fp_functions_0_ai718_a10_combout),
	.datab(!fp_functions_0_aadd_0_a101_sumout),
	.datac(!fp_functions_0_ai726_a1_combout),
	.datad(!fp_functions_0_ai718_a11_combout),
	.datae(!fp_functions_0_ai718_a3_combout),
	.dataf(!fp_functions_0_ai719_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai726_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai726_a2.extended_lut = "off";
defparam fp_functions_0_ai726_a2.lut_mask = 64'h3333333333333337;
defparam fp_functions_0_ai726_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai727_a1(
	.dataa(!fp_functions_0_aadd_0_a41_sumout),
	.datab(!fp_functions_0_aadd_0_a91_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai727_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai727_a1.extended_lut = "off";
defparam fp_functions_0_ai727_a1.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_ai727_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai718_a12(
	.dataa(!fp_functions_0_aadd_0_a101_sumout),
	.datab(!fp_functions_0_aadd_0_a106_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai718_a12_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai718_a12.extended_lut = "off";
defparam fp_functions_0_ai718_a12.lut_mask = 64'h8888888888888888;
defparam fp_functions_0_ai718_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai727_a2(
	.dataa(!fp_functions_0_aadd_0_a96_sumout),
	.datab(!fp_functions_0_ai727_a1_combout),
	.datac(!fp_functions_0_ai718_a12_combout),
	.datad(!fp_functions_0_ai718_a11_combout),
	.datae(!fp_functions_0_ai718_a3_combout),
	.dataf(!fp_functions_0_ai719_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai727_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai727_a2.extended_lut = "off";
defparam fp_functions_0_ai727_a2.lut_mask = 64'h5555555555555557;
defparam fp_functions_0_ai727_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a6(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.datae(!fp_functions_0_areduce_nor_3_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a6_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a6.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a6.lut_mask = 64'h3030305030303050;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a6.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a7(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a_aq),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.datae(!fp_functions_0_areduce_nor_3_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a7_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a7.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a7.lut_mask = 64'h3030305030303050;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a8(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_aq),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.datae(!fp_functions_0_areduce_nor_3_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a8_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a8.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a8.lut_mask = 64'h3030305030303050;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a8.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a9(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a8_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq),
	.datad(!fp_functions_0_areduce_nor_2_acombout),
	.datae(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.dataf(!fp_functions_0_areduce_nor_3_a0_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a9_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a9.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a9.lut_mask = 64'h550F550F550F3300;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a9.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1(
	.dataa(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a5_combout),
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
defparam fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1.lut_mask = 64'h7777777777777777;
defparam fp_functions_0_arVStage_uid76_lzcShifterZ1_uid10_fxpToFPTest_merged_bit_select_b_a0_a_a1.shared_arith = "off";

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

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a10(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a5_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a9_a_aq),
	.datad(!fp_functions_0_areduce_nor_2_acombout),
	.datae(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.dataf(!fp_functions_0_areduce_nor_3_a0_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a10_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a10.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a10.lut_mask = 64'h0F550F550F553300;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a10.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a11(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a6_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a10_a_aq),
	.datad(!fp_functions_0_areduce_nor_2_acombout),
	.datae(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.dataf(!fp_functions_0_areduce_nor_3_a0_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a11_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a11.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a11.lut_mask = 64'h0F550F550F553300;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a11.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a12(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a7_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a11_a_aq),
	.datad(!fp_functions_0_areduce_nor_2_acombout),
	.datae(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.dataf(!fp_functions_0_areduce_nor_3_a0_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a12_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a12.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a12.lut_mask = 64'h0F550F550F553300;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a24(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_aq),
	.datac(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a16_a_aq),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a15_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a24_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a24.extended_lut = "off";
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a24.lut_mask = 64'hAAA2AAA2AAA2AAA2;
defparam fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a24.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a13(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a20_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a12_a_aq),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a24_combout),
	.datae(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.dataf(!fp_functions_0_areduce_nor_3_a0_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a13_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a13.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a13.lut_mask = 64'hFF00FF00FF005353;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a13.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a14(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a21_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a13_a_aq),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a23_combout),
	.datae(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.dataf(!fp_functions_0_areduce_nor_3_a0_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a14_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a14.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a14.lut_mask = 64'hFF00FF00FF005353;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a14.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a15(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a22_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a14_a_aq),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a22_combout),
	.datae(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.dataf(!fp_functions_0_areduce_nor_3_a0_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a15_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a15.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a15.lut_mask = 64'hFF00FF00FF005353;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a15.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a16(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a23_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a15_a_aq),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a27_a_a16_combout),
	.datae(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.dataf(!fp_functions_0_areduce_nor_3_a0_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a16_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a16.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a16.lut_mask = 64'hFF00FF00FF005353;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a16.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17(
	.dataa(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a11_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a14_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a24_a_a24_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17.lut_mask = 64'hCCDCCCDCCCDCCCDC;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a18(
	.dataa(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a19_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a20_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a26_a_a22_combout),
	.datad(!fp_functions_0_areduce_nor_3_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a18_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a18.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a18.lut_mask = 64'hAABAAABAAABAAABA;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a18.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a19(
	.dataa(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a19_combout),
	.datab(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a20_combout),
	.datac(!fp_functions_0_avStagei_uid60_lzcShifterZ1_uid10_fxpToFPTest_q_a25_a_a23_combout),
	.datad(!fp_functions_0_areduce_nor_3_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a19_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a19.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a19.lut_mask = 64'hCCDCCCDCCCDCCCDC;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a19.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1225_a0(
	.dataa(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a18_combout),
	.datab(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a5_combout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a19_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a16_combout),
	.datae(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a28_a_a17_combout),
	.dataf(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a15_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1225_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1225_a0.extended_lut = "off";
defparam fp_functions_0_ai1225_a0.lut_mask = 64'h030B474F838BC7CF;
defparam fp_functions_0_ai1225_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0(
	.dataa(!areset),
	.datab(!fp_functions_0_aadd_0_a81_sumout),
	.datac(!fp_functions_0_ai718_a2_combout),
	.datad(!fp_functions_0_ai718_a3_combout),
	.datae(!fp_functions_0_aadd_0_a146_sumout),
	.dataf(!fp_functions_0_ai718_a4_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0.extended_lut = "off";
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0.lut_mask = 64'h55555555555D5555;
defparam fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a20(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_aq),
	.datab(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq),
	.datac(!fp_functions_0_areduce_nor_2_acombout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.datae(!fp_functions_0_areduce_nor_3_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a20_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a20.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a20.lut_mask = 64'h5050503050505030;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a4_a_a20.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a21(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_aq),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.datad(!fp_functions_0_areduce_nor_3_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a21_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a21.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a21.lut_mask = 64'h4440444044404440;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a21.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_a22(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_aq),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.datad(!fp_functions_0_areduce_nor_3_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_a22_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_a22.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_a22.lut_mask = 64'h4440444044404440;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a23(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_aq),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.datad(!fp_functions_0_areduce_nor_3_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a23_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a23.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a23.lut_mask = 64'h4440444044404440;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a23.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_a24(
	.dataa(!fp_functions_0_avStagei_uid53_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_aq),
	.datab(!fp_functions_0_areduce_nor_2_acombout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a4_combout),
	.datad(!fp_functions_0_areduce_nor_3_a0_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_a24_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_a24.extended_lut = "off";
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_a24.lut_mask = 64'h4440444044404440;
defparam fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a3_a_a24.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_or_0_a0(
	.dataa(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a31_a_a5_combout),
	.datab(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a30_a_a18_combout),
	.datac(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a29_a_a19_combout),
	.datad(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a0_a_a21_combout),
	.datae(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a2_a_a22_combout),
	.dataf(!fp_functions_0_avStagei_uid67_lzcShifterZ1_uid10_fxpToFPTest_q_a1_a_a23_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_or_0_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_or_0_a0.extended_lut = "off";
defparam fp_functions_0_areduce_or_0_a0.lut_mask = 64'hFF80AA8088808880;
defparam fp_functions_0_areduce_or_0_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_or_0_a1(
	.dataa(!fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a3_a_a16_sumout),
	.datab(!fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a4_a_a11_sumout),
	.datac(!fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a5_a_a6_sumout),
	.datad(!fp_functions_0_afracRnd_uid15_fxpToFPTest_merged_bit_select_c_a6_a_a1_sumout),
	.datae(!fp_functions_0_areduce_or_0_a0_combout),
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
defparam fp_functions_0_areduce_or_0_a1.lut_mask = 64'hFFFF7FFFFFFF7FFF;
defparam fp_functions_0_areduce_or_0_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai728_a1(
	.dataa(!fp_functions_0_aadd_0_a36_sumout),
	.datab(!fp_functions_0_aadd_0_a96_sumout),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai728_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai728_a1.extended_lut = "off";
defparam fp_functions_0_ai728_a1.lut_mask = 64'h4444444444444444;
defparam fp_functions_0_ai728_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai728_a2(
	.dataa(!fp_functions_0_aadd_0_a91_sumout),
	.datab(!fp_functions_0_ai728_a1_combout),
	.datac(!fp_functions_0_ai718_a12_combout),
	.datad(!fp_functions_0_ai718_a11_combout),
	.datae(!fp_functions_0_ai718_a3_combout),
	.dataf(!fp_functions_0_ai719_a1_combout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai728_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai728_a2.extended_lut = "off";
defparam fp_functions_0_ai728_a2.lut_mask = 64'h5555555555555557;
defparam fp_functions_0_ai728_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_ai1125_a5(
	.dataa(!fp_functions_0_areduce_nor_2_acombout),
	.datab(!fp_functions_0_aredist2_vCount_uid44_lzcShifterZ1_uid10_fxpToFPTest_q_1_q_a0_a_aq),
	.datac(!areset),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_ai1125_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_ai1125_a5.extended_lut = "off";
defparam fp_functions_0_ai1125_a5.lut_mask = 64'h4040404040404040;
defparam fp_functions_0_ai1125_a5.shared_arith = "off";

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

assign q[31] = fp_functions_0_aredist3_signX_uid6_fxpToFPTest_b_2_q_a0_a_aq;

endmodule
