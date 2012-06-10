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
	output DDR2CLK_P,
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

	inout DDR2UDQS_P,
	inout DDR2UDQS_N,
	inout DDR2LDQS_P,
	inout DDR2LDQS_N,
	output DDR2LDM,
	output DDR2UDM,
	output DDR2ODT,

	// CLK
	input SYS_CLK, // 100 MHz oscillator = 10ns period (top level pin)
	input SYS_RESETn,
	
	// Buttons and switches
	input [4:0] btn,
	input [3:0] SW,
	
	// JB
	input [7:0] JB,
	
	// HDMI Out
	output HDMIOUTCLKP,
	output HDMIOUTCLKN,
	output [2:0] HDMIOUTDP,
	output [2:0] HDMIOUTDN,
	
	// LED Out
	output wire [7:0] LED
    );
	 
	//******************************************************************//
	// Create global clock and synchronous system reset.                //
	//******************************************************************//
	wire          locked;
	//wire          reset;
	wire sysreset = ~SYS_RESETn;
	wire SYS_RESET;
	
	BUF sys_reset_buf (.I(sysreset), .O(SYS_RESET));

	wire          clk50m, clk50m_bufg;

	wire          pwrup;

	IBUFG sysclk_buf (.I(SYS_CLK), .O(sysclk));

	BUFIO2 #(.DIVIDE_BYPASS("FALSE"), .DIVIDE(2))
	sysclk_div (.DIVCLK(clk50m), .IOCLK(), .SERDESSTROBE(), .I(sysclk));

	BUFG clk50m_bufgbufg (.I(clk50m), .O(clk50m_bufg));

	wire pclk_lckd;
	
	SRL16E #(.INIT(16'h1)) pwrup_0 (
		.Q(pwrup),
		.A0(1'b1),
		.A1(1'b1),
		.A2(1'b1),
		.A3(1'b1),
		.CE(pclk_lckd),
		.CLK(clk50m_bufg),
		.D(1'b0)
	);
	
	wire render_clk;
	wire color_clk;
	wire read_clk;
	
	clockGeneration mainClockGen (
    .CLK_IN100m(sysclk),     // IN
    .Render_CLK(render_clk), // OUT
    .Color_CLK(color_clk),	  // OUT
	 .Read_CLK(read_clk));	  // OUT
		
////////////////////
// Button Setup
////////////////////

	wire [7:0] JBn = ~JB;
	wire [5:0] command = {JBn[7], {JBn[6], JBn[3:0]} | btn}; 


//////////////////////////////////////
/// Memory Controller
//////////////////////////////////////
	 
	// Inputs
	wire [2:0] p0_cmd_instr;
	wire [5:0] p0_cmd_bl;
	wire [29:0] p0_cmd_byte_addr;
	reg [3:0] p0_wr_mask;
	wire [31:0] p0_wr_data;
	wire p0_rd_en;
	wire p0_wr_en;
	
	wire [2:0] p1_cmd_instr;
	wire [5:0] p1_cmd_bl;
	wire [29:0] p1_cmd_byte_addr;
	reg [3:0] p1_wr_mask;
	wire [31:0] p1_wr_data;
	wire p1_rd_en;
	wire p1_wr_en;
	
	wire [2:0] p2_cmd_instr;
	wire [5:0] p2_cmd_bl;
	wire [29:0] p2_cmd_byte_addr;
	wire p2_rd_en;
	wire p0_cmd_en;
	wire p1_cmd_en;
	wire p2_cmd_en;
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
	wire p1_rd_full;
	wire p1_wr_empty;
	
	wire [31:0] p2_rd_data;
	wire [6:0] p2_rd_count;
	wire p2_rd_empty;
	wire p2_rd_full;
	wire mem_calib_done;
	wire clk0;


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
		.clk(sysclk), 
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
		.p1_rd_full(p1_rd_full),
		.p1_wr_empty(p1_wr_empty),
		.p1_wr_en(p1_wr_en), 
		.p2_cmd_instr(p2_cmd_instr), 
		.p2_cmd_bl(p2_cmd_bl), 
		.p2_cmd_byte_addr(p2_cmd_byte_addr), 
		.p2_rd_data(p2_rd_data), 
		.p2_rd_count(p2_rd_count), 
		.p2_rd_en(p2_rd_en), 
		.p2_rd_empty(p2_rd_empty),
		.p2_rd_full(p2_rd_full),
		.p0_cmd_en(p0_cmd_en),
		.p1_cmd_en(p1_cmd_en),
		.p2_cmd_en(p2_cmd_en),
		.calib_done(mem_calib_done), 
		.reset(mem_reset),
		.clk0(clk0),
		.p0clk(render_clk),
		.p1clk(color_clk),
		.p2clk(read_clk)
	);
	

  
//////////////////////////////////////
/// HDMI Controller
//////////////////////////////////////

	// Inputs
	wire [7:0] red_data_in;
	wire [7:0] green_data_in;
	wire [7:0] blue_data_in;
	
	// Outputs
	wire stream_data;
	wire pclk;
	wire end_line;
	wire [10:0] y_pos;
	
	HDMI_Controller HDMI (
	 .clk50m(clk50m),
    .clk50m_bufg(clk50m_bufg), 
	 .RESET(SYS_RESET),
	 .SW(SW[3:0]),
	 .pwrup(pwrup),
    .TMDSP({HDMIOUTCLKP, HDMIOUTDP}), 
    .TMDSN({HDMIOUTCLKN, HDMIOUTDN}),
	 .pclk_lckd(pclk_lckd),
	 .red_data_in(red_data_in),
	 .green_data_in(green_data_in),
	 .blue_data_in(blue_data_in),
	 .retrieve_data(stream_data),
	 .pclk(pclk),
	 .end_line(end_line),
	 .y_pos(y_pos)
    );
	 

//////////////////////////////////////
/// Mandelbrot Generator
//////////////////////////////////////

	parameter set_size = 2;
	parameter max_iterations = 255;

	// Outputs
	wire mandelbrot_data_ready;
	wire frame_ready;
	wire render_reset;
	wire [31:0] point_data;
	
	// Inputs
	wire mandelbrot_send_data;
	wire start_render = 1;
	wire clear_frame;
	
	mandelbrotRederingEngine  # (
		 .set_size(set_size),
		 .max_iterations(max_iterations)
	) mandelbrot (
    .CLK(render_clk), 
	 .SYS_RESET(SYS_RESET),
	 .pwrup(pwrup),
	 .SW(SW),
	 .btn(command),
    .send_data(mandelbrot_send_data), 
    .start_render(start_render), 
	 .clear_frame(clear_frame),
    .data(point_data), 
	 .render_reset(render_reset),
    .ready(mandelbrot_data_ready), 
    .frame_ready(frame_ready),
	 .LED(LED[7:0])
    );
	 
	 
//////////////////////////////////////
/// Port0 Controller
//////////////////////////////////////

	// Outputs
	wire frame_selector;
	 
	ddrPort0Controller # (
		 .set_size(set_size)
	) port0Controller (
		 .clk(render_clk), 
		 .reset(SYS_RESET),
		 .data(point_data), 
		 .render_reset(render_reset),
		 .ready(mandelbrot_data_ready), 
		 .frame_ready(frame_ready), 
		 .send_data(mandelbrot_send_data), 
		 .clear_frame(clear_frame),
		 .mem_calib_done(mem_calib_done), 
		 .p0_wr_full(p0_wr_full), 
		 .p0_wr_empty(p0_wr_empty), 
		 .p0_rd_empty(p0_rd_empty),
		 .p0_rd_data(p0_rd_data),
		 .mem_reset(mem_reset), 
		 .p0_wr_en(p0_wr_en), 
		 .p0_rd_en(p0_rd_en),
		 .p0_wr_count(p0_wr_count),
		 .p0_cmd_instr(p0_cmd_instr), 
		 .p0_cmd_en(p0_cmd_en), 
		 .p0_cmd_bl(p0_cmd_bl), 
		 .p0_cmd_byte_addr(p0_cmd_byte_addr), 
		 .p0_wr_data(p0_wr_data),
		 .memory_frame(frame_selector)
		 //.LED(LED[3:0])
		 //.LED(LED[0])
		 );
		 
		 //assign LED[3:2] = 2'b11;
		 

//////////////////////////////////////
/// Port2 Controller
//////////////////////////////////////

	// Outputs
	//wire [23:0] data_out;
	wire data_out_valid;

	ddrPort1Controller # (
	 .max_iterations(max_iterations)
	) port2Controller (
    .clk(read_clk), 
    .reset(SYS_RESET), 
    .base_selector(frame_selector), 
	 .pwrup(pwrup),
    .SW(SW), 
    .rd_data(p2_rd_data), 
    .rd_count(p2_rd_count), 
    .rd_empty(p2_rd_empty), 
    .rd_full(p2_rd_full), 
    .mem_calib_done(mem_calib_done), 
    .cmd_instr(p2_cmd_instr), 
    .cmd_bl(p2_cmd_bl), 
    .cmd_byte_addr(p2_cmd_byte_addr), 
    .rd_en(p2_rd_en), 
    .cmd_en(p2_cmd_en), 
    .stream_data(stream_data), 
    .end_line(end_line),
    .y_pos(y_pos),	 
	 .pclk(pclk),
    .data_out({red_data_in, green_data_in, blue_data_in}), 
    .data_out_valid(data_out_valid)
    );
	

//////////////////////////////////////
/// Color Rom Controller
//////////////////////////////////////
	
	colorModule port1Controller (
    .clk(color_clk), 
    .reset(SYS_RESET), 
    .pwrup(pwrup), 
    .SW(SW), 
	 .encoder(JB[5:4]),
    .rd_data(p1_rd_data), 
    .rd_count(p1_rd_count), 
    .rd_empty(p1_rd_empty), 
    .rd_en(p1_rd_en), 
    .wr_empty(p1_wr_empty), 
    .wr_count(p1_wr_count), 
    .wr_data(p1_wr_data), 
    .wr_en(p1_wr_en), 
    .mem_calib_done(mem_calib_done), 
    .cmd_instr(p1_cmd_instr), 
    .cmd_bl(p1_cmd_bl), 
    .cmd_byte_addr(p1_cmd_byte_addr), 
    .cmd_en(p1_cmd_en)
    );
		
endmodule
