`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/08/11 14:40:19
// Module Name   : receive_top.v
// Project Name  : receive_top.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : hit calculate
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////
`include"global.v"
module receive_top
#
(
    parameter  INSTR_WIDTH = 16,
    parameter  DATA_WIDTH  = 32,
    parameter  CHANNEL= 8,
    parameter CLK_FREQ =200000000 
)
(
    input   wire                        clk     ,
    input   wire                        resetn  ,
    input   wire   [INSTR_WIDTH-1:0]    sel_prc ,
    input   wire   [CHANNEL-1:0]        hit     ,
    output  wire   [CHANNEL-1:0]        T0_valid   ,
    output  wire   [CHANNEL*DATA_WIDTH-1:0]     T0_data    ,
    output  wire   [CHANNEL*DATA_WIDTH-1:0]     freq          
);


genvar channel_i;

(*mark_debug = "true"*) (* dont_touch = "true" *)wire   [CHANNEL-1:0]   clr             ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire   [CHANNEL-1:0]   stretch_hit     ;

(*mark_debug = "true"*) (* dont_touch = "true" *)wire   [CHANNEL-1:0]   latch           ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire   [DATA_WIDTH-1:0]    coarse_time [CHANNEL-1:0];
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [DATA_WIDTH-1:0]   fine_time   [CHANNEL-1:0];
(*mark_debug = "true"*) (* dont_touch = "true" *)wire    [CHANNEL-1:0]   fine_valid;
wire [399:0]   step_data   [CHANNEL-1:0];

(*mark_debug = "true"*) (* dont_touch = "true" *)wire                start_en;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [DATA_WIDTH-1:0]start_coarse_data;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [DATA_WIDTH-1:0]start_fine_data;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [CHANNEL-1:1]  stop_en;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [DATA_WIDTH-1:0]stop_coarse_data [CHANNEL-1:1];
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [DATA_WIDTH-1:0]stop_fine_data   [CHANNEL-1:1];




//////////////////////////////////////////////////////////////////////////////
//stretch module declaration
//////////////////////////////////////////////////////////////////////////////
generate
   for(channel_i=0;channel_i<CHANNEL;channel_i=channel_i+1)
   begin
   stretch     stretch_inst
      (
         .clr                    (clr[channel_i]        ), 
         .hit                    (hit[channel_i]        ),
         .stretch_hit            (stretch_hit[channel_i])
      );
   end
endgenerate


////////////////////////////////////////////////////////////////////////
// control block latches both the coarse and the fine time
generate
   for(channel_i=0;channel_i<CHANNEL;channel_i=channel_i+1)
   begin
   control_block   control_block_inst
      (
         .clk         (clk             ),   
         .clr         (clr[channel_i]  ),
         .latch       (latch[channel_i])
      );
   end
endgenerate
////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////
// coarse counter



coarse_cnt
#
(
    .DATA_WIDTH(DATA_WIDTH)
)
coarse_cnt_inst0
    (
        .clk         (clk                    ),   
        .clr         (clr[0]                ),
        .latch       (latch[0]            ),
        .coarse_time (coarse_time[0] )           
    );


generate
   for(channel_i=1;channel_i<CHANNEL;channel_i=channel_i+1)
   begin
   coarse_cnt
    #
    (
        .DATA_WIDTH(DATA_WIDTH)
    )
    coarse_cnt_inst
      (
         .clk         (clk                    ),   
         .clr         (clr[0]                  ),
         .latch       (latch[channel_i]            ),
         .coarse_time (coarse_time[channel_i] )           
      );
   end
endgenerate

////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////
// fine counter
generate
   for(channel_i=0;channel_i<CHANNEL;channel_i=channel_i+1)
   begin
   fine_cnt    fine_cnt_inst
      (
         .clk         (clk                     ),  
         .stretch_hit (stretch_hit[channel_i]  ),
         .clr         (clr[channel_i]          ),
         .step_data   (step_data[channel_i]    )
      );
   end
endgenerate
////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////
// thermometer encoder
generate
   for(channel_i=0;channel_i<CHANNEL;channel_i=channel_i+1)
   begin
      thermometer_encoder 
        #
        (
            .INSTR_WIDTH (INSTR_WIDTH ),
            .DATA_WIDTH  (DATA_WIDTH  )
        )
        thermometer_encoder_inst
      (
         .clk         (clk                                 ),  
         .sel         (sel_prc                             ),
         .en          (clr[channel_i]                      ),
         .step_data   (step_data[channel_i]                ),
         .valid       (fine_valid[channel_i]               ),
         .fine_time   (fine_time[channel_i]                )     
      );
   end
endgenerate

//////////////////////////////////////////////////////////////////////////////
//T0_time module declaration
//////////////////////////////////////////////////////////////////////////////


assign start_coarse_data = coarse_time[0];
assign start_fine_data =fine_time[0];


generate
   for(channel_i=1;channel_i<CHANNEL;channel_i=channel_i+1)
   begin
    assign    stop_en[channel_i]=fine_valid[channel_i];
    assign    stop_coarse_data[channel_i]=coarse_time[channel_i];
    assign    stop_fine_data[channel_i]=fine_time[channel_i];
    T0_time
    #
    (
        .DATA_WIDTH(DATA_WIDTH)
    )
    T0_time_inst
    (
        .clk              (clk                                 ),
        .start_en         (fine_valid[0]                       ),
        .start_coarse_data(start_coarse_data                   ),
        .start_fine_data  (start_fine_data                     ),
        .stop_en          (stop_en[channel_i]                  ),
        .stop_coarse_data (stop_coarse_data[channel_i]         ),
        .stop_fine_data   (stop_fine_data[channel_i]           ),
        .valid            (T0_valid[channel_i]                 ),
        .data             (T0_data [channel_i*DATA_WIDTH+:DATA_WIDTH]                 )
    );
   end
endgenerate


generate
   for(channel_i=0;channel_i<CHANNEL;channel_i=channel_i+1)
   begin
    calc_freq
    #
    (
        .CLK_FREQ(CLK_FREQ),
        .WIDTH(DATA_WIDTH)
    )
    calc_freq_inst
    (
        .clk   (clk            ),
        .resetn(resetn         ),
        .in    (clr[channel_i] ),
        .freq  (freq[channel_i*DATA_WIDTH+:DATA_WIDTH])

    );
   end
endgenerate


endmodule
