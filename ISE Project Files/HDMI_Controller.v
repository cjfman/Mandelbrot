`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:02 05/25/2012 
// Design Name: 
// Module Name:    HDMI_Controller 
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
module HDMI_Controller(
	input clk,
	input reset,
	output wire [3:0] TMDSP,
	output wire [3:0] TMDSN
    );

	// HDMI Out and pixel clock
	
	//Input
	reg [7:0] blue_in;
	reg [7:0] green_in;
	reg [7:0] red_in;
	wire hsync;
	wire vsync;
	wire pixel_enable;
	
	wire pixel_clk;
	wire pixel_clk_x2;
	wire pixel_clk_x10;
	wire pixel_clk_LOCKED;
	
	dvi_out_native hdmi_out (
    .reset(reset), 
    .pll_lckd(pixel_clk_LOCKED), 
    .clkin(pixel_clk), 
    .clkx2in(pixel_clk_x2), 
    .clkx10in(pixel_clk_x10), 
    .blue_din(blue_in), 
    .green_din(green_in), 
    .red_din(red_in), 
    .hsync(hsync), 
    .vsync(vsync), 
    .de(pixel_enable), 
    .TMDS(TMDSP), 
    .TMDSB(TMDSN)
    );	
	
	// Input
	wire pixel_clk_reset;
	
	pixelClock480p pixel_clk_480p
   (// Clock in ports
    .CLK_IN(clk),      					// IN
    // Clock out ports
    .pixel_clk(pixel_clk),     		// OUT
    .pixel_clk_x2(pixel_clk_x2),    // OUT
    .pixel_clk_x10(pixel_clk_x10),  // OUT
    // Status and control signals
    .RESET(RESET),		// IN
    .LOCKED(pixel_clk_LOCKED)); 	// OUT
	 
	 parameter hsync_start = 16;
	 parameter hsync_end	  = 112;
	 parameter vsync_start = 0;
	 parameter vsync_end   = 2;
	 parameter hdata_start = 160;
	 parameter vdata_start = 35;
	 parameter vdata_end   = 515;
	 parameter h_size      = 800;
	 parameter v_size      = 525;
	 
	 reg [10:0] h_pixel;
	 reg [10:0] v_pixel;
	 
	 wire [10:0] next_h_pixel = h_pixel + 1;
	 wire [10:0] next_v_pixel = v_pixel + 1;
	 
	 assign hsync = (h_pixel < hsync_start || h_pixel > hsync_end);
	 assign vsync = (v_pixel < vsync_start || v_pixel > vsync_end);
	 assign pixel_enable = (h_pixel < hdata_start || v_pixel < vdata_start || v_pixel > vdata_end);
	 
	 always @ (posedge clk, posedge reset) begin
		if (reset) begin
			h_pixel <= 'd0;
			v_pixel <= 'd0;
		end else begin
			h_pixel <= (next_h_pixel == h_size) ? 0 : next_h_pixel;
			v_pixel <= (next_v_pixel == v_size) ? 0 :
						  (next_h_pixel == h_size) ? next_v_pixel : v_pixel;
		end
	 end

endmodule
