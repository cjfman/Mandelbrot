`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:47:20 06/09/2012 
// Design Name: 
// Module Name:    colorModule 
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
module colorModule (
	 input clk,
    input reset,
	 input pwrup,
	 input [3:0] SW,
	 
	 output reg [7:0] LED,
	 	 	 
	 // Memory Read
	 input [31:0] rd_data,
    input [6:0] rd_count,
    input rd_empty,
	 output reg rd_en,
	 
	 // Memory Write
	 input wr_empty,
	 input [6:0] wr_count,
	 output wire [31:0] wr_data,
	 output reg wr_en,
    
	 // Memory General
	 input mem_calib_done,
	 output reg [2:0] cmd_instr,
    output reg [5:0] cmd_bl,
    output reg [29:0] cmd_byte_addr,
    output reg cmd_en	
	);


//////////////////////////////////////
/// Debounce and Syncronize Switches
//////////////////////////////////////
	wire  [3:0] sws_sync; //synchronous output

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_sws_3 (.async(SW[3]),.sync(sws_sync[3]),.clk(clk));

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_sws_2 (.async(SW[2]),.sync(sws_sync[2]),.clk(clk));

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_sws_1 (.async(SW[1]),.sync(sws_sync[1]),.clk(clk));

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_sws_0 (.async(SW[0]),.sync(sws_sync[0]),.clk(clk));

	reg [3:0] resolution;
	always @ (posedge clk)
	begin
		resolution <= sws_sync;
	end

	wire sw0_rdy, sw1_rdy, sw2_rdy, sw3_rdy;

	debnce debsw0 (
		.sync(resolution[0]),
		.debnced(sw0_rdy),
		.clk(clk));

	debnce debsw1 (
		.sync(resolution[1]),
		.debnced(sw1_rdy),
		.clk(clk));

	debnce debsw2 (
		.sync(resolution[2]),
		.debnced(sw2_rdy),
		.clk(clk));

	debnce debsw3 (
		.sync(resolution[3]),
		.debnced(sw3_rdy),
		.clk(clk));

  reg update = 1'b0;
  
  always @ (posedge clk)
  begin
    update <= pwrup | sw0_rdy | sw1_rdy | sw2_rdy | sw3_rdy;
  end
  
  ////////////////////////////
	// Resolution configuration
	////////////////////////////
	
	parameter SW_VGA       = 4'b0000; //  640x480
	parameter SW_SVGA      = 4'b0001; //  800x600
	parameter SW_XGA       = 4'b0011; // 1024x768
	parameter SW_HDTV720P  = 4'b0010; // 1280x720
	parameter SW_SXGA      = 4'b1000; // 1280x1024
	
	reg [20:0] total_pixels;
	
	always @ (posedge clk) begin
		if (update) begin
			case (resolution)
			SW_VGA: begin  
				total_pixels <= 21'd307200;
			end
			SW_SVGA: begin
				total_pixels <= 21'd480000;
			end
			SW_XGA: begin
				total_pixels <= 21'd786432;
			end
			SW_HDTV720P: begin
				total_pixels <= 21'd921600;
			end
			SW_SXGA: begin
				total_pixels <= 21'd1310720;
			end
			default: begin   
				total_pixels <= 21'd307200;
			end
			endcase
		end
	end
	
	
	////////////////
	// Color Rom
	////////////////
	
	// Input
	reg  [31:0] offset;
	
	// Output
	wire [23:0] color;
	
	colorRom255 color_rom_0 (
    .clk(clk), 
    .iteration(rd_data), 
    .offset(offset), 
    .color(color)
    );
	 
	 assign wr_data = {8'b0, color};
	

	//////////////////////
	// Memory Controller
	//////////////////////

	
	wire [29:0] read_pointer = 0; 
	wire [29:0] write_pointer = 30'd5242880;
	reg [29:0] pointer;
	reg [1:0] calib_done;
	
	always @(posedge clk) begin
		calib_done <= {calib_done[0], mem_calib_done};
	end
	
	wire [29:0] next_pointer = pointer + (64 << 2);
	wire inrange = ((next_pointer >> 2) < total_pixels);
	wire [7:0] amount = (inrange) ? 64 : (total_pixels - (pointer >> 2));
	wire loaded = (rd_count == read_count);

	reg [4:0] state;
	reg [7:0] read_count;
	
	always @(posedge clk)
		LED <= state;
		
	always @(posedge clk, posedge reset) begin
		if (reset) begin
			pointer <= 0;
			state <= 0;
		end else begin
			case(state)
			0: begin
				if (calib_done[1]) state <= 1;
			end
			1: begin
				if (rd_empty) begin
					cmd_instr <= 3'b001;
					cmd_bl <= amount - 1;
					cmd_byte_addr <= pointer + read_pointer;
					cmd_en <= 1;
					read_count <= amount;
					state <= 2;
				end
			end
			2: begin
				cmd_en <= 0;
				state <= 3;
			end
			3: begin
				if (loaded) begin
					rd_en <= 1;
					state <= 4;
				end
			end
			4: begin
				wr_en <= 1;
				if (rd_count == 1) begin
					rd_en <= 0;
					state <= 5;
				end
			end
			5: begin
				wr_en <= 0;
				cmd_instr <= 3'b000;
				cmd_bl <= amount - 1;
				cmd_byte_addr <= pointer + write_pointer;
				cmd_en <= 1;
				state <= 6;
			end
			6: begin
				cmd_en <= 0;
				state <= 7;
			end
			7: begin
				if (wr_count == 0) begin
					if (inrange) begin
						pointer <= next_pointer;
					end else begin
						pointer <= 0;
					end
					state <= 1;
				end
			end
			endcase
		end
	end


endmodule
