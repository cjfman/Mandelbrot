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
	 
	wire restart = end_frame | update | reset;
	
	////////////////////////////
	// Resolution configuration
	////////////////////////////
	
	parameter SW_VGA       = 4'b0000; //  640x480
	parameter SW_SVGA      = 4'b0001; //  800x600
	parameter SW_XGA       = 4'b0011; // 1024x768
	parameter SW_HDTV720P  = 4'b0010; // 1280x720
	parameter SW_SXGA      = 4'b1000; // 1280x1024
	
	reg [19:0] total_pixels;
	
	always @ (posedge clk) begin
		if (update) begin
			total_pixels <= (SW_VGA)      ? 307200:
								 (SW_SVGA)     ? 480000:
								 (SW_XGA)      ? 786432:
								 (SW_HDTV720P) ? 921600: 1310720; // Assume SXGA
		end
	end
		
		
	//////////////////
	// Output FIFO
	//////////////////
	
	//Inputs
	wire [23:0] FIFO_data_in = rd_data; //(rd_data == 255) ? 24'b0 : 24'hFFFFFF;
	//reg [23:0] FIFO_data_in = 4'b1010;
	reg FIFO_wr_en;
	reg FIFO_rd_en;
	//wire FIFO_rd_en = (stream_data && !FIFO_empty);
	
	//Outpus
	wire [23:0] FIFO_dout;
	wire FIFO_full;
	wire FIFO_almost_full;
	wire FIFO_almost_empty;
	wire FIFO_empty;
	
	MemoryReadFIFO pixel_FIFO (
		.rst(reset), // input rst
		.wr_clk(clk), // input wr_clk
		.rd_clk(pclk), // input rd_clk
		.din(FIFO_data_in), // input [23 : 0] din
		.wr_en(FIFO_wr_en), // input wr_en
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
	reg [5:0] FIFO_write_state;

	always @ (posedge clk) begin
		case(FIFO_write_state)
		0: begin
			if (calib_done[1]) FIFO_write_state <= 1;
		end
		1: begin
			if (!FIFO_full && loaded) begin
				rd_en <= 1;
				FIFO_wr_en <= 1;
				FIFO_write_state <= 2;
				//FIFO_data_in <= rd_data;
			end
		end
		2: begin
			//FIFO_data_in <= rd_data;
			if (FIFO_almost_full || rd_count == 1) begin
				rd_en <= 0;
				FIFO_wr_en <= 0;
				FIFO_write_state <= 1;
			end
		end
		endcase
	end
	
	/*always @ (posedge clk) begin
		case(FIFO_write_state)
		0: begin
			if (FIFO_empty) begin
				FIFO_wr_en <= 1;
				FIFO_write_state <= 1;
			end
		end
		1: begin
			if (FIFO_almost_full) begin
				FIFO_wr_en <= 0;
				FIFO_write_state <= 0;
			end
		end
		endcase
	end*/
		
	// Block HDMI from starting output untill there is data available
	always @ (posedge clk) begin
		start_output <= (start_output || FIFO_full);
		//FIFO_data_in <= rd_data; //~FIFO_data_in;
		//LED <= FIFO_write_state;
	end
		
	reg [26:0] hold;
	reg [11:0] count;
	reg [5:0] STATE;
	
	always @ (posedge pclk) begin
	case (STATE)
		0: begin
			if (FIFO_full) STATE <= 1;
		end
		1: begin
			if (!FIFO_empty) begin
				FIFO_rd_en <= 1;
				STATE <= 2;
			end
		end
		2: begin
			FIFO_rd_en <= 0;
			LED <= FIFO_dout[3:0];
			STATE <= 3;
		end
		3: begin
			hold <= hold + 27'd1;
			if (hold[24]) begin
				hold <= 27'd0;
				STATE <= 1;
			end
		end
		endcase
	end

	/*always @ (posedge clk) begin
		case (state2)
		0: begin
			LED <= 4'b1001;
			if (calib_done[1]) state2 <= 2;
		end
		1: begin
			LED <= 4'b1010;
		end
		2: begin
			LED <= 4'b0101;
			if (rd_full) state2 <= 4;
		end
		3: begin
			hold <= hold + 27'd1;
			rd_en <= 0;
			if (hold[26]) begin
				hold <= 27'd0;
				state2 <= 4;
			end
			end
		4: begin
			if (!rd_empty) begin
				rd_en <= 1;
				LED <= rd_data[3:0];
				state2 <= 3;
			end else
				state2 <= 1;
		end
		endcase
	end*/
	
	
	//////////////////////////////////////
	// Memory Interface
	//////////////////////////////////////
	
	// Calibration
	reg [1:0] calib_done;
	
	always @(posedge clk)
		calib_done <= {calib_done[0], mem_calib_done};
		
	
	// Memory pointers
	
	wire [29:0] base_pointer = 0; //(base_selector) ? 30'd70560 :  0;
	reg [29:0] pointer;
	
	reg [5:0] state = 0;
	reg [7:0] read_count;
	
	wire [29:0] next_pointer = pointer + (64 << 2);
	wire inrange = (next_pointer < total_pixels << 2);
	wire [7:0] read_amount = (inrange) ? 64 : (total_pixels - (pointer >> 2));
	wire loaded = (rd_count == read_count && rd_count != 0);
		 
	always @ (posedge clk) begin //, posedge reset, posedge restart) begin
		/*if (reset) begin
			state <= 0;
			pointer <= 0;
		end else if (restart) begin
			state <= 1;
			pointer <= 0;
		end else begin*/
			case (state)
			0: begin
				if (calib_done[1]) state <= 1;
			end
			1: begin
				cmd_instr <= 3'b001;
				cmd_bl <= 63; //read_amount - 1;
				cmd_byte_addr <= 0; //pointer + base_pointer;
				cmd_en <= 1;
				read_count <= 64; //read_amount;
				//pointer <= (inrange) ? next_pointer : 0;
				state <= 2;
			end
			2: begin
				cmd_en <= 0;
				state <= 3;
			end
			3: begin
				if (loaded) state <= 4;
			end
			4: begin
				if (rd_empty) state <= 1;
			end
			endcase
		//end
	end
	
	/*reg [11:0] count;
	reg [26:0] hold;
	
	always @(posedge clk)
		case(state)
		0: begin
			if (calib_done[1]) state <= 10;
		end
		10: begin
			count <= count + 1'b1;
			if (count[11])
				state <= 11;
			end
		11: begin
			count <= 12'd0;
			cmd_bl <= 6'd63;
			cmd_byte_addr <= pointer;
			cmd_instr <= 3'b001;
			cmd_en <= 1;
			pointer <= pointer + (64 << 2);
			state <= 12;
			end
		12: begin
			cmd_en <= 0;
			count <= count + 1'b1;
			if (count[11])
				state <= 14;
			end
		13: begin
			hold <= hold + 27'd1;
			rd_en <= 0;
			if (hold[26]) begin
				hold <= 27'd0;
				state <= 14;
			end
			end
		14: begin
			if (!rd_empty) begin
				rd_en <= 1;
				LED <= rd_data[3:0];
				state <= 13;
			end else
				state <= 10;
		end
		endcase*/


endmodule
