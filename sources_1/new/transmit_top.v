`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/08/12 11:56:06
// Module Name   : transmit_top.v
// Project Name  : transmit_top.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : usb read and write module
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////

module transmit_top
#
(
    parameter ADDR_WIDTH = 16,
    parameter DATA_WIDTH = 32,
    parameter CHANNEL = 8
)(
    input   wire                   sys_clk               , 
    input   wire                   resetn                , 
    output  wire [3:0]             led                   ,


    //output control signal
    
    output    wire                     capture        ,
    output    wire                     rd_en_instr    ,
    output    wire     [DATA_WIDTH-1:0]max_count      ,
    output    wire     [DATA_WIDTH-1:0]max_time       ,
    output    wire                    channel0_on    ,
    output    wire                    channel1_on    ,
    output    wire                    channel2_on    ,
    output    wire                    channel3_on    ,
    output    wire                    channel4_on    ,
    output    wire                    channel5_on    ,
    output    wire                    channel6_on    ,
    output    wire                    channel7_on    ,
    //input control signal
    
    input    wire   [DATA_WIDTH*CHANNEL-1:0]                  freq        ,
    input    wire     [DATA_WIDTH-1:0]   temp       ,
    input    wire     [3*DATA_WIDTH-1:0]   dna        ,
    

    //data input
    (*mark_debug = "true"*) (* dont_touch = "true" *)input   wire                   data_encoder_pre_en   ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output  wire                   data_encoder_pre_ready,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input   wire [DATA_WIDTH-1:0]  data_encoder_pre_data ,

    //  usb fifo interface     
    input   wire                   usb_rst_n             ,//fpga reset
    output  wire                   usb_pw_en             ,//power enbale
    input   wire                   usb_clk               ,
    inout   wire [DATA_WIDTH-1:0]  usb_data              ,
    inout   wire [DATA_WIDTH/8-1:0]usb_be                ,
    input   wire                   usb_rxf_n             ,   
    input   wire                   usb_txf_n             ,
    output  wire                   usb_oe_n              ,
    output  wire                   usb_we_n              ,    
    output  wire                   usb_rd_n              ,
    output  wire                   usb_siwu              ,
    output  wire                   usb_wakeup            ,
    output  wire                   usb_led     
);



//  user interface
wire                   usb_wr_ready ;
wire                    usb_wr_valid;
wire [DATA_WIDTH-1:0]   usb_wr_data ;    
wire                    usb_rd_ready;
wire                   usb_rd_valid ;
wire [DATA_WIDTH-1:0]  usb_rd_data  ;



wire     [DATA_WIDTH-1:0]instr_usb_data       ;
wire                     instr_usb_en         ;
wire                     instr_user_valid     ;
wire     [DATA_WIDTH-1:0]instr_user_data      ;
wire                     user_ready           ;
wire                     user_en              ;
wire     [DATA_WIDTH-1:0]user_data_i          ;


(*mark_debug = "true"*) (* dont_touch = "true" *)wire                      arbiter_o_ready     ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire                      arbiter_o_valid     ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [DATA_WIDTH-1    :0] arbiter_o_data      ;



wire                            instr_encoder_pre_en  ;
wire [DATA_WIDTH-1:0]           instr_encoder_pre_data;

assign user_en = arbiter_o_valid;
assign user_data_i = arbiter_o_data;
assign arbiter_o_ready = user_ready;
instr_decoder
#
(
    .ADDR_WIDTH (ADDR_WIDTH),
    .DATA_WIDTH (DATA_WIDTH),
    .CHANNEL    (CHANNEL)
)
instr_decoder_inst
(
    .sys_clk        (sys_clk              ),
    .usb_data       (instr_usb_data       ),
    .usb_en         (instr_usb_en         ),
    .user_valid     (instr_user_valid     ),
    .user_data      (instr_user_data      ),
    .freq           (freq                 ),
    .temp           (temp                 ),
    .dna            (dna                  ),


    .channel0_on    (channel0_on          ),
    .channel1_on    (channel1_on          ),
    .channel2_on    (channel2_on          ),
    .channel3_on    (channel3_on          ),
    .channel4_on    (channel4_on          ),
    .channel5_on    (channel5_on          ),
    .channel6_on    (channel6_on          ),
    .channel7_on    (channel7_on          ),
    .capture        (capture              ),
    .rd_en_instr    (rd_en_instr          ),
    .max_count      (max_count            ),
    .max_time       (max_time             ),
    .led            (led                  )
);


assign instr_encoder_pre_en=instr_user_valid;
assign instr_encoder_pre_data=instr_user_data;

encoder 
#(.DATA_WIDTH(DATA_WIDTH))
encoder_inst
(
.sys_clk                     (sys_clk                     ),
.sys_rstn                    (resetn                      ),
.data_encoder_pre_en         (data_encoder_pre_en         ),
.data_encoder_pre_ready      (data_encoder_pre_ready      ),
.data_encoder_pre_data       (data_encoder_pre_data       ),
.instr_encoder_pre_en        (instr_encoder_pre_en        ),
.instr_encoder_pre_data      (instr_encoder_pre_data      ),
.arbiter_o_ready             (arbiter_o_ready             ),
.arbiter_o_valid             (arbiter_o_valid             ),
.arbiter_o_data              (arbiter_o_data              )
);


usb_tranceiver usb_tranceiver_inst
(
    
    .usb_clk     (usb_clk),
    .usb_rst_n   (usb_rst_n),
    .resetn      (resetn),
    .usb_wr_ready(usb_wr_ready),
    .usb_wr_valid(usb_wr_valid),
    .usb_wr_data (usb_wr_data ), 
    .usb_rd_ready(usb_rd_ready),
    .usb_rd_valid(usb_rd_valid),
    .usb_rd_data (usb_rd_data ),
    .sys_clk     (sys_clk),
    .user_valid  (instr_usb_en),
    .user_data_o (instr_usb_data),
    .user_ready  (user_ready),
    .user_en     (user_en),
    .user_data_i (user_data_i)

);


usb_if usb_if_inst
(
    .usb_rst_n    (usb_rst_n    ),//fpga reset
    .usb_pw_en    (usb_pw_en    ),//pow

    .usb_wr_ready (usb_wr_ready ),
    .usb_wr_valid (usb_wr_valid ),
    .usb_wr_data  (usb_wr_data  ),    
    .usb_rd_ready (usb_rd_ready ),
    .usb_rd_valid (usb_rd_valid ),
    .usb_rd_data  (usb_rd_data  ),  

    .usb_clk      (usb_clk      ),
    .usb_data     (usb_data     ),
    .usb_be       (usb_be       ),
    .usb_rxf_n    (usb_rxf_n    ),   
    .usb_txf_n    (usb_txf_n    ),
    .usb_oe_n     (usb_oe_n     ),
    .usb_we_n     (usb_we_n     ),    
    .usb_rd_n     (usb_rd_n     ),
    .usb_siwu     (usb_siwu     ),
    .usb_wakeup   (usb_wakeup   ),
    .usb_led      (usb_led      )
);

endmodule
