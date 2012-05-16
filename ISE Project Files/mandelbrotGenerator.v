`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:07:39 05/14/2012 
// Design Name: 
// Module Name:    mandelbrotGenerator 
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

module mandelbrotGenerator(
    input CLK,
    output [63:0] data,
    output dataset,
	 output ready
    );

	parameter set_size = 256;
	
	// Things that need to be labled better
	wire reset;
	
	// Output data
	reg [63:0] data;
	
	// Point Sets
	reg [HBP:0] x [set_size - 1 : 0];
	reg [HBP:0] y [set_size - 1 : 0];
	wire [HBI:0] iterations [set_size - 1 : 0];
	wire [set_size - 1 : 0] set_ready;
	reg [23:0] color [set_size - 1 : 0];
	
	// Setable Parameters
	reg [HBI:0] max_iterations;
	reg signed [HBP:0] re_start;
	reg signed [HBP:0] im_start;
	reg signed [HBP:0] re_end;
	reg signed [HBP:0] im_end;
	reg x_size [11:0];
	reg y_size [11:0];
	
	// Calculate parameters
	wire re_scale [HBS:0] = (re_end - re_start) / xymin;
	wire im_scale [HBS:0] = (im_end - im_start) / xymin;
	wire [10:0] xymin = (x_size > y_size) ? y_size : x_size;
	
	genvar i;
	
	generate
		for (i = 0; i < set_size; i = i + 1) begin : points
			pointGenerator point_gen (
				.CLK(CLK),
				.reset(reset),
				.re_scale(re_scale),
				.im_scale(im_scale),
				.x(x[i]),
				.y(y[i]),
				.max_iterations(max_iterations),
				.re_start(re.start),
				.im_start(im_start),
				.ready(ready[i]),
				.iteration(iterations[i])
				);
		end
	endgenerate
	
	// Initialize
	initial begin
		max_iterations <= 'd255;
		x_size <= 'd1680;
		y_size <= 'd1050;
		re_start <= -'d3;
	end
	
	
endmodule
