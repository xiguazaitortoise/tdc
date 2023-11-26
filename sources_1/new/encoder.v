`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: anytao
// Create Date: 2021/07/25 14:43:40
// Module Name: encoder.v
// Project Name: encoder
// Target Devices: xc7k325tffg900-2
// Tool Versions: vivado 2017.4
// Description: data and instruct encoder
// Revision: 0.0
//////////////////////////////////////////////////////////////////////////////////
module encoder
#
(
    parameter NUM = 2,
    parameter DATA_WIDTH = 32
)
(
    input          wire sys_clk                     ,
    input          wire sys_rstn                    ,

    input          wire                                        data_encoder_pre_en         ,
    output         wire                                        data_encoder_pre_ready      ,
    input          wire [DATA_WIDTH-1    :0]                   data_encoder_pre_data,


   (*mark_debug = "true"*) (* dont_touch = "true" *)  input          wire                                         instr_encoder_pre_en       ,
   (*mark_debug = "true"*) (* dont_touch = "true" *)  input          wire [DATA_WIDTH-1    :0]                    instr_encoder_pre_data     ,

   
   
   (*mark_debug = "true"*) (* dont_touch = "true" *)  input          wire                                         arbiter_o_ready            ,
   (*mark_debug = "true"*) (* dont_touch = "true" *)  output         wire                                         arbiter_o_valid            ,
   (*mark_debug = "true"*) (* dont_touch = "true" *)  output         wire [DATA_WIDTH-1    :0]                    arbiter_o_data            
    ); 






    wire [NUM-1           :0]  arbiter_i_req  ;
    wire [NUM-1           :0]  arbiter_o_grant;
    wire [NUM-1           :0]  arbiter_i_en   ;
    wire [NUM*DATA_WIDTH-1:0]  arbiter_i_data ;



    wire       data_encoder_req      ;
    wire       data_encoder_grant    ;
    wire       data_encoder_post_en  ;
    wire [DATA_WIDTH-1:0]data_encoder_post_data;


    wire       instr_encoder_req      ;
    wire       instr_encoder_grant    ;
    wire       instr_encoder_post_en  ;
    wire [DATA_WIDTH-1:0]instr_encoder_post_data;

assign arbiter_i_req={data_encoder_req,instr_encoder_req};
assign data_encoder_grant=arbiter_o_grant[1];
assign instr_encoder_grant=arbiter_o_grant[0];
assign arbiter_i_en={data_encoder_post_en,instr_encoder_post_en};
assign arbiter_i_data={data_encoder_post_data,instr_encoder_post_data};

    arbiter
#
(
    .NUM       (NUM)  ,
    .DATA_WIDTH (DATA_WIDTH)
)
arbiter_inst
(
    .sys_clk   (sys_clk)                  ,
    .sys_rstn  (sys_rstn)                  ,
    .i_req  (arbiter_i_req  ),
    .o_grant(arbiter_o_grant),
    .i_en   (arbiter_i_en   ),
    .i_data (arbiter_i_data ),
    .o_valid(arbiter_o_valid),
    .o_data (arbiter_o_data )
);



data_encoder
#
(
    .DATA_WIDTH (DATA_WIDTH) 
)
data_encoder_inst
(
    .sys_clk  (sys_clk),
    .sys_rstn (sys_rstn),
    .pre_en   (data_encoder_pre_en),
    .pre_ready(data_encoder_pre_ready),
    .pre_data (data_encoder_pre_data),
    .req      (data_encoder_req),
    .grant    (data_encoder_grant),
    .post_ready(arbiter_o_ready),
    .post_en  (data_encoder_post_en),
    .post_data(data_encoder_post_data)
);

instr_encoder
#
(
    .DATA_WIDTH (DATA_WIDTH) 
)
instr_encoder_inst
(
    .sys_clk  (sys_clk),
    .sys_rstn (sys_rstn),
    .pre_en   (instr_encoder_pre_en),
    .pre_data (instr_encoder_pre_data),
    .req      (instr_encoder_req),
    .grant    (instr_encoder_grant),
    .post_ready(arbiter_o_ready),
    .post_en  (instr_encoder_post_en),
    .post_data(instr_encoder_post_data)
);
endmodule
