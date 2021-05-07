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

// DATE "05/07/2021 03:45:09"

// 
// Device: Altera 1SX280HN2F43E2VG Package FBGA1760
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module Float_Add (
	q,
	b,
	a,
	clk,
	areset,
	en)/* synthesis synthesis_greybox=0 */;
output 	[31:0] q;
input 	[31:0] b;
input 	[31:0] a;
input 	clk;
input 	areset;
input 	[0:0] en;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire fp_functions_0_aq_a0_a;
wire fp_functions_0_aq_a1_a;
wire fp_functions_0_aq_a2_a;
wire fp_functions_0_aq_a3_a;
wire fp_functions_0_aq_a4_a;
wire fp_functions_0_aq_a5_a;
wire fp_functions_0_aq_a6_a;
wire fp_functions_0_aq_a7_a;
wire fp_functions_0_aq_a8_a;
wire fp_functions_0_aq_a9_a;
wire fp_functions_0_aq_a10_a;
wire fp_functions_0_aq_a11_a;
wire fp_functions_0_aq_a12_a;
wire fp_functions_0_aq_a13_a;
wire fp_functions_0_aq_a14_a;
wire fp_functions_0_aq_a15_a;
wire fp_functions_0_aq_a16_a;
wire fp_functions_0_aq_a17_a;
wire fp_functions_0_aq_a18_a;
wire fp_functions_0_aq_a19_a;
wire fp_functions_0_aq_a20_a;
wire fp_functions_0_aq_a21_a;
wire fp_functions_0_aq_a22_a;
wire fp_functions_0_aq_a23_a;
wire fp_functions_0_aq_a24_a;
wire fp_functions_0_aq_a25_a;
wire fp_functions_0_aq_a26_a;
wire fp_functions_0_aq_a27_a;
wire fp_functions_0_aq_a28_a;
wire fp_functions_0_aq_a29_a;
wire fp_functions_0_aq_a30_a;
wire fp_functions_0_aq_a31_a;
wire fp_functions_0_afpAddTest_impl_ena0_acombout;

wire [31:0] fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus;

assign fp_functions_0_aq_a0_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[0];
assign fp_functions_0_aq_a1_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[1];
assign fp_functions_0_aq_a2_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[2];
assign fp_functions_0_aq_a3_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[3];
assign fp_functions_0_aq_a4_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[4];
assign fp_functions_0_aq_a5_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[5];
assign fp_functions_0_aq_a6_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[6];
assign fp_functions_0_aq_a7_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[7];
assign fp_functions_0_aq_a8_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[8];
assign fp_functions_0_aq_a9_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[9];
assign fp_functions_0_aq_a10_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[10];
assign fp_functions_0_aq_a11_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[11];
assign fp_functions_0_aq_a12_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[12];
assign fp_functions_0_aq_a13_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[13];
assign fp_functions_0_aq_a14_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[14];
assign fp_functions_0_aq_a15_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[15];
assign fp_functions_0_aq_a16_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[16];
assign fp_functions_0_aq_a17_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[17];
assign fp_functions_0_aq_a18_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[18];
assign fp_functions_0_aq_a19_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[19];
assign fp_functions_0_aq_a20_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[20];
assign fp_functions_0_aq_a21_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[21];
assign fp_functions_0_aq_a22_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[22];
assign fp_functions_0_aq_a23_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[23];
assign fp_functions_0_aq_a24_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[24];
assign fp_functions_0_aq_a25_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[25];
assign fp_functions_0_aq_a26_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[26];
assign fp_functions_0_aq_a27_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[27];
assign fp_functions_0_aq_a28_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[28];
assign fp_functions_0_aq_a29_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[29];
assign fp_functions_0_aq_a30_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[30];
assign fp_functions_0_aq_a31_a = fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus[31];

fourteennm_fp_mac fp_functions_0_afpAddTest_impl_DSP0(
	.accumulate(gnd),
	.dfxlfsrena(vcc),
	.dfxmisrena(vcc),
	.ax({b[31],b[30],b[29],b[28],b[27],b[26],b[25],b[24],b[23],b[22],b[21],b[20],b[19],b[18],b[17],b[16],b[15],b[14],b[13],b[12],b[11],b[10],b[9],b[8],b[7],b[6],b[5],b[4],b[3],b[2],b[1],b[0]}),
	.ay({a[31],a[30],a[29],a[28],a[27],a[26],a[25],a[24],a[23],a[22],a[21],a[20],a[19],a[18],a[17],a[16],a[15],a[14],a[13],a[12],a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0]}),
	.az(32'b00000000000000000000000000000000),
	.clk({gnd,gnd,clk}),
	.clr({areset,areset}),
	.ena({gnd,gnd,fp_functions_0_afpAddTest_impl_ena0_acombout}),
	.chainin(32'b00000000000000000000000000000000),
	.mult_overflow(),
	.mult_invalid(),
	.mult_underflow(),
	.mult_inexact(),
	.adder_overflow(),
	.adder_invalid(),
	.adder_underflow(),
	.adder_inexact(),
	.dftout(),
	.resulta(fp_functions_0_afpAddTest_impl_DSP0_RESULTA_bus),
	.chainout());
defparam fp_functions_0_afpAddTest_impl_DSP0.accum_2nd_pipeline_clock = "none";
defparam fp_functions_0_afpAddTest_impl_DSP0.accum_adder_clock = "none";
defparam fp_functions_0_afpAddTest_impl_DSP0.accum_pipeline_clock = "none";
defparam fp_functions_0_afpAddTest_impl_DSP0.accumulate_clock = "none";
defparam fp_functions_0_afpAddTest_impl_DSP0.adder_input_clock = "0";
defparam fp_functions_0_afpAddTest_impl_DSP0.adder_subtract = "false";
defparam fp_functions_0_afpAddTest_impl_DSP0.ax_chainin_2nd_pl_clock = "none";
defparam fp_functions_0_afpAddTest_impl_DSP0.ax_chainin_pl_clock = "none";
defparam fp_functions_0_afpAddTest_impl_DSP0.ax_clock = "0";
defparam fp_functions_0_afpAddTest_impl_DSP0.ay_clock = "0";
defparam fp_functions_0_afpAddTest_impl_DSP0.az_clock = "none";
defparam fp_functions_0_afpAddTest_impl_DSP0.clear_type = "sclr";
defparam fp_functions_0_afpAddTest_impl_DSP0.mult_2nd_pipeline_clock = "none";
defparam fp_functions_0_afpAddTest_impl_DSP0.mult_pipeline_clock = "none";
defparam fp_functions_0_afpAddTest_impl_DSP0.operation_mode = "sp_add";
defparam fp_functions_0_afpAddTest_impl_DSP0.output_clock = "0";
defparam fp_functions_0_afpAddTest_impl_DSP0.use_chainin = "false";

fourteennm_lcell_comb fp_functions_0_afpAddTest_impl_ena0(
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
	.combout(fp_functions_0_afpAddTest_impl_ena0_acombout),
	.sumout(),
	.cout(),
	.shareout());
defparam fp_functions_0_afpAddTest_impl_ena0.extended_lut = "off";
defparam fp_functions_0_afpAddTest_impl_ena0.lut_mask = 64'h7777777777777777;
defparam fp_functions_0_afpAddTest_impl_ena0.shared_arith = "off";

assign q[0] = fp_functions_0_aq_a0_a;

assign q[10] = fp_functions_0_aq_a10_a;

assign q[11] = fp_functions_0_aq_a11_a;

assign q[12] = fp_functions_0_aq_a12_a;

assign q[13] = fp_functions_0_aq_a13_a;

assign q[14] = fp_functions_0_aq_a14_a;

assign q[15] = fp_functions_0_aq_a15_a;

assign q[16] = fp_functions_0_aq_a16_a;

assign q[17] = fp_functions_0_aq_a17_a;

assign q[18] = fp_functions_0_aq_a18_a;

assign q[19] = fp_functions_0_aq_a19_a;

assign q[1] = fp_functions_0_aq_a1_a;

assign q[20] = fp_functions_0_aq_a20_a;

assign q[21] = fp_functions_0_aq_a21_a;

assign q[22] = fp_functions_0_aq_a22_a;

assign q[23] = fp_functions_0_aq_a23_a;

assign q[24] = fp_functions_0_aq_a24_a;

assign q[25] = fp_functions_0_aq_a25_a;

assign q[26] = fp_functions_0_aq_a26_a;

assign q[27] = fp_functions_0_aq_a27_a;

assign q[28] = fp_functions_0_aq_a28_a;

assign q[29] = fp_functions_0_aq_a29_a;

assign q[2] = fp_functions_0_aq_a2_a;

assign q[30] = fp_functions_0_aq_a30_a;

assign q[31] = fp_functions_0_aq_a31_a;

assign q[3] = fp_functions_0_aq_a3_a;

assign q[4] = fp_functions_0_aq_a4_a;

assign q[5] = fp_functions_0_aq_a5_a;

assign q[6] = fp_functions_0_aq_a6_a;

assign q[7] = fp_functions_0_aq_a7_a;

assign q[8] = fp_functions_0_aq_a8_a;

assign q[9] = fp_functions_0_aq_a9_a;

endmodule
