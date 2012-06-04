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
	 
	//assign LED[0] = (state != 0);
	//assign LED[3:1] = 0;
	
	//reg [27:0] led_count;
	//assign LED = led_count[24:21];
	
	//always @(posedge clk)
	//	led_count <= led_count + 1;
	
	//assign LED = state[3:0];
	 
	wire [29:0] base_pointer = 0; //(memory_frame) ? 0 : 70560;
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
	
	always @(posedge clk)
		case(state)
		0: begin
			mem_reset <= 0;
			if (calib_done[1]) state <= 1;
		end
		/*1: begin
			if (frame_ready) begin
				memory_frame <= ~memory_frame;
			end if (!p0_wr_full && ready) begin
				p0_wr_data <= 32'd255; //data;
				write_count <= write_count + 'd1;
				p0_wr_en <= 1;
				state <= 2;
				send_data <= 1;
			end else begin
				state <= 3;
			end
		end
		2: begin
			if (p0_wr_full || !ready) begin
				p0_wr_en <= 0;
				send_data <= 0;
				state <= 1;
			end else begin
				p0_wr_data <= 32'd255; //data;
				write_count <= write_count + 'd1;
			end
		end
		3: begin
			p0_cmd_instr <= 0;
			p0_cmd_en <= 1;
			p0_cmd_bl <= write_count;
			p0_cmd_byte_addr <= pointer;
			pointer <= pointer + (write_count << 2);
			write_count <= 0;
			state <= 4;
		end
		4: begin
			p0_cmd_en <= 0;
			state <= 5;
		end
		5: begin
			if (p0_wr_empty) state <= 1;
		end*/
		1: begin
			if (p0_wr_empty) begin
				p0_wr_en <= 1;
				p0_wr_data <= 0; //255;
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
				p0_wr_data <= p0_wr_data + 1; //~p0_wr_data;
			end
		end
		3: begin
			p0_cmd_en <= 0;
			state <= 1;
		end
		/*1: begin
			p0_wr_en <= 1;
			p0_wr_data <= 64'd1;
			count <= 12'd0;
			state <= 2;
			end
		2: begin
			p0_wr_data <= 64'd2;
			state <= 3;
			end
		3: begin
			p0_wr_data <= 64'd3;
			state <= 4;
			end
		4: begin
			p0_wr_data <= 64'd4;
			state <= 5;
			end
		5: begin
			p0_wr_data <= 64'd5;
			state <= 6;
			end
		6: begin
			p0_wr_data <= 64'h6;
			state <= 7;
			end
		7: begin
			p0_wr_data <= 64'h7;
			state <= 8;
			end
		8: begin
			p0_wr_en <= 0;
			p0_cmd_instr <= 3'b000; // Write
			p0_cmd_bl <= 6'd7; // 6 bytes
			p0_cmd_byte_addr <= 30'd16; // To address 16
			p0_cmd_en <= 1;
			state <= 9;
			end
		9: begin
			p0_cmd_en <= 0;
			state <= 10;
			count <= 12'b0;
			end
		10: begin
			count <= count + 1'b1;
			if (count[11])
				state <= 11;
			end
		11: begin
			count <= 12'd0;
			p0_cmd_bl <= 6'd7;
			p0_cmd_byte_addr <= 30'd16;
			p0_cmd_instr <= 3'b001;
			p0_cmd_en <= 1;
			state <= 12;
			end
		12: begin
			p0_cmd_en <= 0;
			count <= count + 1'b1;
			if (count[11])
				state <= 14;
			end
		13: begin
			hold <= hold + 27'd1;
			p0_rd_en <= 0;
			if (hold[26]) begin
				hold <= 27'd0;
				state <= 14;
			end
			end
		14: begin
			if (!p0_rd_empty) begin
				p0_rd_en <= 1;
				LED <= p0_rd_data[3:0];
				state <= 13;
			end else
				state <= 1;
		end*/
		endcase

endmodule
