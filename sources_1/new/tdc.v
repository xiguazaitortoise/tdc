`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/08/11 10:15:34
// Module Name   : tdc.v
// Project Name  : tdc.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : tdc top (Today is my girlfriend's birthday)
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////
`include"global.v"
module tdc
#
(
    parameter  INSTR_WIDTH = `INSTR_WIDTH,
    parameter  ADDR_WIDTH  = `ADDR_WIDTH ,
    parameter  DATA_WIDTH  = `DATA_WIDTH ,
    parameter  CHANNEL     = `CHANNEL    ,
    parameter  CLK_FREQ    = `CLK_FREQ 
)
(
    input   wire                    sys_clk_p,
    input   wire                    sys_clk_n,
    `ifdef HIT_FROM_IO
    input   wire    [CHANNEL-1:0]   hit      ,
    `endif
    //  usb fifo interface     
    input   wire                   usb_rst_n    ,//fpga reset
    output  wire                   usb_pw_en    ,//power enbale
    input   wire                   usb_clk      ,
    inout   wire [DATA_WIDTH-1:0]  usb_data     ,
    inout   wire [DATA_WIDTH/8-1:0]usb_be       ,
    input   wire                   usb_rxf_n    ,
    input   wire                   usb_txf_n    ,
    output  wire                   usb_oe_n     ,
    output  wire                   usb_we_n     ,    
    output  wire                   usb_rd_n     ,
    output  wire                   usb_siwu     ,
    output  wire                   usb_wakeup   ,
    output  wire                   usb_led      ,
    //board info
    output  wire [3:0]             led            
);



`ifdef HIT_FROM_INTERNAL
wire [CHANNEL-1:0]   hit      ;
reg [7:0] div_cnt;

always @(posedge clk_100M) begin
    if(!clk_100M_lock)begin
      div_cnt<=8'd0;
    end
    else begin
      div_cnt<=div_cnt+1'b1;
    end
end


assign hit[0] = div_cnt[5];
assign hit[1] = div_cnt[4];
`endif
//////////////////////////////////////////////////////////////////////////////
//instr signal declaration
//////////////////////////////////////////////////////////////////////////////

wire                     channel0_on    ;
wire                     channel1_on    ;
wire                     channel2_on    ;
wire                     channel3_on    ;
wire                     channel4_on    ;
wire                     channel5_on    ;
wire                     channel6_on    ;
wire                     channel7_on    ;
wire [DATA_WIDTH-1:0]    channel_on     ;

assign channel_on={     channel7_on
                     ,  channel6_on
                     ,  channel5_on
                     ,  channel4_on
                     ,  channel3_on
                     ,  channel2_on
                     ,  channel1_on
                     ,  channel0_on
};

//////////////////////////////////////////////////////////////////////////////
//internal signal declaration
//////////////////////////////////////////////////////////////////////////////
wire clk_200M;
wire clk_200M_lock;
wire clk_100M;
wire clk_100M_lock;


//////////////////////////////////////////////////////////////////////////////
//clock_top module declaration
//////////////////////////////////////////////////////////////////////////////

clock_top clock_top_inst(.sys_clk_p(sys_clk_p),.sys_clk_n(sys_clk_n),.clk_200M(clk_200M),.clk_200M_lock(clk_200M_lock),.clk_100M(clk_100M),.clk_100M_lock(clk_100M_lock));


//////////////////////////////////////////////////////////////////////////////
//receive module declaration
//////////////////////////////////////////////////////////////////////////////
wire                                    receive_clk     ;
wire                                    receive_resetn  ;
wire    [INSTR_WIDTH-1       :0]        receive_sel_prc ;
wire    [CHANNEL-1           :0]        receive_hit     ;
wire    [CHANNEL-1           :0]        receive_T0_valid;
wire    [CHANNEL*DATA_WIDTH-1:0]        receive_T0_data ;
wire    [CHANNEL*DATA_WIDTH-1:0]        receive_freq    ;

assign receive_clk     = clk_200M     ;
assign receive_resetn  = clk_200M_lock;
assign receive_sel_prc = 16'd0        ;
assign receive_hit     = hit          ;



receive_top
#
(
    .INSTR_WIDTH (INSTR_WIDTH ),
    .DATA_WIDTH  (DATA_WIDTH  ),
    .CHANNEL     (CHANNEL     ),
    .CLK_FREQ    (CLK_FREQ    )
)
receive_top_inst
(
    .clk     (receive_clk     ),
    .resetn  (receive_resetn  ),
    .sel_prc (receive_sel_prc ),
    .hit     (receive_hit     ),
    .T0_valid(receive_T0_valid),
    .T0_data (receive_T0_data ),
    .freq    (receive_freq    )
);


//////////////////////////////////////////////////////////////////////////////
//mem_top module declaration
//////////////////////////////////////////////////////////////////////////////
wire                                mem_clk      ;
wire                                mem_resetn   ;
wire                                mem_capture  ;
wire                                mem_rd_en    ;
wire                                mem_m_ready  ;
wire [INSTR_WIDTH+INSTR_WIDTH-1:0]  mem_max_count;
wire [INSTR_WIDTH+INSTR_WIDTH-1:0]  mem_max_time ;
wire [CHANNEL-1                :0]  mem_s_valid  ;
wire [DATA_WIDTH*CHANNEL-1     :0]  mem_s_data   ;
wire                                mem_m_valid  ;
wire [DATA_WIDTH-1             :0]  mem_m_data   ;




assign mem_clk       = clk_200M        ;
assign mem_resetn    = clk_200M_lock   ;
assign mem_s_valid   = receive_T0_valid;
// assign mem_s_valid   = receive_T0_valid[1+:(CHANNEL-1)];
assign mem_s_data    = receive_T0_data ;
// assign mem_s_data    = receive_T0_data[DATA_WIDTH+:(CHANNEL-1)*DATA_WIDTH] ;


(*dont_touch = "true"*)mem_top
#
(
    .INSTR_WIDTH (INSTR_WIDTH+INSTR_WIDTH),
    .ADDR_WIDTH  (ADDR_WIDTH             ),
    .DATA_WIDTH  (DATA_WIDTH-ADDR_WIDTH  ),
    .CHANNEL     (CHANNEL                )
)
mem_top_inst
(
    .clk       (mem_clk       ),
    .resetn    (mem_resetn    ),
    .capture   (mem_capture   ),
    .rd_en     (mem_rd_en     ),
    .max_count (mem_max_count ),
    .max_time  (mem_max_time  ),
    .channel_on(channel_on    ),
    .time_en   (mem_s_valid   ),
    .time_addr (mem_s_data    ),
    .m_ready   (mem_m_ready   ),
    .m_valid   (mem_m_valid   ),
    .m_data    (mem_m_data    )
);




//////////////////////////////////////////////////////////////////////////////
//addition module declaration
//////////////////////////////////////////////////////////////////////////////
 wire        addition_clk             ;
 wire        addition_resetn          ;
 wire [15:0] addition_MEASURED_TEMP   ;
 wire [15:0] addition_MEASURED_VCCINT ;
 wire [15:0] addition_MEASURED_VCCAUX ;
 wire [15:0] addition_MEASURED_VCCBRAM;
 wire [15:0] addition_MEASURED_AUX0   ;
 wire [15:0] addition_MEASURED_AUX1   ;
 wire [15:0] addition_MEASURED_AUX2   ;
 wire [15:0] addition_MEASURED_AUX3   ;
 wire [15:0] addition_ALM             ;
 wire        addition_dna_valid       ;
 wire [56:0] addition_dna_data        ;
reg  COPYRIGHT=1'b0;
assign addition_clk = clk_100M;
assign addition_resetn=clk_100M_lock;

always @(posedge addition_clk) begin
    if(!addition_resetn)begin
        COPYRIGHT<=1'b0;
    end
    else if(addition_dna_valid)begin
        COPYRIGHT<=(addition_dna_data==`DNA_CHIP0);
    end
end
(*dont_touch = "true"*)addition addition_inst
(
    .clk             (addition_clk             ),
    .resetn          (addition_resetn          ),
    .MEASURED_TEMP   (addition_MEASURED_TEMP   ),
    .MEASURED_VCCINT (addition_MEASURED_VCCINT ),
    .MEASURED_VCCAUX (addition_MEASURED_VCCAUX ),
    .MEASURED_VCCBRAM(addition_MEASURED_VCCBRAM),
    .MEASURED_AUX0   (addition_MEASURED_AUX0   ),
    .MEASURED_AUX1   (addition_MEASURED_AUX1   ),
    .MEASURED_AUX2   (addition_MEASURED_AUX2   ),
    .MEASURED_AUX3   (addition_MEASURED_AUX3   ),
    .ALM             (addition_ALM             ),
    .dna_valid       (addition_dna_valid       ),
    .dna_data        (addition_dna_data        )

);


//////////////////////////////////////////////////////////////////////////////
// transmit_top module declaration
//////////////////////////////////////////////////////////////////////////////
wire                  transmit_clk                   ;
wire                  transmit_resetn                ;
wire                  transmit_valid                 ;
wire                  transmit_ready                 ;
wire [DATA_WIDTH-1:0] transmit_data                  ;


wire                     transmit_capture        ;
wire                     transmit_rd_en_instr    ;
wire     [DATA_WIDTH-1:0]transmit_max_count      ;
wire     [DATA_WIDTH-1:0]transmit_max_time       ;
wire    [CHANNEL*DATA_WIDTH-1:0]        transmit_freq    ;


assign                transmit_clk   = clk_200M      ;
assign                transmit_resetn=clk_200M_lock  ;
assign                transmit_valid = mem_m_valid   ;
assign                transmit_data  = mem_m_data    ;
assign                mem_m_ready    = transmit_ready;

assign   mem_capture   = transmit_capture        ;
assign   mem_rd_en     = transmit_rd_en_instr    ;
assign   mem_max_count = transmit_max_count      ;
assign   mem_max_time  = transmit_max_time       ;
assign   transmit_freq = receive_freq            ;

(*dont_touch = "true"*)transmit_top
#
(
    .ADDR_WIDTH (ADDR_WIDTH),
    .DATA_WIDTH (DATA_WIDTH),
    .CHANNEL    (CHANNEL)
)
transmit_top_inst
(
    .sys_clk      (transmit_clk ), 
    .resetn       (transmit_resetn),
    .led          (led          ),

    //output control signal
    .capture        (transmit_capture              ),
    .rd_en_instr    (transmit_rd_en_instr          ),
    .max_count      (transmit_max_count            ),
    .max_time       (transmit_max_time             ),   
    .channel0_on    (channel0_on          ),
    .channel1_on    (channel1_on          ),
    .channel2_on    (channel2_on          ),
    .channel3_on    (channel3_on          ),
    .channel4_on    (channel4_on          ),
    .channel5_on    (channel5_on          ),
    .channel6_on    (channel6_on          ),
    .channel7_on    (channel7_on          ), 

    //input control signal
    .freq           (transmit_freq),
    .temp           (addition_MEASURED_TEMP),
    .dna            (addition_dna_data),

    .data_encoder_pre_en   (transmit_valid),
    .data_encoder_pre_ready(transmit_ready),
    .data_encoder_pre_data (transmit_data),

    .usb_rst_n    (usb_rst_n    ),
    .usb_pw_en    (usb_pw_en    ),
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
