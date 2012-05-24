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
	 input send_data,
	 input start_render,
    output reg [31:0] data,
    output wire ready,
	 output wire frame_ready
    );

	parameter HBP = 32;
	parameter HBS = 32;
	parameter HBI = 32;
	parameter set_size = 10;
	
	// Things that need to be labled better
	wire start = (render_state == 1);
	
	// Output data controller
	//assign data = iterations_reg[base_output];			// The data to be written to memory
	reg [23:0] base_output;												// The pixel number that is being output
	assign ready = (output_state == 'd1 && data_available);	// The data is ready to be written to memory
	assign frame_ready = (base_output >= total_pixels);		// Every pixel has been calculated
	
	// States
	reg [7:0] render_state;
	reg [7:0] output_state;
	
	// Point Sets
	reg [11:0] x [set_size - 1 : 0];								// X coordinate
	reg [11:0] y [set_size - 1 : 0];								// Y coordinate
	wire [HBI - 1 : 0] iterations     [set_size - 1 : 0];	// Output from calculator point_gen units
	reg  [HBI - 1 : 0] iterations_reg [set_size - 1 : 0];
	wire [set_size - 1 : 0] set_ready;							// Signal taht point_gen units are done calculating
	
	// Setable Parameters
	reg [HBI - 1 : 0] max_iterations;
	reg signed [HBP - 1 : 0] re_start;
	reg signed [HBP - 1 : 0] im_start;
	reg signed [HBP - 1 : 0] re_end;
	reg signed [HBP - 1 : 0] im_end;
	reg [11:0] x_size;
	reg [11:0] y_size;
	
	// Calculate parameters
	wire [HBS - 1 : 0] re_scale = (re_end - re_start) / xymin;
	wire [HBS - 1 : 0] im_scale = (im_end - im_start) / xymin;
	wire [10:0] xymin = (x_size > y_size) ? y_size : x_size;
	
	// Pixels
	wire [23:0] total_pixels = x_size * y_size;
	reg  [23:0] base_pixel;
	wire data_available = (base_pixel >= base_output);
	reg done;			
	
	genvar i;
	
	generate
		for (i = 0; i < set_size; i = i + 1) begin : points
			pointGenerator point_gen (
				.CLK(CLK),
				.start(start),
				.re_scale(re_scale),
				.im_scale(im_scale),
				.x(x[i]),
				.y(y[i]),
				.max_iterations(max_iterations),
				.re_start(re_start),
				.im_start(im_start),
				.ready(set_ready[i]),
				.iteration(iterations[i])
				);
		end
	endgenerate
	
	// Initialize
	
	integer j;

	initial begin
		max_iterations <= 'd255;
		x_size <= 'd640;
		y_size <= 'd480;
		re_start <= -'d3;
		re_end 	<=  'd1;
		im_start <= -'d2;
		im_end	<=  'd2;
		base_pixel <= 'd0;
		render_state <= 'd0;
		output_state <= 'd0;
		base_output <= 'd0;
		for (j = 0; j < set_size; j = j + 1) begin
			iterations_reg[j] <= 'd0;
		end
	end
		
	// Rendering block
	always @(posedge CLK) begin
		case(render_state)
		0: begin
		//Wait until the start_render signal is asserted
			if (start_render) begin
				render_state <= 'd1;
				//total_pixels <= x_size * y_size;
			end
		end
		1: begin
		// Set up the point_gen units and wait until they are done
			for (j = 0; j < set_size; j = j + 1) begin
				//x[j] <= (base_pixel + j) % x_size;
				//y[j] <= (base_pixel + j) / x_size;
				x[j] <= (x[j] + set_size < x_size) ? x[j] + set_size : x[j] + set_size - x_size;
				y[j] <= (x[j] + set_size < x_size) ? y[j] : y[j] + 1;
			end
			render_state <= 'd2;
		end
		2: begin
			if (frame_ready) begin
				render_state <= 'd0;
				base_pixel <= 0;
			end else if (&set_ready && done) begin
				for (j = 0; j < set_size; j = j + 1) begin
					iterations_reg[j] <= iterations[j];
				end
				base_pixel   <= base_pixel + set_size;
				render_state <= 'd1;
			end
		end
		endcase
	end
	
	// Output control block
	always @(posedge CLK) begin
		case(output_state)
		0: begin
		done <= 1;
		if (data_available) begin
			done <= 0;
			output_state <= 'd1;
			data <= iterations_reg[base_output];
			end
		end
		1: begin
			if (send_data) begin
				data <= iterations_reg[base_output];
				base_output <= base_output + 'd1;
			end else if (!data_available) begin
				output_state <= 'd0;
				done <= 1;
				if (frame_ready) base_output <= 0;
			end
		end
		endcase
	end
	
endmodule
