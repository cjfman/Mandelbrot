`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:07:49 05/31/2012 
// Design Name: 
// Module Name:    ddrPort1Controller 
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
module ddrPort1Controller(
    input clk,
    input reset,
	 
    input base_selector,
	 
	 output reg [3:0] LED,
	 
	 // Switches
	 input [3:0] resolution,
	 input update,
	 
	 // Memory
	 input [31:0] rd_data,
    input [6:0] rd_count,
    input rd_empty,
    input rd_full,
    input mem_calib_done,
	 output reg [2:0] cmd_instr,
    output reg [5:0] cmd_bl,
    output reg [29:0] cmd_byte_addr,
    output reg rd_en,
    output reg cmd_en,
    
    // HDMI Interface
	 input stream_data,
	 input end_frame,
	 input pclk,
    output wire [23:0] data_out,
    output wire data_out_valid,
	 output reg start_output
    );
	 
	wire restart;
	wire re_start  = end_frame | update | reset;	
	BUF restart_buf (.I(re_start), .O(restart));
	
	//wire FIFO_reset;
	//wire FIFO_r = reset;
	//BUF FIFO_reset_buf(.I(FIFO_r),.O(FIFO_reset));
	
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
		
		
	//////////////////
	// Output FIFO
	//////////////////
	
	//Inputs
	wire [23:0] FIFO_data_in = (rd_data == 255) ? 24'b0 : 24'hFFFFFF;
	reg FIFO_wr_en;
	wire FIFO_rd_en = (FIFO_state != 4) ? (stream_data && !FIFO_empty) : 1'bz;
	wire FIFO_wr =    (FIFO_state != 4) ? FIFO_wr_en : 1'bz;
	reg FIFO_reset;
	
	//Outpus
	wire [23:0] FIFO_dout;
	wire FIFO_full;
	wire FIFO_almost_full;
	wire FIFO_almost_empty;
	wire FIFO_empty;
	
	MemoryReadFIFO pixel_FIFO (
		.rst(FIFO_reset), // input rst
		.wr_clk(clk), // input wr_clk
		.rd_clk(pclk), // input rd_clk
		.din(FIFO_data_in), // input [23 : 0] din
		.wr_en(FIFO_wr), // input wr_en
		.rd_en(FIFO_rd_en), // input rd_en
		.dout(FIFO_dout), // output [23 : 0] dout
		.full(FIFO_full), // output full
		.empty(FIFO_empty), // output empty
		.almost_full(FIFO_almost_full),
		.almost_empty(almost_empty)
	);
	
	assign data_out_valid = ~FIFO_empty;
	assign data_out = FIFO_dout;
	
	// Feed FIFO
	reg [5:0] FIFO_state;
	reg continue_feed;
	reg [26:0] led_count;
	reg [2:0] reset_count;
	
	always @ (posedge clk, posedge reset) begin
		if (reset) begin
			FIFO_state <= 4;
			FIFO_wr_en <= 0;
			rd_en <= 0;
			continue_feed <= 0;
		end else begin
			case(FIFO_state)
			0: begin
				FIFO_reset <= 1;
				if (calib_done[1]) FIFO_state <= 1;
			end
			1: begin
				if (!FIFO_full && (loaded || continue_feed)) begin
					rd_en <= 1;
					FIFO_wr_en <= 1;
					FIFO_state <= 2;
				end
			end
			2: begin
				if (FIFO_almost_full || rd_almost_empty) begin
					rd_en <= 0;
					FIFO_wr_en <= 0;
					FIFO_state <= 1;
					continue_feed <= ~rd_almost_empty;
				end
			end
			3: begin
				FIFO_reset <= 1;
				FIFO_state <= 4;
			end
			4: begin
				FIFO_reset <= 0;
				reset_count <= reset_count + 1;
				if (reset_count[2]) FIFO_state <= 1;
			end
			endcase
		end
	end
			
	// Block HDMI from starting output untill there is data available
	always @ (posedge clk, posedge reset)
		start_output <= (reset) ? 0 : (start_output || (FIFO_almost_full && FIFO_state == 2));
	
	
	//////////////////////////////////////
	// Memory Interface
	//////////////////////////////////////
	
	// Calibration
	reg [1:0] calib_done;
	
	always @(posedge clk)
		calib_done <= {calib_done[0], mem_calib_done};
		
	reg old_stream;
	
	always @ (posedge pclk) begin
		old_stream <= stream_data;
		// LED <= pointer[5:2];
		if (stream_data & ~old_stream) LED <= pointer[11:8];
	end
		
	
	// Memory pointers
	
	wire [29:0] base_pointer = 0; //(base_selector) ? 30'd70560 :  0;
	reg [29:0] pointer;
	
	reg [5:0] state = 0;
	reg [7:0] read_count;
	
	wire [29:0] next_pointer = pointer + (64 << 2);
	wire inrange = (next_pointer < (total_pixels << 2));
	wire [7:0] read_amount = (inrange) ? 64 : (total_pixels - (pointer >> 2));
	wire loaded = (rd_count == read_count && rd_count != 0);
	wire rd_almost_empty = (rd_count == 1);
		 
	always @ (posedge clk, posedge reset) begin //, posedge restart) begin
		if (reset) begin
			state <= 0;
			pointer <= 0;
			cmd_en <= 0;
			read_count <= 0;
		/*end else if (restart) begin
			state <= 1;
			pointer <= 0;
			cmd_en <= 0;
			read_count <= 0;*/
		end else begin
			case (state)
			0: begin
				if (calib_done[1]) state <= 1;
			end
			1: begin
				if (rd_empty) begin
					cmd_instr <= 3'b001;
					cmd_bl <= read_amount - 1;
					cmd_byte_addr <= pointer + base_pointer;
					cmd_en <= 1;
					read_count <= read_amount;
					pointer <= (inrange) ? next_pointer : 0;
					state <= 2;
				end
			end
			2: begin
				cmd_en <= 0;
				state <= 3;
			end
			3: begin
				if (loaded) state <= 1;
			end
			endcase
		end
	end

endmodule
