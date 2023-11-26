
`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/08/11 15:28:37
// Module Name   : thermometer_encoder.v
// Project Name  : thermometer_encoder.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : calculate fine count time
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module thermometer_encoder
#
(
    parameter  INSTR_WIDTH = 16,
    parameter  DATA_WIDTH  = 32
)
(
    input  wire                        clk         ,  
	input  wire                        en          ,
    input  wire     [399          :0]  step_data   ,
    output reg      [DATA_WIDTH-1 :0]  fine_time   ,
	output wire                        valid       ,
    input  wire     [INSTR_WIDTH-1:0]  sel         
);




reg [DATA_WIDTH-1 :0]fine_time_r0 ={{DATA_WIDTH}{1'b0}};
reg [DATA_WIDTH-1 :0]fine_time_r1 ={{DATA_WIDTH}{1'b0}};
reg [DATA_WIDTH-1 :0]fine_time_r2 ={{DATA_WIDTH}{1'b0}};
reg [DATA_WIDTH-1 :0]fine_time_r3 ={{DATA_WIDTH}{1'b0}};
reg [DATA_WIDTH-1 :0]fine_time_r4 ={{DATA_WIDTH}{1'b0}};
reg [DATA_WIDTH-1 :0]fine_time_r8 ={{DATA_WIDTH}{1'b0}};
reg [DATA_WIDTH-1 :0]fine_time_r16={{DATA_WIDTH}{1'b0}};
reg [DATA_WIDTH-1 :0]fine_time_r32={{DATA_WIDTH}{1'b0}};
reg [DATA_WIDTH-1 :0]fine_time_r64={{DATA_WIDTH}{1'b0}};



always @(posedge clk)begin
	fine_time_r0<=step_data[4*0 ] + 
				  step_data[4*1 ] + 
				  step_data[4*2 ] + 
				  step_data[4*3 ] + 
				  step_data[4*4 ] + 
				  step_data[4*5 ] + 
				  step_data[4*6 ] + 
				  step_data[4*7 ] + 
				  step_data[4*8 ] + 
				  step_data[4*9 ] + 
				  step_data[4*10] + 
				  step_data[4*11] + 
				  step_data[4*12] + 
				  step_data[4*13] + 
				  step_data[4*14] + 
				  step_data[4*15] + 
				  step_data[4*16] + 
				  step_data[4*17] + 
				  step_data[4*18] + 
				  step_data[4*19] + 
				  step_data[4*20] + 
				  step_data[4*21] + 
				  step_data[4*22] + 
				  step_data[4*23] + 
				  step_data[4*24] + 
				  step_data[4*25] + 
				  step_data[4*26] + 
				  step_data[4*27] + 
				  step_data[4*28] + 
				  step_data[4*29] + 
				  step_data[4*30] + 
				  step_data[4*31] + 
				  step_data[4*32] + 
				  step_data[4*33] + 
				  step_data[4*34] + 
				  step_data[4*35] + 
				  step_data[4*36] + 
				  step_data[4*37] + 
				  step_data[4*38] + 
				  step_data[4*39] + 
				  step_data[4*40] + 
				  step_data[4*41] + 
				  step_data[4*42] + 
				  step_data[4*43] + 
				  step_data[4*44] + 
				  step_data[4*45] + 
				  step_data[4*46] + 
				  step_data[4*47] + 
				  step_data[4*48] + 
				  step_data[4*49] + 
				  step_data[4*50] + 
				  step_data[4*51] + 
				  step_data[4*52] + 
				  step_data[4*53] + 
				  step_data[4*54] + 
				  step_data[4*55] + 
				  step_data[4*56] + 
				  step_data[4*57] + 
				  step_data[4*58] + 
				  step_data[4*59] + 
				  step_data[4*60] +
				  step_data[4*61] + 
				  step_data[4*62] + 
				  step_data[4*63] + 
				  step_data[4*64] + 
				  step_data[4*65] + 
				  step_data[4*66] + 
				  step_data[4*67] + 
				  step_data[4*68] + 
				  step_data[4*69] + 
				  step_data[4*70] + 
				  step_data[4*71] + 
				  step_data[4*72] + 
				  step_data[4*73] + 
				  step_data[4*74] + 
				  step_data[4*75] + 
				  step_data[4*76] + 
				  step_data[4*77] + 
				  step_data[4*78] + 
				  step_data[4*79] + 
				  step_data[4*80] + 
				  step_data[4*81] + 
				  step_data[4*82] + 
				  step_data[4*83] + 
				  step_data[4*84] + 
				  step_data[4*85] + 
				  step_data[4*86] + 
				  step_data[4*87] + 
				  step_data[4*88] + 
				  step_data[4*89] + 
				  step_data[4*90] + 
				  step_data[4*91] ;

	fine_time_r1<=step_data[4*0 +1] + 
				  step_data[4*1 +1] + 
				  step_data[4*2 +1] + 
				  step_data[4*3 +1] + 
				  step_data[4*4 +1] + 
				  step_data[4*5 +1] + 
				  step_data[4*6 +1] + 
				  step_data[4*7 +1] + 
				  step_data[4*8 +1] + 
				  step_data[4*9 +1] + 
				  step_data[4*10+1] + 
				  step_data[4*11+1] + 
				  step_data[4*12+1] + 
				  step_data[4*13+1] + 
				  step_data[4*14+1] + 
				  step_data[4*15+1] + 
				  step_data[4*16+1] + 
				  step_data[4*17+1] + 
				  step_data[4*18+1] + 
				  step_data[4*19+1] + 
				  step_data[4*20+1] + 
				  step_data[4*21+1] + 
				  step_data[4*22+1] + 
				  step_data[4*23+1] + 
				  step_data[4*24+1] + 
				  step_data[4*25+1] + 
				  step_data[4*26+1] + 
				  step_data[4*27+1] + 
				  step_data[4*28+1] + 
				  step_data[4*29+1] + 
				  step_data[4*30+1] + 
				  step_data[4*31+1] + 
				  step_data[4*32+1] + 
				  step_data[4*33+1] + 
				  step_data[4*34+1] + 
				  step_data[4*35+1] + 
				  step_data[4*36+1] + 
				  step_data[4*37+1] + 
				  step_data[4*38+1] + 
				  step_data[4*39+1] + 
				  step_data[4*40+1] + 
				  step_data[4*41+1] + 
				  step_data[4*42+1] + 
				  step_data[4*43+1] + 
				  step_data[4*44+1] + 
				  step_data[4*45+1] + 
				  step_data[4*46+1] + 
				  step_data[4*47+1] + 
				  step_data[4*48+1] + 
				  step_data[4*49+1] + 
				  step_data[4*50+1] + 
				  step_data[4*51+1] + 
				  step_data[4*52+1] + 
				  step_data[4*53+1] + 
				  step_data[4*54+1] + 
				  step_data[4*55+1] + 
				  step_data[4*56+1] + 
				  step_data[4*57+1] + 
				  step_data[4*58+1] + 
				  step_data[4*59+1] + 
				  step_data[4*60+1] +
				  step_data[4*61+1] + 
				  step_data[4*62+1] + 
				  step_data[4*63+1] + 
				  step_data[4*64+1] + 
				  step_data[4*65+1] + 
				  step_data[4*66+1] + 
				  step_data[4*67+1] + 
				  step_data[4*68+1] + 
				  step_data[4*69+1] + 
				  step_data[4*70+1] + 
				  step_data[4*71+1] + 
				  step_data[4*72+1] + 
				  step_data[4*73+1] + 
				  step_data[4*74+1] + 
				  step_data[4*75+1] + 
				  step_data[4*76+1] + 
				  step_data[4*77+1] + 
				  step_data[4*78+1] + 
				  step_data[4*79+1] + 
				  step_data[4*80+1] + 
				  step_data[4*81+1] + 
				  step_data[4*82+1] + 
				  step_data[4*83+1] + 
				  step_data[4*84+1] + 
				  step_data[4*85+1] + 
				  step_data[4*86+1] + 
				  step_data[4*87+1] + 
				  step_data[4*88+1] + 
				  step_data[4*89+1] + 
				  step_data[4*90+1] + 
				  step_data[4*91+1] ;				  


	fine_time_r2<=step_data[4*0 +2] + 
				  step_data[4*1 +2] + 
				  step_data[4*2 +2] + 
				  step_data[4*3 +2] + 
				  step_data[4*4 +2] + 
				  step_data[4*5 +2] + 
				  step_data[4*6 +2] + 
				  step_data[4*7 +2] + 
				  step_data[4*8 +2] + 
				  step_data[4*9 +2] + 
				  step_data[4*10+2] + 
				  step_data[4*11+2] + 
				  step_data[4*12+2] + 
				  step_data[4*13+2] + 
				  step_data[4*14+2] + 
				  step_data[4*15+2] + 
				  step_data[4*16+2] + 
				  step_data[4*17+2] + 
				  step_data[4*18+2] + 
				  step_data[4*19+2] + 
				  step_data[4*20+2] + 
				  step_data[4*21+2] + 
				  step_data[4*22+2] + 
				  step_data[4*23+2] + 
				  step_data[4*24+2] + 
				  step_data[4*25+2] + 
				  step_data[4*26+2] + 
				  step_data[4*27+2] + 
				  step_data[4*28+2] + 
				  step_data[4*29+2] + 
				  step_data[4*30+2] + 
				  step_data[4*31+2] + 
				  step_data[4*32+2] + 
				  step_data[4*33+2] + 
				  step_data[4*34+2] + 
				  step_data[4*35+2] + 
				  step_data[4*36+2] + 
				  step_data[4*37+2] + 
				  step_data[4*38+2] + 
				  step_data[4*39+2] + 
				  step_data[4*40+2] + 
				  step_data[4*41+2] + 
				  step_data[4*42+2] + 
				  step_data[4*43+2] + 
				  step_data[4*44+2] + 
				  step_data[4*45+2] + 
				  step_data[4*46+2] + 
				  step_data[4*47+2] + 
				  step_data[4*48+2] + 
				  step_data[4*49+2] + 
				  step_data[4*50+2] + 
				  step_data[4*51+2] + 
				  step_data[4*52+2] + 
				  step_data[4*53+2] + 
				  step_data[4*54+2] + 
				  step_data[4*55+2] + 
				  step_data[4*56+2] + 
				  step_data[4*57+2] + 
				  step_data[4*58+2] + 
				  step_data[4*59+2] + 
				  step_data[4*60+2] +
				  step_data[4*61+2] + 
				  step_data[4*62+2] + 
				  step_data[4*63+2] + 
				  step_data[4*64+2] + 
				  step_data[4*65+2] + 
				  step_data[4*66+2] + 
				  step_data[4*67+2] + 
				  step_data[4*68+2] + 
				  step_data[4*69+2] + 
				  step_data[4*70+2] + 
				  step_data[4*71+2] + 
				  step_data[4*72+2] + 
				  step_data[4*73+2] + 
				  step_data[4*74+2] + 
				  step_data[4*75+2] + 
				  step_data[4*76+2] + 
				  step_data[4*77+2] + 
				  step_data[4*78+2] + 
				  step_data[4*79+2] + 
				  step_data[4*80+2] + 
				  step_data[4*81+2] + 
				  step_data[4*82+2] + 
				  step_data[4*83+2] + 
				  step_data[4*84+2] + 
				  step_data[4*85+2] + 
				  step_data[4*86+2] + 
				  step_data[4*87+2] + 
				  step_data[4*88+2] + 
				  step_data[4*89+2] + 
				  step_data[4*90+2] + 
				  step_data[4*91+2] ;	

	fine_time_r3<=step_data[4*0 +3] + 
				  step_data[4*1 +3] + 
				  step_data[4*2 +3] + 
				  step_data[4*3 +3] + 
				  step_data[4*4 +3] + 
				  step_data[4*5 +3] + 
				  step_data[4*6 +3] + 
				  step_data[4*7 +3] + 
				  step_data[4*8 +3] + 
				  step_data[4*9 +3] + 
				  step_data[4*10+3] + 
				  step_data[4*11+3] + 
				  step_data[4*12+3] + 
				  step_data[4*13+3] + 
				  step_data[4*14+3] + 
				  step_data[4*15+3] + 
				  step_data[4*16+3] + 
				  step_data[4*17+3] + 
				  step_data[4*18+3] + 
				  step_data[4*19+3] + 
				  step_data[4*20+3] + 
				  step_data[4*21+3] + 
				  step_data[4*22+3] + 
				  step_data[4*23+3] + 
				  step_data[4*24+3] + 
				  step_data[4*25+3] + 
				  step_data[4*26+3] + 
				  step_data[4*27+3] + 
				  step_data[4*28+3] + 
				  step_data[4*29+3] + 
				  step_data[4*30+3] + 
				  step_data[4*31+3] + 
				  step_data[4*32+3] + 
				  step_data[4*33+3] + 
				  step_data[4*34+3] + 
				  step_data[4*35+3] + 
				  step_data[4*36+3] + 
				  step_data[4*37+3] + 
				  step_data[4*38+3] + 
				  step_data[4*39+3] + 
				  step_data[4*40+3] + 
				  step_data[4*41+3] + 
				  step_data[4*42+3] + 
				  step_data[4*43+3] + 
				  step_data[4*44+3] + 
				  step_data[4*45+3] + 
				  step_data[4*46+3] + 
				  step_data[4*47+3] + 
				  step_data[4*48+3] + 
				  step_data[4*49+3] + 
				  step_data[4*50+3] + 
				  step_data[4*51+3] + 
				  step_data[4*52+3] + 
				  step_data[4*53+3] + 
				  step_data[4*54+3] + 
				  step_data[4*55+3] + 
				  step_data[4*56+3] + 
				  step_data[4*57+3] + 
				  step_data[4*58+3] + 
				  step_data[4*59+3] + 
				  step_data[4*60+3] +
				  step_data[4*61+3] + 
				  step_data[4*62+3] + 
				  step_data[4*63+3] + 
				  step_data[4*64+3] + 
				  step_data[4*65+3] + 
				  step_data[4*66+3] + 
				  step_data[4*67+3] + 
				  step_data[4*68+3] + 
				  step_data[4*69+3] + 
				  step_data[4*70+3] + 
				  step_data[4*71+3] + 
				  step_data[4*72+3] + 
				  step_data[4*73+3] + 
				  step_data[4*74+3] + 
				  step_data[4*75+3] + 
				  step_data[4*76+3] + 
				  step_data[4*77+3] + 
				  step_data[4*78+3] + 
				  step_data[4*79+3] + 
				  step_data[4*80+3] + 
				  step_data[4*81+3] + 
				  step_data[4*82+3] + 
				  step_data[4*83+3] + 
				  step_data[4*84+3] + 
				  step_data[4*85+3] + 
				  step_data[4*86+3] + 
				  step_data[4*87+3] + 
				  step_data[4*88+3] + 
				  step_data[4*89+3] + 
				  step_data[4*90+3] + 
				  step_data[4*91+3] ;	
				  
				  
				  
	fine_time_r4<=step_data[4*1 -1] + 
				  step_data[4*2 -1] + 
				  step_data[4*3 -1] + 
				  step_data[4*4 -1] + 
				  step_data[4*5 -1] + 
				  step_data[4*6 -1] + 
				  step_data[4*7 -1] + 
				  step_data[4*8 -1] + 
				  step_data[4*9 -1] + 
				  step_data[4*10-1] + 
				  step_data[4*11-1] + 
				  step_data[4*12-1] + 
				  step_data[4*13-1] + 
				  step_data[4*14-1] + 
				  step_data[4*15-1] + 
				  step_data[4*16-1] + 
				  step_data[4*17-1] + 
				  step_data[4*18-1] + 
				  step_data[4*19-1] + 
				  step_data[4*20-1] + 
				  step_data[4*21-1] + 
				  step_data[4*22-1] + 
				  step_data[4*23-1] + 
				  step_data[4*24-1] + 
				  step_data[4*25-1] + 
				  step_data[4*26-1] + 
				  step_data[4*27-1] + 
				  step_data[4*28-1] + 
				  step_data[4*29-1] + 
				  step_data[4*30-1] + 
				  step_data[4*31-1] + 
				  step_data[4*32-1] + 
				  step_data[4*33-1] + 
				  step_data[4*34-1] + 
				  step_data[4*35-1] + 
				  step_data[4*36-1] + 
				  step_data[4*37-1] + 
				  step_data[4*38-1] + 
				  step_data[4*39-1] + 
				  step_data[4*40-1] + 
				  step_data[4*41-1] + 
				  step_data[4*42-1] + 
				  step_data[4*43-1] + 
				  step_data[4*44-1] + 
				  step_data[4*45-1] + 
				  step_data[4*46-1] + 
				  step_data[4*47-1] + 
				  step_data[4*48-1] + 
				  step_data[4*49-1] + 
				  step_data[4*50-1] + 
				  step_data[4*51-1] + 
				  step_data[4*52-1] + 
				  step_data[4*53-1] + 
				  step_data[4*54-1] + 
				  step_data[4*55-1] + 
				  step_data[4*56-1] + 
				  step_data[4*57-1] + 
				  step_data[4*58-1] + 
				  step_data[4*59-1] + 
				  step_data[4*60-1] + 
				  step_data[4*61-1] +
				  step_data[4*62-1] + 
				  step_data[4*63-1] + 
				  step_data[4*64-1] + 
				  step_data[4*65-1] + 
				  step_data[4*66-1] + 
				  step_data[4*67-1] + 
				  step_data[4*68-1] + 
				  step_data[4*69-1] + 
				  step_data[4*70-1] + 
				  step_data[4*71-1] + 
				  step_data[4*72-1] + 
				  step_data[4*73-1] + 
				  step_data[4*74-1] + 
				  step_data[4*75-1] + 
				  step_data[4*76-1] + 
				  step_data[4*77-1] + 
				  step_data[4*78-1] + 
				  step_data[4*79-1] + 
				  step_data[4*80-1] + 
				  step_data[4*81-1] + 
				  step_data[4*82-1] + 
				  step_data[4*83-1] + 
				  step_data[4*84-1] + 
				  step_data[4*85-1] + 
				  step_data[4*86-1] + 
				  step_data[4*87-1] + 
				  step_data[4*88-1] + 
				  step_data[4*89-1] + 
				  step_data[4*90-1] + 
				  step_data[4*91-1] + 
				  step_data[4*92-1] ;	
				  
	fine_time_r8<=step_data[8*1 -1] + 
				  step_data[8*2 -1] + 
				  step_data[8*3 -1] + 
				  step_data[8*4 -1] + 
				  step_data[8*5 -1] + 
				  step_data[8*6 -1] + 
				  step_data[8*7 -1] + 
				  step_data[8*8 -1] + 
				  step_data[8*9 -1] + 
				  step_data[8*10-1] + 
				  step_data[8*11-1] + 
				  step_data[8*12-1] + 
				  step_data[8*13-1] + 
				  step_data[8*14-1] + 
				  step_data[8*15-1] + 
				  step_data[8*16-1] + 
				  step_data[8*17-1] + 
				  step_data[8*18-1] + 
				  step_data[8*19-1] + 
				  step_data[8*20-1] + 
				  step_data[8*21-1] + 
				  step_data[8*22-1] + 
				  step_data[8*23-1] + 
				  step_data[8*24-1] + 
				  step_data[8*25-1] + 
				  step_data[8*26-1] + 
				  step_data[8*27-1] + 
				  step_data[8*28-1] + 
				  step_data[8*29-1] + 
				  step_data[8*30-1] + 
				  step_data[8*31-1] + 
				  step_data[8*32-1] + 
				  step_data[8*33-1] + 
				  step_data[8*34-1] + 
				  step_data[8*35-1] + 
				  step_data[8*36-1] + 
				  step_data[8*37-1] + 
				  step_data[8*38-1] + 
				  step_data[8*39-1] + 
				  step_data[8*40-1] + 
				  step_data[8*41-1] + 
				  step_data[8*42-1] + 
				  step_data[8*43-1] + 
				  step_data[8*44-1] + 
				  step_data[8*45-1] + 
				  step_data[8*46-1] ;	
				  
	fine_time_r16<=step_data[16*1 -1] + 
				   step_data[16*2 -1] + 
				   step_data[16*3 -1] + 
				   step_data[16*4 -1] + 
				   step_data[16*5 -1] + 
				   step_data[16*6 -1] + 
				   step_data[16*7 -1] + 
				   step_data[16*8 -1] + 
				   step_data[16*9 -1] + 
				   step_data[16*10-1] + 
				   step_data[16*11-1] + 
				   step_data[16*12-1] + 
				   step_data[16*13-1] + 
				   step_data[16*14-1] + 
				   step_data[16*15-1] + 
				   step_data[16*16-1] + 
				   step_data[16*17-1] + 
				   step_data[16*18-1] + 
				   step_data[16*19-1] + 
				   step_data[16*20-1] + 
				   step_data[16*21-1] + 
				   step_data[16*22-1] + 
				   step_data[16*23-1] ;



	fine_time_r32<=step_data[32*1 -1] + 
				   step_data[32*2 -1] + 
				   step_data[32*3 -1] + 
				   step_data[32*4 -1] + 
				   step_data[32*5 -1] + 
				   step_data[32*6 -1] + 
				   step_data[32*7 -1] + 
				   step_data[32*8 -1] + 
				   step_data[32*9 -1] + 
				   step_data[32*10-1] + 
				   step_data[32*11-1] + 
				   step_data[32*12-1] ;		


	fine_time_r64<=step_data[64*1 -1] + 
				   step_data[64*2 -1] + 
				   step_data[64*3 -1] + 
				   step_data[64*4 -1] + 
				   step_data[64*5 -1] + 
				   step_data[64*6 -1] ;		
				  
				  
end

always @(posedge clk)begin

case(sel)
0:fine_time<=fine_time_r0+fine_time_r1+fine_time_r2+fine_time_r3;
1:fine_time<=fine_time_r4*4;
2:fine_time<=fine_time_r8*8;
3:fine_time<=fine_time_r16*16;
4:fine_time<=fine_time_r32*32;
5:fine_time<=fine_time_r64*64;

endcase


end

reg [2:0]en_r=3'b0;
always @(posedge clk)begin
	en_r[2:0]<={en_r[1:0],en};
end

assign valid = (en_r[2:1]==2'b01);

endmodule
