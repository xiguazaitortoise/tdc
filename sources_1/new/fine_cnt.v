`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/08/11 15:08:04
// Module Name   : fine_cnt.v
// Project Name  : fine_cnt.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : fine count time
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////
module fine_cnt
(
    input  wire                     clk         ,  
    input  wire                     stretch_hit ,
    output wire                     clr         ,
    output wire    [399:0]          step_data   
);


wire    [399:0]         delay_tap       ;
assign clr  =   step_data[0];


(*dont_touch = "true"*)delay_chain delay_chain_inst
(
    .stretch_hit     (stretch_hit     ),
    .delay_tap       (delay_tap       )
);



(*dont_touch = "true"*)syncer #(.DP(2),.DW(400)) syncer_inst (
    .din_a(1'b1),
    .dout (step_data),
    .rst_n(delay_tap),
    .clk  (clk)
);
// (*dont_touch = "true"*)d_flip_flop d_flip_flop_inst
// (
//     .clk       (clk      ),
//     .delay_tap (delay_tap), 
//     .step_data (step_data) 
// );


endmodule

