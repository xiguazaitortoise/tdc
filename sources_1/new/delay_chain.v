`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/07/06 19:27:48
// Module Name   : delay_chain.v
// Project Name  : delay_chain.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : 
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////
`include "global.v"
module delay_chain
#
(
    parameter PRECISION_DLY = 14
)
(
    input   wire                        stretch_hit     ,
    `ifdef TDC_SIM
    output  reg   [399:0]                delay_tap      
    `elsif TDC_SYN
    output  wire  [399:0]                delay_tap 
    `endif 
);


`ifdef TDC_SIM


always  #(PRECISION_DLY) delay_tap[0]=  stretch_hit;
always  delay_tap[1]  = #(PRECISION_DLY) delay_tap[0  ];
always  delay_tap[2  ]= #(PRECISION_DLY) delay_tap[1  ];
always  delay_tap[3  ]= #(PRECISION_DLY) delay_tap[2  ];
always  delay_tap[4  ]= #(PRECISION_DLY) delay_tap[3  ];
always  delay_tap[5  ]= #(PRECISION_DLY) delay_tap[4  ];
always  delay_tap[6  ]= #(PRECISION_DLY) delay_tap[5  ];
always  delay_tap[7  ]= #(PRECISION_DLY) delay_tap[6  ];
always  delay_tap[8  ]= #(PRECISION_DLY) delay_tap[7  ];
always  delay_tap[9  ]= #(PRECISION_DLY) delay_tap[8  ];
always  delay_tap[10 ]= #(PRECISION_DLY) delay_tap[9  ];
always  delay_tap[11 ]= #(PRECISION_DLY) delay_tap[10 ];
always  delay_tap[12 ]= #(PRECISION_DLY) delay_tap[11 ];
always  delay_tap[13 ]= #(PRECISION_DLY) delay_tap[12 ];
always  delay_tap[14 ]= #(PRECISION_DLY) delay_tap[13 ];
always  delay_tap[15 ]= #(PRECISION_DLY) delay_tap[14 ];
always  delay_tap[16 ]= #(PRECISION_DLY) delay_tap[15 ];
always  delay_tap[17 ]= #(PRECISION_DLY) delay_tap[16 ];
always  delay_tap[18 ]= #(PRECISION_DLY) delay_tap[17 ];
always  delay_tap[19 ]= #(PRECISION_DLY) delay_tap[18 ];
always  delay_tap[20 ]= #(PRECISION_DLY) delay_tap[19 ];
always  delay_tap[21 ]= #(PRECISION_DLY) delay_tap[20 ];
always  delay_tap[22 ]= #(PRECISION_DLY) delay_tap[21 ];
always  delay_tap[23 ]= #(PRECISION_DLY) delay_tap[22 ];
always  delay_tap[24 ]= #(PRECISION_DLY) delay_tap[23 ];
always  delay_tap[25 ]= #(PRECISION_DLY) delay_tap[24 ];
always  delay_tap[26 ]= #(PRECISION_DLY) delay_tap[25 ];
always  delay_tap[27 ]= #(PRECISION_DLY) delay_tap[26 ];
always  delay_tap[28 ]= #(PRECISION_DLY) delay_tap[27 ];
always  delay_tap[29 ]= #(PRECISION_DLY) delay_tap[28 ];
always  delay_tap[30 ]= #(PRECISION_DLY) delay_tap[29 ];
always  delay_tap[31 ]= #(PRECISION_DLY) delay_tap[30 ];
always  delay_tap[32 ]= #(PRECISION_DLY) delay_tap[31 ];
always  delay_tap[33 ]= #(PRECISION_DLY) delay_tap[32 ];
always  delay_tap[34 ]= #(PRECISION_DLY) delay_tap[33 ];
always  delay_tap[35 ]= #(PRECISION_DLY) delay_tap[34 ];
always  delay_tap[36 ]= #(PRECISION_DLY) delay_tap[35 ];
always  delay_tap[37 ]= #(PRECISION_DLY) delay_tap[36 ];
always  delay_tap[38 ]= #(PRECISION_DLY) delay_tap[37 ];
always  delay_tap[39 ]= #(PRECISION_DLY) delay_tap[38 ];
always  delay_tap[40 ]= #(PRECISION_DLY) delay_tap[39 ];
always  delay_tap[41 ]= #(PRECISION_DLY) delay_tap[40 ];
always  delay_tap[42 ]= #(PRECISION_DLY) delay_tap[41 ];
always  delay_tap[43 ]= #(PRECISION_DLY) delay_tap[42 ];
always  delay_tap[44 ]= #(PRECISION_DLY) delay_tap[43 ];
always  delay_tap[45 ]= #(PRECISION_DLY) delay_tap[44 ];
always  delay_tap[46 ]= #(PRECISION_DLY) delay_tap[45 ];
always  delay_tap[47 ]= #(PRECISION_DLY) delay_tap[46 ];
always  delay_tap[48 ]= #(PRECISION_DLY) delay_tap[47 ];
always  delay_tap[49 ]= #(PRECISION_DLY) delay_tap[48 ];
always  delay_tap[50 ]= #(PRECISION_DLY) delay_tap[49 ];
always  delay_tap[51 ]= #(PRECISION_DLY) delay_tap[50 ];
always  delay_tap[52 ]= #(PRECISION_DLY) delay_tap[51 ];
always  delay_tap[53 ]= #(PRECISION_DLY) delay_tap[52 ];
always  delay_tap[54 ]= #(PRECISION_DLY) delay_tap[53 ];
always  delay_tap[55 ]= #(PRECISION_DLY) delay_tap[54 ];
always  delay_tap[56 ]= #(PRECISION_DLY) delay_tap[55 ];
always  delay_tap[57 ]= #(PRECISION_DLY) delay_tap[56 ];
always  delay_tap[58 ]= #(PRECISION_DLY) delay_tap[57 ];
always  delay_tap[59 ]= #(PRECISION_DLY) delay_tap[58 ];
always  delay_tap[60 ]= #(PRECISION_DLY) delay_tap[59 ];
always  delay_tap[61 ]= #(PRECISION_DLY) delay_tap[60 ];
always  delay_tap[62 ]= #(PRECISION_DLY) delay_tap[61 ];
always  delay_tap[63 ]= #(PRECISION_DLY) delay_tap[62 ];
always  delay_tap[64 ]= #(PRECISION_DLY) delay_tap[63 ];
always  delay_tap[65 ]= #(PRECISION_DLY) delay_tap[64 ];
always  delay_tap[66 ]= #(PRECISION_DLY) delay_tap[65 ];
always  delay_tap[67 ]= #(PRECISION_DLY) delay_tap[66 ];
always  delay_tap[68 ]= #(PRECISION_DLY) delay_tap[67 ];
always  delay_tap[69 ]= #(PRECISION_DLY) delay_tap[68 ];
always  delay_tap[70 ]= #(PRECISION_DLY) delay_tap[69 ];
always  delay_tap[71 ]= #(PRECISION_DLY) delay_tap[70 ];
always  delay_tap[72 ]= #(PRECISION_DLY) delay_tap[71 ];
always  delay_tap[73 ]= #(PRECISION_DLY) delay_tap[72 ];
always  delay_tap[74 ]= #(PRECISION_DLY) delay_tap[73 ];
always  delay_tap[75 ]= #(PRECISION_DLY) delay_tap[74 ];
always  delay_tap[76 ]= #(PRECISION_DLY) delay_tap[75 ];
always  delay_tap[77 ]= #(PRECISION_DLY) delay_tap[76 ];
always  delay_tap[78 ]= #(PRECISION_DLY) delay_tap[77 ];
always  delay_tap[79 ]= #(PRECISION_DLY) delay_tap[78 ];
always  delay_tap[80 ]= #(PRECISION_DLY) delay_tap[79 ];
always  delay_tap[81 ]= #(PRECISION_DLY) delay_tap[80 ];
always  delay_tap[82 ]= #(PRECISION_DLY) delay_tap[81 ];
always  delay_tap[83 ]= #(PRECISION_DLY) delay_tap[82 ];
always  delay_tap[84 ]= #(PRECISION_DLY) delay_tap[83 ];
always  delay_tap[85 ]= #(PRECISION_DLY) delay_tap[84 ];
always  delay_tap[86 ]= #(PRECISION_DLY) delay_tap[85 ];
always  delay_tap[87 ]= #(PRECISION_DLY) delay_tap[86 ];
always  delay_tap[88 ]= #(PRECISION_DLY) delay_tap[87 ];
always  delay_tap[89 ]= #(PRECISION_DLY) delay_tap[88 ];
always  delay_tap[90 ]= #(PRECISION_DLY) delay_tap[89 ];
always  delay_tap[91 ]= #(PRECISION_DLY) delay_tap[90 ];
always  delay_tap[92 ]= #(PRECISION_DLY) delay_tap[91 ];
always  delay_tap[93 ]= #(PRECISION_DLY) delay_tap[92 ];
always  delay_tap[94 ]= #(PRECISION_DLY) delay_tap[93 ];
always  delay_tap[95 ]= #(PRECISION_DLY) delay_tap[94 ];
always  delay_tap[96 ]= #(PRECISION_DLY) delay_tap[95 ];
always  delay_tap[97 ]= #(PRECISION_DLY) delay_tap[96 ];
always  delay_tap[98 ]= #(PRECISION_DLY) delay_tap[97 ];
always  delay_tap[99 ]= #(PRECISION_DLY) delay_tap[98 ];
always  delay_tap[100]= #(PRECISION_DLY) delay_tap[99 ];
always  delay_tap[101]= #(PRECISION_DLY) delay_tap[100];
always  delay_tap[102]= #(PRECISION_DLY) delay_tap[101];
always  delay_tap[103]= #(PRECISION_DLY) delay_tap[102];
always  delay_tap[104]= #(PRECISION_DLY) delay_tap[103];
always  delay_tap[105]= #(PRECISION_DLY) delay_tap[104];
always  delay_tap[106]= #(PRECISION_DLY) delay_tap[105];
always  delay_tap[107]= #(PRECISION_DLY) delay_tap[106];
always  delay_tap[108]= #(PRECISION_DLY) delay_tap[107];
always  delay_tap[109]= #(PRECISION_DLY) delay_tap[108];
always  delay_tap[110]= #(PRECISION_DLY) delay_tap[109];
always  delay_tap[111]= #(PRECISION_DLY) delay_tap[110];
always  delay_tap[112]= #(PRECISION_DLY) delay_tap[111];
always  delay_tap[113]= #(PRECISION_DLY) delay_tap[112];
always  delay_tap[114]= #(PRECISION_DLY) delay_tap[113];
always  delay_tap[115]= #(PRECISION_DLY) delay_tap[114];
always  delay_tap[116]= #(PRECISION_DLY) delay_tap[115];
always  delay_tap[117]= #(PRECISION_DLY) delay_tap[116];
always  delay_tap[118]= #(PRECISION_DLY) delay_tap[117];
always  delay_tap[119]= #(PRECISION_DLY) delay_tap[118];
always  delay_tap[120]= #(PRECISION_DLY) delay_tap[119];
always  delay_tap[121]= #(PRECISION_DLY) delay_tap[120];
always  delay_tap[122]= #(PRECISION_DLY) delay_tap[121];
always  delay_tap[123]= #(PRECISION_DLY) delay_tap[122];
always  delay_tap[124]= #(PRECISION_DLY) delay_tap[123];
always  delay_tap[125]= #(PRECISION_DLY) delay_tap[124];
always  delay_tap[126]= #(PRECISION_DLY) delay_tap[125];
always  delay_tap[127]= #(PRECISION_DLY) delay_tap[126];
always  delay_tap[128]= #(PRECISION_DLY) delay_tap[127];
always  delay_tap[129]= #(PRECISION_DLY) delay_tap[128];
always  delay_tap[130]= #(PRECISION_DLY) delay_tap[129];
always  delay_tap[131]= #(PRECISION_DLY) delay_tap[130];
always  delay_tap[132]= #(PRECISION_DLY) delay_tap[131];
always  delay_tap[133]= #(PRECISION_DLY) delay_tap[132];
always  delay_tap[134]= #(PRECISION_DLY) delay_tap[133];
always  delay_tap[135]= #(PRECISION_DLY) delay_tap[134];
always  delay_tap[136]= #(PRECISION_DLY) delay_tap[135];
always  delay_tap[137]= #(PRECISION_DLY) delay_tap[136];
always  delay_tap[138]= #(PRECISION_DLY) delay_tap[137];
always  delay_tap[139]= #(PRECISION_DLY) delay_tap[138];
always  delay_tap[140]= #(PRECISION_DLY) delay_tap[139];
always  delay_tap[141]= #(PRECISION_DLY) delay_tap[140];
always  delay_tap[142]= #(PRECISION_DLY) delay_tap[141];
always  delay_tap[143]= #(PRECISION_DLY) delay_tap[142];
always  delay_tap[144]= #(PRECISION_DLY) delay_tap[143];
always  delay_tap[145]= #(PRECISION_DLY) delay_tap[144];
always  delay_tap[146]= #(PRECISION_DLY) delay_tap[145];
always  delay_tap[147]= #(PRECISION_DLY) delay_tap[146];
always  delay_tap[148]= #(PRECISION_DLY) delay_tap[147];
always  delay_tap[149]= #(PRECISION_DLY) delay_tap[148];
always  delay_tap[150]= #(PRECISION_DLY) delay_tap[149];
always  delay_tap[151]= #(PRECISION_DLY) delay_tap[150];
always  delay_tap[152]= #(PRECISION_DLY) delay_tap[151];
always  delay_tap[153]= #(PRECISION_DLY) delay_tap[152];
always  delay_tap[154]= #(PRECISION_DLY) delay_tap[153];
always  delay_tap[155]= #(PRECISION_DLY) delay_tap[154];
always  delay_tap[156]= #(PRECISION_DLY) delay_tap[155];
always  delay_tap[157]= #(PRECISION_DLY) delay_tap[156];
always  delay_tap[158]= #(PRECISION_DLY) delay_tap[157];
always  delay_tap[159]= #(PRECISION_DLY) delay_tap[158];
always  delay_tap[160]= #(PRECISION_DLY) delay_tap[159];
always  delay_tap[161]= #(PRECISION_DLY) delay_tap[160];
always  delay_tap[162]= #(PRECISION_DLY) delay_tap[161];
always  delay_tap[163]= #(PRECISION_DLY) delay_tap[162];
always  delay_tap[164]= #(PRECISION_DLY) delay_tap[163];
always  delay_tap[165]= #(PRECISION_DLY) delay_tap[164];
always  delay_tap[166]= #(PRECISION_DLY) delay_tap[165];
always  delay_tap[167]= #(PRECISION_DLY) delay_tap[166];
always  delay_tap[168]= #(PRECISION_DLY) delay_tap[167];
always  delay_tap[169]= #(PRECISION_DLY) delay_tap[168];
always  delay_tap[170]= #(PRECISION_DLY) delay_tap[169];
always  delay_tap[171]= #(PRECISION_DLY) delay_tap[170];
always  delay_tap[172]= #(PRECISION_DLY) delay_tap[171];
always  delay_tap[173]= #(PRECISION_DLY) delay_tap[172];
always  delay_tap[174]= #(PRECISION_DLY) delay_tap[173];
always  delay_tap[175]= #(PRECISION_DLY) delay_tap[174];
always  delay_tap[176]= #(PRECISION_DLY) delay_tap[175];
always  delay_tap[177]= #(PRECISION_DLY) delay_tap[176];
always  delay_tap[178]= #(PRECISION_DLY) delay_tap[177];
always  delay_tap[179]= #(PRECISION_DLY) delay_tap[178];
always  delay_tap[180]= #(PRECISION_DLY) delay_tap[179];
always  delay_tap[181]= #(PRECISION_DLY) delay_tap[180];
always  delay_tap[182]= #(PRECISION_DLY) delay_tap[181];
always  delay_tap[183]= #(PRECISION_DLY) delay_tap[182];
always  delay_tap[184]= #(PRECISION_DLY) delay_tap[183];
always  delay_tap[185]= #(PRECISION_DLY) delay_tap[184];
always  delay_tap[186]= #(PRECISION_DLY) delay_tap[185];
always  delay_tap[187]= #(PRECISION_DLY) delay_tap[186];
always  delay_tap[188]= #(PRECISION_DLY) delay_tap[187];
always  delay_tap[189]= #(PRECISION_DLY) delay_tap[188];
always  delay_tap[190]= #(PRECISION_DLY) delay_tap[189];
always  delay_tap[191]= #(PRECISION_DLY) delay_tap[190];
always  delay_tap[192]= #(PRECISION_DLY) delay_tap[191];
always  delay_tap[193]= #(PRECISION_DLY) delay_tap[192];
always  delay_tap[194]= #(PRECISION_DLY) delay_tap[193];
always  delay_tap[195]= #(PRECISION_DLY) delay_tap[194];
always  delay_tap[196]= #(PRECISION_DLY) delay_tap[195];
always  delay_tap[197]= #(PRECISION_DLY) delay_tap[196];
always  delay_tap[198]= #(PRECISION_DLY) delay_tap[197];
always  delay_tap[199]= #(PRECISION_DLY) delay_tap[198];
always  delay_tap[200]= #(PRECISION_DLY) delay_tap[199];
always  delay_tap[201]= #(PRECISION_DLY) delay_tap[200];
always  delay_tap[202]= #(PRECISION_DLY) delay_tap[201];
always  delay_tap[203]= #(PRECISION_DLY) delay_tap[202];
always  delay_tap[204]= #(PRECISION_DLY) delay_tap[203];
always  delay_tap[205]= #(PRECISION_DLY) delay_tap[204];
always  delay_tap[206]= #(PRECISION_DLY) delay_tap[205];
always  delay_tap[207]= #(PRECISION_DLY) delay_tap[206];
always  delay_tap[208]= #(PRECISION_DLY) delay_tap[207];
always  delay_tap[209]= #(PRECISION_DLY) delay_tap[208];
always  delay_tap[210]= #(PRECISION_DLY) delay_tap[209];
always  delay_tap[211]= #(PRECISION_DLY) delay_tap[210];
always  delay_tap[212]= #(PRECISION_DLY) delay_tap[211];
always  delay_tap[213]= #(PRECISION_DLY) delay_tap[212];
always  delay_tap[214]= #(PRECISION_DLY) delay_tap[213];
always  delay_tap[215]= #(PRECISION_DLY) delay_tap[214];
always  delay_tap[216]= #(PRECISION_DLY) delay_tap[215];
always  delay_tap[217]= #(PRECISION_DLY) delay_tap[216];
always  delay_tap[218]= #(PRECISION_DLY) delay_tap[217];
always  delay_tap[219]= #(PRECISION_DLY) delay_tap[218];
always  delay_tap[220]= #(PRECISION_DLY) delay_tap[219];
always  delay_tap[221]= #(PRECISION_DLY) delay_tap[220];
always  delay_tap[222]= #(PRECISION_DLY) delay_tap[221];
always  delay_tap[223]= #(PRECISION_DLY) delay_tap[222];
always  delay_tap[224]= #(PRECISION_DLY) delay_tap[223];
always  delay_tap[225]= #(PRECISION_DLY) delay_tap[224];
always  delay_tap[226]= #(PRECISION_DLY) delay_tap[225];
always  delay_tap[227]= #(PRECISION_DLY) delay_tap[226];
always  delay_tap[228]= #(PRECISION_DLY) delay_tap[227];
always  delay_tap[229]= #(PRECISION_DLY) delay_tap[228];
always  delay_tap[230]= #(PRECISION_DLY) delay_tap[229];
always  delay_tap[231]= #(PRECISION_DLY) delay_tap[230];
always  delay_tap[232]= #(PRECISION_DLY) delay_tap[231];
always  delay_tap[233]= #(PRECISION_DLY) delay_tap[232];
always  delay_tap[234]= #(PRECISION_DLY) delay_tap[233];
always  delay_tap[235]= #(PRECISION_DLY) delay_tap[234];
always  delay_tap[236]= #(PRECISION_DLY) delay_tap[235];
always  delay_tap[237]= #(PRECISION_DLY) delay_tap[236];
always  delay_tap[238]= #(PRECISION_DLY) delay_tap[237];
always  delay_tap[239]= #(PRECISION_DLY) delay_tap[238];
always  delay_tap[240]= #(PRECISION_DLY) delay_tap[239];
always  delay_tap[241]= #(PRECISION_DLY) delay_tap[240];
always  delay_tap[242]= #(PRECISION_DLY) delay_tap[241];
always  delay_tap[243]= #(PRECISION_DLY) delay_tap[242];
always  delay_tap[244]= #(PRECISION_DLY) delay_tap[243];
always  delay_tap[245]= #(PRECISION_DLY) delay_tap[244];
always  delay_tap[246]= #(PRECISION_DLY) delay_tap[245];
always  delay_tap[247]= #(PRECISION_DLY) delay_tap[246];
always  delay_tap[248]= #(PRECISION_DLY) delay_tap[247];
always  delay_tap[249]= #(PRECISION_DLY) delay_tap[248];
always  delay_tap[250]= #(PRECISION_DLY) delay_tap[249];
always  delay_tap[251]= #(PRECISION_DLY) delay_tap[250];
always  delay_tap[252]= #(PRECISION_DLY) delay_tap[251];
always  delay_tap[253]= #(PRECISION_DLY) delay_tap[252];
always  delay_tap[254]= #(PRECISION_DLY) delay_tap[253];
always  delay_tap[255]= #(PRECISION_DLY) delay_tap[254];
always  delay_tap[256]= #(PRECISION_DLY) delay_tap[255];
always  delay_tap[257]= #(PRECISION_DLY) delay_tap[256];
always  delay_tap[258]= #(PRECISION_DLY) delay_tap[257];
always  delay_tap[259]= #(PRECISION_DLY) delay_tap[258];
always  delay_tap[260]= #(PRECISION_DLY) delay_tap[259];
always  delay_tap[261]= #(PRECISION_DLY) delay_tap[260];
always  delay_tap[262]= #(PRECISION_DLY) delay_tap[261];
always  delay_tap[263]= #(PRECISION_DLY) delay_tap[262];
always  delay_tap[264]= #(PRECISION_DLY) delay_tap[263];
always  delay_tap[265]= #(PRECISION_DLY) delay_tap[264];
always  delay_tap[266]= #(PRECISION_DLY) delay_tap[265];
always  delay_tap[267]= #(PRECISION_DLY) delay_tap[266];
always  delay_tap[268]= #(PRECISION_DLY) delay_tap[267];
always  delay_tap[269]= #(PRECISION_DLY) delay_tap[268];
always  delay_tap[270]= #(PRECISION_DLY) delay_tap[269];
always  delay_tap[271]= #(PRECISION_DLY) delay_tap[270];
always  delay_tap[272]= #(PRECISION_DLY) delay_tap[271];
always  delay_tap[273]= #(PRECISION_DLY) delay_tap[272];
always  delay_tap[274]= #(PRECISION_DLY) delay_tap[273];
always  delay_tap[275]= #(PRECISION_DLY) delay_tap[274];
always  delay_tap[276]= #(PRECISION_DLY) delay_tap[275];
always  delay_tap[277]= #(PRECISION_DLY) delay_tap[276];
always  delay_tap[278]= #(PRECISION_DLY) delay_tap[277];
always  delay_tap[279]= #(PRECISION_DLY) delay_tap[278];
always  delay_tap[280]= #(PRECISION_DLY) delay_tap[279];
always  delay_tap[281]= #(PRECISION_DLY) delay_tap[280];
always  delay_tap[282]= #(PRECISION_DLY) delay_tap[281];
always  delay_tap[283]= #(PRECISION_DLY) delay_tap[282];
always  delay_tap[284]= #(PRECISION_DLY) delay_tap[283];
always  delay_tap[285]= #(PRECISION_DLY) delay_tap[284];
always  delay_tap[286]= #(PRECISION_DLY) delay_tap[285];
always  delay_tap[287]= #(PRECISION_DLY) delay_tap[286];
always  delay_tap[288]= #(PRECISION_DLY) delay_tap[287];
always  delay_tap[289]= #(PRECISION_DLY) delay_tap[288];
always  delay_tap[290]= #(PRECISION_DLY) delay_tap[289];
always  delay_tap[291]= #(PRECISION_DLY) delay_tap[290];
always  delay_tap[292]= #(PRECISION_DLY) delay_tap[291];
always  delay_tap[293]= #(PRECISION_DLY) delay_tap[292];
always  delay_tap[294]= #(PRECISION_DLY) delay_tap[293];
always  delay_tap[295]= #(PRECISION_DLY) delay_tap[294];
always  delay_tap[296]= #(PRECISION_DLY) delay_tap[295];
always  delay_tap[297]= #(PRECISION_DLY) delay_tap[296];
always  delay_tap[298]= #(PRECISION_DLY) delay_tap[297];
always  delay_tap[299]= #(PRECISION_DLY) delay_tap[298];
always  delay_tap[300]= #(PRECISION_DLY) delay_tap[299];
always  delay_tap[301]= #(PRECISION_DLY) delay_tap[300];
always  delay_tap[302]= #(PRECISION_DLY) delay_tap[301];
always  delay_tap[303]= #(PRECISION_DLY) delay_tap[302];
always  delay_tap[304]= #(PRECISION_DLY) delay_tap[303];
always  delay_tap[305]= #(PRECISION_DLY) delay_tap[304];
always  delay_tap[306]= #(PRECISION_DLY) delay_tap[305];
always  delay_tap[307]= #(PRECISION_DLY) delay_tap[306];
always  delay_tap[308]= #(PRECISION_DLY) delay_tap[307];
always  delay_tap[309]= #(PRECISION_DLY) delay_tap[308];
always  delay_tap[310]= #(PRECISION_DLY) delay_tap[309];
always  delay_tap[311]= #(PRECISION_DLY) delay_tap[310];
always  delay_tap[312]= #(PRECISION_DLY) delay_tap[311];
always  delay_tap[313]= #(PRECISION_DLY) delay_tap[312];
always  delay_tap[314]= #(PRECISION_DLY) delay_tap[313];
always  delay_tap[315]= #(PRECISION_DLY) delay_tap[314];
always  delay_tap[316]= #(PRECISION_DLY) delay_tap[315];
always  delay_tap[317]= #(PRECISION_DLY) delay_tap[316];
always  delay_tap[318]= #(PRECISION_DLY) delay_tap[317];
always  delay_tap[319]= #(PRECISION_DLY) delay_tap[318];
always  delay_tap[320]= #(PRECISION_DLY) delay_tap[319];
always  delay_tap[321]= #(PRECISION_DLY) delay_tap[320];
always  delay_tap[322]= #(PRECISION_DLY) delay_tap[321];
always  delay_tap[323]= #(PRECISION_DLY) delay_tap[322];
always  delay_tap[324]= #(PRECISION_DLY) delay_tap[323];
always  delay_tap[325]= #(PRECISION_DLY) delay_tap[324];
always  delay_tap[326]= #(PRECISION_DLY) delay_tap[325];
always  delay_tap[327]= #(PRECISION_DLY) delay_tap[326];
always  delay_tap[328]= #(PRECISION_DLY) delay_tap[327];
always  delay_tap[329]= #(PRECISION_DLY) delay_tap[328];
always  delay_tap[330]= #(PRECISION_DLY) delay_tap[329];
always  delay_tap[331]= #(PRECISION_DLY) delay_tap[330];
always  delay_tap[332]= #(PRECISION_DLY) delay_tap[331];
always  delay_tap[333]= #(PRECISION_DLY) delay_tap[332];
always  delay_tap[334]= #(PRECISION_DLY) delay_tap[333];
always  delay_tap[335]= #(PRECISION_DLY) delay_tap[334];
always  delay_tap[336]= #(PRECISION_DLY) delay_tap[335];
always  delay_tap[337]= #(PRECISION_DLY) delay_tap[336];
always  delay_tap[338]= #(PRECISION_DLY) delay_tap[337];
always  delay_tap[339]= #(PRECISION_DLY) delay_tap[338];
always  delay_tap[340]= #(PRECISION_DLY) delay_tap[339];
always  delay_tap[341]= #(PRECISION_DLY) delay_tap[340];
always  delay_tap[342]= #(PRECISION_DLY) delay_tap[341];
always  delay_tap[343]= #(PRECISION_DLY) delay_tap[342];
always  delay_tap[344]= #(PRECISION_DLY) delay_tap[343];
always  delay_tap[345]= #(PRECISION_DLY) delay_tap[344];
always  delay_tap[346]= #(PRECISION_DLY) delay_tap[345];
always  delay_tap[347]= #(PRECISION_DLY) delay_tap[346];
always  delay_tap[348]= #(PRECISION_DLY) delay_tap[347];
always  delay_tap[349]= #(PRECISION_DLY) delay_tap[348];
always  delay_tap[350]= #(PRECISION_DLY) delay_tap[349];
always  delay_tap[351]= #(PRECISION_DLY) delay_tap[350];
always  delay_tap[352]= #(PRECISION_DLY) delay_tap[351];
always  delay_tap[353]= #(PRECISION_DLY) delay_tap[352];
always  delay_tap[354]= #(PRECISION_DLY) delay_tap[353];
always  delay_tap[355]= #(PRECISION_DLY) delay_tap[354];
always  delay_tap[356]= #(PRECISION_DLY) delay_tap[355];
always  delay_tap[357]= #(PRECISION_DLY) delay_tap[356];
always  delay_tap[358]= #(PRECISION_DLY) delay_tap[357];
always  delay_tap[359]= #(PRECISION_DLY) delay_tap[358];
always  delay_tap[360]= #(PRECISION_DLY) delay_tap[359];
always  delay_tap[361]= #(PRECISION_DLY) delay_tap[360];
always  delay_tap[362]= #(PRECISION_DLY) delay_tap[361];
always  delay_tap[363]= #(PRECISION_DLY) delay_tap[362];
always  delay_tap[364]= #(PRECISION_DLY) delay_tap[363];
always  delay_tap[365]= #(PRECISION_DLY) delay_tap[364];
always  delay_tap[366]= #(PRECISION_DLY) delay_tap[365];
always  delay_tap[367]= #(PRECISION_DLY) delay_tap[366];
always  delay_tap[368]= #(PRECISION_DLY) delay_tap[367];
always  delay_tap[369]= #(PRECISION_DLY) delay_tap[368];
always  delay_tap[370]= #(PRECISION_DLY) delay_tap[369];
always  delay_tap[371]= #(PRECISION_DLY) delay_tap[370];
always  delay_tap[372]= #(PRECISION_DLY) delay_tap[371];
always  delay_tap[373]= #(PRECISION_DLY) delay_tap[372];
always  delay_tap[374]= #(PRECISION_DLY) delay_tap[373];
always  delay_tap[375]= #(PRECISION_DLY) delay_tap[374];
always  delay_tap[376]= #(PRECISION_DLY) delay_tap[375];
always  delay_tap[377]= #(PRECISION_DLY) delay_tap[376];
always  delay_tap[378]= #(PRECISION_DLY) delay_tap[377];
always  delay_tap[379]= #(PRECISION_DLY) delay_tap[378];
always  delay_tap[380]= #(PRECISION_DLY) delay_tap[379];
always  delay_tap[381]= #(PRECISION_DLY) delay_tap[380];
always  delay_tap[382]= #(PRECISION_DLY) delay_tap[381];
always  delay_tap[383]= #(PRECISION_DLY) delay_tap[382];
always  delay_tap[384]= #(PRECISION_DLY) delay_tap[383];
always  delay_tap[385]= #(PRECISION_DLY) delay_tap[384];
always  delay_tap[386]= #(PRECISION_DLY) delay_tap[385];
always  delay_tap[387]= #(PRECISION_DLY) delay_tap[386];
always  delay_tap[388]= #(PRECISION_DLY) delay_tap[387];
always  delay_tap[389]= #(PRECISION_DLY) delay_tap[388];
always  delay_tap[390]= #(PRECISION_DLY) delay_tap[389];
always  delay_tap[391]= #(PRECISION_DLY) delay_tap[390];
always  delay_tap[392]= #(PRECISION_DLY) delay_tap[391];
always  delay_tap[393]= #(PRECISION_DLY) delay_tap[392];
always  delay_tap[394]= #(PRECISION_DLY) delay_tap[393];
always  delay_tap[395]= #(PRECISION_DLY) delay_tap[394];
always  delay_tap[396]= #(PRECISION_DLY) delay_tap[395];
always  delay_tap[397]= #(PRECISION_DLY) delay_tap[396];
always  delay_tap[398]= #(PRECISION_DLY) delay_tap[397];
always  delay_tap[399]= #(PRECISION_DLY) delay_tap[398];


`elsif TDC_SYN

wire  [3:0]start_carry0_CO ;
wire  [3:0]start_carry1_CO ;
wire  [3:0]start_carry2_CO ;
wire  [3:0]start_carry3_CO ;
wire  [3:0]start_carry4_CO ;
wire  [3:0]start_carry5_CO ;
wire  [3:0]start_carry6_CO ;
wire  [3:0]start_carry7_CO ;
wire  [3:0]start_carry8_CO ;
wire  [3:0]start_carry9_CO ;
wire  [3:0]start_carry10_CO;
wire  [3:0]start_carry11_CO;
wire  [3:0]start_carry12_CO;
wire  [3:0]start_carry13_CO;
wire  [3:0]start_carry14_CO;
wire  [3:0]start_carry15_CO;
wire  [3:0]start_carry16_CO;
wire  [3:0]start_carry17_CO;
wire  [3:0]start_carry18_CO;
wire  [3:0]start_carry19_CO;
wire  [3:0]start_carry20_CO;
wire  [3:0]start_carry21_CO;
wire  [3:0]start_carry22_CO;
wire  [3:0]start_carry23_CO;
wire  [3:0]start_carry24_CO;
wire  [3:0]start_carry25_CO;
wire  [3:0]start_carry26_CO;
wire  [3:0]start_carry27_CO;
wire  [3:0]start_carry28_CO;
wire  [3:0]start_carry29_CO;
wire  [3:0]start_carry30_CO;
wire  [3:0]start_carry31_CO;
wire  [3:0]start_carry32_CO;
wire  [3:0]start_carry33_CO;
wire  [3:0]start_carry34_CO;
wire  [3:0]start_carry35_CO;
wire  [3:0]start_carry36_CO;
wire  [3:0]start_carry37_CO;
wire  [3:0]start_carry38_CO;
wire  [3:0]start_carry39_CO;
wire  [3:0]start_carry40_CO;
wire  [3:0]start_carry41_CO;
wire  [3:0]start_carry42_CO;
wire  [3:0]start_carry43_CO;
wire  [3:0]start_carry44_CO;
wire  [3:0]start_carry45_CO;
wire  [3:0]start_carry46_CO;
wire  [3:0]start_carry47_CO;
wire  [3:0]start_carry48_CO;
wire  [3:0]start_carry49_CO;
wire  [3:0]start_carry50_CO;
wire  [3:0]start_carry51_CO;
wire  [3:0]start_carry52_CO;
wire  [3:0]start_carry53_CO;
wire  [3:0]start_carry54_CO;
wire  [3:0]start_carry55_CO;
wire  [3:0]start_carry56_CO;
wire  [3:0]start_carry57_CO;
wire  [3:0]start_carry58_CO;
wire  [3:0]start_carry59_CO;
wire  [3:0]start_carry60_CO;
wire  [3:0]start_carry61_CO;
wire  [3:0]start_carry62_CO;
wire  [3:0]start_carry63_CO;
wire  [3:0]start_carry64_CO;
wire  [3:0]start_carry65_CO;
wire  [3:0]start_carry66_CO;
wire  [3:0]start_carry67_CO;
wire  [3:0]start_carry68_CO;
wire  [3:0]start_carry69_CO;
wire  [3:0]start_carry70_CO;
wire  [3:0]start_carry71_CO;
wire  [3:0]start_carry72_CO;
wire  [3:0]start_carry73_CO;
wire  [3:0]start_carry74_CO;
wire  [3:0]start_carry75_CO;
wire  [3:0]start_carry76_CO;
wire  [3:0]start_carry77_CO;
wire  [3:0]start_carry78_CO;
wire  [3:0]start_carry79_CO;
wire  [3:0]start_carry80_CO;
wire  [3:0]start_carry81_CO;
wire  [3:0]start_carry82_CO;
wire  [3:0]start_carry83_CO;
wire  [3:0]start_carry84_CO;
wire  [3:0]start_carry85_CO;
wire  [3:0]start_carry86_CO;
wire  [3:0]start_carry87_CO;
wire  [3:0]start_carry88_CO;
wire  [3:0]start_carry89_CO;
wire  [3:0]start_carry90_CO;
wire  [3:0]start_carry91_CO;
wire  [3:0]start_carry92_CO;
wire  [3:0]start_carry93_CO;
wire  [3:0]start_carry94_CO;
wire  [3:0]start_carry95_CO;
wire  [3:0]start_carry96_CO;
wire  [3:0]start_carry97_CO;
wire  [3:0]start_carry98_CO;
wire  [3:0]start_carry99_CO;


CARRY4 CARRY4_delay0_inst
(
    .CO(start_carry0_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(1'b0),                              // 1-bit carry cascade input
    .CYINIT(stretch_hit),                   // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay1_inst 
(
    .CO(start_carry1_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry0_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay2_inst 
(
    .CO(start_carry2_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry1_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay3_inst 
(
    .CO(start_carry3_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry2_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay4_inst 
(
    .CO(start_carry4_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry3_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay5_inst 
(
    .CO(start_carry5_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry4_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);
CARRY4 CARRY4_delay6_inst 
(
    .CO(start_carry6_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry5_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay7_inst 
(
    .CO(start_carry7_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry6_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay8_inst 
(
    .CO(start_carry8_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry7_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay9_inst 
(
    .CO(start_carry9_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry8_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);





CARRY4 CARRY4_delay10_inst
(
    .CO(start_carry10_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry9_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay11_inst 
(
    .CO(start_carry11_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry10_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay12_inst 
(
    .CO(start_carry12_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry11_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay13_inst 
(
    .CO(start_carry13_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry12_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay14_inst 
(
    .CO(start_carry14_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry13_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay15_inst 
(
    .CO(start_carry15_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry14_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);
CARRY4 CARRY4_delay16_inst 
(
    .CO(start_carry16_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry15_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay17_inst 
(
    .CO(start_carry17_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry16_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay18_inst 
(
    .CO(start_carry18_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry17_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay19_inst 
(
    .CO(start_carry19_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry18_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);





CARRY4 CARRY4_delay20_inst
(
    .CO(start_carry20_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry19_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay21_inst 
(
    .CO(start_carry21_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry20_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay22_inst 
(
    .CO(start_carry22_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry21_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay23_inst 
(
    .CO(start_carry23_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry22_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay24_inst 
(
    .CO(start_carry24_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry23_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay25_inst 
(
    .CO(start_carry25_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry24_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);
CARRY4 CARRY4_delay26_inst 
(
    .CO(start_carry26_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry25_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay27_inst 
(
    .CO(start_carry27_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry26_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay28_inst 
(
    .CO(start_carry28_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry27_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay29_inst 
(
    .CO(start_carry29_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry28_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay30_inst
(
    .CO(start_carry30_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry29_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay31_inst 
(
    .CO(start_carry31_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry30_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay32_inst 
(
    .CO(start_carry32_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry31_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay33_inst 
(
    .CO(start_carry33_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry32_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay34_inst 
(
    .CO(start_carry34_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry33_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay35_inst 
(
    .CO(start_carry35_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry34_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);
CARRY4 CARRY4_delay36_inst 
(
    .CO(start_carry36_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry35_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay37_inst 
(
    .CO(start_carry37_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry36_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay38_inst 
(
    .CO(start_carry38_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry37_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay39_inst 
(
    .CO(start_carry39_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry38_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);






CARRY4 CARRY4_delay40_inst
(
    .CO(start_carry40_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry39_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay41_inst 
(
    .CO(start_carry41_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry40_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay42_inst 
(
    .CO(start_carry42_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry41_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay43_inst 
(
    .CO(start_carry43_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry42_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay44_inst 
(
    .CO(start_carry44_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry43_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay45_inst 
(
    .CO(start_carry45_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry44_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);
CARRY4 CARRY4_delay46_inst 
(
    .CO(start_carry46_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry45_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay47_inst 
(
    .CO(start_carry47_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry46_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay48_inst 
(
    .CO(start_carry48_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry47_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay49_inst 
(
    .CO(start_carry49_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry48_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);





CARRY4 CARRY4_delay50_inst
(
    .CO(start_carry50_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry49_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay51_inst 
(
    .CO(start_carry51_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry50_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay52_inst 
(
    .CO(start_carry52_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry51_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay53_inst 
(
    .CO(start_carry53_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry52_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay54_inst 
(
    .CO(start_carry54_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry53_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay55_inst 
(
    .CO(start_carry55_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry54_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);
CARRY4 CARRY4_delay56_inst 
(
    .CO(start_carry56_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry55_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay57_inst 
(
    .CO(start_carry57_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry56_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay58_inst 
(
    .CO(start_carry58_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry57_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay59_inst 
(
    .CO(start_carry59_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry58_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);





CARRY4 CARRY4_delay60_inst
(
    .CO(start_carry60_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry59_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay61_inst 
(
    .CO(start_carry61_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry60_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay62_inst 
(
    .CO(start_carry62_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry61_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay63_inst 
(
    .CO(start_carry63_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry62_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay64_inst 
(
    .CO(start_carry64_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry63_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay65_inst 
(
    .CO(start_carry65_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry64_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);
CARRY4 CARRY4_delay66_inst 
(
    .CO(start_carry66_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry65_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay67_inst 
(
    .CO(start_carry67_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry66_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay68_inst 
(
    .CO(start_carry68_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry67_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay69_inst 
(
    .CO(start_carry69_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry68_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay70_inst
(
    .CO(start_carry70_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry69_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay71_inst 
(
    .CO(start_carry71_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry70_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay72_inst 
(
    .CO(start_carry72_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry71_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay73_inst 
(
    .CO(start_carry73_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry72_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay74_inst 
(
    .CO(start_carry74_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry73_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay75_inst 
(
    .CO(start_carry75_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry74_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);
CARRY4 CARRY4_delay76_inst 
(
    .CO(start_carry76_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry75_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay77_inst 
(
    .CO(start_carry77_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry76_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay78_inst 
(
    .CO(start_carry78_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry77_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay79_inst 
(
    .CO(start_carry79_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry78_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);





CARRY4 CARRY4_delay80_inst
(
    .CO(start_carry80_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry79_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay81_inst 
(
    .CO(start_carry81_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry80_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay82_inst 
(
    .CO(start_carry82_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry81_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay83_inst 
(
    .CO(start_carry83_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry82_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay84_inst 
(
    .CO(start_carry84_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry83_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay85_inst 
(
    .CO(start_carry85_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry84_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);
CARRY4 CARRY4_delay86_inst 
(
    .CO(start_carry86_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry85_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay87_inst 
(
    .CO(start_carry87_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry86_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay88_inst 
(
    .CO(start_carry88_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry87_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay89_inst 
(
    .CO(start_carry89_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry88_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);





CARRY4 CARRY4_delay90_inst
(
    .CO(start_carry90_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry89_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay91_inst 
(
    .CO(start_carry91_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry90_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay92_inst 
(
    .CO(start_carry92_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry91_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay93_inst 
(
    .CO(start_carry93_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry92_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay94_inst 
(
    .CO(start_carry94_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry93_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);

CARRY4 CARRY4_delay95_inst 
(
    .CO(start_carry95_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry94_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);
CARRY4 CARRY4_delay96_inst 
(
    .CO(start_carry96_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry95_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);


CARRY4 CARRY4_delay97_inst 
(
    .CO(start_carry97_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry96_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




CARRY4 CARRY4_delay98_inst 
(
    .CO(start_carry98_CO),                   // 4-bit carry out
    .O(),                                   // 4-bit carry chain XOR data out
    .CI(start_carry97_CO[3]),                // 1-bit carry cascade input
    .CYINIT(1'b0),                          // 1-bit carry initialization
    .DI(4'b0000),                           // 4-bit carry-MUX data in
    .S(4'b1111)                             // 4-bit carry-MUX select input
);




// CARRY4 CARRY4_delay99_inst 
// (
//     .CO(start_carry99_CO),                   // 4-bit carry out
//     .O(),                                   // 4-bit carry chain XOR data out
//     .CI(start_carry98_CO[3]),                // 1-bit carry cascade input
//     .CYINIT(1'b0),                          // 1-bit carry initialization
//     .DI(4'b0000),                           // 4-bit carry-MUX data in
//     .S(4'b1111)                             // 4-bit carry-MUX select input
// );

assign delay_tap[399:0]  =   {
     start_carry99_CO[3] 
    ,start_carry99_CO[2] 
    ,start_carry99_CO[1] 
    ,start_carry99_CO[0] 
    ,start_carry98_CO[3]    
    ,start_carry98_CO[2] 
    ,start_carry98_CO[1] 
    ,start_carry98_CO[0]
    ,start_carry97_CO[3]
    ,start_carry97_CO[2]
    ,start_carry97_CO[1]
    ,start_carry97_CO[0]
    ,start_carry96_CO[3]
    ,start_carry96_CO[2]
    ,start_carry96_CO[1]
    ,start_carry96_CO[0]
    ,start_carry95_CO[3]
    ,start_carry95_CO[2]
    ,start_carry95_CO[1]
    ,start_carry95_CO[0]
    ,start_carry94_CO[3]
    ,start_carry94_CO[2]
    ,start_carry94_CO[1]
    ,start_carry94_CO[0]
    ,start_carry93_CO[3]
    ,start_carry93_CO[2]
    ,start_carry93_CO[1]
    ,start_carry93_CO[0]
    ,start_carry92_CO[3]
    ,start_carry92_CO[2]
    ,start_carry92_CO[1]
    ,start_carry92_CO[0]
    ,start_carry91_CO[3]
    ,start_carry91_CO[2]
    ,start_carry91_CO[1]
    ,start_carry91_CO[0]
    ,start_carry90_CO[3]
    ,start_carry90_CO[2]
    ,start_carry90_CO[1]
    ,start_carry90_CO[0]

    ,start_carry89_CO[3]
    ,start_carry89_CO[2]
    ,start_carry89_CO[1]
    ,start_carry89_CO[0]
    ,start_carry88_CO[3]
    ,start_carry88_CO[2]
    ,start_carry88_CO[1]
    ,start_carry88_CO[0]
    ,start_carry87_CO[3]
    ,start_carry87_CO[2]
    ,start_carry87_CO[1]
    ,start_carry87_CO[0]
    ,start_carry86_CO[3]
    ,start_carry86_CO[2]
    ,start_carry86_CO[1]
    ,start_carry86_CO[0]
    ,start_carry85_CO[3]
    ,start_carry85_CO[2]
    ,start_carry85_CO[1]
    ,start_carry85_CO[0]
    ,start_carry84_CO[3]
    ,start_carry84_CO[2]
    ,start_carry84_CO[1]
    ,start_carry84_CO[0]
    ,start_carry83_CO[3]
    ,start_carry83_CO[2]
    ,start_carry83_CO[1]
    ,start_carry83_CO[0]
    ,start_carry82_CO[3]
    ,start_carry82_CO[2]
    ,start_carry82_CO[1]
    ,start_carry82_CO[0]
    ,start_carry81_CO[3]
    ,start_carry81_CO[2]
    ,start_carry81_CO[1]
    ,start_carry81_CO[0]
    ,start_carry80_CO[3]
    ,start_carry80_CO[2]
    ,start_carry80_CO[1]
    ,start_carry80_CO[0]

    ,start_carry79_CO[3]
    ,start_carry79_CO[2]
    ,start_carry79_CO[1]
    ,start_carry79_CO[0]
    ,start_carry78_CO[3]
    ,start_carry78_CO[2]
    ,start_carry78_CO[1]
    ,start_carry78_CO[0]
    ,start_carry77_CO[3]
    ,start_carry77_CO[2]
    ,start_carry77_CO[1]
    ,start_carry77_CO[0]
    ,start_carry76_CO[3]
    ,start_carry76_CO[2]
    ,start_carry76_CO[1]
    ,start_carry76_CO[0]
    ,start_carry75_CO[3]
    ,start_carry75_CO[2]
    ,start_carry75_CO[1]
    ,start_carry75_CO[0]
    ,start_carry74_CO[3]
    ,start_carry74_CO[2]
    ,start_carry74_CO[1]
    ,start_carry74_CO[0]
    ,start_carry73_CO[3]
    ,start_carry73_CO[2]
    ,start_carry73_CO[1]
    ,start_carry73_CO[0]
    ,start_carry72_CO[3]
    ,start_carry72_CO[2]
    ,start_carry72_CO[1]
    ,start_carry72_CO[0]
    ,start_carry71_CO[3]
    ,start_carry71_CO[2]
    ,start_carry71_CO[1]
    ,start_carry71_CO[0]
    ,start_carry70_CO[3]
    ,start_carry70_CO[2]
    ,start_carry70_CO[1]
    ,start_carry70_CO[0]


    ,start_carry69_CO[3]
    ,start_carry69_CO[2]
    ,start_carry69_CO[1]
    ,start_carry69_CO[0]
    ,start_carry68_CO[3]
    ,start_carry68_CO[2]
    ,start_carry68_CO[1]
    ,start_carry68_CO[0]
    ,start_carry67_CO[3]
    ,start_carry67_CO[2]
    ,start_carry67_CO[1]
    ,start_carry67_CO[0]
    ,start_carry66_CO[3]
    ,start_carry66_CO[2]
    ,start_carry66_CO[1]
    ,start_carry66_CO[0]
    ,start_carry65_CO[3]
    ,start_carry65_CO[2]
    ,start_carry65_CO[1]
    ,start_carry65_CO[0]
    ,start_carry64_CO[3]
    ,start_carry64_CO[2]
    ,start_carry64_CO[1]
    ,start_carry64_CO[0]
    ,start_carry63_CO[3]
    ,start_carry63_CO[2]
    ,start_carry63_CO[1]
    ,start_carry63_CO[0]
    ,start_carry62_CO[3]
    ,start_carry62_CO[2]
    ,start_carry62_CO[1]
    ,start_carry62_CO[0]
    ,start_carry61_CO[3]
    ,start_carry61_CO[2]
    ,start_carry61_CO[1]
    ,start_carry61_CO[0]
    ,start_carry60_CO[3]
    ,start_carry60_CO[2]
    ,start_carry60_CO[1]
    ,start_carry60_CO[0]

    ,start_carry59_CO[3]
    ,start_carry59_CO[2]
    ,start_carry59_CO[1]
    ,start_carry59_CO[0]
    ,start_carry58_CO[3]
    ,start_carry58_CO[2]
    ,start_carry58_CO[1]
    ,start_carry58_CO[0]
    ,start_carry57_CO[3]
    ,start_carry57_CO[2]
    ,start_carry57_CO[1]
    ,start_carry57_CO[0]
    ,start_carry56_CO[3]
    ,start_carry56_CO[2]
    ,start_carry56_CO[1]
    ,start_carry56_CO[0]
    ,start_carry55_CO[3]
    ,start_carry55_CO[2]
    ,start_carry55_CO[1]
    ,start_carry55_CO[0]
    ,start_carry54_CO[3]
    ,start_carry54_CO[2]
    ,start_carry54_CO[1]
    ,start_carry54_CO[0]
    ,start_carry53_CO[3]
    ,start_carry53_CO[2]
    ,start_carry53_CO[1]
    ,start_carry53_CO[0]
    ,start_carry52_CO[3]
    ,start_carry52_CO[2]
    ,start_carry52_CO[1]
    ,start_carry52_CO[0]
    ,start_carry51_CO[3]
    ,start_carry51_CO[2]
    ,start_carry51_CO[1]
    ,start_carry51_CO[0]
    ,start_carry50_CO[3]
    ,start_carry50_CO[2]
    ,start_carry50_CO[1]
    ,start_carry50_CO[0]

    ,start_carry49_CO[3]
    ,start_carry49_CO[2]
    ,start_carry49_CO[1]
    ,start_carry49_CO[0]
    ,start_carry48_CO[3]
    ,start_carry48_CO[2]
    ,start_carry48_CO[1]
    ,start_carry48_CO[0]
    ,start_carry47_CO[3]
    ,start_carry47_CO[2]
    ,start_carry47_CO[1]
    ,start_carry47_CO[0]
    ,start_carry46_CO[3]
    ,start_carry46_CO[2]
    ,start_carry46_CO[1]
    ,start_carry46_CO[0]
    ,start_carry45_CO[3]
    ,start_carry45_CO[2]
    ,start_carry45_CO[1]
    ,start_carry45_CO[0]
    ,start_carry44_CO[3]
    ,start_carry44_CO[2]
    ,start_carry44_CO[1]
    ,start_carry44_CO[0]
    ,start_carry43_CO[3]
    ,start_carry43_CO[2]
    ,start_carry43_CO[1]
    ,start_carry43_CO[0]
    ,start_carry42_CO[3]
    ,start_carry42_CO[2]
    ,start_carry42_CO[1]
    ,start_carry42_CO[0]
    ,start_carry41_CO[3]
    ,start_carry41_CO[2]
    ,start_carry41_CO[1]
    ,start_carry41_CO[0]
    ,start_carry40_CO[3]
    ,start_carry40_CO[2]
    ,start_carry40_CO[1]
    ,start_carry40_CO[0]



    ,start_carry39_CO[3]
    ,start_carry39_CO[2]
    ,start_carry39_CO[1]
    ,start_carry39_CO[0]
    ,start_carry38_CO[3]
    ,start_carry38_CO[2]
    ,start_carry38_CO[1]
    ,start_carry38_CO[0]
    ,start_carry37_CO[3]
    ,start_carry37_CO[2]
    ,start_carry37_CO[1]
    ,start_carry37_CO[0]
    ,start_carry36_CO[3]
    ,start_carry36_CO[2]
    ,start_carry36_CO[1]
    ,start_carry36_CO[0]
    ,start_carry35_CO[3]
    ,start_carry35_CO[2]
    ,start_carry35_CO[1]
    ,start_carry35_CO[0]
    ,start_carry34_CO[3]
    ,start_carry34_CO[2]
    ,start_carry34_CO[1]
    ,start_carry34_CO[0]
    ,start_carry33_CO[3]
    ,start_carry33_CO[2]
    ,start_carry33_CO[1]
    ,start_carry33_CO[0]
    ,start_carry32_CO[3]
    ,start_carry32_CO[2]
    ,start_carry32_CO[1]
    ,start_carry32_CO[0]
    ,start_carry31_CO[3]
    ,start_carry31_CO[2]
    ,start_carry31_CO[1]
    ,start_carry31_CO[0]
    ,start_carry30_CO[3]
    ,start_carry30_CO[2]
    ,start_carry30_CO[1]
    ,start_carry30_CO[0]



    ,start_carry29_CO[3]
    ,start_carry29_CO[2]
    ,start_carry29_CO[1]
    ,start_carry29_CO[0]
    ,start_carry28_CO[3]
    ,start_carry28_CO[2]
    ,start_carry28_CO[1]
    ,start_carry28_CO[0]
    ,start_carry27_CO[3]
    ,start_carry27_CO[2]
    ,start_carry27_CO[1]
    ,start_carry27_CO[0]
    ,start_carry26_CO[3]
    ,start_carry26_CO[2]
    ,start_carry26_CO[1]
    ,start_carry26_CO[0]
    ,start_carry25_CO[3]
    ,start_carry25_CO[2]
    ,start_carry25_CO[1]
    ,start_carry25_CO[0]
    ,start_carry24_CO[3]
    ,start_carry24_CO[2]
    ,start_carry24_CO[1]
    ,start_carry24_CO[0]
    ,start_carry23_CO[3]
    ,start_carry23_CO[2]
    ,start_carry23_CO[1]
    ,start_carry23_CO[0]
    ,start_carry22_CO[3]
    ,start_carry22_CO[2]
    ,start_carry22_CO[1]
    ,start_carry22_CO[0]
    ,start_carry21_CO[3]
    ,start_carry21_CO[2]
    ,start_carry21_CO[1]
    ,start_carry21_CO[0]
    ,start_carry20_CO[3]
    ,start_carry20_CO[2]
    ,start_carry20_CO[1]
    ,start_carry20_CO[0]

    ,start_carry19_CO[3]
    ,start_carry19_CO[2]
    ,start_carry19_CO[1]
    ,start_carry19_CO[0]
    ,start_carry18_CO[3]
    ,start_carry18_CO[2]
    ,start_carry18_CO[1]
    ,start_carry18_CO[0]
    ,start_carry17_CO[3]
    ,start_carry17_CO[2]
    ,start_carry17_CO[1]
    ,start_carry17_CO[0]
    ,start_carry16_CO[3]
    ,start_carry16_CO[2]
    ,start_carry16_CO[1]
    ,start_carry16_CO[0]
    ,start_carry15_CO[3]
    ,start_carry15_CO[2]
    ,start_carry15_CO[1]
    ,start_carry15_CO[0]
    ,start_carry14_CO[3]
    ,start_carry14_CO[2]
    ,start_carry14_CO[1]
    ,start_carry14_CO[0]
    ,start_carry13_CO[3]
    ,start_carry13_CO[2]
    ,start_carry13_CO[1]
    ,start_carry13_CO[0]
    ,start_carry12_CO[3]
    ,start_carry12_CO[2]
    ,start_carry12_CO[1]
    ,start_carry12_CO[0]
    ,start_carry11_CO[3]
    ,start_carry11_CO[2]
    ,start_carry11_CO[1]
    ,start_carry11_CO[0]
    ,start_carry10_CO[3]
    ,start_carry10_CO[2]
    ,start_carry10_CO[1]
    ,start_carry10_CO[0]



    ,start_carry9_CO[3]
    ,start_carry9_CO[2]
    ,start_carry9_CO[1]
    ,start_carry9_CO[0]
    ,start_carry8_CO[3]
    ,start_carry8_CO[2]
    ,start_carry8_CO[1]
    ,start_carry8_CO[0]
    ,start_carry7_CO[3]
    ,start_carry7_CO[2]
    ,start_carry7_CO[1]
    ,start_carry7_CO[0]
    ,start_carry6_CO[3]
    ,start_carry6_CO[2]
    ,start_carry6_CO[1]
    ,start_carry6_CO[0]
    ,start_carry5_CO[3]
    ,start_carry5_CO[2]
    ,start_carry5_CO[1]
    ,start_carry5_CO[0]
    ,start_carry4_CO[3]
    ,start_carry4_CO[2]
    ,start_carry4_CO[1]
    ,start_carry4_CO[0]
    ,start_carry3_CO[3]
    ,start_carry3_CO[2]
    ,start_carry3_CO[1]
    ,start_carry3_CO[0]
    ,start_carry2_CO[3]
    ,start_carry2_CO[2]
    ,start_carry2_CO[1]
    ,start_carry2_CO[0]
    ,start_carry1_CO[3]
    ,start_carry1_CO[2]
    ,start_carry1_CO[1]
    ,start_carry1_CO[0]
    ,start_carry0_CO[3]
    ,start_carry0_CO[2]
    ,start_carry0_CO[1]
    ,start_carry0_CO[0]

};

`endif

endmodule

