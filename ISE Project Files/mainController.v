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
	//input [5:0] btn,
	input [3:0] SW,
	
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
	
	clockGeneration mainClockGen (
    .CLK_IN100m(sysclk),      // IN
    .Render_CLK(render_clk), // OUT
    .Color_CLK(color_clk));  // OUT
		
		
	/*reg [27:0] led_count;
	assign LED[7:6] = led_count[27:26];
	assign LED[4] = update;
	assign LED[5] = 1;
	
	always @(posedge color_clk)
		led_count <= led_count + 1;*/


//////////////////////////////////////
/// Debounce and Syncronize Switches
//////////////////////////////////////
	wire  [3:0] sws_sync; //synchronous output

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_sws_3 (.async(SW[3]),.sync(sws_sync[3]),.clk(clk50m_bufg));

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_sws_2 (.async(SW[2]),.sync(sws_sync[2]),.clk(clk50m_bufg));

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_sws_1 (.async(SW[1]),.sync(sws_sync[1]),.clk(clk50m_bufg));

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_sws_0 (.async(SW[0]),.sync(sws_sync[0]),.clk(clk50m_bufg));

	reg [3:0] resolution;
	always @ (posedge clk50m_bufg)
	begin
		resolution <= sws_sync;
	end

	wire sw0_rdy, sw1_rdy, sw2_rdy, sw3_rdy;

	debnce debsw0 (
		.sync(resolution[0]),
		.debnced(sw0_rdy),
		.clk(clk50m_bufg));

	debnce debsw1 (
		.sync(resolution[1]),
		.debnced(sw1_rdy),
		.clk(clk50m_bufg));

	debnce debsw2 (
		.sync(resolution[2]),
		.debnced(sw2_rdy),
		.clk(clk50m_bufg));

	debnce debsw3 (
		.sync(resolution[3]),
		.debnced(sw3_rdy),
		.clk(clk50m_bufg));

  reg update = 1'b0;
  
  always @ (posedge clk50m_bufg)
  begin
    update <= pwrup | sw0_rdy | sw1_rdy | sw2_rdy | sw3_rdy;
  end


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
	reg [31:0] p1_wr_data;
	wire p1_rd_en;
	reg p1_wr_en;
	wire p0_cmd_en;
	wire p1_cmd_en;
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
		.p1_wr_en(p1_wr_en), 
		.p0_cmd_en(p0_cmd_en),
		.p1_cmd_en(p1_cmd_en),
		.calib_done(mem_calib_done), 
		.reset(mem_reset),
		.clk0(clk0),
		.p0clk(render_clk),
		.p1clk(color_clk)
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

	parameter set_size = 1;
	parameter max_iterations = 255;

	// Outputs
	wire mandelbrot_data_ready;
	wire frame_ready;
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
	 .update(update),
	 .resolution(resolution),
    .send_data(mandelbrot_send_data), 
    .start_render(start_render), 
	 .clear_frame(clear_frame),
    .data(point_data), 
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
		 .data(point_data), 
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
/// Port1 Controller
//////////////////////////////////////

	// Outputs
	//wire [23:0] data_out;
	wire data_out_valid;

	ddrPort1Controller # (
	 .max_iterations(max_iterations)
	) port1Controller (
    .clk(color_clk), 
    .reset(SYS_RESET), 
    .base_selector(frame_selector), 
    .resolution(resolution), 
    .update(update), 
    .rd_data(p1_rd_data), 
    .rd_count(p1_rd_count), 
    .rd_empty(p1_rd_empty), 
    .rd_full(p1_rd_full), 
    .mem_calib_done(mem_calib_done), 
    .cmd_instr(p1_cmd_instr), 
    .cmd_bl(p1_cmd_bl), 
    .cmd_byte_addr(p1_cmd_byte_addr), 
    .rd_en(p1_rd_en), 
    .cmd_en(p1_cmd_en), 
    .stream_data(stream_data), 
    .end_line(end_line),
    .y_pos(y_pos),	 
	 .pclk(pclk),
    .data_out({red_data_in, green_data_in, blue_data_in}), 
    .data_out_valid(data_out_valid)
	 //.LED(LED[3:0])
	 //.LED(LED[1])
    );
		
endmodule
