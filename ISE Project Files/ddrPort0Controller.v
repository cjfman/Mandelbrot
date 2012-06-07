`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:34:00 05/23/2012 
// Design Name: 
// Module Name:    ddrPort0Controller 
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
module ddrPort0Controller # (
   parameter set_size = 1
	)(
	input clk,
	input reset,
	
	input [31:0] data,
	input render_reset,
	input ready,
	input frame_ready,
	output reg send_data,
	output wire clear_frame,
	
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
	output reg memory_frame,
	output reg [3:0] LED
    );
	 	
	always @(posedge clk) begin
		LED <= state;
	end
	
	////////////////
	// Color Rom
	////////////////
	
	// Input
	wire [31:0] iteration = data;
	reg  [31:0] offset;
	
	// Output
	wire [23:0] color;
	
	colorRom255 color_rom_0 (
    .clk(clk), 
    .iteration(iteration), 
    .offset(offset), 
    .color(color)
    );
	 
	 
	//////////////////////
	// Memory Controller
	//////////////////////
			 
	wire [29:0] base_pointer = (memory_frame) ? 0 : 30'd5242880;
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

	reg [4:0] state;
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
				//p0_wr_data <= data;
				state <= 4;
			end
			4: begin
				if (count < set_size) begin
					count <= count + 1;
					p0_wr_en <= 1;
					p0_wr_data <= color;
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
				//state <= (pointer < (1310720 << 2)) ? 1 : 6;
				state <= 1;
			end
			/*1: begin
				if (p0_wr_empty) begin
					p0_wr_en <= 1;
					p0_wr_data <= (pointer < 153600 << 2) ? 255 : 0; //~p0_wr_data;
					state <= 2;
				end
			end
			2: begin
				if (p0_wr_count == 63) begin
					p0_wr_en <= 0;
					p0_cmd_instr <= 3'b000;
					p0_cmd_en <= 1;
					p0_cmd_bl <= 63;
					p0_cmd_byte_addr <= pointer;
					pointer <= pointer + (64 << 2);
					state <= 3;
				end else begin
					p0_wr_data <= (pointer < 153600 << 2) ? 255 : 0; //p0_wr_data + 1;
				end
			end
			3: begin
				p0_cmd_en <= 0;
				state <= (pointer < (1310720 << 2)) ? 1 : 4;
			end*/
			endcase
		end
	end

endmodule
