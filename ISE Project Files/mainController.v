`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:56:56 07/31/2011 
// Design Name: 
// Module Name:    mainController
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mainController(

	// DDR2 Ram
	/*output DDR2CLK_P,
	output DDR2CLK_N,
	output DDR2CKE,
	output DDR2RASN,
	output DDR2CASN,
	output DDR2WEN,
	inout DDR2RZQ,
	inout DDR2ZIO,
	output [2:0] DDR2BA,

	output [12:0] DDR2A,
	inout [15:0] DDR2DQ,

	output DDR2UDQS_P,
	output DDR2UDQS_N,
	output DDR2LDQS_P,
	output DDR2LDQS_N,
	output DDR2LDM,
	output DDR2UDM,
	output DDR2ODT,*/

	// CLK
	input clk, // 100 MHz oscillator = 10ns period (top level pin)
	//input nreset,
	
	// Buttons and switches
	//input [5:0] btn,
	//input [7:0] sw,
	
	// HDMI Out
	output HDMIOUTCLKP,
	output HDMIOUTCLKN,
	output [2:0] HDMIOUTDP,
	output [2:0] HDMIOUTDN,
	
	// LED Out
	output wire [7:0] LED
    );
	 
	 
	wire resetn = 1;
	
	/*
	// Inputs
	wire [2:0] p0_cmd_instr;
	wire [5:0] p0_cmd_bl;
	wire [29:0] p0_cmd_byte_addr;
	reg [3:0] p0_wr_mask;
	wire [31:0] p0_wr_data;
	reg p0_rd_en;
	wire p0_wr_en;
	reg [2:0] p1_cmd_instr;
	reg [5:0] p1_cmd_bl;
	reg [29:0] p1_cmd_byte_addr;
	reg [3:0] p1_wr_mask;
	reg [31:0] p1_wr_data;
	reg p1_rd_en;
	reg p1_wr_en;
	wire p0_cmd_en;
	wire mem_reset;

	// Outputs
	wire [6:0] p0_wr_count;
	wire [31:0] p0_rd_data;
	wire [6:0] p0_rd_count;
	wire p0_rd_empty;
	wire p0_wr_full;
	wire p0_wr_empty;
	wire [6:0] p1_wr_count;
	wire [31:0] p1_rd_data;
	wire [6:0] p1_rd_count;
	wire p1_rd_empty;
	wire mem_calib_done;
	wire clk0;
	//wire CLK = clk;


	// Instantiate the Unit Under Test (UUT)
	videoRam vram (
		.DDR2CLK_P(DDR2CLK_P), 
		.DDR2CLK_N(DDR2CLK_N), 
		.DDR2CKE(DDR2CKE), 
		.DDR2RASN(DDR2RASN), 
		.DDR2CASN(DDR2CASN), 
		.DDR2WEN(DDR2WEN), 
		.DDR2RZQ(DDR2RZQ), 
		.DDR2ZIO(DDR2ZIO), 
		.DDR2BA(DDR2BA), 
		.DDR2A(DDR2A), 
		.DDR2DQ(DDR2DQ), 
		.DDR2UDQS_P(DDR2UDQS_P), 
		.DDR2UDQS_N(DDR2UDQS_N), 
		.DDR2LDQS_P(DDR2LDQS_P), 
		.DDR2LDQS_N(DDR2LDQS_N), 
		.DDR2LDM(DDR2LDM), 
		.DDR2UDM(DDR2UDM), 
		.DDR2ODT(DDR2ODT), 
		.clk(clk), 
		.p0_cmd_instr(p0_cmd_instr), 
		.p0_cmd_bl(p0_cmd_bl), 
		.p0_cmd_byte_addr(p0_cmd_byte_addr), 
		.p0_wr_mask(p0_wr_mask), 
		.p0_wr_data(p0_wr_data), 
		.p0_wr_count(p0_wr_count), 
		.p0_rd_data(p0_rd_data), 
		.p0_rd_count(p0_rd_count), 
		.p0_rd_en(p0_rd_en), 
		.p0_rd_empty(p0_rd_empty),
		.p0_wr_full(p0_wr_full),
		.p0_wr_empty(p0_wr_empty),
		.p0_wr_en(p0_wr_en), 
		.p1_cmd_instr(p1_cmd_instr), 
		.p1_cmd_bl(p1_cmd_bl), 
		.p1_cmd_byte_addr(p1_cmd_byte_addr), 
		.p1_wr_mask(p1_wr_mask), 
		.p1_wr_count(p1_wr_count), 
		.p1_wr_data(p1_wr_data), 
		.p1_rd_data(p1_rd_data), 
		.p1_rd_count(p1_rd_count), 
		.p1_rd_en(p1_rd_en), 
		.p1_rd_empty(p1_rd_empty),
		.p1_wr_en(p1_wr_en), 
		.p0_cmd_en(p0_cmd_en), 
		.calib_done(mem_calib_done), 
		.reset(mem_reset),
		.clk0(clk0)
	);
	
	// Outputs
	wire mandelbrot_data_ready;
	wire frame_ready;
	wire [31:0] point_data;
	
	// Inputs
	wire mandelbrot_send_data;
	wire start_render = 1;
	
	mandelbrotRederingEngine mandelbrot (
    .CLK(clk0), 
    .send_data(mandelbrot_send_data), 
    .start_render(start_render), 
    .data(point_data), 
    .ready(mandelbrot_data_ready), 
    .frame_ready(frame_ready)
    );
	 
	ddrPort0Controller port0Controller (
		 .clk(clk0), 
		 .data(point_data), 
		 .ready(mandelbrot_data_ready), 
		 .frame_ready(frame_ready), 
		 .send_data(mandelbrot_send_data), 
		 .mem_calib_done(mem_calib_done), 
		 .p0_wr_full(p0_wr_full), 
		 .p0_wr_empty(p0_wr_empty), 
		 .reset(mem_reset), 
		 .p0_wr_en(p0_wr_en), 
		 .p0_cmd_instr(p0_cmd_instr), 
		 .p0_cmd_en(p0_cmd_en), 
		 .p0_cmd_bl(p0_cmd_bl), 
		 .p0_cmd_byte_addr(p0_cmd_byte_addr), 
		 .p0_wr_data(p0_wr_data)
		 );*/
		 
	 
	wire [3:0] tmdsint;
	
	HDMI_Controller HDMI (
    .clk(clk), 
	 .resetn(resetn),
    .TMDSP({HDMIOUTCLKP, HDMIOUTDP}), 
    .TMDSN({HDMIOUTCLKN, HDMIOUTDN}),
	 .led(LED[1])
    );

	 /*reg [24:0] led_timer;
	 assign LED[1] = led_timer [24];
	 
	 always @ (posedge pixel_clk)
		led_timer <= led_timer + 'b1;
		
	pixelClock480p pixel_clk_480p
   (// Clock in ports
    .CLK_IN(clk),      					// IN
    // Clock out ports
    .pixel_clk(pixel_clk),     		// OUT
    .pixel_clk_x2(pixel_clk_x2),    // OUT
    .pixel_clk_x10(pixel_clk_x10),  // OUT
    // Status and control signals
    .LOCKED(pixel_clk_LOCKED)); 	// OUT*/
		
endmodule
