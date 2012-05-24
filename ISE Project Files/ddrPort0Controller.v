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
module ddrPort0Controller(
	input clk,
	
	input [31:0] data,
	input ready,
	input frame_ready,
	output reg send_data,
	
	input mem_calib_done,
	input p0_wr_full,
	input p0_wr_empty,
	output reg reset,
	output reg p0_wr_en,
	output reg [2:0] p0_cmd_instr,
	output reg p0_cmd_en,
	output reg [5:0] p0_cmd_bl,
	output reg [29:0] p0_cmd_byte_addr,
	output reg [31:0] p0_wr_data
    );
	 
	wire [29:0] write_base_pointer = (memory_frame) ? 0 : 70560;
	reg [29:0] write_pointer;
	reg [1:0] calib_done;
	reg [5:0] write_count;
	reg memory_frame;
	
	
	initial begin
		memory_frame <= 'd0;
		reset <= 1;
	end
	
	always @(posedge clk)
		calib_done <= {calib_done[0], mem_calib_done};

	reg [4:0] write_state = 0;
	reg [11:0] count;
	
	always @(posedge clk)
		case(write_state)
		0: begin
			reset <= 0;
			if (calib_done[1]) write_state <= 1;
		end
		1: begin
			if (frame_ready) begin
				memory_frame <= ~memory_frame;
			end if (!p0_wr_full && ready) begin
				p0_wr_data <= data;
				write_count <= write_count + 'd1;
				p0_wr_en <= 1;
				write_state <= 2;
				send_data <= 1;
			end else begin
				write_state <= 3;
			end
		end
		2: begin
			if (p0_wr_full || !ready) begin
				p0_wr_en <= 0;
				send_data <= 0;
				write_state <= 1;
			end else begin
				p0_wr_data <= data;
				write_count <= write_count + 'd1;
			end
		end
		3: begin
			p0_cmd_instr <= 0;
			p0_cmd_en <= 1;
			p0_cmd_bl <= write_count;
			p0_cmd_byte_addr <= write_pointer;
			write_pointer <= write_pointer + (write_count << 2);
			write_count <= 0;
			write_state <= 4;
		end
		4: begin
			p0_cmd_en <= 0;
			write_state <= 5;
		end
		5: begin
			if (p0_wr_empty) write_state <= 1;
		end
		endcase


endmodule
