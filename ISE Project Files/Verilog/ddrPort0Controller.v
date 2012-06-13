`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent
// Engineer: Charles Jessup Franklin
// 
// Create Date: 23:34:00 05/23/2012 
// Module Name: iterationMemoryWritter 
// Tool versions: ISE 13.3
// Description: Writes information from the mandelbrot rendering engine to memory
//
//
//////////////////////////////////////////////////////////////////////////////////
module iterationMemoryWritter # (
	parameter set_size = 1
	)(
	input clk,
	input reset,
	
	// Mandelbrot Engine
	input [31:0] data,
	input render_reset,
	input ready,
	input frame_ready,
	output reg send_data,
	output wire clear_frame,
	
	// Memory
	input mem_calib_done,
	input p0_wr_full,
	input p0_wr_empty,
	input p0_rd_empty,
	input [6:0] p0_wr_count,
	input [31:0] p0_rd_data,
	output reg mem_reset,
	output reg p0_wr_en,
	output reg p0_rd_en,
	output reg [2:0] p0_cmd_instr,
	output reg p0_cmd_en,
	output reg [5:0] p0_cmd_bl,
	output reg [29:0] p0_cmd_byte_addr,
	output reg [31:0] p0_wr_data,
	output reg memory_frame
   );
			 
	wire [29:0] base_pointer = 0;
	reg [29:0] pointer;
	reg [1:0] calib_done;
	reg [5:0] write_count;
	
	initial begin
		memory_frame <= 'd0;
		mem_reset <= 1;
	end
	
	always @(posedge clk) begin
		calib_done <= {calib_done[0], mem_calib_done};
	end

	reg [2:0] state;
	reg [11:0] count;
	reg [26:0] hold;
	
	assign clear_frame = (pointer == 0);
	
	always @(posedge clk, posedge reset) begin
		if (reset) begin
			pointer <= 0;
			state <= 0;
		end else begin
			case(state)
			0: begin
				mem_reset <= 0;
				if (calib_done[1]) state <= 1;
			end
			1: begin
				if (render_reset) begin
					pointer <= 0;
				end else if (frame_ready) begin
					memory_frame <= ~memory_frame;
					pointer <= 0;
				end else if (p0_wr_empty && ready) begin
					send_data <= 1;
					state <= 2;
				end
			end
			2: begin
				send_data <= 0;
				state <= 3;
			end
			3: begin
				p0_wr_data <= data;
				p0_wr_en <= 1;
				count <= count + 1;
				state <= 4;
			end
			4: begin
				if (count < set_size) begin
					p0_wr_data <= data;
					count <= count + 1;
				end else begin
					p0_wr_en <= 0;
					count <= 0;
					state <= 5;
				end
			end
			5: begin
				p0_cmd_instr <= 0;
				p0_cmd_en <= 1;
				p0_cmd_bl <= set_size;
				p0_cmd_byte_addr <= pointer;
				pointer <= pointer + (set_size << 2);
				state <= 6;
			end
			6: begin
				p0_cmd_en <= 0;
				state <= 1;
			end
			endcase
		end
	end

endmodule
