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
module ddrPort1Controller # (
	 parameter max_iterations = 255
	 )(
    input clk,
    input reset,
	 input pwrup,
	 input [3:0] SW,
	 
    input base_selector,
	 
	 output reg [3:0] LED,
	 	 
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
	 input end_line,	
	 input [10:0] y_pos,
	 input pclk,
    output wire [23:0] data_out,
    output wire data_out_valid
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
	
	reg [10:0] y_size;
	reg [10:0] x_size;
	
	always @ (posedge clk) begin
		if (update) begin
			case (resolution)
			SW_VGA: begin
				x_size <= 11'd640;
				y_size <= 11'd480;
			end
			SW_SVGA: begin
				x_size <= 11'd800;
				y_size <= 11'd600;
			end
			SW_XGA: begin
				x_size <= 11'd1024;
				y_size <= 11'd768;
			end
			SW_HDTV720P: begin
				x_size <= 11'd1280;
				y_size <= 11'd720;
			end
			SW_SXGA: begin
				x_size <= 11'd1280;
				y_size <= 11'd1024;
			end
			default: begin
				x_size <= 11'd640;
				y_size <= 11'd480;
			end
			endcase
		end
	end
		
		
	//////////////////
	// Output FIFO
	//////////////////
	
	//Inputs
	wire [23:0] FIFO_data_in = rd_data; //(rd_data == max_iterations) ? 24'b0 : 24'hFFFFFF;
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
	
	
	//////////////////////////////////////
	// Memory Interface
	//////////////////////////////////////
	
	// Calibration
	reg [1:0] calib_done;
	
	always @(posedge clk)
		calib_done <= {calib_done[0], mem_calib_done};
		
	
	// Memory pointers
	
	wire [29:0] base_pointer = (base_selector) ? 30'd5242880 :  0;
	reg [29:0] line_pointer;
	reg [29:0] pointer;
	
	reg [5:0] state = 0;
	reg [7:0] read_count;
	
	wire [29:0] next_pointer = pointer + (64 << 2);
	wire [29:0] next_line_pointer = (y_pos + 1) * x_size;
	wire inrange = ((next_pointer >> 2) < x_size);
	wire [7:0] read_amount = (inrange) ? 64 : (x_size - (pointer >> 2));
	wire loaded = (rd_count == read_count && rd_count != 0);
	wire rd_almost_empty = (rd_count == 1);
	
	wire s_end_line;
   synchro #(.INITIALIZE("LOGIC1"))
   synchro_end_line (.async(end_line),.sync(s_end_line),.clk(clk));
		 
	always @ (posedge clk, posedge reset) begin
		if (reset) begin
			state <= 0;
			pointer <= 0;
			cmd_en <= 0;
			read_count <= 0;
		end else begin
			case (state)
			0: begin
				if (calib_done[1]) state <= 5;
			end
			1: begin
				if (rd_empty) begin
					cmd_instr <= 3'b001;
					cmd_bl <= read_amount - 1;
					cmd_byte_addr <= pointer + line_pointer + base_pointer;
					cmd_en <= 1;
					read_count <= read_amount;
					state <= 2;
				end
			end
			2: begin
				cmd_en <= 0;
				state <= 3;
			end
			3: begin
				if (loaded) state <= 4;
			end
			4: begin
				LED[0] <= (x_size == 640);
				if ((pointer >> 2) == 512) LED[1] <= 1;
				if ((line_pointer >> 2) == 153601) LED[2] <= 1;
				if ((line_pointer >> 2) == 307840) LED[3] <= 1;
				if (inrange) begin
					pointer <= next_pointer;
					state <= 1;
				end else begin
					pointer <= 0;
					state <= 5;
				end
			end
			5: begin
				if (s_end_line && y_pos < y_size) begin
					line_pointer <= next_line_pointer << 2;
					state <= 1;
				end
			end
			endcase
		end
	end


endmodule
