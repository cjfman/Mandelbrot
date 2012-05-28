////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.76xd
//  \   \         Application: netgen
//  /   /         Filename: mainController_synthesis.v
// /___/   /\     Timestamp: Sun May 27 15:34:54 2012
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -filter "C:/Users/Charles Franklin/Documents/FPGA/Mandelbrot/ISE Project Files/iseconfig/filter.filter" -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim mainController.ngc mainController_synthesis.v 
// Device	: xc6slx45-3-csg324
// Input file	: mainController.ngc
// Output file	: C:\Users\Charles Franklin\Documents\FPGA\Mandelbrot\ISE Project Files\netgen\synthesis\mainController_synthesis.v
// # of Modules	: 1
// Design Name	: mainController
// Xilinx        : C:\Xilinx\13.3\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module mainController (
  clk, HDMIOUTCLKP, HDMIOUTCLKN, btn, sw, HDMIOUTDP, HDMIOUTDN
);
  input clk;
  output HDMIOUTCLKP;
  output HDMIOUTCLKN;
  input [5 : 0] btn;
  input [7 : 0] sw;
  output [2 : 0] HDMIOUTDP;
  output [2 : 0] HDMIOUTDN;
  wire \HDMI/Result<10>1 ;
  wire \HDMI/Result<9>1 ;
  wire \HDMI/Result<8>1 ;
  wire \HDMI/Result<7>1 ;
  wire \HDMI/Result<6>1 ;
  wire \HDMI/Result<5>1 ;
  wire \HDMI/Result<4>1 ;
  wire \HDMI/Result<3>1 ;
  wire \HDMI/Result<2>1 ;
  wire \HDMI/Result<1>1 ;
  wire \HDMI/Result<0>1 ;
  wire \HDMI/pixel_clk_480p/clkin1 ;
  wire \HDMI/pixel_clk_480p/clkout1 ;
  wire \HDMI/pixel_clk_480p/clkout2 ;
  wire \HDMI/GND_2_o_GND_2_o_equal_11_o ;
  wire \HDMI/GND_2_o_GND_2_o_equal_12_o ;
  wire \HDMI/pixel_enable ;
  wire \HDMI/hsync ;
  wire \HDMI/vsync ;
  wire \HDMI/pixel_clk_LOCKED ;
  wire \HDMI/pixel_clk ;
  wire \HDMI/pixel_clk_x2 ;
  wire \HDMI/pixel_clk_x10 ;
  wire \HDMI/hdmi_out/oserdes0/cascade_di ;
  wire \HDMI/hdmi_out/oserdes0/cascade_ti ;
  wire \HDMI/hdmi_out/oserdes0/cascade_do ;
  wire \HDMI/hdmi_out/oserdes0/cascade_to ;
  wire \HDMI/hdmi_out/oserdes1/cascade_di ;
  wire \HDMI/hdmi_out/oserdes1/cascade_ti ;
  wire \HDMI/hdmi_out/oserdes1/cascade_do ;
  wire \HDMI/hdmi_out/oserdes1/cascade_to ;
  wire \HDMI/hdmi_out/oserdes2/cascade_di ;
  wire \HDMI/hdmi_out/oserdes2/cascade_ti ;
  wire \HDMI/hdmi_out/oserdes2/cascade_do ;
  wire \HDMI/hdmi_out/oserdes2/cascade_to ;
  wire \HDMI/hdmi_out/clkout/cascade_di ;
  wire \HDMI/hdmi_out/clkout/cascade_ti ;
  wire \HDMI/hdmi_out/clkout/cascade_do ;
  wire \HDMI/hdmi_out/clkout/cascade_to ;
  wire \HDMI/hdmi_out/toggle_inv ;
  wire \HDMI/hdmi_out/bufpll_lock_inv ;
  wire \HDMI/hdmi_out/toggle_115 ;
  wire \HDMI/hdmi_out/tmdsclk ;
  wire \HDMI/hdmi_out/serdesstrobe ;
  wire \HDMI/hdmi_out/bufpll_lock ;
  wire \HDMI/hdmi_out/pclkx10 ;
  wire \HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ;
  wire \HDMI/hdmi_out/enc0/encb/c0_reg_127 ;
  wire \HDMI/hdmi_out/enc0/encb/decision3 ;
  wire \HDMI/hdmi_out/enc0/encb/decision2_131 ;
  wire \HDMI/hdmi_out/enc0/encb/GND_6_o_cnt[4]_mux_55_OUT<1> ;
  wire \HDMI/hdmi_out/enc0/encb/GND_6_o_cnt[4]_mux_55_OUT<2> ;
  wire \HDMI/hdmi_out/enc0/encb/GND_6_o_cnt[4]_mux_55_OUT<3> ;
  wire \HDMI/hdmi_out/enc0/encb/GND_6_o_cnt[4]_mux_55_OUT<4> ;
  wire \HDMI/hdmi_out/enc0/encb/c1_reg_decision3_mux_54_OUT[1] ;
  wire \HDMI/hdmi_out/enc0/encb/c1_reg_decision3_mux_54_OUT[4] ;
  wire \HDMI/hdmi_out/enc0/encb/c1_reg_decision3_mux_54_OUT[8] ;
  wire \HDMI/hdmi_out/enc0/encb/c1_reg_decision3_mux_54_OUT[9] ;
  wire \HDMI/hdmi_out/enc0/encb/c1_reg_140 ;
  wire \HDMI/hdmi_out/enc0/encb/c1_q_141 ;
  wire \HDMI/hdmi_out/enc0/encb/c0_q_142 ;
  wire \HDMI/hdmi_out/enc0/encb/de_reg_143 ;
  wire \HDMI/hdmi_out/enc0/encb/de_q_144 ;
  wire \HDMI/hdmi_out/enc0/encg/GND_6_o_cnt[4]_mux_55_OUT<1> ;
  wire \HDMI/hdmi_out/enc0/encg/GND_6_o_cnt[4]_mux_55_OUT<2> ;
  wire \HDMI/hdmi_out/enc0/encg/GND_6_o_cnt[4]_mux_55_OUT<3> ;
  wire \HDMI/hdmi_out/enc0/encg/GND_6_o_cnt[4]_mux_55_OUT<4> ;
  wire \HDMI/hdmi_out/enc0/encg/c1_reg_decision3_mux_54_OUT[1] ;
  wire \HDMI/hdmi_out/enc0/encg/c1_reg_decision3_mux_54_OUT[4] ;
  wire \HDMI/hdmi_out/enc0/encg/c1_reg_decision3_mux_54_OUT[8] ;
  wire \HDMI/hdmi_out/enc0/encg/c1_reg_decision3_mux_54_OUT[9] ;
  wire \HDMI/hdmi_out/enc0/encr/GND_6_o_cnt[4]_mux_55_OUT<1> ;
  wire \HDMI/hdmi_out/enc0/encr/GND_6_o_cnt[4]_mux_55_OUT<2> ;
  wire \HDMI/hdmi_out/enc0/encr/GND_6_o_cnt[4]_mux_55_OUT<3> ;
  wire \HDMI/hdmi_out/enc0/encr/GND_6_o_cnt[4]_mux_55_OUT<4> ;
  wire \HDMI/hdmi_out/enc0/encr/c1_reg_decision3_mux_54_OUT[1] ;
  wire \HDMI/hdmi_out/enc0/encr/c1_reg_decision3_mux_54_OUT[4] ;
  wire \HDMI/hdmi_out/enc0/encr/c1_reg_decision3_mux_54_OUT[8] ;
  wire \HDMI/hdmi_out/enc0/encr/c1_reg_decision3_mux_54_OUT[9] ;
  wire \HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d3 ;
  wire \HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d2 ;
  wire \HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d1 ;
  wire \HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d ;
  wire \HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d3 ;
  wire \HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d2 ;
  wire \HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d1 ;
  wire \HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d ;
  wire \HDMI/hdmi_out/enc0/pixel2x/sync_INV_27_o ;
  wire \HDMI/hdmi_out/enc0/pixel2x/sync ;
  wire \HDMI/hdmi_out/enc0/pixel2x/rstp ;
  wire \HDMI/hdmi_out/enc0/pixel2x/rstsync_q ;
  wire \HDMI/hdmi_out/enc0/pixel2x/rstsync ;
  wire N2;
  wire \HDMI/pixel_enable1_278 ;
  wire \HDMI/pixel_enable3_279 ;
  wire \HDMI/pixel_enable4_280 ;
  wire N4;
  wire \HDMI/hsync1_282 ;
  wire \HDMI/hsync2_283 ;
  wire N6;
  wire \HDMI/Mcount_h_pixel_cy<8>_rt_285 ;
  wire \HDMI/Mcount_h_pixel_cy<7>_rt_286 ;
  wire \HDMI/Mcount_h_pixel_cy<6>_rt_287 ;
  wire \HDMI/Mcount_h_pixel_cy<5>_rt_288 ;
  wire \HDMI/Mcount_h_pixel_cy<4>_rt_289 ;
  wire \HDMI/Mcount_h_pixel_cy<3>_rt_290 ;
  wire \HDMI/Mcount_h_pixel_cy<2>_rt_291 ;
  wire \HDMI/Mcount_h_pixel_cy<1>_rt_292 ;
  wire \HDMI/Mcount_v_pixel_cy<9>_rt_293 ;
  wire \HDMI/Mcount_v_pixel_cy<8>_rt_294 ;
  wire \HDMI/Mcount_v_pixel_cy<7>_rt_295 ;
  wire \HDMI/Mcount_v_pixel_cy<6>_rt_296 ;
  wire \HDMI/Mcount_v_pixel_cy<5>_rt_297 ;
  wire \HDMI/Mcount_v_pixel_cy<4>_rt_298 ;
  wire \HDMI/Mcount_v_pixel_cy<3>_rt_299 ;
  wire \HDMI/Mcount_v_pixel_cy<2>_rt_300 ;
  wire \HDMI/Mcount_v_pixel_cy<1>_rt_301 ;
  wire \HDMI/Mcount_h_pixel_xor<9>_rt_302 ;
  wire \HDMI/Mcount_v_pixel_xor<10>_rt_303 ;
  wire N95;
  wire N97;
  wire \HDMI/v_pixel_0_dpot_306 ;
  wire N99;
  wire N101;
  wire N102;
  wire N104;
  wire N105;
  wire N107;
  wire N108;
  wire N110;
  wire N111;
  wire N113;
  wire N114;
  wire N116;
  wire N117;
  wire \HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_320 ;
  wire \HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot1 ;
  wire \HDMI/h_pixel_9_rstpot_322 ;
  wire \HDMI/h_pixel_8_rstpot_323 ;
  wire \HDMI/h_pixel_7_rstpot_324 ;
  wire \HDMI/h_pixel_6_rstpot_325 ;
  wire \HDMI/h_pixel_5_rstpot_326 ;
  wire \HDMI/h_pixel_4_rstpot_327 ;
  wire \HDMI/h_pixel_3_rstpot_328 ;
  wire \HDMI/h_pixel_2_rstpot_329 ;
  wire \HDMI/h_pixel_1_rstpot_330 ;
  wire \HDMI/h_pixel_0_rstpot_331 ;
  wire \HDMI/v_pixel_0_rstpot_332 ;
  wire \HDMI/v_pixel_8_rstpot_333 ;
  wire \HDMI/v_pixel_7_rstpot_334 ;
  wire \HDMI/v_pixel_6_rstpot_335 ;
  wire \HDMI/v_pixel_5_rstpot_336 ;
  wire \HDMI/v_pixel_4_rstpot_337 ;
  wire \HDMI/v_pixel_3_rstpot_338 ;
  wire \HDMI/v_pixel_2_rstpot_339 ;
  wire \HDMI/v_pixel_1_rstpot_340 ;
  wire \HDMI/v_pixel_9_rstpot_341 ;
  wire \HDMI/v_pixel_10_rstpot_342 ;
  wire \HDMI/hdmi_out/enc0/encr/Mshreg_n1d_3_343 ;
  wire \HDMI/hdmi_out/enc0/encb/Mshreg_n1d_3_344 ;
  wire \HDMI/hdmi_out/enc0/encg/Mshreg_n1d_3_345 ;
  wire \NLW_HDMI/hdmi_out/oserdes0/oserdes_m_TQ_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes0/oserdes_m_SHIFTOUT3_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes0/oserdes_m_SHIFTOUT4_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes0/oserdes_s_SHIFTOUT1_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes0/oserdes_s_TQ_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes0/oserdes_s_OQ_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes0/oserdes_s_SHIFTOUT2_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes1/oserdes_m_TQ_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes1/oserdes_m_SHIFTOUT3_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes1/oserdes_m_SHIFTOUT4_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes1/oserdes_s_SHIFTOUT1_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes1/oserdes_s_TQ_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes1/oserdes_s_OQ_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes1/oserdes_s_SHIFTOUT2_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes2/oserdes_m_TQ_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes2/oserdes_m_SHIFTOUT3_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes2/oserdes_m_SHIFTOUT4_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes2/oserdes_s_SHIFTOUT1_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes2/oserdes_s_TQ_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes2/oserdes_s_OQ_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/oserdes2/oserdes_s_SHIFTOUT2_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/clkout/oserdes_m_TQ_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/clkout/oserdes_m_SHIFTOUT3_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/clkout/oserdes_m_SHIFTOUT4_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/clkout/oserdes_s_SHIFTOUT1_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/clkout/oserdes_s_TQ_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/clkout/oserdes_s_OQ_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/clkout/oserdes_s_SHIFTOUT2_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out14_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out13_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out12_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out11_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out10_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out9_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out8_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out7_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out6_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out5_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out4_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out3_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out2_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out1_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out0_Q_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[29].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[28].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[27].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[26].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[25].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[24].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[23].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[22].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[21].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[20].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[19].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[18].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[17].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[16].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[15].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[14].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[13].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[12].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[11].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[10].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[9].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[8].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[7].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[6].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[5].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[4].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[3].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[2].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[1].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[0].i_RAM16X1D_U_SPO_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/encr/Mshreg_n1d_3_Q15_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/encb/Mshreg_n1d_3_Q15_UNCONNECTED ;
  wire \NLW_HDMI/hdmi_out/enc0/encg/Mshreg_n1d_3_Q15_UNCONNECTED ;
  wire \NLW_HDMI/pixel_clk_480p/pll_base_inst_CLKOUT3_UNCONNECTED ;
  wire \NLW_HDMI/pixel_clk_480p/pll_base_inst_CLKFBIN_UNCONNECTED ;
  wire \NLW_HDMI/pixel_clk_480p/pll_base_inst_CLKOUT4_UNCONNECTED ;
  wire \NLW_HDMI/pixel_clk_480p/pll_base_inst_CLKOUT5_UNCONNECTED ;
  wire \NLW_HDMI/pixel_clk_480p/pll_base_inst_CLKFBOUT_UNCONNECTED ;
  wire [8 : 0] \HDMI/Mcount_h_pixel_cy ;
  wire [0 : 0] \HDMI/Mcount_h_pixel_lut ;
  wire [9 : 0] \HDMI/Mcount_v_pixel_cy ;
  wire [0 : 0] \HDMI/Mcount_v_pixel_lut ;
  wire [10 : 0] \HDMI/v_pixel ;
  wire [9 : 0] \HDMI/h_pixel ;
  wire [9 : 0] \HDMI/Result ;
  wire [9 : 6] \HDMI/hdmi_out/enc0/encb/dout ;
  wire [9 : 6] \HDMI/hdmi_out/enc0/encg/dout ;
  wire [9 : 6] \HDMI/hdmi_out/enc0/encr/dout ;
  wire [0 : 0] \HDMI/hdmi_out/tmdsclkint ;
  wire [2 : 0] \HDMI/hdmi_out/tmdsint ;
  wire [4 : 1] \HDMI/hdmi_out/enc0/encb/cnt ;
  wire [1 : 1] \HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy ;
  wire [3 : 3] \HDMI/hdmi_out/enc0/encb/n1d ;
  wire [3 : 3] \HDMI/hdmi_out/enc0/encb/PWR_6_o_BUS_0017_sub_29_OUT ;
  wire [3 : 3] \HDMI/hdmi_out/enc0/encb/n0q_m ;
  wire [3 : 3] \HDMI/hdmi_out/enc0/encb/n1q_m ;
  wire [4 : 1] \HDMI/hdmi_out/enc0/encg/cnt ;
  wire [3 : 3] \HDMI/hdmi_out/enc0/encg/n1d ;
  wire [3 : 3] \HDMI/hdmi_out/enc0/encg/PWR_6_o_BUS_0017_sub_29_OUT ;
  wire [3 : 3] \HDMI/hdmi_out/enc0/encg/n0q_m ;
  wire [3 : 3] \HDMI/hdmi_out/enc0/encg/n1q_m ;
  wire [4 : 1] \HDMI/hdmi_out/enc0/encr/cnt ;
  wire [3 : 3] \HDMI/hdmi_out/enc0/encr/n1d ;
  wire [3 : 3] \HDMI/hdmi_out/enc0/encr/PWR_6_o_BUS_0017_sub_29_OUT ;
  wire [3 : 3] \HDMI/hdmi_out/enc0/encr/n0q_m ;
  wire [3 : 3] \HDMI/hdmi_out/enc0/encr/n1q_m ;
  wire [14 : 0] \HDMI/hdmi_out/enc0/pixel2x/mux ;
  wire [29 : 0] \HDMI/hdmi_out/enc0/pixel2x/db ;
  wire [3 : 0] \HDMI/hdmi_out/enc0/pixel2x/ra ;
  wire [3 : 0] \HDMI/hdmi_out/enc0/pixel2x/wa ;
  wire [29 : 0] \HDMI/hdmi_out/enc0/pixel2x/dataint ;
  VCC   XST_VCC (
    .P(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1])
  );
  GND   XST_GND (
    .G(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> )
  );
  IBUFG #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IOSTANDARD ( "DEFAULT" ))
  \HDMI/pixel_clk_480p/clkin1_buf  (
    .I(clk),
    .O(\HDMI/pixel_clk_480p/clkin1 )
  );
  BUFG   \HDMI/pixel_clk_480p/clkout2_buf  (
    .O(\HDMI/pixel_clk_x2 ),
    .I(\HDMI/pixel_clk_480p/clkout1 )
  );
  BUFG   \HDMI/pixel_clk_480p/clkout3_buf  (
    .O(\HDMI/pixel_clk ),
    .I(\HDMI/pixel_clk_480p/clkout2 )
  );
  XORCY   \HDMI/Mcount_h_pixel_xor<9>  (
    .CI(\HDMI/Mcount_h_pixel_cy [8]),
    .LI(\HDMI/Mcount_h_pixel_xor<9>_rt_302 ),
    .O(\HDMI/Result [9])
  );
  XORCY   \HDMI/Mcount_h_pixel_xor<8>  (
    .CI(\HDMI/Mcount_h_pixel_cy [7]),
    .LI(\HDMI/Mcount_h_pixel_cy<8>_rt_285 ),
    .O(\HDMI/Result [8])
  );
  MUXCY   \HDMI/Mcount_h_pixel_cy<8>  (
    .CI(\HDMI/Mcount_h_pixel_cy [7]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_h_pixel_cy<8>_rt_285 ),
    .O(\HDMI/Mcount_h_pixel_cy [8])
  );
  XORCY   \HDMI/Mcount_h_pixel_xor<7>  (
    .CI(\HDMI/Mcount_h_pixel_cy [6]),
    .LI(\HDMI/Mcount_h_pixel_cy<7>_rt_286 ),
    .O(\HDMI/Result [7])
  );
  MUXCY   \HDMI/Mcount_h_pixel_cy<7>  (
    .CI(\HDMI/Mcount_h_pixel_cy [6]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_h_pixel_cy<7>_rt_286 ),
    .O(\HDMI/Mcount_h_pixel_cy [7])
  );
  XORCY   \HDMI/Mcount_h_pixel_xor<6>  (
    .CI(\HDMI/Mcount_h_pixel_cy [5]),
    .LI(\HDMI/Mcount_h_pixel_cy<6>_rt_287 ),
    .O(\HDMI/Result [6])
  );
  MUXCY   \HDMI/Mcount_h_pixel_cy<6>  (
    .CI(\HDMI/Mcount_h_pixel_cy [5]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_h_pixel_cy<6>_rt_287 ),
    .O(\HDMI/Mcount_h_pixel_cy [6])
  );
  XORCY   \HDMI/Mcount_h_pixel_xor<5>  (
    .CI(\HDMI/Mcount_h_pixel_cy [4]),
    .LI(\HDMI/Mcount_h_pixel_cy<5>_rt_288 ),
    .O(\HDMI/Result [5])
  );
  MUXCY   \HDMI/Mcount_h_pixel_cy<5>  (
    .CI(\HDMI/Mcount_h_pixel_cy [4]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_h_pixel_cy<5>_rt_288 ),
    .O(\HDMI/Mcount_h_pixel_cy [5])
  );
  XORCY   \HDMI/Mcount_h_pixel_xor<4>  (
    .CI(\HDMI/Mcount_h_pixel_cy [3]),
    .LI(\HDMI/Mcount_h_pixel_cy<4>_rt_289 ),
    .O(\HDMI/Result [4])
  );
  MUXCY   \HDMI/Mcount_h_pixel_cy<4>  (
    .CI(\HDMI/Mcount_h_pixel_cy [3]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_h_pixel_cy<4>_rt_289 ),
    .O(\HDMI/Mcount_h_pixel_cy [4])
  );
  XORCY   \HDMI/Mcount_h_pixel_xor<3>  (
    .CI(\HDMI/Mcount_h_pixel_cy [2]),
    .LI(\HDMI/Mcount_h_pixel_cy<3>_rt_290 ),
    .O(\HDMI/Result [3])
  );
  MUXCY   \HDMI/Mcount_h_pixel_cy<3>  (
    .CI(\HDMI/Mcount_h_pixel_cy [2]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_h_pixel_cy<3>_rt_290 ),
    .O(\HDMI/Mcount_h_pixel_cy [3])
  );
  XORCY   \HDMI/Mcount_h_pixel_xor<2>  (
    .CI(\HDMI/Mcount_h_pixel_cy [1]),
    .LI(\HDMI/Mcount_h_pixel_cy<2>_rt_291 ),
    .O(\HDMI/Result [2])
  );
  MUXCY   \HDMI/Mcount_h_pixel_cy<2>  (
    .CI(\HDMI/Mcount_h_pixel_cy [1]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_h_pixel_cy<2>_rt_291 ),
    .O(\HDMI/Mcount_h_pixel_cy [2])
  );
  XORCY   \HDMI/Mcount_h_pixel_xor<1>  (
    .CI(\HDMI/Mcount_h_pixel_cy [0]),
    .LI(\HDMI/Mcount_h_pixel_cy<1>_rt_292 ),
    .O(\HDMI/Result [1])
  );
  MUXCY   \HDMI/Mcount_h_pixel_cy<1>  (
    .CI(\HDMI/Mcount_h_pixel_cy [0]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_h_pixel_cy<1>_rt_292 ),
    .O(\HDMI/Mcount_h_pixel_cy [1])
  );
  XORCY   \HDMI/Mcount_h_pixel_xor<0>  (
    .CI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .LI(\HDMI/Mcount_h_pixel_lut [0]),
    .O(\HDMI/Result [0])
  );
  MUXCY   \HDMI/Mcount_h_pixel_cy<0>  (
    .CI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .DI(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .S(\HDMI/Mcount_h_pixel_lut [0]),
    .O(\HDMI/Mcount_h_pixel_cy [0])
  );
  XORCY   \HDMI/Mcount_v_pixel_xor<10>  (
    .CI(\HDMI/Mcount_v_pixel_cy [9]),
    .LI(\HDMI/Mcount_v_pixel_xor<10>_rt_303 ),
    .O(\HDMI/Result<10>1 )
  );
  XORCY   \HDMI/Mcount_v_pixel_xor<9>  (
    .CI(\HDMI/Mcount_v_pixel_cy [8]),
    .LI(\HDMI/Mcount_v_pixel_cy<9>_rt_293 ),
    .O(\HDMI/Result<9>1 )
  );
  MUXCY   \HDMI/Mcount_v_pixel_cy<9>  (
    .CI(\HDMI/Mcount_v_pixel_cy [8]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_v_pixel_cy<9>_rt_293 ),
    .O(\HDMI/Mcount_v_pixel_cy [9])
  );
  XORCY   \HDMI/Mcount_v_pixel_xor<8>  (
    .CI(\HDMI/Mcount_v_pixel_cy [7]),
    .LI(\HDMI/Mcount_v_pixel_cy<8>_rt_294 ),
    .O(\HDMI/Result<8>1 )
  );
  MUXCY   \HDMI/Mcount_v_pixel_cy<8>  (
    .CI(\HDMI/Mcount_v_pixel_cy [7]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_v_pixel_cy<8>_rt_294 ),
    .O(\HDMI/Mcount_v_pixel_cy [8])
  );
  XORCY   \HDMI/Mcount_v_pixel_xor<7>  (
    .CI(\HDMI/Mcount_v_pixel_cy [6]),
    .LI(\HDMI/Mcount_v_pixel_cy<7>_rt_295 ),
    .O(\HDMI/Result<7>1 )
  );
  MUXCY   \HDMI/Mcount_v_pixel_cy<7>  (
    .CI(\HDMI/Mcount_v_pixel_cy [6]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_v_pixel_cy<7>_rt_295 ),
    .O(\HDMI/Mcount_v_pixel_cy [7])
  );
  XORCY   \HDMI/Mcount_v_pixel_xor<6>  (
    .CI(\HDMI/Mcount_v_pixel_cy [5]),
    .LI(\HDMI/Mcount_v_pixel_cy<6>_rt_296 ),
    .O(\HDMI/Result<6>1 )
  );
  MUXCY   \HDMI/Mcount_v_pixel_cy<6>  (
    .CI(\HDMI/Mcount_v_pixel_cy [5]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_v_pixel_cy<6>_rt_296 ),
    .O(\HDMI/Mcount_v_pixel_cy [6])
  );
  XORCY   \HDMI/Mcount_v_pixel_xor<5>  (
    .CI(\HDMI/Mcount_v_pixel_cy [4]),
    .LI(\HDMI/Mcount_v_pixel_cy<5>_rt_297 ),
    .O(\HDMI/Result<5>1 )
  );
  MUXCY   \HDMI/Mcount_v_pixel_cy<5>  (
    .CI(\HDMI/Mcount_v_pixel_cy [4]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_v_pixel_cy<5>_rt_297 ),
    .O(\HDMI/Mcount_v_pixel_cy [5])
  );
  XORCY   \HDMI/Mcount_v_pixel_xor<4>  (
    .CI(\HDMI/Mcount_v_pixel_cy [3]),
    .LI(\HDMI/Mcount_v_pixel_cy<4>_rt_298 ),
    .O(\HDMI/Result<4>1 )
  );
  MUXCY   \HDMI/Mcount_v_pixel_cy<4>  (
    .CI(\HDMI/Mcount_v_pixel_cy [3]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_v_pixel_cy<4>_rt_298 ),
    .O(\HDMI/Mcount_v_pixel_cy [4])
  );
  XORCY   \HDMI/Mcount_v_pixel_xor<3>  (
    .CI(\HDMI/Mcount_v_pixel_cy [2]),
    .LI(\HDMI/Mcount_v_pixel_cy<3>_rt_299 ),
    .O(\HDMI/Result<3>1 )
  );
  MUXCY   \HDMI/Mcount_v_pixel_cy<3>  (
    .CI(\HDMI/Mcount_v_pixel_cy [2]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_v_pixel_cy<3>_rt_299 ),
    .O(\HDMI/Mcount_v_pixel_cy [3])
  );
  XORCY   \HDMI/Mcount_v_pixel_xor<2>  (
    .CI(\HDMI/Mcount_v_pixel_cy [1]),
    .LI(\HDMI/Mcount_v_pixel_cy<2>_rt_300 ),
    .O(\HDMI/Result<2>1 )
  );
  MUXCY   \HDMI/Mcount_v_pixel_cy<2>  (
    .CI(\HDMI/Mcount_v_pixel_cy [1]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_v_pixel_cy<2>_rt_300 ),
    .O(\HDMI/Mcount_v_pixel_cy [2])
  );
  XORCY   \HDMI/Mcount_v_pixel_xor<1>  (
    .CI(\HDMI/Mcount_v_pixel_cy [0]),
    .LI(\HDMI/Mcount_v_pixel_cy<1>_rt_301 ),
    .O(\HDMI/Result<1>1 )
  );
  MUXCY   \HDMI/Mcount_v_pixel_cy<1>  (
    .CI(\HDMI/Mcount_v_pixel_cy [0]),
    .DI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .S(\HDMI/Mcount_v_pixel_cy<1>_rt_301 ),
    .O(\HDMI/Mcount_v_pixel_cy [1])
  );
  XORCY   \HDMI/Mcount_v_pixel_xor<0>  (
    .CI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .LI(\HDMI/Mcount_v_pixel_lut [0]),
    .O(\HDMI/Result<0>1 )
  );
  MUXCY   \HDMI/Mcount_v_pixel_cy<0>  (
    .CI(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .DI(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .S(\HDMI/Mcount_v_pixel_lut [0]),
    .O(\HDMI/Mcount_v_pixel_cy [0])
  );
  OSERDES2 #(
    .BYPASS_GCLK_FF ( "FALSE" ),
    .DATA_RATE_OQ ( "SDR" ),
    .DATA_RATE_OT ( "SDR" ),
    .OUTPUT_MODE ( "DIFFERENTIAL" ),
    .SERDES_MODE ( "MASTER" ),
    .DATA_WIDTH ( 5 ),
    .TRAIN_PATTERN ( 0 ))
  \HDMI/hdmi_out/oserdes0/oserdes_m  (
    .SHIFTOUT1(\HDMI/hdmi_out/oserdes0/cascade_di ),
    .D2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .D3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLKDIV(\HDMI/pixel_clk_x2 ),
    .TQ(\NLW_HDMI/hdmi_out/oserdes0/oserdes_m_TQ_UNCONNECTED ),
    .SHIFTIN1(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .T4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .OCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTIN4(\HDMI/hdmi_out/oserdes0/cascade_to ),
    .SHIFTIN3(\HDMI/hdmi_out/oserdes0/cascade_do ),
    .SHIFTOUT3(\NLW_HDMI/hdmi_out/oserdes0/oserdes_m_SHIFTOUT3_UNCONNECTED ),
    .OQ(\HDMI/hdmi_out/tmdsint [0]),
    .CLK0(\HDMI/hdmi_out/pclkx10 ),
    .T1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .IOCE(\HDMI/hdmi_out/serdesstrobe ),
    .SHIFTIN2(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .D4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .TCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .T3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .SHIFTOUT2(\HDMI/hdmi_out/oserdes0/cascade_ti ),
    .TRAIN(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLK1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .RST(\HDMI/hdmi_out/bufpll_lock_inv ),
    .SHIFTOUT4(\NLW_HDMI/hdmi_out/oserdes0/oserdes_m_SHIFTOUT4_UNCONNECTED ),
    .T2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> )
  );
  OSERDES2 #(
    .BYPASS_GCLK_FF ( "FALSE" ),
    .DATA_RATE_OQ ( "SDR" ),
    .DATA_RATE_OT ( "SDR" ),
    .OUTPUT_MODE ( "DIFFERENTIAL" ),
    .SERDES_MODE ( "SLAVE" ),
    .DATA_WIDTH ( 5 ),
    .TRAIN_PATTERN ( 0 ))
  \HDMI/hdmi_out/oserdes0/oserdes_s  (
    .SHIFTOUT1(\NLW_HDMI/hdmi_out/oserdes0/oserdes_s_SHIFTOUT1_UNCONNECTED ),
    .D2(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLKDIV(\HDMI/pixel_clk_x2 ),
    .TQ(\NLW_HDMI/hdmi_out/oserdes0/oserdes_s_TQ_UNCONNECTED ),
    .SHIFTIN1(\HDMI/hdmi_out/oserdes0/cascade_di ),
    .T4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .OCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTIN4(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTIN3(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTOUT3(\HDMI/hdmi_out/oserdes0/cascade_do ),
    .OQ(\NLW_HDMI/hdmi_out/oserdes0/oserdes_s_OQ_UNCONNECTED ),
    .CLK0(\HDMI/hdmi_out/pclkx10 ),
    .T1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .IOCE(\HDMI/hdmi_out/serdesstrobe ),
    .SHIFTIN2(\HDMI/hdmi_out/oserdes0/cascade_ti ),
    .D1(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .TCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .T3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .SHIFTOUT2(\NLW_HDMI/hdmi_out/oserdes0/oserdes_s_SHIFTOUT2_UNCONNECTED ),
    .TRAIN(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLK1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .RST(\HDMI/hdmi_out/bufpll_lock_inv ),
    .SHIFTOUT4(\HDMI/hdmi_out/oserdes0/cascade_to ),
    .T2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> )
  );
  OSERDES2 #(
    .BYPASS_GCLK_FF ( "FALSE" ),
    .DATA_RATE_OQ ( "SDR" ),
    .DATA_RATE_OT ( "SDR" ),
    .OUTPUT_MODE ( "DIFFERENTIAL" ),
    .SERDES_MODE ( "MASTER" ),
    .DATA_WIDTH ( 5 ),
    .TRAIN_PATTERN ( 0 ))
  \HDMI/hdmi_out/oserdes1/oserdes_m  (
    .SHIFTOUT1(\HDMI/hdmi_out/oserdes1/cascade_di ),
    .D2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .D3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLKDIV(\HDMI/pixel_clk_x2 ),
    .TQ(\NLW_HDMI/hdmi_out/oserdes1/oserdes_m_TQ_UNCONNECTED ),
    .SHIFTIN1(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .T4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .OCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTIN4(\HDMI/hdmi_out/oserdes1/cascade_to ),
    .SHIFTIN3(\HDMI/hdmi_out/oserdes1/cascade_do ),
    .SHIFTOUT3(\NLW_HDMI/hdmi_out/oserdes1/oserdes_m_SHIFTOUT3_UNCONNECTED ),
    .OQ(\HDMI/hdmi_out/tmdsint [1]),
    .CLK0(\HDMI/hdmi_out/pclkx10 ),
    .T1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .IOCE(\HDMI/hdmi_out/serdesstrobe ),
    .SHIFTIN2(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .D4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .TCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .T3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .SHIFTOUT2(\HDMI/hdmi_out/oserdes1/cascade_ti ),
    .TRAIN(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLK1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .RST(\HDMI/hdmi_out/bufpll_lock_inv ),
    .SHIFTOUT4(\NLW_HDMI/hdmi_out/oserdes1/oserdes_m_SHIFTOUT4_UNCONNECTED ),
    .T2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> )
  );
  OSERDES2 #(
    .BYPASS_GCLK_FF ( "FALSE" ),
    .DATA_RATE_OQ ( "SDR" ),
    .DATA_RATE_OT ( "SDR" ),
    .OUTPUT_MODE ( "DIFFERENTIAL" ),
    .SERDES_MODE ( "SLAVE" ),
    .DATA_WIDTH ( 5 ),
    .TRAIN_PATTERN ( 0 ))
  \HDMI/hdmi_out/oserdes1/oserdes_s  (
    .SHIFTOUT1(\NLW_HDMI/hdmi_out/oserdes1/oserdes_s_SHIFTOUT1_UNCONNECTED ),
    .D2(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLKDIV(\HDMI/pixel_clk_x2 ),
    .TQ(\NLW_HDMI/hdmi_out/oserdes1/oserdes_s_TQ_UNCONNECTED ),
    .SHIFTIN1(\HDMI/hdmi_out/oserdes1/cascade_di ),
    .T4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .OCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTIN4(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTIN3(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTOUT3(\HDMI/hdmi_out/oserdes1/cascade_do ),
    .OQ(\NLW_HDMI/hdmi_out/oserdes1/oserdes_s_OQ_UNCONNECTED ),
    .CLK0(\HDMI/hdmi_out/pclkx10 ),
    .T1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .IOCE(\HDMI/hdmi_out/serdesstrobe ),
    .SHIFTIN2(\HDMI/hdmi_out/oserdes1/cascade_ti ),
    .D1(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .TCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .T3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .SHIFTOUT2(\NLW_HDMI/hdmi_out/oserdes1/oserdes_s_SHIFTOUT2_UNCONNECTED ),
    .TRAIN(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLK1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .RST(\HDMI/hdmi_out/bufpll_lock_inv ),
    .SHIFTOUT4(\HDMI/hdmi_out/oserdes1/cascade_to ),
    .T2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> )
  );
  OSERDES2 #(
    .BYPASS_GCLK_FF ( "FALSE" ),
    .DATA_RATE_OQ ( "SDR" ),
    .DATA_RATE_OT ( "SDR" ),
    .OUTPUT_MODE ( "DIFFERENTIAL" ),
    .SERDES_MODE ( "MASTER" ),
    .DATA_WIDTH ( 5 ),
    .TRAIN_PATTERN ( 0 ))
  \HDMI/hdmi_out/oserdes2/oserdes_m  (
    .SHIFTOUT1(\HDMI/hdmi_out/oserdes2/cascade_di ),
    .D2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .D3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLKDIV(\HDMI/pixel_clk_x2 ),
    .TQ(\NLW_HDMI/hdmi_out/oserdes2/oserdes_m_TQ_UNCONNECTED ),
    .SHIFTIN1(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .T4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .OCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTIN4(\HDMI/hdmi_out/oserdes2/cascade_to ),
    .SHIFTIN3(\HDMI/hdmi_out/oserdes2/cascade_do ),
    .SHIFTOUT3(\NLW_HDMI/hdmi_out/oserdes2/oserdes_m_SHIFTOUT3_UNCONNECTED ),
    .OQ(\HDMI/hdmi_out/tmdsint [2]),
    .CLK0(\HDMI/hdmi_out/pclkx10 ),
    .T1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .IOCE(\HDMI/hdmi_out/serdesstrobe ),
    .SHIFTIN2(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .D4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .TCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .T3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .SHIFTOUT2(\HDMI/hdmi_out/oserdes2/cascade_ti ),
    .TRAIN(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLK1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .RST(\HDMI/hdmi_out/bufpll_lock_inv ),
    .SHIFTOUT4(\NLW_HDMI/hdmi_out/oserdes2/oserdes_m_SHIFTOUT4_UNCONNECTED ),
    .T2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> )
  );
  OSERDES2 #(
    .BYPASS_GCLK_FF ( "FALSE" ),
    .DATA_RATE_OQ ( "SDR" ),
    .DATA_RATE_OT ( "SDR" ),
    .OUTPUT_MODE ( "DIFFERENTIAL" ),
    .SERDES_MODE ( "SLAVE" ),
    .DATA_WIDTH ( 5 ),
    .TRAIN_PATTERN ( 0 ))
  \HDMI/hdmi_out/oserdes2/oserdes_s  (
    .SHIFTOUT1(\NLW_HDMI/hdmi_out/oserdes2/oserdes_s_SHIFTOUT1_UNCONNECTED ),
    .D2(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLKDIV(\HDMI/pixel_clk_x2 ),
    .TQ(\NLW_HDMI/hdmi_out/oserdes2/oserdes_s_TQ_UNCONNECTED ),
    .SHIFTIN1(\HDMI/hdmi_out/oserdes2/cascade_di ),
    .T4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .OCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTIN4(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTIN3(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTOUT3(\HDMI/hdmi_out/oserdes2/cascade_do ),
    .OQ(\NLW_HDMI/hdmi_out/oserdes2/oserdes_s_OQ_UNCONNECTED ),
    .CLK0(\HDMI/hdmi_out/pclkx10 ),
    .T1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .IOCE(\HDMI/hdmi_out/serdesstrobe ),
    .SHIFTIN2(\HDMI/hdmi_out/oserdes2/cascade_ti ),
    .D1(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .TCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .T3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .SHIFTOUT2(\NLW_HDMI/hdmi_out/oserdes2/oserdes_s_SHIFTOUT2_UNCONNECTED ),
    .TRAIN(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLK1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .RST(\HDMI/hdmi_out/bufpll_lock_inv ),
    .SHIFTOUT4(\HDMI/hdmi_out/oserdes2/cascade_to ),
    .T2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> )
  );
  OSERDES2 #(
    .BYPASS_GCLK_FF ( "FALSE" ),
    .DATA_RATE_OQ ( "SDR" ),
    .DATA_RATE_OT ( "SDR" ),
    .OUTPUT_MODE ( "DIFFERENTIAL" ),
    .SERDES_MODE ( "MASTER" ),
    .DATA_WIDTH ( 5 ),
    .TRAIN_PATTERN ( 0 ))
  \HDMI/hdmi_out/clkout/oserdes_m  (
    .SHIFTOUT1(\HDMI/hdmi_out/clkout/cascade_di ),
    .D2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .D3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLKDIV(\HDMI/pixel_clk_x2 ),
    .TQ(\NLW_HDMI/hdmi_out/clkout/oserdes_m_TQ_UNCONNECTED ),
    .SHIFTIN1(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .T4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .OCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTIN4(\HDMI/hdmi_out/clkout/cascade_to ),
    .SHIFTIN3(\HDMI/hdmi_out/clkout/cascade_do ),
    .SHIFTOUT3(\NLW_HDMI/hdmi_out/clkout/oserdes_m_SHIFTOUT3_UNCONNECTED ),
    .OQ(\HDMI/hdmi_out/tmdsclk ),
    .CLK0(\HDMI/hdmi_out/pclkx10 ),
    .T1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .IOCE(\HDMI/hdmi_out/serdesstrobe ),
    .SHIFTIN2(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D1(\HDMI/hdmi_out/tmdsclkint [0]),
    .D4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .TCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .T3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .SHIFTOUT2(\HDMI/hdmi_out/clkout/cascade_ti ),
    .TRAIN(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLK1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .RST(\HDMI/hdmi_out/bufpll_lock_inv ),
    .SHIFTOUT4(\NLW_HDMI/hdmi_out/clkout/oserdes_m_SHIFTOUT4_UNCONNECTED ),
    .T2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> )
  );
  OSERDES2 #(
    .BYPASS_GCLK_FF ( "FALSE" ),
    .DATA_RATE_OQ ( "SDR" ),
    .DATA_RATE_OT ( "SDR" ),
    .OUTPUT_MODE ( "DIFFERENTIAL" ),
    .SERDES_MODE ( "SLAVE" ),
    .DATA_WIDTH ( 5 ),
    .TRAIN_PATTERN ( 0 ))
  \HDMI/hdmi_out/clkout/oserdes_s  (
    .SHIFTOUT1(\NLW_HDMI/hdmi_out/clkout/oserdes_s_SHIFTOUT1_UNCONNECTED ),
    .D2(\HDMI/hdmi_out/tmdsclkint [0]),
    .D3(\HDMI/hdmi_out/tmdsclkint [0]),
    .CLKDIV(\HDMI/pixel_clk_x2 ),
    .TQ(\NLW_HDMI/hdmi_out/clkout/oserdes_s_TQ_UNCONNECTED ),
    .SHIFTIN1(\HDMI/hdmi_out/clkout/cascade_di ),
    .T4(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .OCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTIN4(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTIN3(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SHIFTOUT3(\HDMI/hdmi_out/clkout/cascade_do ),
    .OQ(\NLW_HDMI/hdmi_out/clkout/oserdes_s_OQ_UNCONNECTED ),
    .CLK0(\HDMI/hdmi_out/pclkx10 ),
    .T1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .IOCE(\HDMI/hdmi_out/serdesstrobe ),
    .SHIFTIN2(\HDMI/hdmi_out/clkout/cascade_ti ),
    .D1(\HDMI/hdmi_out/tmdsclkint [0]),
    .D4(\HDMI/hdmi_out/tmdsclkint [0]),
    .TCE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .T3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .SHIFTOUT2(\NLW_HDMI/hdmi_out/clkout/oserdes_s_SHIFTOUT2_UNCONNECTED ),
    .TRAIN(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CLK1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .RST(\HDMI/hdmi_out/bufpll_lock_inv ),
    .SHIFTOUT4(\HDMI/hdmi_out/clkout/cascade_to ),
    .T2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> )
  );
  OBUFDS #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ))
  \HDMI/hdmi_out/TMDS3  (
    .I(\HDMI/hdmi_out/tmdsclk ),
    .O(HDMIOUTCLKP),
    .OB(HDMIOUTCLKN)
  );
  OBUFDS #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ))
  \HDMI/hdmi_out/TMDS2  (
    .I(\HDMI/hdmi_out/tmdsint [2]),
    .O(HDMIOUTDP[2]),
    .OB(HDMIOUTDN[2])
  );
  OBUFDS #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ))
  \HDMI/hdmi_out/TMDS1  (
    .I(\HDMI/hdmi_out/tmdsint [1]),
    .O(HDMIOUTDP[1]),
    .OB(HDMIOUTDN[1])
  );
  OBUFDS #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ))
  \HDMI/hdmi_out/TMDS0  (
    .I(\HDMI/hdmi_out/tmdsint [0]),
    .O(HDMIOUTDP[0]),
    .OB(HDMIOUTDN[0])
  );
  BUFPLL #(
    .ENABLE_SYNC ( "TRUE" ),
    .DIVIDE ( 5 ))
  \HDMI/hdmi_out/ioclk_buf  (
    .IOCLK(\HDMI/hdmi_out/pclkx10 ),
    .LOCK(\HDMI/hdmi_out/bufpll_lock ),
    .SERDESSTROBE(\HDMI/hdmi_out/serdesstrobe ),
    .PLLIN(\HDMI/pixel_clk_x10 ),
    .GCLK(\HDMI/pixel_clk_x2 ),
    .LOCKED(\HDMI/pixel_clk_LOCKED )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/toggle  (
    .C(\HDMI/pixel_clk_x2 ),
    .CLR(\HDMI/hdmi_out/bufpll_lock_inv ),
    .D(\HDMI/hdmi_out/toggle_inv ),
    .Q(\HDMI/hdmi_out/toggle_115 )
  );
  FD   \HDMI/hdmi_out/enc0/encb/n0q_m_3  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/PWR_6_o_BUS_0017_sub_29_OUT [3]),
    .Q(\HDMI/hdmi_out/enc0/encb/n0q_m [3])
  );
  FD   \HDMI/hdmi_out/enc0/encb/n1q_m_3  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/n1d [3]),
    .Q(\HDMI/hdmi_out/enc0/encb/n1q_m [3])
  );
  FD   \HDMI/hdmi_out/enc0/encb/c1_reg  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/c1_q_141 ),
    .Q(\HDMI/hdmi_out/enc0/encb/c1_reg_140 )
  );
  FD   \HDMI/hdmi_out/enc0/encb/c0_reg  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/c0_q_142 ),
    .Q(\HDMI/hdmi_out/enc0/encb/c0_reg_127 )
  );
  FD   \HDMI/hdmi_out/enc0/encb/de_reg  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/de_q_144 ),
    .Q(\HDMI/hdmi_out/enc0/encb/de_reg_143 )
  );
  FD   \HDMI/hdmi_out/enc0/encb/c1_q  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/vsync ),
    .Q(\HDMI/hdmi_out/enc0/encb/c1_q_141 )
  );
  FD   \HDMI/hdmi_out/enc0/encb/de_q  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/pixel_enable ),
    .Q(\HDMI/hdmi_out/enc0/encb/de_q_144 )
  );
  FD   \HDMI/hdmi_out/enc0/encb/c0_q  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hsync ),
    .Q(\HDMI/hdmi_out/enc0/encb/c0_q_142 )
  );
  FD   \HDMI/hdmi_out/enc0/encg/n0q_m_3  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encg/PWR_6_o_BUS_0017_sub_29_OUT [3]),
    .Q(\HDMI/hdmi_out/enc0/encg/n0q_m [3])
  );
  FD   \HDMI/hdmi_out/enc0/encg/n1q_m_3  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encg/n1d [3]),
    .Q(\HDMI/hdmi_out/enc0/encg/n1q_m [3])
  );
  FD   \HDMI/hdmi_out/enc0/encr/n0q_m_3  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encr/PWR_6_o_BUS_0017_sub_29_OUT [3]),
    .Q(\HDMI/hdmi_out/enc0/encr/n0q_m [3])
  );
  FD   \HDMI/hdmi_out/enc0/encr/n1q_m_3  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encr/n1d [3]),
    .Q(\HDMI/hdmi_out/enc0/encr/n1q_m [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out14  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [14]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out14_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out13  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [13]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out13_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out12  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [12]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out12_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out11  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [11]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out11_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out10  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [10]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out10_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out9  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [9]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out9_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out8  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [8]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out8_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out7  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [7]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out7_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out6  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [6]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out6_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out5  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [5]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out5_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out4  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [4]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out4_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out3  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [3]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out3_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out2  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [2]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out2_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out1  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [1]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out1_Q_UNCONNECTED )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_out0  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/mux [0]),
    .Q(\NLW_HDMI/hdmi_out/enc0/pixel2x/fd_out0_Q_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db29  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [29]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [29])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db28  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [28]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [28])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db27  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [27]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [27])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db26  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [26]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [26])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db25  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [25]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [25])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db24  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [24]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [24])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db23  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [23]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [23])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db22  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [22]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [22])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db21  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [21]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [21])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db20  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [20]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [20])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db19  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [19]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [19])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db18  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [18]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [18])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db17  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [17]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [17])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db16  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [16]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [16])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db15  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [15]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [15])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db14  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [14]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [14])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db13  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [13]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [13])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db12  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [12]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [12])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db11  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [11]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [11])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db10  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [10]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [10])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db9  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [9]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db8  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [8]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db7  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [7]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db6  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [6]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db5  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [5]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db4  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [4]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db3  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [3]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db2  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [2]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db1  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [1]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_db0  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/dataint [0]),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/db [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fdc_ra3  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d3 ),
    .R(\HDMI/hdmi_out/enc0/pixel2x/rstp ),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/ra [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fdc_ra2  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d2 ),
    .R(\HDMI/hdmi_out/enc0/pixel2x/rstp ),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/ra [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fdc_ra1  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d1 ),
    .R(\HDMI/hdmi_out/enc0/pixel2x/rstp ),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/ra [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fdc_ra0  (
    .C(\HDMI/pixel_clk_x2 ),
    .CE(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d ),
    .R(\HDMI/hdmi_out/enc0/pixel2x/rstp ),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/ra [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/sync_gen  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/sync_INV_27_o ),
    .R(\HDMI/hdmi_out/enc0/pixel2x/rstp ),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/sync )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_rstp  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/rstsync_q ),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/rstp )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fd_rstsync  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/rstsync ),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/rstsync_q )
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[29].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encr/dout [9]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[29].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [29])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[28].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encr/dout [8]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[28].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [28])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[27].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encr/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[27].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [27])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[26].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encr/dout [6]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[26].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [26])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[25].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encr/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[25].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [25])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[24].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encg/dout [9]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[24].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [24])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[23].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encg/dout [8]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[23].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [23])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[22].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encg/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[22].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [22])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[21].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encg/dout [6]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[21].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [21])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[20].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encg/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[20].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [20])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[19].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encb/dout [9]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[19].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [19])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[18].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encb/dout [8]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[18].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [18])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[17].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encb/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[17].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [17])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[16].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encb/dout [6]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[16].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [16])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[15].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encb/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[15].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [15])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[14].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encr/dout [6]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[14].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [14])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[13].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encr/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[13].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [13])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[12].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encr/dout [6]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[12].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [12])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[11].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encr/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[11].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [11])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[10].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encr/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[10].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [10])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[9].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encg/dout [6]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[9].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [9])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[8].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encg/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[8].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [8])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[7].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encg/dout [6]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[7].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [7])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[6].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encg/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[6].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [6])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[5].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encg/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[5].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [5])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[4].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encb/dout [6]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[4].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [4])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[3].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encb/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[3].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [3])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[2].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encb/dout [6]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[2].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [2])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[1].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encb/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[1].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [1])
  );
  RAM16X1D #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[0].i_RAM16X1D_U  (
    .A0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .A1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .A2(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .A3(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .D(\HDMI/hdmi_out/enc0/encb/dout [7]),
    .DPRA0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .DPRA1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .DPRA2(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .DPRA3(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .WCLK(\HDMI/pixel_clk ),
    .WE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .SPO(\NLW_HDMI/hdmi_out/enc0/pixel2x/fifo_u/dram16s[0].i_RAM16X1D_U_SPO_UNCONNECTED ),
    .DPO(\HDMI/hdmi_out/enc0/pixel2x/dataint [0])
  );
  LUT3 #(
    .INIT ( 8'hB1 ))
  \HDMI/hdmi_out/enc0/encb/Mmux_c1_reg_decision3_mux_54_OUT91  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encb/c0_reg_127 ),
    .I2(\HDMI/hdmi_out/enc0/encb/n0q_m [3]),
    .O(\HDMI/hdmi_out/enc0/encb/c1_reg_decision3_mux_54_OUT[8] )
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \HDMI/hdmi_out/enc0/encg/Mmux_c1_reg_decision3_mux_54_OUT91  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encg/n0q_m [3]),
    .O(\HDMI/hdmi_out/enc0/encg/c1_reg_decision3_mux_54_OUT[8] )
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \HDMI/hdmi_out/enc0/encr/Mmux_c1_reg_decision3_mux_54_OUT91  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encr/n0q_m [3]),
    .O(\HDMI/hdmi_out/enc0/encr/c1_reg_decision3_mux_54_OUT[8] )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d21  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d2 )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d21  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d2 )
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d31  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/ra [3]),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .I3(\HDMI/hdmi_out/enc0/pixel2x/ra [2]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d3 )
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d31  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/wa [3]),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .I3(\HDMI/hdmi_out/enc0/pixel2x/wa [2]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d3 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux16  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [15]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [0]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [0])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux21  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [25]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [10]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [10])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux31  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [26]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [11]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [11])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux41  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [27]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [12]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [12])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux51  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [28]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [13]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [13])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux61  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [29]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [14]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [14])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux71  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [16]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [1]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [1])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux81  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [17]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [2]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [2])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux91  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [18]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [3]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [3])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux101  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [19]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [4]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [4])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux111  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [20]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [5]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [5])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux121  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [21]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [6]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [6])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux131  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [22]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [7]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [7])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux141  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [23]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [8]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [8])
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mmux_mux151  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/db [24]),
    .I2(\HDMI/hdmi_out/enc0/pixel2x/db [9]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/mux [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d111  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/ra [1]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d1 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d111  (
    .I0(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .I1(\HDMI/hdmi_out/enc0/pixel2x/wa [1]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d1 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFEFFFF ))
  \HDMI/GND_2_o_GND_2_o_equal_11_o<10>_SW0  (
    .I0(\HDMI/v_pixel [10]),
    .I1(\HDMI/v_pixel [7]),
    .I2(\HDMI/v_pixel [6]),
    .I3(\HDMI/v_pixel [8]),
    .I4(\HDMI/v_pixel [2]),
    .I5(\HDMI/v_pixel [5]),
    .O(N2)
  );
  LUT6 #(
    .INIT ( 64'h0000000000001000 ))
  \HDMI/GND_2_o_GND_2_o_equal_11_o<10>  (
    .I0(\HDMI/v_pixel [1]),
    .I1(\HDMI/v_pixel [0]),
    .I2(\HDMI/v_pixel [9]),
    .I3(\HDMI/v_pixel [3]),
    .I4(\HDMI/v_pixel [4]),
    .I5(N2),
    .O(\HDMI/GND_2_o_GND_2_o_equal_11_o )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF00011111 ))
  \HDMI/pixel_enable1  (
    .I0(\HDMI/h_pixel [9]),
    .I1(\HDMI/h_pixel [8]),
    .I2(\HDMI/h_pixel [5]),
    .I3(\HDMI/h_pixel [6]),
    .I4(\HDMI/h_pixel [7]),
    .I5(\HDMI/v_pixel [10]),
    .O(\HDMI/pixel_enable1_278 )
  );
  LUT6 #(
    .INIT ( 64'h00010101FFFFFFFF ))
  \HDMI/pixel_enable3  (
    .I0(\HDMI/v_pixel [4]),
    .I1(\HDMI/v_pixel [3]),
    .I2(\HDMI/v_pixel [2]),
    .I3(\HDMI/v_pixel [1]),
    .I4(\HDMI/v_pixel [0]),
    .I5(\HDMI/v_pixel [5]),
    .O(\HDMI/pixel_enable3_279 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \HDMI/pixel_enable4  (
    .I0(\HDMI/v_pixel [8]),
    .I1(\HDMI/v_pixel [9]),
    .I2(\HDMI/v_pixel [7]),
    .I3(\HDMI/v_pixel [6]),
    .O(\HDMI/pixel_enable4_280 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \HDMI/pixel_enable2_SW0  (
    .I0(\HDMI/v_pixel [6]),
    .I1(\HDMI/v_pixel [7]),
    .O(N4)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \HDMI/hsync1  (
    .I0(\HDMI/h_pixel [2]),
    .I1(\HDMI/h_pixel [3]),
    .I2(\HDMI/h_pixel [0]),
    .I3(\HDMI/h_pixel [1]),
    .O(\HDMI/hsync1_282 )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \HDMI/hsync2  (
    .I0(\HDMI/h_pixel [7]),
    .I1(\HDMI/h_pixel [8]),
    .I2(\HDMI/h_pixel [9]),
    .O(\HDMI/hsync2_283 )
  );
  LUT5 #(
    .INIT ( 32'hEAABAAAB ))
  \HDMI/hsync3  (
    .I0(\HDMI/hsync2_283 ),
    .I1(\HDMI/h_pixel [5]),
    .I2(\HDMI/h_pixel [6]),
    .I3(\HDMI/h_pixel [4]),
    .I4(\HDMI/hsync1_282 ),
    .O(\HDMI/hsync )
  );
  LUT5 #(
    .INIT ( 32'h7FFFFFFF ))
  \HDMI/GND_2_o_GND_2_o_equal_12_o<10>_SW0  (
    .I0(\HDMI/h_pixel [1]),
    .I1(\HDMI/h_pixel [0]),
    .I2(\HDMI/h_pixel [2]),
    .I3(\HDMI/h_pixel [3]),
    .I4(\HDMI/h_pixel [9]),
    .O(N6)
  );
  LUT6 #(
    .INIT ( 64'h0000000000001000 ))
  \HDMI/GND_2_o_GND_2_o_equal_12_o<10>  (
    .I0(\HDMI/h_pixel [6]),
    .I1(\HDMI/h_pixel [5]),
    .I2(\HDMI/h_pixel [8]),
    .I3(\HDMI/h_pixel [4]),
    .I4(\HDMI/h_pixel [7]),
    .I5(N6),
    .O(\HDMI/GND_2_o_GND_2_o_equal_12_o )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_h_pixel_cy<8>_rt  (
    .I0(\HDMI/h_pixel [8]),
    .O(\HDMI/Mcount_h_pixel_cy<8>_rt_285 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_h_pixel_cy<7>_rt  (
    .I0(\HDMI/h_pixel [7]),
    .O(\HDMI/Mcount_h_pixel_cy<7>_rt_286 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_h_pixel_cy<6>_rt  (
    .I0(\HDMI/h_pixel [6]),
    .O(\HDMI/Mcount_h_pixel_cy<6>_rt_287 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_h_pixel_cy<5>_rt  (
    .I0(\HDMI/h_pixel [5]),
    .O(\HDMI/Mcount_h_pixel_cy<5>_rt_288 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_h_pixel_cy<4>_rt  (
    .I0(\HDMI/h_pixel [4]),
    .O(\HDMI/Mcount_h_pixel_cy<4>_rt_289 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_h_pixel_cy<3>_rt  (
    .I0(\HDMI/h_pixel [3]),
    .O(\HDMI/Mcount_h_pixel_cy<3>_rt_290 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_h_pixel_cy<2>_rt  (
    .I0(\HDMI/h_pixel [2]),
    .O(\HDMI/Mcount_h_pixel_cy<2>_rt_291 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_h_pixel_cy<1>_rt  (
    .I0(\HDMI/h_pixel [1]),
    .O(\HDMI/Mcount_h_pixel_cy<1>_rt_292 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_v_pixel_cy<9>_rt  (
    .I0(\HDMI/v_pixel [9]),
    .O(\HDMI/Mcount_v_pixel_cy<9>_rt_293 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_v_pixel_cy<8>_rt  (
    .I0(\HDMI/v_pixel [8]),
    .O(\HDMI/Mcount_v_pixel_cy<8>_rt_294 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_v_pixel_cy<7>_rt  (
    .I0(\HDMI/v_pixel [7]),
    .O(\HDMI/Mcount_v_pixel_cy<7>_rt_295 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_v_pixel_cy<6>_rt  (
    .I0(\HDMI/v_pixel [6]),
    .O(\HDMI/Mcount_v_pixel_cy<6>_rt_296 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_v_pixel_cy<5>_rt  (
    .I0(\HDMI/v_pixel [5]),
    .O(\HDMI/Mcount_v_pixel_cy<5>_rt_297 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_v_pixel_cy<4>_rt  (
    .I0(\HDMI/v_pixel [4]),
    .O(\HDMI/Mcount_v_pixel_cy<4>_rt_298 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_v_pixel_cy<3>_rt  (
    .I0(\HDMI/v_pixel [3]),
    .O(\HDMI/Mcount_v_pixel_cy<3>_rt_299 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_v_pixel_cy<2>_rt  (
    .I0(\HDMI/v_pixel [2]),
    .O(\HDMI/Mcount_v_pixel_cy<2>_rt_300 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_v_pixel_cy<1>_rt  (
    .I0(\HDMI/v_pixel [1]),
    .O(\HDMI/Mcount_v_pixel_cy<1>_rt_301 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_h_pixel_xor<9>_rt  (
    .I0(\HDMI/h_pixel [9]),
    .O(\HDMI/Mcount_h_pixel_xor<9>_rt_302 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \HDMI/Mcount_v_pixel_xor<10>_rt  (
    .I0(\HDMI/v_pixel [10]),
    .O(\HDMI/Mcount_v_pixel_xor<10>_rt_303 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/tmdsclkint_0  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/toggle_115 ),
    .Q(\HDMI/hdmi_out/tmdsclkint [0])
  );
  LUT6 #(
    .INIT ( 64'hFF00FF0100FF01FF ))
  \HDMI/hdmi_out/enc0/encb/decision2  (
    .I0(\HDMI/hdmi_out/enc0/encb/cnt [3]),
    .I1(\HDMI/hdmi_out/enc0/encb/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encb/cnt [1]),
    .I3(\HDMI/hdmi_out/enc0/encb/n1q_m [3]),
    .I4(\HDMI/hdmi_out/enc0/encb/cnt [4]),
    .I5(\HDMI/hdmi_out/enc0/encb/n0q_m [3]),
    .O(\HDMI/hdmi_out/enc0/encb/decision2_131 )
  );
  LUT6 #(
    .INIT ( 64'h0F990F99FF990099 ))
  \HDMI/hdmi_out/enc0/encb/Mmux_c1_reg_decision3_mux_54_OUT101  (
    .I0(\HDMI/hdmi_out/enc0/encb/c1_reg_140 ),
    .I1(\HDMI/hdmi_out/enc0/encb/c0_reg_127 ),
    .I2(\HDMI/hdmi_out/enc0/encb/n0q_m [3]),
    .I3(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I4(\HDMI/hdmi_out/enc0/encb/decision3 ),
    .I5(\HDMI/hdmi_out/enc0/encb/decision2_131 ),
    .O(\HDMI/hdmi_out/enc0/encb/c1_reg_decision3_mux_54_OUT[9] )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFF8 ))
  \HDMI/pixel_enable2_SW1  (
    .I0(\HDMI/v_pixel [1]),
    .I1(\HDMI/v_pixel [0]),
    .I2(\HDMI/v_pixel [3]),
    .I3(\HDMI/v_pixel [9]),
    .I4(\HDMI/v_pixel [4]),
    .O(N95)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \HDMI/vsync11  (
    .I0(N4),
    .I1(\HDMI/v_pixel [8]),
    .I2(\HDMI/v_pixel [5]),
    .I3(\HDMI/v_pixel [2]),
    .I4(\HDMI/v_pixel [10]),
    .I5(N95),
    .O(\HDMI/vsync )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \HDMI/pixel_enable2_SW2  (
    .I0(\HDMI/v_pixel [8]),
    .I1(\HDMI/v_pixel [5]),
    .I2(\HDMI/v_pixel [2]),
    .I3(\HDMI/v_pixel [4]),
    .I4(\HDMI/v_pixel [3]),
    .O(N97)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFA8FFA8FFA8 ))
  \HDMI/pixel_enable5  (
    .I0(\HDMI/v_pixel [9]),
    .I1(N4),
    .I2(N97),
    .I3(\HDMI/pixel_enable1_278 ),
    .I4(\HDMI/pixel_enable3_279 ),
    .I5(\HDMI/pixel_enable4_280 ),
    .O(\HDMI/pixel_enable )
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_SW0  (
    .I0(\HDMI/h_pixel [4]),
    .I1(\HDMI/h_pixel [5]),
    .O(N99)
  );
  LUT6 #(
    .INIT ( 64'hF0F0F0F0F0F4F0B0 ))
  \HDMI/v_pixel_0_dpot  (
    .I0(\HDMI/h_pixel [7]),
    .I1(\HDMI/h_pixel [8]),
    .I2(\HDMI/v_pixel [0]),
    .I3(N99),
    .I4(\HDMI/Result<0>1 ),
    .I5(N6),
    .O(\HDMI/v_pixel_0_dpot_306 )
  );
  FD   \HDMI/hdmi_out/enc0/encb/cnt_4  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/GND_6_o_cnt[4]_mux_55_OUT<4> ),
    .Q(\HDMI/hdmi_out/enc0/encb/cnt [4])
  );
  FD   \HDMI/hdmi_out/enc0/encb/cnt_3  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/GND_6_o_cnt[4]_mux_55_OUT<3> ),
    .Q(\HDMI/hdmi_out/enc0/encb/cnt [3])
  );
  FD   \HDMI/hdmi_out/enc0/encb/cnt_2  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/GND_6_o_cnt[4]_mux_55_OUT<2> ),
    .Q(\HDMI/hdmi_out/enc0/encb/cnt [2])
  );
  FD   \HDMI/hdmi_out/enc0/encb/cnt_1  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/GND_6_o_cnt[4]_mux_55_OUT<1> ),
    .Q(\HDMI/hdmi_out/enc0/encb/cnt [1])
  );
  FD   \HDMI/hdmi_out/enc0/encb/dout_9  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/c1_reg_decision3_mux_54_OUT[9] ),
    .Q(\HDMI/hdmi_out/enc0/encb/dout [9])
  );
  FD   \HDMI/hdmi_out/enc0/encb/dout_8  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/c1_reg_decision3_mux_54_OUT[8] ),
    .Q(\HDMI/hdmi_out/enc0/encb/dout [8])
  );
  FD   \HDMI/hdmi_out/enc0/encb/dout_7  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/c1_reg_decision3_mux_54_OUT[1] ),
    .Q(\HDMI/hdmi_out/enc0/encb/dout [7])
  );
  FD   \HDMI/hdmi_out/enc0/encb/dout_6  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encb/c1_reg_decision3_mux_54_OUT[4] ),
    .Q(\HDMI/hdmi_out/enc0/encb/dout [6])
  );
  FD   \HDMI/hdmi_out/enc0/encg/cnt_4  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encg/GND_6_o_cnt[4]_mux_55_OUT<4> ),
    .Q(\HDMI/hdmi_out/enc0/encg/cnt [4])
  );
  FD   \HDMI/hdmi_out/enc0/encg/cnt_3  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encg/GND_6_o_cnt[4]_mux_55_OUT<3> ),
    .Q(\HDMI/hdmi_out/enc0/encg/cnt [3])
  );
  FD   \HDMI/hdmi_out/enc0/encg/cnt_2  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encg/GND_6_o_cnt[4]_mux_55_OUT<2> ),
    .Q(\HDMI/hdmi_out/enc0/encg/cnt [2])
  );
  FD   \HDMI/hdmi_out/enc0/encg/cnt_1  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encg/GND_6_o_cnt[4]_mux_55_OUT<1> ),
    .Q(\HDMI/hdmi_out/enc0/encg/cnt [1])
  );
  FD   \HDMI/hdmi_out/enc0/encg/dout_9  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encg/c1_reg_decision3_mux_54_OUT[9] ),
    .Q(\HDMI/hdmi_out/enc0/encg/dout [9])
  );
  FD   \HDMI/hdmi_out/enc0/encg/dout_8  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encg/c1_reg_decision3_mux_54_OUT[8] ),
    .Q(\HDMI/hdmi_out/enc0/encg/dout [8])
  );
  FD   \HDMI/hdmi_out/enc0/encg/dout_7  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encg/c1_reg_decision3_mux_54_OUT[1] ),
    .Q(\HDMI/hdmi_out/enc0/encg/dout [7])
  );
  FD   \HDMI/hdmi_out/enc0/encg/dout_6  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encg/c1_reg_decision3_mux_54_OUT[4] ),
    .Q(\HDMI/hdmi_out/enc0/encg/dout [6])
  );
  FD   \HDMI/hdmi_out/enc0/encr/cnt_4  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encr/GND_6_o_cnt[4]_mux_55_OUT<4> ),
    .Q(\HDMI/hdmi_out/enc0/encr/cnt [4])
  );
  FD   \HDMI/hdmi_out/enc0/encr/cnt_3  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encr/GND_6_o_cnt[4]_mux_55_OUT<3> ),
    .Q(\HDMI/hdmi_out/enc0/encr/cnt [3])
  );
  FD   \HDMI/hdmi_out/enc0/encr/cnt_2  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encr/GND_6_o_cnt[4]_mux_55_OUT<2> ),
    .Q(\HDMI/hdmi_out/enc0/encr/cnt [2])
  );
  FD   \HDMI/hdmi_out/enc0/encr/cnt_1  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encr/GND_6_o_cnt[4]_mux_55_OUT<1> ),
    .Q(\HDMI/hdmi_out/enc0/encr/cnt [1])
  );
  FD   \HDMI/hdmi_out/enc0/encr/dout_9  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encr/c1_reg_decision3_mux_54_OUT[9] ),
    .Q(\HDMI/hdmi_out/enc0/encr/dout [9])
  );
  FD   \HDMI/hdmi_out/enc0/encr/dout_8  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encr/c1_reg_decision3_mux_54_OUT[8] ),
    .Q(\HDMI/hdmi_out/enc0/encr/dout [8])
  );
  FD   \HDMI/hdmi_out/enc0/encr/dout_7  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encr/c1_reg_decision3_mux_54_OUT[1] ),
    .Q(\HDMI/hdmi_out/enc0/encr/dout [7])
  );
  FD   \HDMI/hdmi_out/enc0/encr/dout_6  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/encr/c1_reg_decision3_mux_54_OUT[4] ),
    .Q(\HDMI/hdmi_out/enc0/encr/dout [6])
  );
  FD #(
    .INIT ( 1'b1 ))
  \HDMI/hdmi_out/enc0/pixel2x/fdp_rst  (
    .C(\HDMI/pixel_clk_x2 ),
    .D(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/rstsync )
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fdc_wa3  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d3 ),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/wa [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fdc_wa2  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d2 ),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/wa [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fdc_wa1  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d1 ),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/wa [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \HDMI/hdmi_out/enc0/pixel2x/fdc_wa0  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d ),
    .Q(\HDMI/hdmi_out/enc0/pixel2x/wa [0])
  );
  LUT3 #(
    .INIT ( 8'h42 ))
  \HDMI/hdmi_out/enc0/encb/decision31  (
    .I0(\HDMI/hdmi_out/enc0/encb/n1q_m [3]),
    .I1(\HDMI/hdmi_out/enc0/encb/n0q_m [3]),
    .I2(\HDMI/hdmi_out/enc0/encb/cnt [4]),
    .O(\HDMI/hdmi_out/enc0/encb/decision3 )
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \HDMI/hdmi_out/enc0/encb/Mmux_GND_6_o_cnt[4]_mux_55_OUT103_SW0  (
    .I0(\HDMI/hdmi_out/enc0/encb/cnt [4]),
    .I1(\HDMI/hdmi_out/enc0/encb/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encb/cnt [1]),
    .I3(\HDMI/hdmi_out/enc0/encb/cnt [3]),
    .O(N101)
  );
  LUT4 #(
    .INIT ( 16'hAA8A ))
  \HDMI/hdmi_out/enc0/encb/Mmux_GND_6_o_cnt[4]_mux_55_OUT103_SW4  (
    .I0(\HDMI/hdmi_out/enc0/encb/cnt [3]),
    .I1(\HDMI/hdmi_out/enc0/encb/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encb/cnt [4]),
    .I3(\HDMI/hdmi_out/enc0/encb/cnt [1]),
    .O(N102)
  );
  LUT6 #(
    .INIT ( 64'h828A0008A2AA2028 ))
  \HDMI/hdmi_out/enc0/encb/Mmux_GND_6_o_cnt[4]_mux_55_OUT103  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encb/n1q_m [3]),
    .I2(\HDMI/hdmi_out/enc0/encb/n0q_m [3]),
    .I3(N102),
    .I4(\HDMI/hdmi_out/enc0/encb/cnt [4]),
    .I5(N101),
    .O(\HDMI/hdmi_out/enc0/encb/GND_6_o_cnt[4]_mux_55_OUT<4> )
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \HDMI/hdmi_out/enc0/encg/Mmux_GND_6_o_cnt[4]_mux_55_OUT103_SW0  (
    .I0(\HDMI/hdmi_out/enc0/encg/cnt [4]),
    .I1(\HDMI/hdmi_out/enc0/encg/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encg/cnt [1]),
    .I3(\HDMI/hdmi_out/enc0/encg/cnt [3]),
    .O(N104)
  );
  LUT4 #(
    .INIT ( 16'hAA8A ))
  \HDMI/hdmi_out/enc0/encg/Mmux_GND_6_o_cnt[4]_mux_55_OUT103_SW4  (
    .I0(\HDMI/hdmi_out/enc0/encg/cnt [3]),
    .I1(\HDMI/hdmi_out/enc0/encg/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encg/cnt [4]),
    .I3(\HDMI/hdmi_out/enc0/encg/cnt [1]),
    .O(N105)
  );
  LUT6 #(
    .INIT ( 64'h828A0008A2AA2028 ))
  \HDMI/hdmi_out/enc0/encg/Mmux_GND_6_o_cnt[4]_mux_55_OUT103  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encg/n1q_m [3]),
    .I2(\HDMI/hdmi_out/enc0/encg/n0q_m [3]),
    .I3(N105),
    .I4(\HDMI/hdmi_out/enc0/encg/cnt [4]),
    .I5(N104),
    .O(\HDMI/hdmi_out/enc0/encg/GND_6_o_cnt[4]_mux_55_OUT<4> )
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \HDMI/hdmi_out/enc0/encr/Mmux_GND_6_o_cnt[4]_mux_55_OUT103_SW0  (
    .I0(\HDMI/hdmi_out/enc0/encr/cnt [4]),
    .I1(\HDMI/hdmi_out/enc0/encr/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encr/cnt [1]),
    .I3(\HDMI/hdmi_out/enc0/encr/cnt [3]),
    .O(N107)
  );
  LUT4 #(
    .INIT ( 16'hAA8A ))
  \HDMI/hdmi_out/enc0/encr/Mmux_GND_6_o_cnt[4]_mux_55_OUT103_SW4  (
    .I0(\HDMI/hdmi_out/enc0/encr/cnt [3]),
    .I1(\HDMI/hdmi_out/enc0/encr/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encr/cnt [4]),
    .I3(\HDMI/hdmi_out/enc0/encr/cnt [1]),
    .O(N108)
  );
  LUT6 #(
    .INIT ( 64'h828A0008A2AA2028 ))
  \HDMI/hdmi_out/enc0/encr/Mmux_GND_6_o_cnt[4]_mux_55_OUT103  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encr/n1q_m [3]),
    .I2(\HDMI/hdmi_out/enc0/encr/n0q_m [3]),
    .I3(N108),
    .I4(\HDMI/hdmi_out/enc0/encr/cnt [4]),
    .I5(N107),
    .O(\HDMI/hdmi_out/enc0/encr/GND_6_o_cnt[4]_mux_55_OUT<4> )
  );
  LUT6 #(
    .INIT ( 64'hAA55AA5556AA57AA ))
  \HDMI/hdmi_out/enc0/encb/Mmux_GND_6_o_cnt[4]_mux_55_OUT84_SW0  (
    .I0(\HDMI/hdmi_out/enc0/encb/cnt [3]),
    .I1(\HDMI/hdmi_out/enc0/encb/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encb/cnt [1]),
    .I3(\HDMI/hdmi_out/enc0/encb/n1q_m [3]),
    .I4(\HDMI/hdmi_out/enc0/encb/cnt [4]),
    .I5(\HDMI/hdmi_out/enc0/encb/n0q_m [3]),
    .O(N110)
  );
  LUT5 #(
    .INIT ( 32'hD2969696 ))
  \HDMI/hdmi_out/enc0/encb/Mmux_GND_6_o_cnt[4]_mux_55_OUT84_SW1  (
    .I0(\HDMI/hdmi_out/enc0/encb/n1q_m [3]),
    .I1(\HDMI/hdmi_out/enc0/encb/n0q_m [3]),
    .I2(\HDMI/hdmi_out/enc0/encb/cnt [3]),
    .I3(\HDMI/hdmi_out/enc0/encb/cnt [2]),
    .I4(\HDMI/hdmi_out/enc0/encb/cnt [1]),
    .O(N111)
  );
  LUT6 #(
    .INIT ( 64'hAA55AA5556AA57AA ))
  \HDMI/hdmi_out/enc0/encg/Mmux_GND_6_o_cnt[4]_mux_55_OUT84_SW0  (
    .I0(\HDMI/hdmi_out/enc0/encg/cnt [3]),
    .I1(\HDMI/hdmi_out/enc0/encg/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encg/cnt [1]),
    .I3(\HDMI/hdmi_out/enc0/encg/n1q_m [3]),
    .I4(\HDMI/hdmi_out/enc0/encg/cnt [4]),
    .I5(\HDMI/hdmi_out/enc0/encg/n0q_m [3]),
    .O(N113)
  );
  LUT5 #(
    .INIT ( 32'hD2969696 ))
  \HDMI/hdmi_out/enc0/encg/Mmux_GND_6_o_cnt[4]_mux_55_OUT84_SW1  (
    .I0(\HDMI/hdmi_out/enc0/encg/n1q_m [3]),
    .I1(\HDMI/hdmi_out/enc0/encg/n0q_m [3]),
    .I2(\HDMI/hdmi_out/enc0/encg/cnt [3]),
    .I3(\HDMI/hdmi_out/enc0/encg/cnt [2]),
    .I4(\HDMI/hdmi_out/enc0/encg/cnt [1]),
    .O(N114)
  );
  LUT6 #(
    .INIT ( 64'hAA55AA5556AA57AA ))
  \HDMI/hdmi_out/enc0/encr/Mmux_GND_6_o_cnt[4]_mux_55_OUT84_SW0  (
    .I0(\HDMI/hdmi_out/enc0/encr/cnt [3]),
    .I1(\HDMI/hdmi_out/enc0/encr/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encr/cnt [1]),
    .I3(\HDMI/hdmi_out/enc0/encr/n1q_m [3]),
    .I4(\HDMI/hdmi_out/enc0/encr/cnt [4]),
    .I5(\HDMI/hdmi_out/enc0/encr/n0q_m [3]),
    .O(N116)
  );
  LUT5 #(
    .INIT ( 32'hD2969696 ))
  \HDMI/hdmi_out/enc0/encr/Mmux_GND_6_o_cnt[4]_mux_55_OUT84_SW1  (
    .I0(\HDMI/hdmi_out/enc0/encr/n1q_m [3]),
    .I1(\HDMI/hdmi_out/enc0/encr/n0q_m [3]),
    .I2(\HDMI/hdmi_out/enc0/encr/cnt [3]),
    .I3(\HDMI/hdmi_out/enc0/encr/cnt [2]),
    .I4(\HDMI/hdmi_out/enc0/encr/cnt [1]),
    .O(N117)
  );
  LUT5 #(
    .INIT ( 32'hFDDFA88A ))
  \HDMI/hdmi_out/enc0/encb/Mmux_c1_reg_decision3_mux_54_OUT21  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encb/cnt [4]),
    .I2(\HDMI/hdmi_out/enc0/encb/n1q_m [3]),
    .I3(\HDMI/hdmi_out/enc0/encb/n0q_m [3]),
    .I4(\HDMI/hdmi_out/enc0/encb/c0_reg_127 ),
    .O(\HDMI/hdmi_out/enc0/encb/c1_reg_decision3_mux_54_OUT[1] )
  );
  LUT5 #(
    .INIT ( 32'hA88AFDDF ))
  \HDMI/hdmi_out/enc0/encb/Mmux_c1_reg_decision3_mux_54_OUT51  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encb/cnt [4]),
    .I2(\HDMI/hdmi_out/enc0/encb/n1q_m [3]),
    .I3(\HDMI/hdmi_out/enc0/encb/n0q_m [3]),
    .I4(\HDMI/hdmi_out/enc0/encb/c0_reg_127 ),
    .O(\HDMI/hdmi_out/enc0/encb/c1_reg_decision3_mux_54_OUT[4] )
  );
  LUT4 #(
    .INIT ( 16'hA88A ))
  \HDMI/hdmi_out/enc0/encg/Mmux_c1_reg_decision3_mux_54_OUT21  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encg/cnt [4]),
    .I2(\HDMI/hdmi_out/enc0/encg/n1q_m [3]),
    .I3(\HDMI/hdmi_out/enc0/encg/n0q_m [3]),
    .O(\HDMI/hdmi_out/enc0/encg/c1_reg_decision3_mux_54_OUT[1] )
  );
  LUT4 #(
    .INIT ( 16'hFF9F ))
  \HDMI/hdmi_out/enc0/encg/Mmux_c1_reg_decision3_mux_54_OUT51  (
    .I0(\HDMI/hdmi_out/enc0/encg/n1q_m [3]),
    .I1(\HDMI/hdmi_out/enc0/encg/n0q_m [3]),
    .I2(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I3(\HDMI/hdmi_out/enc0/encg/cnt [4]),
    .O(\HDMI/hdmi_out/enc0/encg/c1_reg_decision3_mux_54_OUT[4] )
  );
  LUT4 #(
    .INIT ( 16'hA88A ))
  \HDMI/hdmi_out/enc0/encr/Mmux_c1_reg_decision3_mux_54_OUT21  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encr/cnt [4]),
    .I2(\HDMI/hdmi_out/enc0/encr/n1q_m [3]),
    .I3(\HDMI/hdmi_out/enc0/encr/n0q_m [3]),
    .O(\HDMI/hdmi_out/enc0/encr/c1_reg_decision3_mux_54_OUT[1] )
  );
  LUT4 #(
    .INIT ( 16'hFF9F ))
  \HDMI/hdmi_out/enc0/encr/Mmux_c1_reg_decision3_mux_54_OUT51  (
    .I0(\HDMI/hdmi_out/enc0/encr/n1q_m [3]),
    .I1(\HDMI/hdmi_out/enc0/encr/n0q_m [3]),
    .I2(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I3(\HDMI/hdmi_out/enc0/encr/cnt [4]),
    .O(\HDMI/hdmi_out/enc0/encr/c1_reg_decision3_mux_54_OUT[4] )
  );
  LUT4 #(
    .INIT ( 16'h757F ))
  \HDMI/hdmi_out/enc0/encg/Mmux_c1_reg_decision3_mux_54_OUT101  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encg/n1q_m [3]),
    .I2(\HDMI/hdmi_out/enc0/encg/cnt [4]),
    .I3(\HDMI/hdmi_out/enc0/encg/n0q_m [3]),
    .O(\HDMI/hdmi_out/enc0/encg/c1_reg_decision3_mux_54_OUT[9] )
  );
  LUT4 #(
    .INIT ( 16'h757F ))
  \HDMI/hdmi_out/enc0/encr/Mmux_c1_reg_decision3_mux_54_OUT101  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encr/n1q_m [3]),
    .I2(\HDMI/hdmi_out/enc0/encr/cnt [4]),
    .I3(\HDMI/hdmi_out/enc0/encr/n0q_m [3]),
    .O(\HDMI/hdmi_out/enc0/encr/c1_reg_decision3_mux_54_OUT[9] )
  );
  LUT6 #(
    .INIT ( 64'hFF00BD0042000000 ))
  \HDMI/hdmi_out/enc0/encb/Mmux_GND_6_o_cnt[4]_mux_55_OUT84  (
    .I0(\HDMI/hdmi_out/enc0/encb/n1q_m [3]),
    .I1(\HDMI/hdmi_out/enc0/encb/cnt [4]),
    .I2(\HDMI/hdmi_out/enc0/encb/n0q_m [3]),
    .I3(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I4(N111),
    .I5(N110),
    .O(\HDMI/hdmi_out/enc0/encb/GND_6_o_cnt[4]_mux_55_OUT<3> )
  );
  LUT6 #(
    .INIT ( 64'hFF00BD0042000000 ))
  \HDMI/hdmi_out/enc0/encg/Mmux_GND_6_o_cnt[4]_mux_55_OUT84  (
    .I0(\HDMI/hdmi_out/enc0/encg/n1q_m [3]),
    .I1(\HDMI/hdmi_out/enc0/encg/cnt [4]),
    .I2(\HDMI/hdmi_out/enc0/encg/n0q_m [3]),
    .I3(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I4(N114),
    .I5(N113),
    .O(\HDMI/hdmi_out/enc0/encg/GND_6_o_cnt[4]_mux_55_OUT<3> )
  );
  LUT6 #(
    .INIT ( 64'hFF00BD0042000000 ))
  \HDMI/hdmi_out/enc0/encr/Mmux_GND_6_o_cnt[4]_mux_55_OUT84  (
    .I0(\HDMI/hdmi_out/enc0/encr/n1q_m [3]),
    .I1(\HDMI/hdmi_out/enc0/encr/cnt [4]),
    .I2(\HDMI/hdmi_out/enc0/encr/n0q_m [3]),
    .I3(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I4(N117),
    .I5(N116),
    .O(\HDMI/hdmi_out/enc0/encr/GND_6_o_cnt[4]_mux_55_OUT<3> )
  );
  LUT5 #(
    .INIT ( 32'h88282888 ))
  \HDMI/hdmi_out/enc0/encg/Mmux_GND_6_o_cnt[4]_mux_55_OUT41  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encg/cnt [1]),
    .I2(\HDMI/hdmi_out/enc0/encg/cnt [4]),
    .I3(\HDMI/hdmi_out/enc0/encg/n0q_m [3]),
    .I4(\HDMI/hdmi_out/enc0/encg/n1q_m [3]),
    .O(\HDMI/hdmi_out/enc0/encg/GND_6_o_cnt[4]_mux_55_OUT<1> )
  );
  LUT5 #(
    .INIT ( 32'h88282888 ))
  \HDMI/hdmi_out/enc0/encr/Mmux_GND_6_o_cnt[4]_mux_55_OUT41  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encr/cnt [1]),
    .I2(\HDMI/hdmi_out/enc0/encr/cnt [4]),
    .I3(\HDMI/hdmi_out/enc0/encr/n0q_m [3]),
    .I4(\HDMI/hdmi_out/enc0/encr/n1q_m [3]),
    .O(\HDMI/hdmi_out/enc0/encr/GND_6_o_cnt[4]_mux_55_OUT<1> )
  );
  LUT6 #(
    .INIT ( 64'h8828828888888888 ))
  \HDMI/hdmi_out/enc0/encb/Mmux_GND_6_o_cnt[4]_mux_55_OUT63  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encb/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encb/cnt [1]),
    .I3(\HDMI/hdmi_out/enc0/encb/n1q_m [3]),
    .I4(\HDMI/hdmi_out/enc0/encb/n0q_m [3]),
    .I5(\HDMI/hdmi_out/enc0/encb/cnt [4]),
    .O(\HDMI/hdmi_out/enc0/encb/GND_6_o_cnt[4]_mux_55_OUT<2> )
  );
  LUT6 #(
    .INIT ( 64'h8828828888888888 ))
  \HDMI/hdmi_out/enc0/encg/Mmux_GND_6_o_cnt[4]_mux_55_OUT63  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encg/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encg/cnt [1]),
    .I3(\HDMI/hdmi_out/enc0/encg/n1q_m [3]),
    .I4(\HDMI/hdmi_out/enc0/encg/n0q_m [3]),
    .I5(\HDMI/hdmi_out/enc0/encg/cnt [4]),
    .O(\HDMI/hdmi_out/enc0/encg/GND_6_o_cnt[4]_mux_55_OUT<2> )
  );
  LUT6 #(
    .INIT ( 64'h8828828888888888 ))
  \HDMI/hdmi_out/enc0/encr/Mmux_GND_6_o_cnt[4]_mux_55_OUT63  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encr/cnt [2]),
    .I2(\HDMI/hdmi_out/enc0/encr/cnt [1]),
    .I3(\HDMI/hdmi_out/enc0/encr/n1q_m [3]),
    .I4(\HDMI/hdmi_out/enc0/encr/n0q_m [3]),
    .I5(\HDMI/hdmi_out/enc0/encr/cnt [4]),
    .O(\HDMI/hdmi_out/enc0/encr/GND_6_o_cnt[4]_mux_55_OUT<2> )
  );
  LUT5 #(
    .INIT ( 32'h88282888 ))
  \HDMI/hdmi_out/enc0/encb/Mmux_GND_6_o_cnt[4]_mux_55_OUT41  (
    .I0(\HDMI/hdmi_out/enc0/encb/de_reg_143 ),
    .I1(\HDMI/hdmi_out/enc0/encb/cnt [1]),
    .I2(\HDMI/hdmi_out/enc0/encb/cnt [4]),
    .I3(\HDMI/hdmi_out/enc0/encb/n0q_m [3]),
    .I4(\HDMI/hdmi_out/enc0/encb/n1q_m [3]),
    .O(\HDMI/hdmi_out/enc0/encb/GND_6_o_cnt[4]_mux_55_OUT<1> )
  );
  LUT5 #(
    .INIT ( 32'h00000020 ))
  \HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot  (
    .I0(\HDMI/h_pixel [4]),
    .I1(\HDMI/h_pixel [7]),
    .I2(\HDMI/h_pixel [8]),
    .I3(\HDMI/h_pixel [5]),
    .I4(\HDMI/h_pixel [6]),
    .O(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_320 )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot  (
    .I0(\HDMI/h_pixel [1]),
    .I1(\HDMI/h_pixel [0]),
    .I2(\HDMI/h_pixel [2]),
    .I3(\HDMI/h_pixel [3]),
    .I4(\HDMI/h_pixel [9]),
    .O(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot1 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \HDMI/h_pixel_9_rstpot  (
    .I0(\HDMI/Result [9]),
    .I1(\HDMI/GND_2_o_GND_2_o_equal_12_o ),
    .O(\HDMI/h_pixel_9_rstpot_322 )
  );
  FD   \HDMI/h_pixel_9  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/h_pixel_9_rstpot_322 ),
    .Q(\HDMI/h_pixel [9])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \HDMI/h_pixel_8_rstpot  (
    .I0(\HDMI/Result [8]),
    .I1(\HDMI/GND_2_o_GND_2_o_equal_12_o ),
    .O(\HDMI/h_pixel_8_rstpot_323 )
  );
  FD   \HDMI/h_pixel_8  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/h_pixel_8_rstpot_323 ),
    .Q(\HDMI/h_pixel [8])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \HDMI/h_pixel_7_rstpot  (
    .I0(\HDMI/Result [7]),
    .I1(\HDMI/GND_2_o_GND_2_o_equal_12_o ),
    .O(\HDMI/h_pixel_7_rstpot_324 )
  );
  FD   \HDMI/h_pixel_7  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/h_pixel_7_rstpot_324 ),
    .Q(\HDMI/h_pixel [7])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \HDMI/h_pixel_6_rstpot  (
    .I0(\HDMI/Result [6]),
    .I1(\HDMI/GND_2_o_GND_2_o_equal_12_o ),
    .O(\HDMI/h_pixel_6_rstpot_325 )
  );
  FD   \HDMI/h_pixel_6  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/h_pixel_6_rstpot_325 ),
    .Q(\HDMI/h_pixel [6])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \HDMI/h_pixel_5_rstpot  (
    .I0(\HDMI/Result [5]),
    .I1(\HDMI/GND_2_o_GND_2_o_equal_12_o ),
    .O(\HDMI/h_pixel_5_rstpot_326 )
  );
  FD   \HDMI/h_pixel_5  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/h_pixel_5_rstpot_326 ),
    .Q(\HDMI/h_pixel [5])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \HDMI/h_pixel_4_rstpot  (
    .I0(\HDMI/Result [4]),
    .I1(\HDMI/GND_2_o_GND_2_o_equal_12_o ),
    .O(\HDMI/h_pixel_4_rstpot_327 )
  );
  FD   \HDMI/h_pixel_4  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/h_pixel_4_rstpot_327 ),
    .Q(\HDMI/h_pixel [4])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \HDMI/h_pixel_3_rstpot  (
    .I0(\HDMI/Result [3]),
    .I1(\HDMI/GND_2_o_GND_2_o_equal_12_o ),
    .O(\HDMI/h_pixel_3_rstpot_328 )
  );
  FD   \HDMI/h_pixel_3  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/h_pixel_3_rstpot_328 ),
    .Q(\HDMI/h_pixel [3])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \HDMI/h_pixel_2_rstpot  (
    .I0(\HDMI/Result [2]),
    .I1(\HDMI/GND_2_o_GND_2_o_equal_12_o ),
    .O(\HDMI/h_pixel_2_rstpot_329 )
  );
  FD   \HDMI/h_pixel_2  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/h_pixel_2_rstpot_329 ),
    .Q(\HDMI/h_pixel [2])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \HDMI/h_pixel_1_rstpot  (
    .I0(\HDMI/Result [1]),
    .I1(\HDMI/GND_2_o_GND_2_o_equal_12_o ),
    .O(\HDMI/h_pixel_1_rstpot_330 )
  );
  FD   \HDMI/h_pixel_1  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/h_pixel_1_rstpot_330 ),
    .Q(\HDMI/h_pixel [1])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \HDMI/h_pixel_0_rstpot  (
    .I0(\HDMI/Result [0]),
    .I1(\HDMI/GND_2_o_GND_2_o_equal_12_o ),
    .O(\HDMI/h_pixel_0_rstpot_331 )
  );
  FD   \HDMI/h_pixel_0  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/h_pixel_0_rstpot_331 ),
    .Q(\HDMI/h_pixel [0])
  );
  FD   \HDMI/v_pixel_0  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/v_pixel_0_rstpot_332 ),
    .Q(\HDMI/v_pixel [0])
  );
  LUT4 #(
    .INIT ( 16'h00B8 ))
  \HDMI/v_pixel_0_rstpot  (
    .I0(\HDMI/v_pixel [0]),
    .I1(\HDMI/h_pixel [6]),
    .I2(\HDMI/v_pixel_0_dpot_306 ),
    .I3(\HDMI/GND_2_o_GND_2_o_equal_11_o ),
    .O(\HDMI/v_pixel_0_rstpot_332 )
  );
  FD   \HDMI/v_pixel_8  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/v_pixel_8_rstpot_333 ),
    .Q(\HDMI/v_pixel [8])
  );
  FD   \HDMI/v_pixel_7  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/v_pixel_7_rstpot_334 ),
    .Q(\HDMI/v_pixel [7])
  );
  FD   \HDMI/v_pixel_6  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/v_pixel_6_rstpot_335 ),
    .Q(\HDMI/v_pixel [6])
  );
  FD   \HDMI/v_pixel_5  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/v_pixel_5_rstpot_336 ),
    .Q(\HDMI/v_pixel [5])
  );
  FD   \HDMI/v_pixel_4  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/v_pixel_4_rstpot_337 ),
    .Q(\HDMI/v_pixel [4])
  );
  FD   \HDMI/v_pixel_3  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/v_pixel_3_rstpot_338 ),
    .Q(\HDMI/v_pixel [3])
  );
  FD   \HDMI/v_pixel_2  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/v_pixel_2_rstpot_339 ),
    .Q(\HDMI/v_pixel [2])
  );
  FD   \HDMI/v_pixel_1  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/v_pixel_1_rstpot_340 ),
    .Q(\HDMI/v_pixel [1])
  );
  FD   \HDMI/v_pixel_9  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/v_pixel_9_rstpot_341 ),
    .Q(\HDMI/v_pixel [9])
  );
  FD   \HDMI/v_pixel_10  (
    .C(\HDMI/pixel_clk ),
    .D(\HDMI/v_pixel_10_rstpot_342 ),
    .Q(\HDMI/v_pixel [10])
  );
  LUT5 #(
    .INIT ( 32'h0000CAAA ))
  \HDMI/v_pixel_8_rstpot  (
    .I0(\HDMI/v_pixel [8]),
    .I1(\HDMI/Result<8>1 ),
    .I2(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_320 ),
    .I3(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot1 ),
    .I4(\HDMI/GND_2_o_GND_2_o_equal_11_o ),
    .O(\HDMI/v_pixel_8_rstpot_333 )
  );
  LUT5 #(
    .INIT ( 32'h0000CAAA ))
  \HDMI/v_pixel_7_rstpot  (
    .I0(\HDMI/v_pixel [7]),
    .I1(\HDMI/Result<7>1 ),
    .I2(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_320 ),
    .I3(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot1 ),
    .I4(\HDMI/GND_2_o_GND_2_o_equal_11_o ),
    .O(\HDMI/v_pixel_7_rstpot_334 )
  );
  LUT5 #(
    .INIT ( 32'h0000CAAA ))
  \HDMI/v_pixel_6_rstpot  (
    .I0(\HDMI/v_pixel [6]),
    .I1(\HDMI/Result<6>1 ),
    .I2(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_320 ),
    .I3(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot1 ),
    .I4(\HDMI/GND_2_o_GND_2_o_equal_11_o ),
    .O(\HDMI/v_pixel_6_rstpot_335 )
  );
  LUT5 #(
    .INIT ( 32'h0000CAAA ))
  \HDMI/v_pixel_5_rstpot  (
    .I0(\HDMI/v_pixel [5]),
    .I1(\HDMI/Result<5>1 ),
    .I2(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_320 ),
    .I3(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot1 ),
    .I4(\HDMI/GND_2_o_GND_2_o_equal_11_o ),
    .O(\HDMI/v_pixel_5_rstpot_336 )
  );
  LUT5 #(
    .INIT ( 32'h0000CAAA ))
  \HDMI/v_pixel_4_rstpot  (
    .I0(\HDMI/v_pixel [4]),
    .I1(\HDMI/Result<4>1 ),
    .I2(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_320 ),
    .I3(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot1 ),
    .I4(\HDMI/GND_2_o_GND_2_o_equal_11_o ),
    .O(\HDMI/v_pixel_4_rstpot_337 )
  );
  LUT5 #(
    .INIT ( 32'h0000CAAA ))
  \HDMI/v_pixel_3_rstpot  (
    .I0(\HDMI/v_pixel [3]),
    .I1(\HDMI/Result<3>1 ),
    .I2(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_320 ),
    .I3(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot1 ),
    .I4(\HDMI/GND_2_o_GND_2_o_equal_11_o ),
    .O(\HDMI/v_pixel_3_rstpot_338 )
  );
  LUT5 #(
    .INIT ( 32'h0000CAAA ))
  \HDMI/v_pixel_2_rstpot  (
    .I0(\HDMI/v_pixel [2]),
    .I1(\HDMI/Result<2>1 ),
    .I2(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_320 ),
    .I3(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot1 ),
    .I4(\HDMI/GND_2_o_GND_2_o_equal_11_o ),
    .O(\HDMI/v_pixel_2_rstpot_339 )
  );
  LUT5 #(
    .INIT ( 32'h0000CAAA ))
  \HDMI/v_pixel_1_rstpot  (
    .I0(\HDMI/v_pixel [1]),
    .I1(\HDMI/Result<1>1 ),
    .I2(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_320 ),
    .I3(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot1 ),
    .I4(\HDMI/GND_2_o_GND_2_o_equal_11_o ),
    .O(\HDMI/v_pixel_1_rstpot_340 )
  );
  LUT5 #(
    .INIT ( 32'h0000CAAA ))
  \HDMI/v_pixel_9_rstpot  (
    .I0(\HDMI/v_pixel [9]),
    .I1(\HDMI/Result<9>1 ),
    .I2(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_320 ),
    .I3(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot1 ),
    .I4(\HDMI/GND_2_o_GND_2_o_equal_11_o ),
    .O(\HDMI/v_pixel_9_rstpot_341 )
  );
  LUT5 #(
    .INIT ( 32'h0000CAAA ))
  \HDMI/v_pixel_10_rstpot  (
    .I0(\HDMI/v_pixel [10]),
    .I1(\HDMI/Result<10>1 ),
    .I2(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_rstpot_320 ),
    .I3(\HDMI/GND_2_o_GND_2_o_equal_12_o<10>_cepot1 ),
    .I4(\HDMI/GND_2_o_GND_2_o_equal_11_o ),
    .O(\HDMI/v_pixel_10_rstpot_342 )
  );
  INV   \HDMI/Mcount_h_pixel_lut<0>_INV_0  (
    .I(\HDMI/h_pixel [0]),
    .O(\HDMI/Mcount_h_pixel_lut [0])
  );
  INV   \HDMI/Mcount_v_pixel_lut<0>_INV_0  (
    .I(\HDMI/v_pixel [0]),
    .O(\HDMI/Mcount_v_pixel_lut [0])
  );
  INV   \HDMI/hdmi_out/bufpll_lock_inv1_INV_0  (
    .I(\HDMI/hdmi_out/bufpll_lock ),
    .O(\HDMI/hdmi_out/bufpll_lock_inv )
  );
  INV   \HDMI/hdmi_out/toggle_inv1_INV_0  (
    .I(\HDMI/hdmi_out/toggle_115 ),
    .O(\HDMI/hdmi_out/toggle_inv )
  );
  INV   \HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d11_INV_0  (
    .I(\HDMI/hdmi_out/enc0/pixel2x/ra [0]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/Mram_ra_d )
  );
  INV   \HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d11_INV_0  (
    .I(\HDMI/hdmi_out/enc0/pixel2x/wa [0]),
    .O(\HDMI/hdmi_out/enc0/pixel2x/Mram_wa_d )
  );
  INV   \HDMI/hdmi_out/enc0/pixel2x/sync_INV_27_o1_INV_0  (
    .I(\HDMI/hdmi_out/enc0/pixel2x/sync ),
    .O(\HDMI/hdmi_out/enc0/pixel2x/sync_INV_27_o )
  );
  INV   \HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_xor<3>11111_INV_0  (
    .I(\HDMI/hdmi_out/enc0/encb/n1d [3]),
    .O(\HDMI/hdmi_out/enc0/encb/PWR_6_o_BUS_0017_sub_29_OUT [3])
  );
  INV   \HDMI/hdmi_out/enc0/encg/Msub_PWR_6_o_BUS_0017_sub_29_OUT_xor<3>11111_INV_0  (
    .I(\HDMI/hdmi_out/enc0/encg/n1d [3]),
    .O(\HDMI/hdmi_out/enc0/encg/PWR_6_o_BUS_0017_sub_29_OUT [3])
  );
  INV   \HDMI/hdmi_out/enc0/encr/Msub_PWR_6_o_BUS_0017_sub_29_OUT_xor<3>11111_INV_0  (
    .I(\HDMI/hdmi_out/enc0/encr/n1d [3]),
    .O(\HDMI/hdmi_out/enc0/encr/PWR_6_o_BUS_0017_sub_29_OUT [3])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/encr/Mshreg_n1d_3  (
    .A0(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .A1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .A2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .A3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .CLK(\HDMI/pixel_clk ),
    .D(\HDMI/v_pixel [5]),
    .Q(\HDMI/hdmi_out/enc0/encr/Mshreg_n1d_3_343 ),
    .Q15(\NLW_HDMI/hdmi_out/enc0/encr/Mshreg_n1d_3_Q15_UNCONNECTED )
  );
  FDE   \HDMI/hdmi_out/enc0/encr/n1d_3  (
    .C(\HDMI/pixel_clk ),
    .CE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D(\HDMI/hdmi_out/enc0/encr/Mshreg_n1d_3_343 ),
    .Q(\HDMI/hdmi_out/enc0/encr/n1d [3])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/encb/Mshreg_n1d_3  (
    .A0(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .A1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .A2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .A3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .CLK(\HDMI/pixel_clk ),
    .D(\HDMI/h_pixel [5]),
    .Q(\HDMI/hdmi_out/enc0/encb/Mshreg_n1d_3_344 ),
    .Q15(\NLW_HDMI/hdmi_out/enc0/encb/Mshreg_n1d_3_Q15_UNCONNECTED )
  );
  FDE   \HDMI/hdmi_out/enc0/encb/n1d_3  (
    .C(\HDMI/pixel_clk ),
    .CE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D(\HDMI/hdmi_out/enc0/encb/Mshreg_n1d_3_344 ),
    .Q(\HDMI/hdmi_out/enc0/encb/n1d [3])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \HDMI/hdmi_out/enc0/encg/Mshreg_n1d_3  (
    .A0(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .A1(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .A2(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .A3(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .CE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .CLK(\HDMI/pixel_clk ),
    .D(\HDMI/h_pixel [6]),
    .Q(\HDMI/hdmi_out/enc0/encg/Mshreg_n1d_3_345 ),
    .Q15(\NLW_HDMI/hdmi_out/enc0/encg/Mshreg_n1d_3_Q15_UNCONNECTED )
  );
  FDE   \HDMI/hdmi_out/enc0/encg/n1d_3  (
    .C(\HDMI/pixel_clk ),
    .CE(\HDMI/hdmi_out/enc0/encb/Msub_PWR_6_o_BUS_0017_sub_29_OUT_cy [1]),
    .D(\HDMI/hdmi_out/enc0/encg/Mshreg_n1d_3_345 ),
    .Q(\HDMI/hdmi_out/enc0/encg/n1d [3])
  );
  PLL_BASE #(
    .BANDWIDTH ( "OPTIMIZED" ),
    .CLK_FEEDBACK ( "CLKFBOUT" ),
    .COMPENSATION ( "SYSTEM_SYNCHRONOUS" ),
    .RESET_ON_LOSS_OF_LOCK ( "FALSE" ),
    .CLKFBOUT_MULT ( 38 ),
    .CLKOUT0_DIVIDE ( 3 ),
    .CLKOUT1_DIVIDE ( 15 ),
    .CLKOUT2_DIVIDE ( 30 ),
    .CLKOUT3_DIVIDE ( 1 ),
    .CLKOUT4_DIVIDE ( 1 ),
    .CLKOUT5_DIVIDE ( 1 ),
    .DIVCLK_DIVIDE ( 5 ),
    .CLKFBOUT_PHASE ( 0.000000 ),
    .CLKIN_PERIOD ( 10.000000 ),
    .CLKOUT0_DUTY_CYCLE ( 0.500000 ),
    .CLKOUT0_PHASE ( 0.000000 ),
    .CLKOUT1_DUTY_CYCLE ( 0.500000 ),
    .CLKOUT1_PHASE ( 0.000000 ),
    .CLKOUT2_DUTY_CYCLE ( 0.500000 ),
    .CLKOUT2_PHASE ( 0.000000 ),
    .CLKOUT3_DUTY_CYCLE ( 0.500000 ),
    .CLKOUT3_PHASE ( 0.000000 ),
    .CLKOUT4_DUTY_CYCLE ( 0.500000 ),
    .CLKOUT4_PHASE ( 0.000000 ),
    .CLKOUT5_DUTY_CYCLE ( 0.500000 ),
    .CLKOUT5_PHASE ( 0.000000 ),
    .REF_JITTER ( 0.010000 ))
  \HDMI/pixel_clk_480p/pll_base_inst  (
    .CLKIN(\HDMI/pixel_clk_480p/clkin1 ),
    .CLKOUT1(\HDMI/pixel_clk_480p/clkout1 ),
    .CLKOUT0(\HDMI/pixel_clk_x10 ),
    .CLKOUT2(\HDMI/pixel_clk_480p/clkout2 ),
    .RST(\HDMI/hdmi_out/enc0/encb/Madd_cnt[4]_GND_6_o_sub_41_OUT_cy<2> ),
    .LOCKED(\HDMI/pixel_clk_LOCKED ),
    .CLKOUT3(\NLW_HDMI/pixel_clk_480p/pll_base_inst_CLKOUT3_UNCONNECTED ),
    .CLKFBIN(\NLW_HDMI/pixel_clk_480p/pll_base_inst_CLKFBIN_UNCONNECTED ),
    .CLKOUT4(\NLW_HDMI/pixel_clk_480p/pll_base_inst_CLKOUT4_UNCONNECTED ),
    .CLKOUT5(\NLW_HDMI/pixel_clk_480p/pll_base_inst_CLKOUT5_UNCONNECTED ),
    .CLKFBOUT(\NLW_HDMI/pixel_clk_480p/pll_base_inst_CLKFBOUT_UNCONNECTED )
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

