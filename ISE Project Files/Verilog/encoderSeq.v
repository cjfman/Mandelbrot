`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:58:50 06/09/2012 
// Design Name: 
// Module Name:    encoderSeq 
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
module encoderSeq(
    input [1:0] pos_in,
    output wire [1:0] pos_out
    );
	 
	 assign pos_out = (pos_in == 2'd0) ? 2'd1 :
							(pos_in == 2'd1) ? 2'd3 :
							(pos_in == 2'd2) ? 2'd0 : 2'd2;


endmodule
