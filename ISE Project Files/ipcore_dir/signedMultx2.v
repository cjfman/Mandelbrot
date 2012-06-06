////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.76xd
//  \   \         Application: netgen
//  /   /         Filename: signedMultx2.v
// /___/   /\     Timestamp: Wed Jun 06 07:19:32 2012
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog "C:/Users/Charles Franklin/Documents/FPGA/Mandelbrot/ISE Project Files/ipcore_dir/tmp/_cg/signedMultx2.ngc" "C:/Users/Charles Franklin/Documents/FPGA/Mandelbrot/ISE Project Files/ipcore_dir/tmp/_cg/signedMultx2.v" 
// Device	: 6slx45csg324-3
// Input file	: C:/Users/Charles Franklin/Documents/FPGA/Mandelbrot/ISE Project Files/ipcore_dir/tmp/_cg/signedMultx2.ngc
// Output file	: C:/Users/Charles Franklin/Documents/FPGA/Mandelbrot/ISE Project Files/ipcore_dir/tmp/_cg/signedMultx2.v
// # of Modules	: 1
// Design Name	: signedMultx2
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

module signedMultx2 (
a, p
)/* synthesis syn_black_box syn_noprune=1 */;
  input [32 : 0] a;
  output [34 : 0] p;
  
  // synthesis translate_off
  
  wire [32 : 0] NlwRenamedSignal_a;
  assign
    NlwRenamedSignal_a[32] = a[32],
    NlwRenamedSignal_a[31] = a[31],
    NlwRenamedSignal_a[30] = a[30],
    NlwRenamedSignal_a[29] = a[29],
    NlwRenamedSignal_a[28] = a[28],
    NlwRenamedSignal_a[27] = a[27],
    NlwRenamedSignal_a[26] = a[26],
    NlwRenamedSignal_a[25] = a[25],
    NlwRenamedSignal_a[24] = a[24],
    NlwRenamedSignal_a[23] = a[23],
    NlwRenamedSignal_a[22] = a[22],
    NlwRenamedSignal_a[21] = a[21],
    NlwRenamedSignal_a[20] = a[20],
    NlwRenamedSignal_a[19] = a[19],
    NlwRenamedSignal_a[18] = a[18],
    NlwRenamedSignal_a[17] = a[17],
    NlwRenamedSignal_a[16] = a[16],
    NlwRenamedSignal_a[15] = a[15],
    NlwRenamedSignal_a[14] = a[14],
    NlwRenamedSignal_a[13] = a[13],
    NlwRenamedSignal_a[12] = a[12],
    NlwRenamedSignal_a[11] = a[11],
    NlwRenamedSignal_a[10] = a[10],
    NlwRenamedSignal_a[9] = a[9],
    NlwRenamedSignal_a[8] = a[8],
    NlwRenamedSignal_a[7] = a[7],
    NlwRenamedSignal_a[6] = a[6],
    NlwRenamedSignal_a[5] = a[5],
    NlwRenamedSignal_a[4] = a[4],
    NlwRenamedSignal_a[3] = a[3],
    NlwRenamedSignal_a[2] = a[2],
    NlwRenamedSignal_a[1] = a[1],
    NlwRenamedSignal_a[0] = a[0],
    p[34] = NlwRenamedSignal_a[32],
    p[33] = NlwRenamedSignal_a[32],
    p[32] = NlwRenamedSignal_a[31],
    p[31] = NlwRenamedSignal_a[30],
    p[30] = NlwRenamedSignal_a[29],
    p[29] = NlwRenamedSignal_a[28],
    p[28] = NlwRenamedSignal_a[27],
    p[27] = NlwRenamedSignal_a[26],
    p[26] = NlwRenamedSignal_a[25],
    p[25] = NlwRenamedSignal_a[24],
    p[24] = NlwRenamedSignal_a[23],
    p[23] = NlwRenamedSignal_a[22],
    p[22] = NlwRenamedSignal_a[21],
    p[21] = NlwRenamedSignal_a[20],
    p[20] = NlwRenamedSignal_a[19],
    p[19] = NlwRenamedSignal_a[18],
    p[18] = NlwRenamedSignal_a[17],
    p[17] = NlwRenamedSignal_a[16],
    p[16] = NlwRenamedSignal_a[15],
    p[15] = NlwRenamedSignal_a[14],
    p[14] = NlwRenamedSignal_a[13],
    p[13] = NlwRenamedSignal_a[12],
    p[12] = NlwRenamedSignal_a[11],
    p[11] = NlwRenamedSignal_a[10],
    p[10] = NlwRenamedSignal_a[9],
    p[9] = NlwRenamedSignal_a[8],
    p[8] = NlwRenamedSignal_a[7],
    p[7] = NlwRenamedSignal_a[6],
    p[6] = NlwRenamedSignal_a[5],
    p[5] = NlwRenamedSignal_a[4],
    p[4] = NlwRenamedSignal_a[3],
    p[3] = NlwRenamedSignal_a[2],
    p[2] = NlwRenamedSignal_a[1],
    p[1] = NlwRenamedSignal_a[0];
  GND   blk00000001 (
    .G(p[0])
  );

// synthesis translate_on

endmodule

// synthesis translate_off

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

// synthesis translate_on
