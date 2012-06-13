`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent
// Engineer: Charles Jessup Franklin
// 
// Create Date:    10:21:44 06/06/2012 
// Module Name:    fixedPointMult 
// Description:    Signed fixed point multiplier
//
//////////////////////////////////////////////////////////////////////////////////
module signedFixedPointMult #(
	parameter iD = 16, // Number of places before the point of input
	parameter iF = 16, // Number of places after the point of input
	parameter oD = 16, // Number of places before the point of output
	parameter oF = 16  // Number of places after the point of output
	)(
	input wire signed  [iD - 1 : -iF] A,
	input wire signed  [iD - 1 : -iF] B,
	output wire signed [oD - 1 : -oF] O
	);

	wire signed [(iD*2) - 1 : -(iF*2)] product = A * B; 			// Full multiplication
	assign O = {product [(iD*2) - 1], product [oD - 2 : -oF]};	// Trim output and keep sign bit

endmodule
