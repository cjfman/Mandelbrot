`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:03 06/06/2012 
// Design Name: 
// Module Name:    colorRom255 
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
module colorRom255(
	 input clk,
    input [31:0] iteration,
    input [31:0] offset,
    output reg [23:0] color
    );

	always @ (posedge clk)
		case(iteration)
		254: color <= 24'hff0600; 253: color <= 24'hff0c00; 252: color <= 24'hff1200; 251: color <= 24'hff1800; 250: color <= 24'hff1e00;
		249: color <= 24'hff2400; 248: color <= 24'hff2a00; 247: color <= 24'hff3000; 246: color <= 24'hff3600; 245: color <= 24'hff3c00;
		244: color <= 24'hff4200; 243: color <= 24'hff4800; 242: color <= 24'hff4e00; 241: color <= 24'hff5400; 240: color <= 24'hff5b00;
		239: color <= 24'hff6100; 238: color <= 24'hff6700; 237: color <= 24'hff6d00; 236: color <= 24'hff7300; 235: color <= 24'hff7900;
		234: color <= 24'hff7f00; 233: color <= 24'hff8500; 232: color <= 24'hff8b00; 231: color <= 24'hff9100; 230: color <= 24'hff9700;
		229: color <= 24'hff9d00; 228: color <= 24'hffa300; 227: color <= 24'hffaa00; 226: color <= 24'hffb000; 225: color <= 24'hffb600;
		224: color <= 24'hffbc00; 223: color <= 24'hffc200; 222: color <= 24'hffc800; 221: color <= 24'hffce00; 220: color <= 24'hffd400;
		219: color <= 24'hffda00; 218: color <= 24'hffe000; 217: color <= 24'hffe600; 216: color <= 24'hffec00; 215: color <= 24'hfff200;
		214: color <= 24'hfff800; 213: color <= 24'hffff00; 212: color <= 24'hf8ff00; 211: color <= 24'hf2ff00; 210: color <= 24'hecff00;
		209: color <= 24'he6ff00; 208: color <= 24'he0ff00; 207: color <= 24'hdaff00; 206: color <= 24'hd4ff00; 205: color <= 24'hceff00;
		204: color <= 24'hc8ff00; 203: color <= 24'hc2ff00; 202: color <= 24'hbcff00; 201: color <= 24'hb6ff00; 200: color <= 24'hb0ff00;
		199: color <= 24'ha9ff00; 198: color <= 24'ha3ff00; 197: color <= 24'h9dff00; 196: color <= 24'h97ff00; 195: color <= 24'h91ff00;
		194: color <= 24'h8bff00; 193: color <= 24'h85ff00; 192: color <= 24'h7fff00; 191: color <= 24'h79ff00; 190: color <= 24'h73ff00;
		189: color <= 24'h6dff00; 188: color <= 24'h67ff00; 187: color <= 24'h61ff00; 186: color <= 24'h5bff00; 185: color <= 24'h54ff00;
		184: color <= 24'h4eff00; 183: color <= 24'h48ff00; 182: color <= 24'h42ff00; 181: color <= 24'h3cff00; 180: color <= 24'h36ff00;
		179: color <= 24'h30ff00; 178: color <= 24'h2aff00; 177: color <= 24'h24ff00; 176: color <= 24'h1eff00; 175: color <= 24'h18ff00;
		174: color <= 24'h12ff00; 173: color <= 24'h0cff00; 172: color <= 24'h06ff00; 171: color <= 24'h00ff00; 170: color <= 24'h00ff06;
		169: color <= 24'h00ff0c; 168: color <= 24'h00ff12; 167: color <= 24'h00ff18; 166: color <= 24'h00ff1e; 165: color <= 24'h00ff24;
		164: color <= 24'h00ff2a; 163: color <= 24'h00ff30; 162: color <= 24'h00ff36; 161: color <= 24'h00ff3c; 160: color <= 24'h00ff42;
		159: color <= 24'h00ff48; 158: color <= 24'h00ff4e; 157: color <= 24'h00ff54; 156: color <= 24'h00ff5b; 155: color <= 24'h00ff61;
		154: color <= 24'h00ff67; 153: color <= 24'h00ff6d; 152: color <= 24'h00ff73; 151: color <= 24'h00ff79; 150: color <= 24'h00ff7f;
		149: color <= 24'h00ff85; 148: color <= 24'h00ff8b; 147: color <= 24'h00ff91; 146: color <= 24'h00ff97; 145: color <= 24'h00ff9d;
		144: color <= 24'h00ffa3; 143: color <= 24'h00ffaa; 142: color <= 24'h00ffb0; 141: color <= 24'h00ffb6; 140: color <= 24'h00ffbc;
		139: color <= 24'h00ffc2; 138: color <= 24'h00ffc8; 137: color <= 24'h00ffce; 136: color <= 24'h00ffd4; 135: color <= 24'h00ffda;
		134: color <= 24'h00ffe0; 133: color <= 24'h00ffe6; 132: color <= 24'h00ffec; 131: color <= 24'h00fff2; 130: color <= 24'h00fff8;
		129: color <= 24'h00ffff; 128: color <= 24'h00f8ff; 127: color <= 24'h00f2ff; 126: color <= 24'h00ecff; 125: color <= 24'h00e6ff;
		124: color <= 24'h00e0ff; 123: color <= 24'h00daff; 122: color <= 24'h00d4ff; 121: color <= 24'h00ceff; 120: color <= 24'h00c8ff;
		119: color <= 24'h00c2ff; 118: color <= 24'h00bcff; 117: color <= 24'h00b6ff; 116: color <= 24'h00b0ff; 115: color <= 24'h00a9ff;
		114: color <= 24'h00a3ff; 113: color <= 24'h009dff; 112: color <= 24'h0097ff; 111: color <= 24'h0091ff; 110: color <= 24'h008bff;
		109: color <= 24'h0085ff; 108: color <= 24'h007fff; 107: color <= 24'h0079ff; 106: color <= 24'h0073ff; 105: color <= 24'h006dff;
		104: color <= 24'h0067ff; 103: color <= 24'h0061ff; 102: color <= 24'h005bff; 101: color <= 24'h0054ff; 100: color <= 24'h004eff;
		099: color <= 24'h0048ff; 098: color <= 24'h0042ff; 097: color <= 24'h003cff; 096: color <= 24'h0036ff; 095: color <= 24'h0030ff;
		094: color <= 24'h002aff; 093: color <= 24'h0024ff; 092: color <= 24'h001eff; 091: color <= 24'h0018ff; 090: color <= 24'h0012ff;
		089: color <= 24'h000cff; 088: color <= 24'h0006ff; 087: color <= 24'h0000ff; 086: color <= 24'h0600ff; 085: color <= 24'h0c00ff;
		084: color <= 24'h1200ff; 083: color <= 24'h1800ff; 082: color <= 24'h1e00ff; 081: color <= 24'h2400ff; 080: color <= 24'h2a00ff;
		079: color <= 24'h3000ff; 078: color <= 24'h3600ff; 077: color <= 24'h3c00ff; 076: color <= 24'h4200ff; 075: color <= 24'h4800ff;
		074: color <= 24'h4e00ff; 073: color <= 24'h5400ff; 072: color <= 24'h5b00ff; 071: color <= 24'h6100ff; 070: color <= 24'h6700ff;
		069: color <= 24'h6d00ff; 068: color <= 24'h7300ff; 067: color <= 24'h7900ff; 066: color <= 24'h7f00ff; 065: color <= 24'h8500ff;
		064: color <= 24'h8b00ff; 063: color <= 24'h9100ff; 062: color <= 24'h9700ff; 061: color <= 24'h9d00ff; 060: color <= 24'ha300ff;
		059: color <= 24'haa00ff; 058: color <= 24'hb000ff; 057: color <= 24'hb600ff; 056: color <= 24'hbc00ff; 055: color <= 24'hc200ff;
		054: color <= 24'hc800ff; 053: color <= 24'hce00ff; 052: color <= 24'hd400ff; 051: color <= 24'hda00ff; 050: color <= 24'he000ff;
		049: color <= 24'he600ff; 048: color <= 24'hec00ff; 047: color <= 24'hf200ff; 046: color <= 24'hf800ff; 045: color <= 24'hff00ff;
		044: color <= 24'hfb00fb; 043: color <= 24'hf800f8; 042: color <= 24'hf500f5; 041: color <= 24'hf200f2; 040: color <= 24'hef00ef;
		039: color <= 24'hec00ec; 038: color <= 24'he900e9; 037: color <= 24'he600e6; 036: color <= 24'he300e3; 035: color <= 24'he000e0;
		034: color <= 24'hdd00dd; 033: color <= 24'hda00da; 032: color <= 24'hd700d7; 031: color <= 24'hd400d4; 030: color <= 24'hd100d1;
		029: color <= 24'hce00ce; 028: color <= 24'hcb00cb; 027: color <= 24'hc800c8; 026: color <= 24'hc500c5; 025: color <= 24'hc200c2;
		024: color <= 24'hbf00bf; 023: color <= 24'hbc00bc; 022: color <= 24'hb900b9; 021: color <= 24'hb600b6; 020: color <= 24'hb300b3;
		019: color <= 24'hb000b0; 018: color <= 24'had00ad; 017: color <= 24'haa00aa; 016: color <= 24'ha600a6; 015: color <= 24'ha300a3;
		014: color <= 24'ha000a0; 013: color <= 24'h9d009d; 012: color <= 24'h9a009a; 011: color <= 24'h970097; 010: color <= 24'h940094;
		009: color <= 24'h910091; 008: color <= 24'h8e008e; 007: color <= 24'h8b008b; 006: color <= 24'h880088; 005: color <= 24'h850085;
		004: color <= 24'h820082; 003: color <= 24'h7f007f; 002: color <= 24'h7f007f; 001: color <= 24'h7f007f; 000: color <= 24'h7f007f;
		255: color <= 24'h000000;
		endcase
endmodule