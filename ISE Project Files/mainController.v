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

	input clk // 100 MHz oscillator = 10ns period (top level pin)

    );
	 
	 
	reg [2:0] p0_cmd_instr;
	reg [5:0] p0_cmd_bl;
	reg [29:0] p0_cmd_byte_addr;
	reg [7:0] p0_wr_mask;
	reg [63:0] p0_wr_data;
	reg p0_rd_en;
	reg p0_wr_en;
	reg [2:0] p1_cmd_instr;
	reg [5:0] p1_cmd_bl;
	reg [29:0] p1_cmd_byte_addr;
	reg [7:0] p1_wr_mask;
	reg [63:0] p1_wr_data;
	reg p1_rd_en;
	reg p1_wr_en;
	reg p0_cmd_en;
	reg reset = 1;

	// Outputs
	wire [6:0] p0_wr_count;
	wire [63:0] p0_rd_data;
	wire [6:0] p0_rd_count;
	wire p0_rd_empty;
	wire [6:0] p1_wr_count;
	wire [63:0] p1_rd_data;
	wire [6:0] p1_rd_count;
	wire p1_rd_empty;
	wire calib_done;
	wire clk0;
	wire CLK = clk;


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
		.calib_done(calib_done), 
		.reset(reset),
		.clk0(clk0)
	);
	
	// Outputs
	wire ready;
	wire [31:0] point_data;
	
	mandelbrotRederingEngine instance_name (
    .CLK(CLK), 
    .send_data(send_data), 
    .start_render(start_render), 
    .data(data), 
    .ready(ready), 
    .frame_ready(frame_ready)
    );
	
	// Memory Variables
	reg [29:0] mem_base_pointer;
	reg [29:0] mem_pointer;
	reg [1:0] calib_done;
	
	initial begin
		mem_base_pointer <= 'd0;
	end
	
	always @(posedge clk0)
		calib_done <= {calib_done[0], calib_done};

	reg [4:0] state = 0;
	reg [11:0] count;
	
	always @(posedge clk0)
		case(state)
		0: begin
			reset <= 0;
			if (calib_done[1]) state <= 1;
		end
		1: begin
			if (!wr_full && ready) begin
				p0_wr_data <= data;
			end
		end
		/*1: begin
			p0_wr_en <= 1;
			p0_wr_data <= 64'd1;
			state <= 2;
			count <= 12'd0;
			end
		7: begin
			p0_wr_en <= 0;
			p0_cmd_instr <= 3'b000; // Write
			p0_cmd_bl <= 6'd6; // 6 bytes
			p0_cmd_byte_addr <= 30'd16; // To address 16
			p0_cmd_en <= 1;
			state <= 8;
			end*/
		/*8: begin
			p0_cmd_en <= 0;
			state <= 9;
			end
		9: begin
			count <= count + 1'b1;
			if (count[11])
				state <= 10;
			end
		10: begin
			count <= 12'd0;
			p0_cmd_bl <= 6'd16; // 16 bytes
			p0_cmd_byte_addr <= 30'd16; // From Address 16
			p0_cmd_instr <= 3'b001; // Read
			p0_cmd_en <= 1;
			state <= 11;
			end
		11: begin
			p0_cmd_en <= 0;
			count <= count + 1'b1;
			if (count[11])
				state <= 0;
			end*/
			
		endcase


endmodule
