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
	 parameter max_iterations = 255,
	 parameter HBP = 32,
	 parameter HBS = 32,
	 parameter HBI = 32,
	 parameter set_size = 1
	 )(
    input CLK,
	 input SYS_RESET,
	 input send_data,
	 input start_render,
	 input clear_frame,
	 input pwrup,
	 input [3:0] SW,
	 input [4:0] btn,
    output reg [31:0] data,
	 output wire render_reset,
    output wire ready,
	 output reg frame_ready,
	 output reg [7:0] LED
    );

	wire reset = (SYS_RESET || update || button);
	assign render_reset = (update || button);
	
	reg [7:0] led_count;
	reg old_frame;
	
	always @ (posedge CLK) begin
	//	if (data != 255 && data > LED) LED <= data[7:0];
		//if (frame_ready && !old_frame) led_count <= led_count + 1;
		//LED <= led_count;
		//old_frame <= frame_ready;
		LED <= {output_state, render_state};
	end
	
	
//////////////////////////////////////
/// Debounce and Syncronize Switches
//////////////////////////////////////
	wire  [3:0] sws_sync; //synchronous output

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_sws_3 (.async(SW[3]),.sync(sws_sync[3]),.clk(CLK));

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_sws_2 (.async(SW[2]),.sync(sws_sync[2]),.clk(CLK));

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_sws_1 (.async(SW[1]),.sync(sws_sync[1]),.clk(CLK));

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_sws_0 (.async(SW[0]),.sync(sws_sync[0]),.clk(CLK));

	reg [3:0] resolution;
	always @ (posedge CLK)
	begin
		resolution <= sws_sync;
	end

	wire sw0_rdy, sw1_rdy, sw2_rdy, sw3_rdy;

	debnce debsw0 (
		.sync(resolution[0]),
		.debnced(sw0_rdy),
		.clk(CLK));

	debnce debsw1 (
		.sync(resolution[1]),
		.debnced(sw1_rdy),
		.clk(CLK));

	debnce debsw2 (
		.sync(resolution[2]),
		.debnced(sw2_rdy),
		.clk(CLK));

	debnce debsw3 (
		.sync(resolution[3]),
		.debnced(sw3_rdy),
		.clk(CLK));

  reg update = 1'b0;
  
  always @ (posedge CLK)
  begin
    update <= pwrup | sw0_rdy | sw1_rdy | sw2_rdy | sw3_rdy;
  end
  
	
//////////////////////////////////////
/// Debounce and Syncronize Buttons
//////////////////////////////////////

	//always @ (posedge CLK)
	//	LED[7:5] <= btn[2:0];

	wire  [4:0] btn_sync; //synchronous output

	synchro #(.INITIALIZE("LOGIC0"))
	synchro_btn_4 (.async(btn[4]),.sync(btn_sync[4]),.clk(CLK));
	
	synchro #(.INITIALIZE("LOGIC0"))
	synchro_btn_3 (.async(btn[3]),.sync(btn_sync[3]),.clk(CLK));
	
	synchro #(.INITIALIZE("LOGIC0"))
	synchro_btn_2 (.async(btn[2]),.sync(btn_sync[2]),.clk(CLK));
	
	synchro #(.INITIALIZE("LOGIC0"))
	synchro_btn_1 (.async(btn[1]),.sync(btn_sync[1]),.clk(CLK));
	
	synchro #(.INITIALIZE("LOGIC0"))
	synchro_btn_0 (.async(btn[0]),.sync(btn_sync[0]),.clk(CLK));
	
	reg [4:0] button;
	always @ (posedge CLK)
	begin
		button <= btn_sync;
	end

	wire btn0_rdy, btn1_rdy, btn2_rdy, btn3_rdy, btn4_rdy;
	
	debnce deb_btn0 (
		.sync(button[0]),
		.debnced(btn0_rdy),
		.clk(CLK));
		
	debnce deb_btn1 (
		.sync(button[1]),
		.debnced(btn1_rdy),
		.clk(CLK));
		
	debnce deb_btn2 (
		.sync(button[2]),
		.debnced(btn2_rdy),
		.clk(CLK));
		
	debnce deb_btn3 (
		.sync(button[3]),
		.debnced(btn3_rdy),
		.clk(CLK));
		
	debnce deb_btn4 (
		.sync(button[4]),
		.debnced(btn4_rdy),
		.clk(CLK));


  reg btn_update = 1'b0;
  
  always @ (posedge CLK)
  begin
    btn_update <= btn0_rdy | btn1_rdy | btn2_rdy | btn3_rdy | btn4_rdy;
  end
  
  
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
	reg [3:-(HBP-3)] y_inverse;
	reg [20:0] total_pixels;
	
	always @ (posedge CLK) begin
		if (update) begin
			case (resolution)
			SW_VGA: begin
				x_size <= 11'd640;
				y_size <= 11'd480;
				y_inverse <= 33'b000000000000100010001000100010001;    
				total_pixels <= 21'd307200;
			end
			SW_SVGA: begin
				x_size <= 11'd800;
				y_size <= 11'd600;
				total_pixels <= 21'd480000;
				y_inverse <= 33'b000000000000011011010011101000000;
			end
			SW_XGA: begin
				x_size <= 11'd1024;
				y_size <= 11'd768;
				y_inverse <= 33'b000000000000010101010101010101010;
				total_pixels <= 21'd786432;
			end
			SW_HDTV720P: begin
				x_size <= 11'd1280;
				y_size <= 11'd720;
				y_inverse <= 33'b000000000000010110110000010110110;
				total_pixels <= 21'd921600;
			end
			SW_SXGA: begin
				x_size <= 11'd1280;
				y_size <= 11'd1024;
				y_inverse <= 33'b000000001000000000000000000000000;
				total_pixels <= 21'd1310720;
			end
			default: begin
				x_size <= 11'd640;
				y_size <= 11'd480;
				y_inverse <= 33'b000000000000100010001000100010001;    
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
	reg signed [3:-(HBP-3)] re_start;
	reg signed [3:-(HBP-3)] im_start;
	reg signed [3:-(HBP-3)] re_end;
	reg signed [3:-(HBP-3)] im_end;
	
	// Calculate parameters
	wire signed [3:-(HBP-3)] re_diff = (re_end - re_start);
	wire signed [3:-(HBP-3)] im_diff = (im_end - im_start);
	wire signed [3:-(HBP-3)] re_scale;// = (re_end - re_start) / y_size;
	wire signed [3:-(HBP-3)] im_scale; // = (im_end - im_start) / y_size;
	
	signedFixedPointMult # (
		.iD(4),
		.iF(HBP-3),
		.oD(4),
		.oF(HBP-3)
	) re_scaled (	
		.A(re_diff), 
		.B(y_inverse), 
		.O(re_scale)
		);
		
	signedFixedPointMult # (
		.iD(4),
		.iF(HBP-3),
		.oD(4),
		.oF(HBP-3)
	) im_scaled (	
		.A(im_diff), 
		.B(y_inverse), 
		.O(im_scale)
		);
	
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
				.re_start(re_start),
				.im_start(im_start),
				.done(set_ready[i]),
				.iteration(iterations[i])
				);
		end
	endgenerate
	
	// Initialize
	
	integer j;

	initial begin
		for (j = 0; j < set_size; j = j + 1) begin
			iterations_reg[j] <= 'd0;
			x[j] = j;
			y[j] = 0;
		end
	end
	
///////////////////////
// Changing Parameters
///////////////////////
		
	initial begin
		re_start <= {-4'd2, 29'h0};
		re_end 	<=  {4'd0, 29'd0};
		im_start <= {-4'd1, 29'h0};
		im_end	<=  {4'd1, 29'd0};
	end
	
	wire signed [3:-(HBP-3)] percent10 = 33'b0000_00011001100110011001100110011;
	wire signed [3:-(HBP-3)] re_increment;
	wire signed [3:-(HBP-3)] im_increment;
	
	signedFixedPointMult # (
		.iD(4),
		.iF(HBP-3),
		.oD(4),
		.oF(HBP-3)
	) re_incr (	
		.A(re_diff), 
		.B(percent10), 
		.O(re_increment)
		);
		
	signedFixedPointMult # (
		.iD(4),
		.iF(HBP-3),
		.oD(4),
		.oF(HBP-3)
	) im_incr (	
		.A(im_diff), 
		.B(percent10), 
		.O(im_increment)
		);
	
	always @ (posedge CLK) begin
		if (btn_update) begin
			if (button[0]) begin // UP
				im_start <= im_start - im_increment;
				im_end   <= im_end   - im_increment;
			end else if (button[1]) begin // LEFT
				re_start <= re_start - re_increment;
				re_end   <= re_end   - re_increment;
			end else if (button[2]) begin // DOWN
				im_start <= im_start + im_increment;
				im_end   <= im_end   + im_increment;
			end else if (button[3]) begin // RIGHT
				re_start <= re_start + re_increment;
				re_end   <= re_end   + re_increment;
			end else if (button[4]) begin // IN
				re_start <= re_start + re_increment;
				re_end   <= re_end   - re_increment;
				im_start <= im_start + im_increment;
				im_end   <= im_end   - im_increment;
			end
		end
	end
		
		
	/////////////////////////
	// Render Control Logic
	/////////////////////////
	
	reg [7:0] render_state;
	
	always @(posedge CLK, posedge reset) begin
		if (reset) begin
			render_state <= 0;
			base_pixel <= 0;
			for (j = 0; j < set_size; j = j + 1) begin
				x[j] <= j;
				y[j] <= 0;
			end
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
				if (&set_ready && output_done) begin
					for (j = 0; j < set_size; j = j + 1) begin
						iterations_reg[j] <= iterations[j];
					end
					base_pixel   <= base_pixel + set_size;
					render_state <= 'd3;
				end
			end
			3: begin
				if (base_pixel >= total_pixels) begin
					render_state <= 'd0;
					base_pixel <= 0;
					for (j = 0; j < set_size; j = j + 1) begin
						x[j] <= j;
						y[j] <= 0;
					end
				end else render_state <= 1;
			end
			endcase
		end
	end
	
	/////////////////////
	//
	/////////////////////
		
	always @ (posedge CLK) begin
		frame_ready <= (clear_frame) ? 0 : (output_total >= total_pixels || frame_ready);
	end

	
	///////////////////////
	// Output controller
	///////////////////////
	
	//reg frame_ready;
	reg [3:0] output_state;
	reg [7:0] output_count;
	reg [20:0] output_total;
	wire output_done = (output_state == 0);
	wire data_available = (base_pixel > output_total);
	assign ready = (output_state == 1);
	
	always @ (posedge CLK, posedge reset) begin
		if (reset) begin
			output_state <= 0;
			output_total <= 0;
			output_count <= 0;
		end else begin
			case(output_state)
			0: begin
				if (data_available) begin
					output_state <= 1;
				end
			end
			1: begin
				if (send_data) begin
					output_state <= 2;
					output_total <= output_total + set_size;
					data <= iterations_reg[output_count];
					output_count <= output_count + 1;
				end
			end
			2: begin
				if (output_count < set_size) begin
					data <= iterations_reg[output_count];
					output_count <= output_count + 1;
				end else begin
					output_state <= 0;
					output_count <= 0;
					if (frame_ready) output_total <= 0;
				end
			end
			endcase
		end
	end
	
endmodule
