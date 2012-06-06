`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:23 06/06/2012 
// Design Name: 
// Module Name:    colorRom 
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
module colorRom(
    input clk,
    input [31:0] iteration,
    input [31:0] offset,
    output reg [23:0] color
    );

	always @ (posedge clk)
		case(iteration)
			0000: color <= 24'hff0100; 0001: color <= 24'hff0300; 0002: color <= 24'hff0400; 0003: color <= 24'hff0600; 0004: color <= 24'hff0700; 
			0005: color <= 24'hff0900; 0006: color <= 24'hff0a00; 0007: color <= 24'hff0c00; 0008: color <= 24'hff0d00; 0009: color <= 24'hff0f00; 
			0010: color <= 24'hff1000; 0011: color <= 24'hff1200; 0012: color <= 24'hff1300; 0013: color <= 24'hff1500; 0014: color <= 24'hff1700; 
			0015: color <= 24'hff1800; 0016: color <= 24'hff1a00; 0017: color <= 24'hff1b00; 0018: color <= 24'hff1d00; 0019: color <= 24'hff1e00; 
			0020: color <= 24'hff2000; 0021: color <= 24'hff2100; 0022: color <= 24'hff2300; 0023: color <= 24'hff2400; 0024: color <= 24'hff2600; 
			0025: color <= 24'hff2700; 0026: color <= 24'hff2900; 0027: color <= 24'hff2b00; 0028: color <= 24'hff2c00; 0029: color <= 24'hff2e00; 
			0030: color <= 24'hff2f00; 0031: color <= 24'hff3100; 0032: color <= 24'hff3200; 0033: color <= 24'hff3400; 0034: color <= 24'hff3500; 
			0035: color <= 24'hff3700; 0036: color <= 24'hff3800; 0037: color <= 24'hff3a00; 0038: color <= 24'hff3b00; 0039: color <= 24'hff3d00; 
			0040: color <= 24'hff3e00; 0041: color <= 24'hff4000; 0042: color <= 24'hff4200; 0043: color <= 24'hff4300; 0044: color <= 24'hff4500; 
			0045: color <= 24'hff4600; 0046: color <= 24'hff4800; 0047: color <= 24'hff4900; 0048: color <= 24'hff4b00; 0049: color <= 24'hff4c00; 
			0050: color <= 24'hff4e00; 0051: color <= 24'hff4f00; 0052: color <= 24'hff5100; 0053: color <= 24'hff5200; 0054: color <= 24'hff5400; 
			0055: color <= 24'hff5600; 0056: color <= 24'hff5700; 0057: color <= 24'hff5900; 0058: color <= 24'hff5a00; 0059: color <= 24'hff5c00; 
			0060: color <= 24'hff5d00; 0061: color <= 24'hff5f00; 0062: color <= 24'hff6000; 0063: color <= 24'hff6200; 0064: color <= 24'hff6300; 
			0065: color <= 24'hff6500; 0066: color <= 24'hff6600; 0067: color <= 24'hff6800; 0068: color <= 24'hff6900; 0069: color <= 24'hff6b00; 
			0070: color <= 24'hff6d00; 0071: color <= 24'hff6e00; 0072: color <= 24'hff7000; 0073: color <= 24'hff7100; 0074: color <= 24'hff7300; 
			0075: color <= 24'hff7400; 0076: color <= 24'hff7600; 0077: color <= 24'hff7700; 0078: color <= 24'hff7900; 0079: color <= 24'hff7a00; 
			0080: color <= 24'hff7c00; 0081: color <= 24'hff7d00; 0082: color <= 24'hff7f00; 0083: color <= 24'hff8100; 0084: color <= 24'hff8200; 
			0085: color <= 24'hff8400; 0086: color <= 24'hff8500; 0087: color <= 24'hff8700; 0088: color <= 24'hff8800; 0089: color <= 24'hff8a00; 
			0090: color <= 24'hff8b00; 0091: color <= 24'hff8d00; 0092: color <= 24'hff8e00; 0093: color <= 24'hff9000; 0094: color <= 24'hff9100; 
			0095: color <= 24'hff9300; 0096: color <= 24'hff9500; 0097: color <= 24'hff9600; 0098: color <= 24'hff9800; 0099: color <= 24'hff9900; 
			0100: color <= 24'hff9b00; 0101: color <= 24'hff9c00; 0102: color <= 24'hff9e00; 0103: color <= 24'hff9f00; 0104: color <= 24'hffa100; 
			0105: color <= 24'hffa200; 0106: color <= 24'hffa400; 0107: color <= 24'hffa500; 0108: color <= 24'hffa700; 0109: color <= 24'hffa800; 
			0110: color <= 24'hffaa00; 0111: color <= 24'hffac00; 0112: color <= 24'hffad00; 0113: color <= 24'hffaf00; 0114: color <= 24'hffb000; 
			0115: color <= 24'hffb200; 0116: color <= 24'hffb300; 0117: color <= 24'hffb500; 0118: color <= 24'hffb600; 0119: color <= 24'hffb800; 
			0120: color <= 24'hffb900; 0121: color <= 24'hffbb00; 0122: color <= 24'hffbc00; 0123: color <= 24'hffbe00; 0124: color <= 24'hffc000; 
			0125: color <= 24'hffc100; 0126: color <= 24'hffc300; 0127: color <= 24'hffc400; 0128: color <= 24'hffc600; 0129: color <= 24'hffc700; 
			0130: color <= 24'hffc900; 0131: color <= 24'hffca00; 0132: color <= 24'hffcc00; 0133: color <= 24'hffcd00; 0134: color <= 24'hffcf00; 
			0135: color <= 24'hffd000; 0136: color <= 24'hffd200; 0137: color <= 24'hffd300; 0138: color <= 24'hffd500; 0139: color <= 24'hffd700; 
			0140: color <= 24'hffd800; 0141: color <= 24'hffda00; 0142: color <= 24'hffdb00; 0143: color <= 24'hffdd00; 0144: color <= 24'hffde00; 
			0145: color <= 24'hffe000; 0146: color <= 24'hffe100; 0147: color <= 24'hffe300; 0148: color <= 24'hffe400; 0149: color <= 24'hffe600; 
			0150: color <= 24'hffe700; 0151: color <= 24'hffe900; 0152: color <= 24'hffeb00; 0153: color <= 24'hffec00; 0154: color <= 24'hffee00; 
			0155: color <= 24'hffef00; 0156: color <= 24'hfff100; 0157: color <= 24'hfff200; 0158: color <= 24'hfff400; 0159: color <= 24'hfff500; 
			0160: color <= 24'hfff700; 0161: color <= 24'hfff800; 0162: color <= 24'hfffa00; 0163: color <= 24'hfffb00; 0164: color <= 24'hfffd00; 
			0165: color <= 24'hfffe00; 0166: color <= 24'hfdff00; 0167: color <= 24'hfbff00; 0168: color <= 24'hfaff00; 0169: color <= 24'hf8ff00; 
			0170: color <= 24'hf7ff00; 0171: color <= 24'hf5ff00; 0172: color <= 24'hf4ff00; 0173: color <= 24'hf2ff00; 0174: color <= 24'hf1ff00; 
			0175: color <= 24'hefff00; 0176: color <= 24'heeff00; 0177: color <= 24'hecff00; 0178: color <= 24'hebff00; 0179: color <= 24'he9ff00; 
			0180: color <= 24'he7ff00; 0181: color <= 24'he6ff00; 0182: color <= 24'he4ff00; 0183: color <= 24'he3ff00; 0184: color <= 24'he1ff00; 
			0185: color <= 24'he0ff00; 0186: color <= 24'hdeff00; 0187: color <= 24'hddff00; 0188: color <= 24'hdbff00; 0189: color <= 24'hdaff00; 
			0190: color <= 24'hd8ff00; 0191: color <= 24'hd7ff00; 0192: color <= 24'hd5ff00; 0193: color <= 24'hd3ff00; 0194: color <= 24'hd2ff00; 
			0195: color <= 24'hd0ff00; 0196: color <= 24'hcfff00; 0197: color <= 24'hcdff00; 0198: color <= 24'hccff00; 0199: color <= 24'hcaff00; 
			0200: color <= 24'hc9ff00; 0201: color <= 24'hc7ff00; 0202: color <= 24'hc6ff00; 0203: color <= 24'hc4ff00; 0204: color <= 24'hc3ff00; 
			0205: color <= 24'hc1ff00; 0206: color <= 24'hc0ff00; 0207: color <= 24'hbeff00; 0208: color <= 24'hbcff00; 0209: color <= 24'hbbff00; 
			0210: color <= 24'hb9ff00; 0211: color <= 24'hb8ff00; 0212: color <= 24'hb6ff00; 0213: color <= 24'hb5ff00; 0214: color <= 24'hb3ff00; 
			0215: color <= 24'hb2ff00; 0216: color <= 24'hb0ff00; 0217: color <= 24'hafff00; 0218: color <= 24'hadff00; 0219: color <= 24'hacff00; 
			0220: color <= 24'haaff00; 0221: color <= 24'ha8ff00; 0222: color <= 24'ha7ff00; 0223: color <= 24'ha5ff00; 0224: color <= 24'ha4ff00; 
			0225: color <= 24'ha2ff00; 0226: color <= 24'ha1ff00; 0227: color <= 24'h9fff00; 0228: color <= 24'h9eff00; 0229: color <= 24'h9cff00; 
			0230: color <= 24'h9bff00; 0231: color <= 24'h99ff00; 0232: color <= 24'h98ff00; 0233: color <= 24'h96ff00; 0234: color <= 24'h95ff00; 
			0235: color <= 24'h93ff00; 0236: color <= 24'h91ff00; 0237: color <= 24'h90ff00; 0238: color <= 24'h8eff00; 0239: color <= 24'h8dff00; 
			0240: color <= 24'h8bff00; 0241: color <= 24'h8aff00; 0242: color <= 24'h88ff00; 0243: color <= 24'h87ff00; 0244: color <= 24'h85ff00; 
			0245: color <= 24'h84ff00; 0246: color <= 24'h82ff00; 0247: color <= 24'h81ff00; 0248: color <= 24'h7fff00; 0249: color <= 24'h7dff00; 
			0250: color <= 24'h7cff00; 0251: color <= 24'h7aff00; 0252: color <= 24'h79ff00; 0253: color <= 24'h77ff00; 0254: color <= 24'h76ff00; 
			0255: color <= 24'h74ff00; 0256: color <= 24'h73ff00; 0257: color <= 24'h71ff00; 0258: color <= 24'h70ff00; 0259: color <= 24'h6eff00; 
			0260: color <= 24'h6dff00; 0261: color <= 24'h6bff00; 0262: color <= 24'h69ff00; 0263: color <= 24'h68ff00; 0264: color <= 24'h66ff00; 
			0265: color <= 24'h65ff00; 0266: color <= 24'h63ff00; 0267: color <= 24'h62ff00; 0268: color <= 24'h60ff00; 0269: color <= 24'h5fff00; 
			0270: color <= 24'h5dff00; 0271: color <= 24'h5cff00; 0272: color <= 24'h5aff00; 0273: color <= 24'h59ff00; 0274: color <= 24'h57ff00; 
			0275: color <= 24'h56ff00; 0276: color <= 24'h54ff00; 0277: color <= 24'h52ff00; 0278: color <= 24'h51ff00; 0279: color <= 24'h4fff00; 
			0280: color <= 24'h4eff00; 0281: color <= 24'h4cff00; 0282: color <= 24'h4bff00; 0283: color <= 24'h49ff00; 0284: color <= 24'h48ff00; 
			0285: color <= 24'h46ff00; 0286: color <= 24'h45ff00; 0287: color <= 24'h43ff00; 0288: color <= 24'h42ff00; 0289: color <= 24'h40ff00; 
			0290: color <= 24'h3eff00; 0291: color <= 24'h3dff00; 0292: color <= 24'h3bff00; 0293: color <= 24'h3aff00; 0294: color <= 24'h38ff00; 
			0295: color <= 24'h37ff00; 0296: color <= 24'h35ff00; 0297: color <= 24'h34ff00; 0298: color <= 24'h32ff00; 0299: color <= 24'h31ff00; 
			0300: color <= 24'h2fff00; 0301: color <= 24'h2eff00; 0302: color <= 24'h2cff00; 0303: color <= 24'h2bff00; 0304: color <= 24'h29ff00; 
			0305: color <= 24'h27ff00; 0306: color <= 24'h26ff00; 0307: color <= 24'h24ff00; 0308: color <= 24'h23ff00; 0309: color <= 24'h21ff00; 
			0310: color <= 24'h20ff00; 0311: color <= 24'h1eff00; 0312: color <= 24'h1dff00; 0313: color <= 24'h1bff00; 0314: color <= 24'h1aff00; 
			0315: color <= 24'h18ff00; 0316: color <= 24'h17ff00; 0317: color <= 24'h15ff00; 0318: color <= 24'h13ff00; 0319: color <= 24'h12ff00; 
			0320: color <= 24'h10ff00; 0321: color <= 24'h0fff00; 0322: color <= 24'h0dff00; 0323: color <= 24'h0cff00; 0324: color <= 24'h0aff00; 
			0325: color <= 24'h09ff00; 0326: color <= 24'h07ff00; 0327: color <= 24'h06ff00; 0328: color <= 24'h04ff00; 0329: color <= 24'h03ff00; 
			0330: color <= 24'h01ff00; 0331: color <= 24'h00ff00; 0332: color <= 24'h00ff01; 0333: color <= 24'h00ff03; 0334: color <= 24'h00ff04; 
			0335: color <= 24'h00ff06; 0336: color <= 24'h00ff07; 0337: color <= 24'h00ff09; 0338: color <= 24'h00ff0a; 0339: color <= 24'h00ff0c; 
			0340: color <= 24'h00ff0d; 0341: color <= 24'h00ff0f; 0342: color <= 24'h00ff10; 0343: color <= 24'h00ff12; 0344: color <= 24'h00ff13; 
			0345: color <= 24'h00ff15; 0346: color <= 24'h00ff17; 0347: color <= 24'h00ff18; 0348: color <= 24'h00ff1a; 0349: color <= 24'h00ff1b; 
			0350: color <= 24'h00ff1d; 0351: color <= 24'h00ff1e; 0352: color <= 24'h00ff20; 0353: color <= 24'h00ff21; 0354: color <= 24'h00ff23; 
			0355: color <= 24'h00ff24; 0356: color <= 24'h00ff26; 0357: color <= 24'h00ff27; 0358: color <= 24'h00ff29; 0359: color <= 24'h00ff2b; 
			0360: color <= 24'h00ff2c; 0361: color <= 24'h00ff2e; 0362: color <= 24'h00ff2f; 0363: color <= 24'h00ff31; 0364: color <= 24'h00ff32; 
			0365: color <= 24'h00ff34; 0366: color <= 24'h00ff35; 0367: color <= 24'h00ff37; 0368: color <= 24'h00ff38; 0369: color <= 24'h00ff3a; 
			0370: color <= 24'h00ff3b; 0371: color <= 24'h00ff3d; 0372: color <= 24'h00ff3e; 0373: color <= 24'h00ff40; 0374: color <= 24'h00ff42; 
			0375: color <= 24'h00ff43; 0376: color <= 24'h00ff45; 0377: color <= 24'h00ff46; 0378: color <= 24'h00ff48; 0379: color <= 24'h00ff49; 
			0380: color <= 24'h00ff4b; 0381: color <= 24'h00ff4c; 0382: color <= 24'h00ff4e; 0383: color <= 24'h00ff4f; 0384: color <= 24'h00ff51; 
			0385: color <= 24'h00ff52; 0386: color <= 24'h00ff54; 0387: color <= 24'h00ff56; 0388: color <= 24'h00ff57; 0389: color <= 24'h00ff59; 
			0390: color <= 24'h00ff5a; 0391: color <= 24'h00ff5c; 0392: color <= 24'h00ff5d; 0393: color <= 24'h00ff5f; 0394: color <= 24'h00ff60; 
			0395: color <= 24'h00ff62; 0396: color <= 24'h00ff63; 0397: color <= 24'h00ff65; 0398: color <= 24'h00ff66; 0399: color <= 24'h00ff68; 
			0400: color <= 24'h00ff69; 0401: color <= 24'h00ff6b; 0402: color <= 24'h00ff6d; 0403: color <= 24'h00ff6e; 0404: color <= 24'h00ff70; 
			0405: color <= 24'h00ff71; 0406: color <= 24'h00ff73; 0407: color <= 24'h00ff74; 0408: color <= 24'h00ff76; 0409: color <= 24'h00ff77; 
			0410: color <= 24'h00ff79; 0411: color <= 24'h00ff7a; 0412: color <= 24'h00ff7c; 0413: color <= 24'h00ff7d; 0414: color <= 24'h00ff7f; 
			0415: color <= 24'h00ff81; 0416: color <= 24'h00ff82; 0417: color <= 24'h00ff84; 0418: color <= 24'h00ff85; 0419: color <= 24'h00ff87; 
			0420: color <= 24'h00ff88; 0421: color <= 24'h00ff8a; 0422: color <= 24'h00ff8b; 0423: color <= 24'h00ff8d; 0424: color <= 24'h00ff8e; 
			0425: color <= 24'h00ff90; 0426: color <= 24'h00ff91; 0427: color <= 24'h00ff93; 0428: color <= 24'h00ff95; 0429: color <= 24'h00ff96; 
			0430: color <= 24'h00ff98; 0431: color <= 24'h00ff99; 0432: color <= 24'h00ff9b; 0433: color <= 24'h00ff9c; 0434: color <= 24'h00ff9e; 
			0435: color <= 24'h00ff9f; 0436: color <= 24'h00ffa1; 0437: color <= 24'h00ffa2; 0438: color <= 24'h00ffa4; 0439: color <= 24'h00ffa5; 
			0440: color <= 24'h00ffa7; 0441: color <= 24'h00ffa8; 0442: color <= 24'h00ffaa; 0443: color <= 24'h00ffac; 0444: color <= 24'h00ffad; 
			0445: color <= 24'h00ffaf; 0446: color <= 24'h00ffb0; 0447: color <= 24'h00ffb2; 0448: color <= 24'h00ffb3; 0449: color <= 24'h00ffb5; 
			0450: color <= 24'h00ffb6; 0451: color <= 24'h00ffb8; 0452: color <= 24'h00ffb9; 0453: color <= 24'h00ffbb; 0454: color <= 24'h00ffbc; 
			0455: color <= 24'h00ffbe; 0456: color <= 24'h00ffc0; 0457: color <= 24'h00ffc1; 0458: color <= 24'h00ffc3; 0459: color <= 24'h00ffc4; 
			0460: color <= 24'h00ffc6; 0461: color <= 24'h00ffc7; 0462: color <= 24'h00ffc9; 0463: color <= 24'h00ffca; 0464: color <= 24'h00ffcc; 
			0465: color <= 24'h00ffcd; 0466: color <= 24'h00ffcf; 0467: color <= 24'h00ffd0; 0468: color <= 24'h00ffd2; 0469: color <= 24'h00ffd3; 
			0470: color <= 24'h00ffd5; 0471: color <= 24'h00ffd7; 0472: color <= 24'h00ffd8; 0473: color <= 24'h00ffda; 0474: color <= 24'h00ffdb; 
			0475: color <= 24'h00ffdd; 0476: color <= 24'h00ffde; 0477: color <= 24'h00ffe0; 0478: color <= 24'h00ffe1; 0479: color <= 24'h00ffe3; 
			0480: color <= 24'h00ffe4; 0481: color <= 24'h00ffe6; 0482: color <= 24'h00ffe7; 0483: color <= 24'h00ffe9; 0484: color <= 24'h00ffeb; 
			0485: color <= 24'h00ffec; 0486: color <= 24'h00ffee; 0487: color <= 24'h00ffef; 0488: color <= 24'h00fff1; 0489: color <= 24'h00fff2; 
			0490: color <= 24'h00fff4; 0491: color <= 24'h00fff5; 0492: color <= 24'h00fff7; 0493: color <= 24'h00fff8; 0494: color <= 24'h00fffa; 
			0495: color <= 24'h00fffb; 0496: color <= 24'h00fffd; 0497: color <= 24'h00fffe; 0498: color <= 24'h00fdff; 0499: color <= 24'h00fbff; 
			0500: color <= 24'h00faff; 0501: color <= 24'h00f8ff; 0502: color <= 24'h00f7ff; 0503: color <= 24'h00f5ff; 0504: color <= 24'h00f4ff; 
			0505: color <= 24'h00f2ff; 0506: color <= 24'h00f1ff; 0507: color <= 24'h00efff; 0508: color <= 24'h00eeff; 0509: color <= 24'h00ecff; 
			0510: color <= 24'h00ebff; 0511: color <= 24'h00e9ff; 0512: color <= 24'h00e7ff; 0513: color <= 24'h00e6ff; 0514: color <= 24'h00e4ff; 
			0515: color <= 24'h00e3ff; 0516: color <= 24'h00e1ff; 0517: color <= 24'h00e0ff; 0518: color <= 24'h00deff; 0519: color <= 24'h00ddff; 
			0520: color <= 24'h00dbff; 0521: color <= 24'h00daff; 0522: color <= 24'h00d8ff; 0523: color <= 24'h00d7ff; 0524: color <= 24'h00d5ff; 
			0525: color <= 24'h00d3ff; 0526: color <= 24'h00d2ff; 0527: color <= 24'h00d0ff; 0528: color <= 24'h00cfff; 0529: color <= 24'h00cdff; 
			0530: color <= 24'h00ccff; 0531: color <= 24'h00caff; 0532: color <= 24'h00c9ff; 0533: color <= 24'h00c7ff; 0534: color <= 24'h00c6ff; 
			0535: color <= 24'h00c4ff; 0536: color <= 24'h00c3ff; 0537: color <= 24'h00c1ff; 0538: color <= 24'h00c0ff; 0539: color <= 24'h00beff; 
			0540: color <= 24'h00bcff; 0541: color <= 24'h00bbff; 0542: color <= 24'h00b9ff; 0543: color <= 24'h00b8ff; 0544: color <= 24'h00b6ff; 
			0545: color <= 24'h00b5ff; 0546: color <= 24'h00b3ff; 0547: color <= 24'h00b2ff; 0548: color <= 24'h00b0ff; 0549: color <= 24'h00afff; 
			0550: color <= 24'h00adff; 0551: color <= 24'h00acff; 0552: color <= 24'h00aaff; 0553: color <= 24'h00a8ff; 0554: color <= 24'h00a7ff; 
			0555: color <= 24'h00a5ff; 0556: color <= 24'h00a4ff; 0557: color <= 24'h00a2ff; 0558: color <= 24'h00a1ff; 0559: color <= 24'h009fff; 
			0560: color <= 24'h009eff; 0561: color <= 24'h009cff; 0562: color <= 24'h009bff; 0563: color <= 24'h0099ff; 0564: color <= 24'h0098ff; 
			0565: color <= 24'h0096ff; 0566: color <= 24'h0095ff; 0567: color <= 24'h0093ff; 0568: color <= 24'h0091ff; 0569: color <= 24'h0090ff; 
			0570: color <= 24'h008eff; 0571: color <= 24'h008dff; 0572: color <= 24'h008bff; 0573: color <= 24'h008aff; 0574: color <= 24'h0088ff; 
			0575: color <= 24'h0087ff; 0576: color <= 24'h0085ff; 0577: color <= 24'h0084ff; 0578: color <= 24'h0082ff; 0579: color <= 24'h0081ff; 
			0580: color <= 24'h007fff; 0581: color <= 24'h007dff; 0582: color <= 24'h007cff; 0583: color <= 24'h007aff; 0584: color <= 24'h0079ff; 
			0585: color <= 24'h0077ff; 0586: color <= 24'h0076ff; 0587: color <= 24'h0074ff; 0588: color <= 24'h0073ff; 0589: color <= 24'h0071ff; 
			0590: color <= 24'h0070ff; 0591: color <= 24'h006eff; 0592: color <= 24'h006dff; 0593: color <= 24'h006bff; 0594: color <= 24'h0069ff; 
			0595: color <= 24'h0068ff; 0596: color <= 24'h0066ff; 0597: color <= 24'h0065ff; 0598: color <= 24'h0063ff; 0599: color <= 24'h0062ff; 
			0600: color <= 24'h0060ff; 0601: color <= 24'h005fff; 0602: color <= 24'h005dff; 0603: color <= 24'h005cff; 0604: color <= 24'h005aff; 
			0605: color <= 24'h0059ff; 0606: color <= 24'h0057ff; 0607: color <= 24'h0056ff; 0608: color <= 24'h0054ff; 0609: color <= 24'h0052ff; 
			0610: color <= 24'h0051ff; 0611: color <= 24'h004fff; 0612: color <= 24'h004eff; 0613: color <= 24'h004cff; 0614: color <= 24'h004bff; 
			0615: color <= 24'h0049ff; 0616: color <= 24'h0048ff; 0617: color <= 24'h0046ff; 0618: color <= 24'h0045ff; 0619: color <= 24'h0043ff; 
			0620: color <= 24'h0042ff; 0621: color <= 24'h0040ff; 0622: color <= 24'h003eff; 0623: color <= 24'h003dff; 0624: color <= 24'h003bff; 
			0625: color <= 24'h003aff; 0626: color <= 24'h0038ff; 0627: color <= 24'h0037ff; 0628: color <= 24'h0035ff; 0629: color <= 24'h0034ff; 
			0630: color <= 24'h0032ff; 0631: color <= 24'h0031ff; 0632: color <= 24'h002fff; 0633: color <= 24'h002eff; 0634: color <= 24'h002cff; 
			0635: color <= 24'h002bff; 0636: color <= 24'h0029ff; 0637: color <= 24'h0027ff; 0638: color <= 24'h0026ff; 0639: color <= 24'h0024ff; 
			0640: color <= 24'h0023ff; 0641: color <= 24'h0021ff; 0642: color <= 24'h0020ff; 0643: color <= 24'h001eff; 0644: color <= 24'h001dff; 
			0645: color <= 24'h001bff; 0646: color <= 24'h001aff; 0647: color <= 24'h0018ff; 0648: color <= 24'h0017ff; 0649: color <= 24'h0015ff; 
			0650: color <= 24'h0013ff; 0651: color <= 24'h0012ff; 0652: color <= 24'h0010ff; 0653: color <= 24'h000fff; 0654: color <= 24'h000dff; 
			0655: color <= 24'h000cff; 0656: color <= 24'h000aff; 0657: color <= 24'h0009ff; 0658: color <= 24'h0007ff; 0659: color <= 24'h0006ff; 
			0660: color <= 24'h0004ff; 0661: color <= 24'h0003ff; 0662: color <= 24'h0001ff; 0663: color <= 24'h0000ff; 0664: color <= 24'h0100ff; 
			0665: color <= 24'h0300ff; 0666: color <= 24'h0400ff; 0667: color <= 24'h0600ff; 0668: color <= 24'h0700ff; 0669: color <= 24'h0900ff; 
			0670: color <= 24'h0a00ff; 0671: color <= 24'h0c00ff; 0672: color <= 24'h0d00ff; 0673: color <= 24'h0f00ff; 0674: color <= 24'h1000ff; 
			0675: color <= 24'h1200ff; 0676: color <= 24'h1300ff; 0677: color <= 24'h1500ff; 0678: color <= 24'h1700ff; 0679: color <= 24'h1800ff; 
			0680: color <= 24'h1a00ff; 0681: color <= 24'h1b00ff; 0682: color <= 24'h1d00ff; 0683: color <= 24'h1e00ff; 0684: color <= 24'h2000ff; 
			0685: color <= 24'h2100ff; 0686: color <= 24'h2300ff; 0687: color <= 24'h2400ff; 0688: color <= 24'h2600ff; 0689: color <= 24'h2700ff; 
			0690: color <= 24'h2900ff; 0691: color <= 24'h2b00ff; 0692: color <= 24'h2c00ff; 0693: color <= 24'h2e00ff; 0694: color <= 24'h2f00ff; 
			0695: color <= 24'h3100ff; 0696: color <= 24'h3200ff; 0697: color <= 24'h3400ff; 0698: color <= 24'h3500ff; 0699: color <= 24'h3700ff; 
			0700: color <= 24'h3800ff; 0701: color <= 24'h3a00ff; 0702: color <= 24'h3b00ff; 0703: color <= 24'h3d00ff; 0704: color <= 24'h3e00ff; 
			0705: color <= 24'h4000ff; 0706: color <= 24'h4200ff; 0707: color <= 24'h4300ff; 0708: color <= 24'h4500ff; 0709: color <= 24'h4600ff; 
			0710: color <= 24'h4800ff; 0711: color <= 24'h4900ff; 0712: color <= 24'h4b00ff; 0713: color <= 24'h4c00ff; 0714: color <= 24'h4e00ff; 
			0715: color <= 24'h4f00ff; 0716: color <= 24'h5100ff; 0717: color <= 24'h5200ff; 0718: color <= 24'h5400ff; 0719: color <= 24'h5600ff; 
			0720: color <= 24'h5700ff; 0721: color <= 24'h5900ff; 0722: color <= 24'h5a00ff; 0723: color <= 24'h5c00ff; 0724: color <= 24'h5d00ff; 
			0725: color <= 24'h5f00ff; 0726: color <= 24'h6000ff; 0727: color <= 24'h6200ff; 0728: color <= 24'h6300ff; 0729: color <= 24'h6500ff; 
			0730: color <= 24'h6600ff; 0731: color <= 24'h6800ff; 0732: color <= 24'h6900ff; 0733: color <= 24'h6b00ff; 0734: color <= 24'h6d00ff; 
			0735: color <= 24'h6e00ff; 0736: color <= 24'h7000ff; 0737: color <= 24'h7100ff; 0738: color <= 24'h7300ff; 0739: color <= 24'h7400ff; 
			0740: color <= 24'h7600ff; 0741: color <= 24'h7700ff; 0742: color <= 24'h7900ff; 0743: color <= 24'h7a00ff; 0744: color <= 24'h7c00ff; 
			0745: color <= 24'h7d00ff; 0746: color <= 24'h7f00ff; 0747: color <= 24'h8100ff; 0748: color <= 24'h8200ff; 0749: color <= 24'h8400ff; 
			0750: color <= 24'h8500ff; 0751: color <= 24'h8700ff; 0752: color <= 24'h8800ff; 0753: color <= 24'h8a00ff; 0754: color <= 24'h8b00ff; 
			0755: color <= 24'h8d00ff; 0756: color <= 24'h8e00ff; 0757: color <= 24'h9000ff; 0758: color <= 24'h9100ff; 0759: color <= 24'h9300ff; 
			0760: color <= 24'h9500ff; 0761: color <= 24'h9600ff; 0762: color <= 24'h9800ff; 0763: color <= 24'h9900ff; 0764: color <= 24'h9b00ff; 
			0765: color <= 24'h9c00ff; 0766: color <= 24'h9e00ff; 0767: color <= 24'h9f00ff; 0768: color <= 24'ha100ff; 0769: color <= 24'ha200ff; 
			0770: color <= 24'ha400ff; 0771: color <= 24'ha500ff; 0772: color <= 24'ha700ff; 0773: color <= 24'ha800ff; 0774: color <= 24'haa00ff; 
			0775: color <= 24'hac00ff; 0776: color <= 24'had00ff; 0777: color <= 24'haf00ff; 0778: color <= 24'hb000ff; 0779: color <= 24'hb200ff; 
			0780: color <= 24'hb300ff; 0781: color <= 24'hb500ff; 0782: color <= 24'hb600ff; 0783: color <= 24'hb800ff; 0784: color <= 24'hb900ff; 
			0785: color <= 24'hbb00ff; 0786: color <= 24'hbc00ff; 0787: color <= 24'hbe00ff; 0788: color <= 24'hc000ff; 0789: color <= 24'hc100ff; 
			0790: color <= 24'hc300ff; 0791: color <= 24'hc400ff; 0792: color <= 24'hc600ff; 0793: color <= 24'hc700ff; 0794: color <= 24'hc900ff; 
			0795: color <= 24'hca00ff; 0796: color <= 24'hcc00ff; 0797: color <= 24'hcd00ff; 0798: color <= 24'hcf00ff; 0799: color <= 24'hd000ff; 
			0800: color <= 24'hd200ff; 0801: color <= 24'hd300ff; 0802: color <= 24'hd500ff; 0803: color <= 24'hd700ff; 0804: color <= 24'hd800ff; 
			0805: color <= 24'hda00ff; 0806: color <= 24'hdb00ff; 0807: color <= 24'hdd00ff; 0808: color <= 24'hde00ff; 0809: color <= 24'he000ff; 
			0810: color <= 24'he100ff; 0811: color <= 24'he300ff; 0812: color <= 24'he400ff; 0813: color <= 24'he600ff; 0814: color <= 24'he700ff; 
			0815: color <= 24'he900ff; 0816: color <= 24'heb00ff; 0817: color <= 24'hec00ff; 0818: color <= 24'hee00ff; 0819: color <= 24'hef00ff; 
			0820: color <= 24'hf100ff; 0821: color <= 24'hf200ff; 0822: color <= 24'hf400ff; 0823: color <= 24'hf500ff; 0824: color <= 24'hf700ff; 
			0825: color <= 24'hf800ff; 0826: color <= 24'hfa00ff; 0827: color <= 24'hfb00ff; 0828: color <= 24'hfd00ff; 0829: color <= 24'hfe00ff; 
			0830: color <= 24'hfe00fe; 0831: color <= 24'hfd00fd; 0832: color <= 24'hfc00fc; 0833: color <= 24'hfb00fb; 0834: color <= 24'hfb00fb; 
			0835: color <= 24'hfa00fa; 0836: color <= 24'hf900f9; 0837: color <= 24'hf800f8; 0838: color <= 24'hf800f8; 0839: color <= 24'hf700f7; 
			0840: color <= 24'hf600f6; 0841: color <= 24'hf500f5; 0842: color <= 24'hf500f5; 0843: color <= 24'hf400f4; 0844: color <= 24'hf300f3; 
			0845: color <= 24'hf200f2; 0846: color <= 24'hf100f1; 0847: color <= 24'hf100f1; 0848: color <= 24'hf000f0; 0849: color <= 24'hef00ef; 
			0850: color <= 24'hee00ee; 0851: color <= 24'hee00ee; 0852: color <= 24'hed00ed; 0853: color <= 24'hec00ec; 0854: color <= 24'heb00eb; 
			0855: color <= 24'heb00eb; 0856: color <= 24'hea00ea; 0857: color <= 24'he900e9; 0858: color <= 24'he800e8; 0859: color <= 24'he700e7; 
			0860: color <= 24'he700e7; 0861: color <= 24'he600e6; 0862: color <= 24'he500e5; 0863: color <= 24'he400e4; 0864: color <= 24'he400e4; 
			0865: color <= 24'he300e3; 0866: color <= 24'he200e2; 0867: color <= 24'he100e1; 0868: color <= 24'he100e1; 0869: color <= 24'he000e0; 
			0870: color <= 24'hdf00df; 0871: color <= 24'hde00de; 0872: color <= 24'hdd00dd; 0873: color <= 24'hdd00dd; 0874: color <= 24'hdc00dc; 
			0875: color <= 24'hdb00db; 0876: color <= 24'hda00da; 0877: color <= 24'hda00da; 0878: color <= 24'hd900d9; 0879: color <= 24'hd800d8; 
			0880: color <= 24'hd700d7; 0881: color <= 24'hd700d7; 0882: color <= 24'hd600d6; 0883: color <= 24'hd500d5; 0884: color <= 24'hd400d4; 
			0885: color <= 24'hd300d3; 0886: color <= 24'hd300d3; 0887: color <= 24'hd200d2; 0888: color <= 24'hd100d1; 0889: color <= 24'hd000d0; 
			0890: color <= 24'hd000d0; 0891: color <= 24'hcf00cf; 0892: color <= 24'hce00ce; 0893: color <= 24'hcd00cd; 0894: color <= 24'hcd00cd; 
			0895: color <= 24'hcc00cc; 0896: color <= 24'hcb00cb; 0897: color <= 24'hca00ca; 0898: color <= 24'hca00ca; 0899: color <= 24'hc900c9; 
			0900: color <= 24'hc800c8; 0901: color <= 24'hc700c7; 0902: color <= 24'hc600c6; 0903: color <= 24'hc600c6; 0904: color <= 24'hc500c5; 
			0905: color <= 24'hc400c4; 0906: color <= 24'hc300c3; 0907: color <= 24'hc300c3; 0908: color <= 24'hc200c2; 0909: color <= 24'hc100c1; 
			0910: color <= 24'hc000c0; 0911: color <= 24'hc000c0; 0912: color <= 24'hbf00bf; 0913: color <= 24'hbe00be; 0914: color <= 24'hbd00bd; 
			0915: color <= 24'hbc00bc; 0916: color <= 24'hbc00bc; 0917: color <= 24'hbb00bb; 0918: color <= 24'hba00ba; 0919: color <= 24'hb900b9; 
			0920: color <= 24'hb900b9; 0921: color <= 24'hb800b8; 0922: color <= 24'hb700b7; 0923: color <= 24'hb600b6; 0924: color <= 24'hb600b6; 
			0925: color <= 24'hb500b5; 0926: color <= 24'hb400b4; 0927: color <= 24'hb300b3; 0928: color <= 24'hb200b2; 0929: color <= 24'hb200b2; 
			0930: color <= 24'hb100b1; 0931: color <= 24'hb000b0; 0932: color <= 24'haf00af; 0933: color <= 24'haf00af; 0934: color <= 24'hae00ae; 
			0935: color <= 24'had00ad; 0936: color <= 24'hac00ac; 0937: color <= 24'hac00ac; 0938: color <= 24'hab00ab; 0939: color <= 24'haa00aa; 
			0940: color <= 24'ha900a9; 0941: color <= 24'ha800a8; 0942: color <= 24'ha800a8; 0943: color <= 24'ha700a7; 0944: color <= 24'ha600a6; 
			0945: color <= 24'ha500a5; 0946: color <= 24'ha500a5; 0947: color <= 24'ha400a4; 0948: color <= 24'ha300a3; 0949: color <= 24'ha200a2; 
			0950: color <= 24'ha200a2; 0951: color <= 24'ha100a1; 0952: color <= 24'ha000a0; 0953: color <= 24'h9f009f; 0954: color <= 24'h9e009e; 
			0955: color <= 24'h9e009e; 0956: color <= 24'h9d009d; 0957: color <= 24'h9c009c; 0958: color <= 24'h9b009b; 0959: color <= 24'h9b009b; 
			0960: color <= 24'h9a009a; 0961: color <= 24'h990099; 0962: color <= 24'h980098; 0963: color <= 24'h980098; 0964: color <= 24'h970097; 
			0965: color <= 24'h960096; 0966: color <= 24'h950095; 0967: color <= 24'h950095; 0968: color <= 24'h940094; 0969: color <= 24'h930093; 
			0970: color <= 24'h920092; 0971: color <= 24'h910091; 0972: color <= 24'h910091; 0973: color <= 24'h900090; 0974: color <= 24'h8f008f; 
			0975: color <= 24'h8e008e; 0976: color <= 24'h8e008e; 0977: color <= 24'h8d008d; 0978: color <= 24'h8c008c; 0979: color <= 24'h8b008b; 
			0980: color <= 24'h8b008b; 0981: color <= 24'h8a008a; 0982: color <= 24'h890089; 0983: color <= 24'h880088; 0984: color <= 24'h870087; 
			0985: color <= 24'h870087; 0986: color <= 24'h860086; 0987: color <= 24'h850085; 0988: color <= 24'h840084; 0989: color <= 24'h840084; 
			0990: color <= 24'h830083; 0991: color <= 24'h820082; 0992: color <= 24'h810081; 0993: color <= 24'h810081; 0994: color <= 24'h800080; 
			0995: color <= 24'h7f007f; 0996: color <= 24'h7f007f; 0997: color <= 24'h7f007f; 0998: color <= 24'h7f007f; 0999: color <= 24'h7f007f; 
			1000: color <= 24'h000000;
			endcase

endmodule
