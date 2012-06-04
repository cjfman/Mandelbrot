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
	
module pointGenerator # (
	 parameter HBP = 32,
	 parameter HBS = 32,
	 parameter HBI = 32
	 )(
	 input CLK,
    input start,
    input [HBS - 1 : 0] re_scale,
	 input [HBS - 1 : 0] im_scale,
    input [11:0] x,
    input [11:0] y,
    input [HBI - 1 : 0] max_iterations,
    input signed [HBP - 1 : 0] re_start,
    input signed [HBP - 1 : 0] im_start,
    output wire ready,
    output reg [HBI - 1 : 0] iteration
    );
	 
	// re, im, re_start, and im_start are signed decimal numbers.
	// One sign bit, to bits to the left of the decimal, and the rest
	// are to the right
/*
	// Complex value
	reg [HBP - 1 : 0] re;
	reg [HBP - 1 : 0] im;
	
	// Complex position
	reg signed [HBP - 1 : 0] re_pos;
	reg signed [HBP - 1 : 0] im_pos;
			
	// Ready Signal
	wire max_reached = (iteration == max_iterations);
	wire over = ((re2 + im2) > (3'h4 << (HBS - 3))); 
	assign ready = (max_reached || over);
	
	// Pre calculations
	wire [HBP - 1 : 0] re2 = re*re;
	wire [HBP - 1 : 0] im2 = im*im;
	
	// Initial values for regs
	initial begin
		re <= 'b0;
		im <= 'b0;
		iteration <= 'b0;
	end
	
	always @(posedge CLK) begin
		if (start) begin
			iteration <= 'b0;
			re <= 'b0;
			im <= 'b0;
			re_pos <= (x * re_scale) + re_start;
			im_pos <= (y * im_scale) + im_start;
		end else if (!ready) begin
			iteration <= iteration + 'b1;
			re <= re2 - im2 + re_pos;
			im <= 2*re*im + im_pos;
		end	
	end
*/

	assign ready = (state == 0);

	reg [3:0] state;
	
	always @ (posedge CLK) begin
		case(state)
		0: if (start) state <= 1;
		1: begin
			iteration <= (x[11:3] == y[11:3]) ? 255 : 0;
			state <= 0;
		end
		endcase
	end
	
endmodule
