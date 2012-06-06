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
	 parameter HBI = 32,
	 parameter max_iterations = 255
	 )(
	 input CLK,
    input start,
    input [3:-(HBP-3)] re_scale,
	 input [3:-(HBP-3)] im_scale,
    input [11:0] x,
    input [11:0] y,
    input signed [3:-(HBP-3)] re_start,
    input signed [3:-(HBP-3)] im_start,
    output reg done,
    output reg [HBI - 1 : 0] iteration
    );
	 
	// re, im, re_start, and im_start are signed decimal numbers.
	// One sign bit, to bits to the left of the decimal, and the rest
	// are to the right
	// Complex value
	reg [3:-(HBP-3)] re;
	reg [3:-(HBP-3)] im;
	
	// Complex position
	reg signed [3:-(HBP-3)] re_pos;
	reg signed [3:-(HBP-3)] im_pos;
			
	// Ready Signal
	wire max_reached = (iteration == max_iterations);
	wire signed [3:-(HBP-3)] max;
	assign max [3:0] = 4'd4;
	wire over = (re2 + im2 > max); 
	wire ready = (max_reached || over);
	
	// Pre calculations
	wire signed [3:-(HBP-3)] re2;
	wire signed [3:-(HBP-3)] im2;
	wire signed [3:-(HBP-3)] product;
	wire signed [3:-(HBP-3)] productX2;
	wire signed [3:-(HBP-3)] xscale;
	wire signed [3:-(HBP-3)] yscale;
	
	signedFixedPointMult # (
		.iD(4),
		.iF(HBP-3),
		.oD(4),
		.oF(HBP-3)
	) real_squared (	
		.A(re), 
		.B(re), 
		.O(re2)
		);
		
	signedFixedPointMult # (
		.iD(4),
		.iF(HBP-3),
		.oD(4),
		.oF(HBP-3)
	) imag_squared (	
		.A(im), 
		.B(im), 
		.O(im2)
		);
		
	signedFixedPointMult # (
		.iD(4),
		.iF(HBP-3),
		.oD(4),
		.oF(HBP-3)
	) product_re_im (	
		.A(re), 
		.B(im), 
		.O(product)
		);
		
	signedFixedPointMult # (
		.iD(4),
		.iF(HBP-3),
		.oD(4),
		.oF(HBP-3)
	) factorX2 (	
		.A(product), 
		.B({4'd2, 29'd0}), 
		.O(productX2)
		);
		
	signedFixedPointMult # (
		.iD(12),
		.iF(HBP-3),
		.oD(4),
		.oF(HBP-3)
	) x_scale (	
		.A({8'd0, re_scale}), 
		.B({0, x, 29'd0}), 
		.O(xscale)
		);
		
	signedFixedPointMult # (
		.iD(12),
		.iF(HBP-3),
		.oD(4),
		.oF(HBP-3)
	) y_scale (	
		.A({8'd0, im_scale}), 
		.B({0, x, 29'd0}), 
		.O(yscale)
		);
	
	// Initial values for regs
	initial begin
		re <= 'b0;
		im <= 'b0;
		iteration <= 'b0;
	end
	
	reg [3:0] state;
	
	always @ (posedge CLK) begin
		case (state)
		0: begin
			if(start) begin
				done <= 0;
				iteration <= 'b0;
				/*re <= 'b0;
				im <= 'b0;
				re_pos <= xscale + re_start;
				im_pos <= yscale + im_start;*/
				state <= 1;
			end
		end
		1: begin
			if (x == y) iteration <= max_iterations;
			state <= 0;
			done <= 1;
			/*if (!ready) begin
				iteration <= iteration + 'b1;
				re <= re2 - im2 + re_pos;
				im <= productX2 + im_pos;
			end else begin
				done <= 1;
				if (x == y) iteration <= max_iterations;
				state <= 0;
			end*/
		end
		endcase
	end
	
endmodule
