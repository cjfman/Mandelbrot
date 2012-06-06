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
	 
	reg led;
	//assign LED[0] = led; //(state != 0);
	//assign LED[3:1] = 0;
	
	//reg [27:0] led_count;
	//assign LED = led_count[24:21];
	
	always @(posedge clk) begin
		//led_count <= led_count + 1;
		//LED[0] <= (LED[0] || state == 2);
		//LED[1] <= (LED[1] || data == 255);
		//LED[2] <= (LED[2] || (data == 255 && state == 2));
		//LED <= state;
	end
	
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
	
	assign clear_frame = (pointer == 0);
	
	always @(posedge clk, posedge reset) begin
		if (reset) begin
			state <= 0;
		end else begin
			case(state)
			0: begin
				mem_reset <= 0;
				if (calib_done[1]) state <= 1;
			end
			1: begin
				if (frame_ready) begin
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
				p0_wr_en <= 1;
				p0_wr_data <= data;
				count <= count + 1;
				state <= 4;
				if (pointer == 0 && data == 255) LED[0] <= 1;
				if (pointer == (318 << 2) && data == 255) LED[1] <= 1;
				if (pointer < (10 << 2) && data == 255) LED[2] <= 1;
				if (pointer < (100 << 2) && data == 255) LED[3] <= 1;
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
