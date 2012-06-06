`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:21:44 06/06/2012 
// Design Name: 
// Module Name:    fixedPointMult 
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
module signedFixedPointMult #(
	parameter iD = 16,
	parameter iF = 16,
	parameter oD = 16,
	parameter oF = 16
	)(
	input wire signed  [iD - 1 : -iF] A,
	input wire signed  [iD - 1 : -iF] B,
	output wire signed [(oD) - 1 : -(oF)] O
	);

	wire signed [(iD*2) - 1 : -(iF*2)] product = A * B;
	assign O = {product [(iD*2) - 1], product [oD - 2 : -oF]};

endmodule
