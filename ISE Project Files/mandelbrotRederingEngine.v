`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:31:31 05/15/2012 
// Design Name: 
// Module Name:    mandelbrotRederingEngine 
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
module mandelbrotRederingEngine(
    input CLK,
    output [63:0] data,
    output ready
    );

	parameter HBP = 64;
	parameter HBS = 64;
	parameter HBI = 64;
	parameter set_size = 256;
	
	// Things that need to be labled better
	wire reset;
	
	// Output data controller
	reg [63:0] data;
	reg [23:0] base_output;
	wire done = (output_state == 'd0);
	
	// States
	reg [7:0] render_state;
	reg [7:0] output_state;
	
	// Point Sets
	reg [11:0] x [set_size - 1 : 0];
	reg [11:0] y [set_size - 1 : 0];
	wire [HBI:0] iterations [set_size - 1 : 0];
	wire [set_size - 1 : 0] set_ready;
	reg [23:0] color [set_size - 1 : 0];
	
	// Setable Parameters
	reg [HBI:0] max_iterations;
	reg signed [HBP:0] re_start;
	reg signed [HBP:0] im_start;
	reg signed [HBP:0] re_end;
	reg signed [HBP:0] im_end;
	reg [11:0] x_size;
	reg [11:0] y_size;
	
	// Calculate parameters
	wire [HBS:0] re_scale = (re_end - re_start) / xymin;
	wire [HBS:0] im_scale = (im_end - im_start) / xymin;
	wire [10:0] xymin = (x_size > y_size) ? y_size : x_size;
	
	// Pixels
	wire [23:0] total_pixels = x_size * y_size;
	reg [23:0] base_pixel;
	
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
				.ready(set_ready[i]),
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
		re_end 	<=  'd1;
		im_start <= -'d2;
		im_end	<=  'd2;
		base_pixel <= 'd0;
		render_state <= 'd0;
		output_state <= 'd0;
		base_output <= 'd0;
	end
	
	integer j;
	
	// Rendering block
	always @(posedge CLK) begin
		case(render_state)
		0: begin
			for (j = 0; j < set_size; j = j + 1) begin
				x[j] <= base_pixel % x_size;
				y[j] <= base_pixel / x_size;
			end
			render_state <= 'd1;
		end
		1: begin
			if (&set_ready && done) begin
				for (j = 0; j < set_size; j = j + 1) begin
					if (iterations[j] == max_iterations) begin
						color[j] <= 0;
					end else begin
						color[j] <= (iterations[j] << 24) / max_iterations;
					end
				end
				base_pixel <= base_pixel + set_size;
				render_state <= 'd0;
			end
		end
		endcase
	end
	
	// Output control block
	always @(posedge CLK) begin
		case(output_state)
		0: begin
			if (base_pixel > base_output) output_state <= 'd1;
		end
		1: begin
			if (base_pixel >= base_output + 'd2) begin
				data[23:0]  <= color[base_pixel];
				data[47:24] <= color[base_pixel + 1];
				base_pixel  <= base_pixel + 'd2;
			end else if (base_pixel == base_output + 'd1) begin
				data[23:0]  <= color[base_pixel];
			end else begin
				output_state <= 'd0;
			end
		end
		endcase
	end
	
endmodule
