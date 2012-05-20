`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:40:29 05/20/2012 
// Design Name: 
// Module Name:    videoRam 
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
module videoRam(
// These pins are named after the nets given in the Atlys UCF file.
	output DDR2CLK_P,
	output DDR2CLK_N,
	output DDR2CKE,
	output DDR2RASN,
	output DDR2CASN,
	output DDR2WEN,
	inout DDR2RZQ,
	inout DDR2ZIO,
	output [2:0] DDR2BA, // With the exception of these three. I changed the UCF file to do DDR2BA[0] etc., which is neater

	output [12:0] DDR2A,
	inout [15:0] DDR2DQ,

	inout DDR2UDQS_P,
	inout DDR2UDQS_N,
	inout DDR2LDQS_P,
	inout DDR2LDQS_N,
	output DDR2LDM,
	output DDR2UDM,
	output DDR2ODT,

	input clk, // 100 MHz oscillator = 10ns period (top level pin)

	input wire [2:0] p0_cmd_instr,
	input wire [5:0] p0_cmd_bl,
	input wire [29:0] p0_cmd_byte_addr,
	input wire [7:0] p0_wr_mask,
	input wire [31:0] p0_wr_data,
	output wire [6:0] p0_wr_count,
	output wire [31:0] p0_rd_data,
	output wire [6:0] p0_rd_count,
	input wire p0_rd_en,
	output wire p0_rd_empty,
	input wire p0_wr_en,

	input wire [2:0] p1_cmd_instr,
	input wire [5:0] p1_cmd_bl,
	input wire [29:0] p1_cmd_byte_addr,
	input wire [7:0] p1_wr_mask,
	output wire [6:0] p1_wr_count,
	input wire [31:0] p1_wr_data,
	output wire [31:0] p1_rd_data,
	output wire [6:0] p1_rd_count,
	input wire p1_rd_en,
	output wire p1_rd_empty,
	input wire p1_wr_en,
	input wire p0_cmd_en,

	output wire calib_done,
	input wire reset,
	output wire clk0
    );
	 
	wire rst0; // It's an output
	 
	ramModule # (
    .P0_MASK_SIZE(4),
    .P0_DATA_PORT_SIZE(32),
    .P1_MASK_SIZE(4),
    .P1_DATA_PORT_SIZE(32),
    .DEBUG_EN(0),
    .MEMCLK_PERIOD(3000),
    .CALIB_SOFT_IP("TRUE"),
    .SIMULATION("FALSE"),
    .RST_ACT_LOW(0),
    .INPUT_CLK_TYPE("SINGLE_ENDED"),
    .MEM_ADDR_ORDER("ROW_BANK_COLUMN"),
    .NUM_DQ_PINS(16),
    .MEM_ADDR_WIDTH(13),
    .MEM_BANKADDR_WIDTH(3)
	)
	u_ramModule (

	  .sys_clk           (clk),
	  .sys_rst_i           (reset),                        
	  
	   .mcb3_dram_dq           (DDR2DQ),  
		.mcb3_dram_a            (DDR2A),  
		.mcb3_dram_ba           (DDR2BA),
		.mcb3_dram_ras_n        (DDR2RASN),                        
		.mcb3_dram_cas_n        (DDR2CASN),                        
		.mcb3_dram_we_n         (DDR2WEN),                          
		.mcb3_dram_odt          (DDR2ODT),
		.mcb3_dram_cke          (DDR2CKE),                          
		.mcb3_dram_ck           (DDR2CLK_P),                          
		.mcb3_dram_ck_n         (DDR2CLK_N),       
		.mcb3_dram_dqs          (DDR2LDQS_P),                          
		.mcb3_dram_dqs_n        (DDR2LDQS_N),
		.mcb3_dram_udqs         (DDR2UDQS_P),    	// for X16 parts                        
		.mcb3_dram_udqs_n       (DDR2UDQS_N),  	// for X16 parts
		.mcb3_dram_udm          (DDR2UDM),    	   // for X16 parts
		.mcb3_dram_dm           (DDR2LDM),
	  
	  
	  .clk0		        (clk0),
	  .rst0		        (rst0),
	  .calib_done          (calib_done),
	  .mcb3_rzq               (rzq3),
	  .mcb3_zio               (zio3),
						
		.p0_cmd_clk                          (clk0),					// Clock
		.p0_cmd_en                           (p0_cmd_en),
		.p0_cmd_instr                        (p0_cmd_instr),
		.p0_cmd_bl                           (p0_cmd_bl),
		.p0_cmd_byte_addr                    (p0_cmd_byte_addr),
		.p0_cmd_empty                        (p0_cmd_empty),
		.p0_cmd_full                         (p0_cmd_full),
		.p0_wr_clk                           (clk0),					// Clock
		.p0_wr_en                            (p0_wr_en),
		.p0_wr_mask                          (p0_wr_mask),
		.p0_wr_data                          (p0_wr_data),
		.p0_wr_full                          (p0_wr_full),
		.p0_wr_empty                         (p0_wr_empty),
		.p0_wr_count                         (p0_wr_count),
		.p0_wr_underrun                      (p0_wr_underrun),
		.p0_wr_error                         (p0_wr_error),
		.p0_rd_clk                           (clk0),					// Clock
		.p0_rd_en                            (p0_rd_en),
		.p0_rd_data                          (p0_rd_data),
		.p0_rd_full                          (p0_rd_full),
		.p0_rd_empty                         (p0_rd_empty),
		.p0_rd_count                         (p0_rd_count),
		.p0_rd_overflow                      (p0_rd_overflow),
		.p0_rd_error                         (p0_rd_error),
		
		.p1_cmd_clk                          (clk0),					// Clock
		.p1_cmd_en                           (p1_cmd_en),
		.p1_cmd_instr                        (p1_cmd_instr),
		.p1_cmd_bl                           (p1_cmd_bl),
		.p1_cmd_byte_addr                    (p1_cmd_byte_addr),
		.p1_cmd_empty                        (p1_cmd_empty),
		.p1_cmd_full                         (p1_cmd_full),
		.p1_wr_clk                           (clk0),					// Clock
		.p1_wr_en                            (p1_wr_en),
		.p1_wr_mask                          (p1_wr_mask),
		.p1_wr_data                          (p1_wr_data),
		.p1_wr_full                          (p1_wr_full),
		.p1_wr_empty                         (p1_wr_empty),
		.p1_wr_count                         (p1_wr_count),
		.p1_wr_underrun                      (p1_wr_underrun),
		.p1_wr_error                         (p1_wr_error),
		.p1_rd_clk                           (clk0),					// Clock
		.p1_rd_en                            (p1_rd_en),
		.p1_rd_data                          (p1_rd_data),
		.p1_rd_full                          (p1_rd_full),
		.p1_rd_empty                         (p1_rd_empty),
		.p1_rd_count                         (p1_rd_count),
		.p1_rd_overflow                      (p1_rd_overflow),
		.p1_rd_error                         (p1_rd_error)
	);


endmodule
