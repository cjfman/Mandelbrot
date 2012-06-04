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
module mandelbrotRederingEngine # (
	 parameter max_iterations = 255
	 )(
    input CLK,
	 input SYS_RESET,
	 input send_data,
	 input start_render,
	 input update,
	 input [3:0] resolution,
    output reg [31:0] data,
    output wire ready,
	 output wire frame_ready,
	 output reg [3:0] LED
    );

	wire reset = (update || SYS_RESET);
	
	parameter HBP = 32;
	parameter HBS = 32;
	parameter HBI = 32;
	parameter set_size = 1;
	
	////////////////////////////
	// Resolution configuration
	////////////////////////////
	
	parameter SW_VGA       = 4'b0000; //  640x480
	parameter SW_SVGA      = 4'b0001; //  800x600
	parameter SW_XGA       = 4'b0011; // 1024x768
	parameter SW_HDTV720P  = 4'b0010; // 1280x720
	parameter SW_SXGA      = 4'b1000; // 1280x1024
	
	reg [10:0] x_size;
	reg [10:0] y_size;
	reg [20:0] total_pixels;
	
	always @ (posedge CLK) begin
		if (update) begin
			case (resolution)
			SW_VGA: begin
				x_size <= 11'd640;
				y_size <= 11'd480;
				total_pixels <= 21'd307200;
			end
			SW_SVGA: begin
				x_size <= 11'd800;
				y_size <= 11'd600;
				total_pixels <= 21'd480000;
			end
			SW_XGA: begin
				x_size <= 11'd1024;
				y_size <= 11'd768;
				total_pixels <= 21'd786432;
			end
			SW_HDTV720P: begin
				x_size <= 11'd1280;
				y_size <= 11'd720;
				total_pixels <= 21'd921600;
			end
			SW_SXGA: begin
				x_size <= 11'd1280;
				y_size <= 11'd1024;
				total_pixels <= 21'd1310720;
			end
			default: begin
				x_size <= 11'd640;
				y_size <= 11'd480;
				total_pixels <= 21'd307200;
			end
			endcase
		end
	end
	
	//////////////////////////
	// Other Stuff
	//////////////////////////
	
	// Things that need to be labled better
	wire start = (render_state == 1);
			
	// Point Sets
	reg [11:0] x [set_size - 1 : 0];								// X coordinate
	reg [11:0] y [set_size - 1 : 0];								// Y coordinate
	wire [HBI - 1 : 0] iterations     [set_size - 1 : 0];	// Output from calculator point_gen units
	reg  [HBI - 1 : 0] iterations_reg [set_size - 1 : 0];
	wire [set_size - 1 : 0] set_ready;							// Signal taht point_gen units are done calculating
	
	// Setable Parameters
	reg signed [HBP - 1 : 0] re_start;
	reg signed [HBP - 1 : 0] im_start;
	reg signed [HBP - 1 : 0] re_end;
	reg signed [HBP - 1 : 0] im_end;
	
	// Calculate parameters
	wire [HBS - 1 : 0] re_scale = (re_end - re_start) / y_size;
	wire [HBS - 1 : 0] im_scale = (im_end - im_start) / y_size;
	
	// Pixels
	reg  [23:0] base_pixel;
	
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
		re_start <= -'d3;
		re_end 	<=  'd1;
		im_start <= -'d2;
		im_end	<=  'd2;
		for (j = 0; j < set_size; j = j + 1) begin
			iterations_reg[j] <= 'd0;
		end
	end
		
	// Rendering block
	reg [7:0] render_state;

	always @(posedge CLK, posedge reset) begin
		if (reset) begin
			render_state <= 0;
			base_pixel <= 0;
		end else begin
			case(render_state)
			0: begin
			//Wait until the start_render signal is asserted
				if (start_render) begin
					render_state <= 'd1;
				end
			end
			1: begin
			// Set up the point_gen units and wait until they are done
				for (j = 0; j < set_size; j = j + 1) begin
					x[j] <= (x[j] + set_size < x_size) ? x[j] + set_size : x[j] + set_size - x_size;
					y[j] <= (x[j] + set_size < x_size) ? y[j] : y[j] + 1;
				end
				render_state <= 'd2;
			end
			2: begin
				if (frame_ready) begin
					render_state <= 'd0;
					base_pixel <= 0;
				end else if (&set_ready && output_done) begin
					for (j = 0; j < set_size; j = j + 1) begin
						iterations_reg[j] <= iterations[j];
					end
					base_pixel   <= base_pixel + set_size;
					render_state <= 'd1;
				end
			end
			endcase
		end
	end
	
	///////////////////////
	// Output controller
	///////////////////////
	
	always @ (posedge CLK) begin
		LED[0] <= (frame_ready);
		LED[1] <= (render_state == 2);
		LED[2] <= (output_state == 1);
		LED[3] <= (&set_ready);
	end
	
	reg [23:0] base_output;												// The pixel number that is being output
	assign ready = (output_state == 'd1 && data_available);	// The data is ready to be written to memory
	assign frame_ready = (base_output >= total_pixels);		// Every pixel has been calculated
	wire data_available = (base_pixel >= base_output);
	
	reg [7:0] output_state;
	wire output_done = (output_state == 0);				
	
	always @(posedge CLK, posedge reset) begin
		if (reset) begin
			output_state <= 0;
			base_output <= 0;
		end else begin
			case(output_state)
			0: begin
			if (data_available) begin
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
					if (frame_ready) base_output <= 0;
				end
			end
			endcase
		end
	end
	
endmodule
