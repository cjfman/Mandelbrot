`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:51 07/31/2011 
// Design Name: 
// Module Name:    ddr_interface
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
module ddr_interface(

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

	input wire [2:0] c3_p0_cmd_instr,
	input wire [5:0] c3_p0_cmd_bl,
	input wire [29:0] c3_p0_cmd_byte_addr,
	input wire [7:0] c3_p0_wr_mask,
	input wire [63:0] c3_p0_wr_data,
	output wire [6:0] c3_p0_wr_count,
	output wire [63:0] c3_p0_rd_data,
	output wire [6:0] c3_p0_rd_count,
	input wire c3_p0_rd_en,
	output wire c3_p0_rd_empty,
	input wire c3_p0_wr_en,

	input wire [2:0] c3_p1_cmd_instr,
	input wire [5:0] c3_p1_cmd_bl,
	input wire [29:0] c3_p1_cmd_byte_addr,
	input wire [7:0] c3_p1_wr_mask,
	output wire [6:0] c3_p1_wr_count,
	input wire [63:0] c3_p1_wr_data,
	output wire [63:0] c3_p1_rd_data,
	output wire [6:0] c3_p1_rd_count,
	input wire c3_p1_rd_en,
	output wire c3_p1_rd_empty,
	input wire c3_p1_wr_en,
	input wire c3_p0_cmd_en,

	output wire c3_calib_done,
	input wire reset,
	output wire c3_clk0 // 32 MHz clock generated by PLL. Actually, this should be 78 MHz! Investigate this.
	);

	wire c3_rst0; // It's an output

	ddr2 # (
		.C3_P0_MASK_SIZE(8),
		.C3_P0_DATA_PORT_SIZE(64),
		.C3_P1_MASK_SIZE(8),
		.C3_P1_DATA_PORT_SIZE(64),
		.DEBUG_EN(1),
		.C3_MEMCLK_PERIOD(3200),
		.C3_CALIB_SOFT_IP("TRUE"),
		.C3_SIMULATION("FALSE"), // This was FALSE in the template - probably doesn't hurt to switch on!
		.C3_RST_ACT_LOW(0),
		.C3_INPUT_CLK_TYPE("SINGLE_ENDED"),
		.C3_MEM_ADDR_ORDER("BANK_ROW_COLUMN"),
		.C3_NUM_DQ_PINS(16),
		.C3_MEM_ADDR_WIDTH(13),
		.C3_MEM_BANKADDR_WIDTH(3)
	)
	u_ddr2 (

		.c3_sys_clk           	(clk), // 100 MHz system clock
		.c3_sys_rst_n           (reset),                        

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
		.mcb3_dram_udqs         (DDR2UDQS_P),    // for X16 parts                        
		.mcb3_dram_udqs_n       (DDR2UDQS_N),  // for X16 parts
		.mcb3_dram_udm          (DDR2UDM),     // for X16 parts
		.mcb3_dram_dm           (DDR2LDM),

		.c3_clk0		        		(c3_clk0), // This is the user clock output generated by the PLL
		.c3_rst0		        		(c3_rst0),
		.c3_calib_done          (c3_calib_done),
		.mcb3_rzq               (DDR2RZQ),
		.mcb3_zio               (DDR2ZIO),

		// Here we're feeding the user clock into the port FIFOs. You will not want to do this if you are running 
		// the FIFOs (three per port!) in different clock domains, but then you'll need to bring clocks in from elsewhere.
		.c3_p0_cmd_clk                          (c3_clk0), // A clock!
		.c3_p0_cmd_en                           (c3_p0_cmd_en),
		.c3_p0_cmd_instr                        (c3_p0_cmd_instr),
		.c3_p0_cmd_bl                           (c3_p0_cmd_bl),
		.c3_p0_cmd_byte_addr                    (c3_p0_cmd_byte_addr),
		.c3_p0_cmd_empty                        (c3_p0_cmd_empty),
		.c3_p0_cmd_full                         (c3_p0_cmd_full),
		.c3_p0_wr_clk                           (c3_clk0), // A clock!
		.c3_p0_wr_en                            (c3_p0_wr_en),
		.c3_p0_wr_mask                          (c3_p0_wr_mask),
		.c3_p0_wr_data                          (c3_p0_wr_data),
		.c3_p0_wr_full                          (c3_p0_wr_full),
		.c3_p0_wr_empty                         (c3_p0_wr_empty),
		.c3_p0_wr_count                         (c3_p0_wr_count),
		.c3_p0_wr_underrun                      (c3_p0_wr_underrun),
		.c3_p0_wr_error                         (c3_p0_wr_error),
		.c3_p0_rd_clk                           (c3_clk0), // A clock!
		.c3_p0_rd_en                            (c3_p0_rd_en),
		.c3_p0_rd_data                          (c3_p0_rd_data),
		.c3_p0_rd_full                          (c3_p0_rd_full),
		.c3_p0_rd_empty                         (c3_p0_rd_empty),
		.c3_p0_rd_count                         (c3_p0_rd_count),
		.c3_p0_rd_overflow                      (c3_p0_rd_overflow),
		.c3_p0_rd_error                         (c3_p0_rd_error),

		.c3_p1_cmd_clk                          (c3_clk0), // A clock!
		.c3_p1_cmd_en                           (c3_p1_cmd_en),
		.c3_p1_cmd_instr                        (c3_p1_cmd_instr),
		.c3_p1_cmd_bl                           (c3_p1_cmd_bl),
		.c3_p1_cmd_byte_addr                    (c3_p1_cmd_byte_addr),
		.c3_p1_cmd_empty                        (c3_p1_cmd_empty),
		.c3_p1_cmd_full                         (c3_p1_cmd_full),
		.c3_p1_wr_clk                           (c3_clk0), // A clock!
		.c3_p1_wr_en                            (c3_p1_wr_en),
		.c3_p1_wr_mask                          (c3_p1_wr_mask),
		.c3_p1_wr_data                          (c3_p1_wr_data),
		.c3_p1_wr_full                          (c3_p1_wr_full),
		.c3_p1_wr_empty                         (c3_p1_wr_empty),
		.c3_p1_wr_count                         (c3_p1_wr_count),
		.c3_p1_wr_underrun                      (c3_p1_wr_underrun),
		.c3_p1_wr_error                         (c3_p1_wr_error),
		.c3_p1_rd_clk                           (c3_clk0), // A clock!
		.c3_p1_rd_en                            (c3_p1_rd_en),
		.c3_p1_rd_data                          (c3_p1_rd_data),
		.c3_p1_rd_full                          (c3_p1_rd_full),
		.c3_p1_rd_empty                         (c3_p1_rd_empty),
		.c3_p1_rd_count                         (c3_p1_rd_count),
		.c3_p1_rd_overflow                      (c3_p1_rd_overflow),
		.c3_p1_rd_error                         (c3_p1_rd_error)
	);


		
endmodule
