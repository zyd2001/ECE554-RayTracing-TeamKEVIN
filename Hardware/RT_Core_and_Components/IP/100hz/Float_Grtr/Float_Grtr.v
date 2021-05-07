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

// DATE "05/07/2021 04:17:29"

// 
// Device: Altera 1SX280HN2F43E2VG Package FBGA1760
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module Float_Grtr (
	clk,
	areset,
	en,
	q,
	a,
	b)/* synthesis synthesis_greybox=0 */;
input 	clk;
input 	areset;
input 	[0:0] en;
output 	[0:0] q;
input 	[31:0] a;
input 	[31:0] b;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire fp_functions_0_aadd_0_a1_sumout;
wire fp_functions_0_aadd_0_a7_cout;
wire fp_functions_0_aadd_0_a12_cout;
wire fp_functions_0_aadd_0_a17_cout;
wire fp_functions_0_aadd_0_a22_cout;
wire fp_functions_0_aadd_0_a27_cout;
wire fp_functions_0_aadd_0_a32_cout;
wire fp_functions_0_aadd_0_a37_cout;
wire fp_functions_0_aadd_0_a42_cout;
wire fp_functions_0_aadd_0_a47_cout;
wire fp_functions_0_aadd_0_a52_cout;
wire fp_functions_0_aadd_0_a57_cout;
wire fp_functions_0_aadd_0_a62_cout;
wire fp_functions_0_aadd_0_a67_cout;
wire fp_functions_0_aadd_0_a72_cout;
wire fp_functions_0_aadd_0_a77_cout;
wire fp_functions_0_aadd_0_a82_cout;
wire fp_functions_0_aadd_0_a87_cout;
wire fp_functions_0_aadd_0_a92_cout;
wire fp_functions_0_aadd_0_a97_cout;
wire fp_functions_0_aadd_0_a102_cout;
wire fp_functions_0_aadd_0_a107_cout;
wire fp_functions_0_aadd_0_a112_cout;
wire fp_functions_0_aadd_0_a117_cout;
wire fp_functions_0_aadd_0_a122_cout;
wire fp_functions_0_aadd_0_a127_cout;
wire fp_functions_0_aadd_0_a132_cout;
wire fp_functions_0_aadd_0_a137_cout;
wire fp_functions_0_aadd_0_a142_cout;
wire fp_functions_0_aadd_0_a147_cout;
wire fp_functions_0_aadd_0_a152_cout;
wire fp_functions_0_aadd_0_a157_cout;
wire fp_functions_0_aadd_0_a162_cout;
wire fp_functions_0_areduce_nor_0_a0_combout;
wire fp_functions_0_areduce_nor_0_acombout;
wire fp_functions_0_areduce_nor_1_a0_combout;
wire fp_functions_0_areduce_nor_1_acombout;
wire fp_functions_0_areduce_nor_5_a0_combout;
wire fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1_combout;
wire fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2_combout;
wire fp_functions_0_areduce_nor_5_a1_combout;
wire fp_functions_0_areduce_nor_5_a2_combout;
wire fp_functions_0_areduce_nor_5_a3_combout;
wire fp_functions_0_areduce_nor_5_a4_combout;
wire fp_functions_0_areduce_nor_5_a5_combout;
wire fp_functions_0_areduce_nor_3_a0_combout;
wire fp_functions_0_areduce_nor_3_a1_combout;
wire fp_functions_0_areduce_nor_3_a2_combout;
wire fp_functions_0_areduce_nor_3_a3_combout;
wire fp_functions_0_areduce_nor_3_a4_combout;
wire fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1_combout;
wire fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2_combout;
wire fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a0_combout;
wire fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0_combout;
wire fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a1_combout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a22_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a21_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a20_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a19_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a18_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a17_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a16_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a15_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a14_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a13_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a12_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a11_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a10_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a9_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a8_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a7_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a6_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a5_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a4_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a3_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a2_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a1_a_acombout;
wire fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a0_a_acombout;


fourteennm_lcell_comb fp_functions_0_aadd_0_a1(
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a7_cout),
	.sharein(gnd),
	.combout(),
	.sumout(fp_functions_0_aadd_0_a1_sumout),
	.cout(),
	.shareout());
defparam fp_functions_0_aadd_0_a1.extended_lut = "off";
defparam fp_functions_0_aadd_0_a1.lut_mask = 64'h000000000000FFFF;
defparam fp_functions_0_aadd_0_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a7(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[30]),
	.datad(!b[30]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a12_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a7_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a7.extended_lut = "off";
defparam fp_functions_0_aadd_0_a7.lut_mask = 64'h0000000005A0F00F;
defparam fp_functions_0_aadd_0_a7.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a12(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[29]),
	.datad(!b[29]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a17_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a12_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a12.extended_lut = "off";
defparam fp_functions_0_aadd_0_a12.lut_mask = 64'h0000000005A0F00F;
defparam fp_functions_0_aadd_0_a12.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a17(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[28]),
	.datad(!b[28]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a22_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a17_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a17.extended_lut = "off";
defparam fp_functions_0_aadd_0_a17.lut_mask = 64'h0000000005A0F00F;
defparam fp_functions_0_aadd_0_a17.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a22(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[27]),
	.datad(!b[27]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a27_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a22_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a22.extended_lut = "off";
defparam fp_functions_0_aadd_0_a22.lut_mask = 64'h0000000005A0F00F;
defparam fp_functions_0_aadd_0_a22.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a27(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[26]),
	.datad(!b[26]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a32_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a27_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a27.extended_lut = "off";
defparam fp_functions_0_aadd_0_a27.lut_mask = 64'h0000000005A0F00F;
defparam fp_functions_0_aadd_0_a27.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a32(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[25]),
	.datad(!b[25]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a37_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a32_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a32.extended_lut = "off";
defparam fp_functions_0_aadd_0_a32.lut_mask = 64'h0000000005A0F00F;
defparam fp_functions_0_aadd_0_a32.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a37(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[24]),
	.datad(!b[24]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a42_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a37_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a37.extended_lut = "off";
defparam fp_functions_0_aadd_0_a37.lut_mask = 64'h0000000005A0F00F;
defparam fp_functions_0_aadd_0_a37.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a42(
	.dataa(!a[31]),
	.datab(gnd),
	.datac(!a[23]),
	.datad(!b[23]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a47_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a42_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a42.extended_lut = "off";
defparam fp_functions_0_aadd_0_a42.lut_mask = 64'h0000000005A0F00F;
defparam fp_functions_0_aadd_0_a42.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a47(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[22]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a22_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a52_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a47_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a47.extended_lut = "off";
defparam fp_functions_0_aadd_0_a47.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a47.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a52(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[21]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a21_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a57_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a52_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a52.extended_lut = "off";
defparam fp_functions_0_aadd_0_a52.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a52.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a57(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[20]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a20_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a62_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a57_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a57.extended_lut = "off";
defparam fp_functions_0_aadd_0_a57.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a57.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a62(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[19]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a19_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a67_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a62_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a62.extended_lut = "off";
defparam fp_functions_0_aadd_0_a62.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a62.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a67(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[18]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a18_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a72_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a67_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a67.extended_lut = "off";
defparam fp_functions_0_aadd_0_a67.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a67.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a72(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[17]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a17_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a77_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a72_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a72.extended_lut = "off";
defparam fp_functions_0_aadd_0_a72.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a72.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a77(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[16]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a16_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a82_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a77_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a77.extended_lut = "off";
defparam fp_functions_0_aadd_0_a77.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a77.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a82(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[15]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a15_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a87_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a82_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a82.extended_lut = "off";
defparam fp_functions_0_aadd_0_a82.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a82.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a87(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[14]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a14_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a92_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a87_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a87.extended_lut = "off";
defparam fp_functions_0_aadd_0_a87.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a87.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a92(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[13]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a13_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a97_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a92_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a92.extended_lut = "off";
defparam fp_functions_0_aadd_0_a92.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a92.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a97(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[12]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a12_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a102_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a97_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a97.extended_lut = "off";
defparam fp_functions_0_aadd_0_a97.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a97.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a102(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[11]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a11_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a107_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a102_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a102.extended_lut = "off";
defparam fp_functions_0_aadd_0_a102.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a102.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a107(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[10]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a10_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a112_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a107_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a107.extended_lut = "off";
defparam fp_functions_0_aadd_0_a107.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a107.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a112(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[9]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a9_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a117_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a112_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a112.extended_lut = "off";
defparam fp_functions_0_aadd_0_a112.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a112.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a117(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[8]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a8_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a122_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a117_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a117.extended_lut = "off";
defparam fp_functions_0_aadd_0_a117.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a117.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a122(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[7]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a7_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a127_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a122_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a122.extended_lut = "off";
defparam fp_functions_0_aadd_0_a122.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a122.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a127(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[6]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a6_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a132_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a127_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a127.extended_lut = "off";
defparam fp_functions_0_aadd_0_a127.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a127.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a132(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[5]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a5_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a137_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a132_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a132.extended_lut = "off";
defparam fp_functions_0_aadd_0_a132.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a132.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a137(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[4]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a4_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a142_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a137_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a137.extended_lut = "off";
defparam fp_functions_0_aadd_0_a137.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a137.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a142(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[3]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a3_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a147_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a142_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a142.extended_lut = "off";
defparam fp_functions_0_aadd_0_a142.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a142.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a147(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[2]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a2_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a152_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a147_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a147.extended_lut = "off";
defparam fp_functions_0_aadd_0_a147.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a147.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a152(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[1]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a1_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a157_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a152_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a152.extended_lut = "off";
defparam fp_functions_0_aadd_0_a152.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a152.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a157(
	.dataa(!a[31]),
	.datab(!fp_functions_0_areduce_nor_0_acombout),
	.datac(!b[0]),
	.datad(!fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a0_a_acombout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(fp_functions_0_aadd_0_a162_cout),
	.sharein(gnd),
	.combout(),
	.sumout(),
	.cout(fp_functions_0_aadd_0_a157_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a157.extended_lut = "off";
defparam fp_functions_0_aadd_0_a157.lut_mask = 64'h000000000254FC03;
defparam fp_functions_0_aadd_0_a157.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aadd_0_a162(
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
	.cout(fp_functions_0_aadd_0_a162_cout),
	.shareout());
defparam fp_functions_0_aadd_0_a162.extended_lut = "off";
defparam fp_functions_0_aadd_0_a162.lut_mask = 64'h00000000FFFF0000;
defparam fp_functions_0_aadd_0_a162.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0_a0(
	.dataa(!b[26]),
	.datab(!b[25]),
	.datac(!b[24]),
	.datad(!b[23]),
	.datae(gnd),
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
defparam fp_functions_0_areduce_nor_0_a0.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_areduce_nor_0_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_0(
	.dataa(!b[30]),
	.datab(!b[29]),
	.datac(!b[28]),
	.datad(!b[27]),
	.datae(!fp_functions_0_areduce_nor_0_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_0_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_0.lut_mask = 64'hFFFF7FFFFFFF7FFF;
defparam fp_functions_0_areduce_nor_0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_1_a0(
	.dataa(!a[27]),
	.datab(!a[26]),
	.datac(!a[25]),
	.datad(!a[24]),
	.datae(!a[23]),
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
defparam fp_functions_0_areduce_nor_1_a0.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_1_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_1(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!fp_functions_0_areduce_nor_1_a0_combout),
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
defparam fp_functions_0_areduce_nor_1.lut_mask = 64'h0080008000800080;
defparam fp_functions_0_areduce_nor_1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_5_a0(
	.dataa(!a[21]),
	.datab(!a[20]),
	.datac(!a[19]),
	.datad(!a[18]),
	.datae(gnd),
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
defparam fp_functions_0_areduce_nor_5_a0.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_areduce_nor_5_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1(
	.dataa(!a[26]),
	.datab(!a[25]),
	.datac(!a[24]),
	.datad(!a[23]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1.extended_lut = "off";
defparam fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1.lut_mask = 64'h0001000100010001;
defparam fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[27]),
	.datae(!fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2.extended_lut = "off";
defparam fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2.lut_mask = 64'h0000000100000001;
defparam fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_5_a1(
	.dataa(!a[15]),
	.datab(!a[14]),
	.datac(!a[13]),
	.datad(!a[12]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_5_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_5_a1.extended_lut = "off";
defparam fp_functions_0_areduce_nor_5_a1.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_areduce_nor_5_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_5_a2(
	.dataa(!a[9]),
	.datab(!a[8]),
	.datac(!a[7]),
	.datad(!a[6]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_5_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_5_a2.extended_lut = "off";
defparam fp_functions_0_areduce_nor_5_a2.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_areduce_nor_5_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_5_a3(
	.dataa(!a[4]),
	.datab(!a[3]),
	.datac(!a[2]),
	.datad(!a[1]),
	.datae(!a[0]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_5_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_5_a3.extended_lut = "off";
defparam fp_functions_0_areduce_nor_5_a3.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_5_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_5_a4(
	.dataa(!a[11]),
	.datab(!a[10]),
	.datac(!a[5]),
	.datad(!fp_functions_0_areduce_nor_5_a2_combout),
	.datae(!fp_functions_0_areduce_nor_5_a3_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_5_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_5_a4.extended_lut = "off";
defparam fp_functions_0_areduce_nor_5_a4.lut_mask = 64'h0000008000000080;
defparam fp_functions_0_areduce_nor_5_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_5_a5(
	.dataa(!a[17]),
	.datab(!a[16]),
	.datac(!fp_functions_0_areduce_nor_5_a1_combout),
	.datad(!fp_functions_0_areduce_nor_5_a4_combout),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_5_a5_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_5_a5.extended_lut = "off";
defparam fp_functions_0_areduce_nor_5_a5.lut_mask = 64'h0008000800080008;
defparam fp_functions_0_areduce_nor_5_a5.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3_a0(
	.dataa(!b[22]),
	.datab(!b[21]),
	.datac(!b[20]),
	.datad(!b[19]),
	.datae(!b[18]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_3_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_3_a0.extended_lut = "off";
defparam fp_functions_0_areduce_nor_3_a0.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_3_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3_a1(
	.dataa(!b[16]),
	.datab(!b[15]),
	.datac(!b[14]),
	.datad(!b[13]),
	.datae(!b[12]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_3_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_3_a1.extended_lut = "off";
defparam fp_functions_0_areduce_nor_3_a1.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_3_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3_a2(
	.dataa(!b[9]),
	.datab(!b[8]),
	.datac(!b[7]),
	.datad(!b[6]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_3_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_3_a2.extended_lut = "off";
defparam fp_functions_0_areduce_nor_3_a2.lut_mask = 64'h8000800080008000;
defparam fp_functions_0_areduce_nor_3_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3_a3(
	.dataa(!b[4]),
	.datab(!b[3]),
	.datac(!b[2]),
	.datad(!b[1]),
	.datae(!b[0]),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_3_a3_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_3_a3.extended_lut = "off";
defparam fp_functions_0_areduce_nor_3_a3.lut_mask = 64'h8000000080000000;
defparam fp_functions_0_areduce_nor_3_a3.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_areduce_nor_3_a4(
	.dataa(!b[11]),
	.datab(!b[10]),
	.datac(!b[5]),
	.datad(!fp_functions_0_areduce_nor_3_a2_combout),
	.datae(!fp_functions_0_areduce_nor_3_a3_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_areduce_nor_3_a4_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_areduce_nor_3_a4.extended_lut = "off";
defparam fp_functions_0_areduce_nor_3_a4.lut_mask = 64'h0000008000000080;
defparam fp_functions_0_areduce_nor_3_a4.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1(
	.dataa(!b[26]),
	.datab(!b[25]),
	.datac(!b[24]),
	.datad(!b[23]),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1.extended_lut = "off";
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1.lut_mask = 64'h0001000100010001;
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2(
	.dataa(!b[30]),
	.datab(!b[29]),
	.datac(!b[28]),
	.datad(!b[27]),
	.datae(!fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a1_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2.extended_lut = "off";
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2.lut_mask = 64'h0000000100000001;
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a0(
	.dataa(!b[17]),
	.datab(!fp_functions_0_areduce_nor_3_a0_combout),
	.datac(!fp_functions_0_areduce_nor_3_a1_combout),
	.datad(!fp_functions_0_areduce_nor_3_a4_combout),
	.datae(!fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a2_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a0.extended_lut = "off";
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a0.lut_mask = 64'h0000FFFD0000FFFD;
defparam fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0(
	.dataa(!a[22]),
	.datab(!fp_functions_0_areduce_nor_5_a0_combout),
	.datac(!fp_functions_0_aexcN_x_uid16_fpCompareTest_q_a0_a_a2_combout),
	.datad(!fp_functions_0_areduce_nor_5_a5_combout),
	.datae(!fp_functions_0_aexcN_y_uid30_fpCompareTest_q_a0_a_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0.extended_lut = "off";
defparam fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0.lut_mask = 64'hF0F20000F0F20000;
defparam fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a1(
	.dataa(!a[31]),
	.datab(!b[31]),
	.datac(!fp_functions_0_areduce_nor_0_acombout),
	.datad(!fp_functions_0_areduce_nor_1_acombout),
	.datae(!fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a0_combout),
	.dataf(!fp_functions_0_aadd_0_a1_sumout),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a1_combout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a1.extended_lut = "off";
defparam fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a1.lut_mask = 64'h000022020000BB9B;
defparam fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a1.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a22_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[22]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a22_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a22_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a22_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a22_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a21_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[21]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a21_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a21_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a21_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a21_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a20_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[20]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a20_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a20_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a20_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a20_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a19_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[19]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a19_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a19_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a19_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a19_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a18_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[18]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a18_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a18_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a18_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a18_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a17_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[17]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a17_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a17_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a17_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a17_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a16_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[16]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a16_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a16_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a16_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a16_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a15_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[15]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a15_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a15_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a15_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a15_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a14_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[14]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a14_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a14_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a14_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a14_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a13_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[13]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a13_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a13_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a13_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a13_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a12_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[12]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a12_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a12_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a12_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a12_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a11_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[11]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a11_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a11_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a11_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a11_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a10_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[10]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a10_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a10_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a10_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a10_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a9_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[9]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a9_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a9_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a9_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a9_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a8_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[8]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a8_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a8_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a8_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a8_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a7_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[7]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a7_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a7_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a7_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a7_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a6_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[6]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a6_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a6_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a6_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a6_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a5_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[5]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a5_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a5_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a5_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a5_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a4_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[4]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a4_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a4_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a4_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a4_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a3_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[3]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a3_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a3_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a3_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a3_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a2_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[2]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a2_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a2_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a2_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a2_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a1_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[1]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a1_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a1_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a1_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a1_a.shared_arith = "off";

fourteennm_lcell_comb fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a0_a(
	.dataa(!a[30]),
	.datab(!a[29]),
	.datac(!a[28]),
	.datad(!a[0]),
	.datae(!fp_functions_0_areduce_nor_1_a0_combout),
	.dataf(gnd),
	.datag(gnd),
	.datah(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a0_a_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a0_a.extended_lut = "off";
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a0_a.lut_mask = 64'h00FF007F00FF007F;
defparam fp_functions_0_aefxLTefy_uid48_fpCompareTest_a_a0_a.shared_arith = "off";

assign q[0] = fp_functions_0_arPostExc_uid66_fpCompareTest_q_a0_a_a1_combout;

endmodule
