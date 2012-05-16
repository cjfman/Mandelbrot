`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:08:39 05/14/2012 
// Design Name: 
// Module Name:    pointGenerator 
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

parameter HBP = 64;
parameter HBS = 64;
parameter HBI = 64;
	
module pointGenerator(
    input CLK,
    input reset,
    input [HBS:0] re_scale,
	 input [HBS:0] im_scale,
    input [11:0] x,
    input [11:0] y,
    input [HBI:0] max_iterations,
    input signed [HBP:0] re_start,
    input signed [HBP:0] im_start,
    output ready,
    output [HBI:0] iteration
    );
	 
	// re, im, re_start, and im_start are signed decimal numbers.
	// One sign bit, to bits to the left of the decimal, and the rest
	// are to the right
	 
	// Output
	reg [HBI:0] iteration;
	wire ready;

	// Complex value
	reg [HBP:0] re;
	reg [HBP:0] im;
	
	// Complex position
	reg signed [HBP:0] re_pos;
	reg signed [HBP:0] im_pos;
			
	// Ready Signal
	wire max_reached = (iteration == max_iterations);
	wire over = ((re**2 + im**2) > (3'h4 << (HBS -3))); 
	assign ready = max_reached || over;
	
	// Initial values for regs
	initial begin
		re <= 'b0;
		im <= 'b0;
		iteration <= 'b0;
	end
	
	always @(posedge CLK) begin
		if (reset) begin
			iteration <= 'b0;
			re <= 'b0;
			im <= 'b0;
			re_pos <= (x * re_scale) + re_start;
			im_pos <= (y * im_scale) + im_start;
		end else if (!ready) begin
			iteration <= iteration + 'b1;
			re <= re**2 - im**2 + re_pos;
			im <= 2*re*im + im_pos;
		end	
	end
endmodule
