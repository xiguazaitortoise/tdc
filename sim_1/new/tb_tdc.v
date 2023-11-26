`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/07/06 19:27:48
// Module Name   : tb_tdc.v
// Project Name  : tb_tdc.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : we are eating dinner for birthday.
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////

`include"global.v"
module tb_tdc();

    parameter  INSTR_WIDTH = `INSTR_WIDTH;
    parameter  DATA_WIDTH  = `DATA_WIDTH ;
    parameter  CHANNEL     = `CHANNEL    ;
    parameter  CLK_FREQ    = `CLK_FREQ   ;
    parameter PERIOD = 10000;

    parameter PERIOD_START = 1000000;
    parameter PERIOD_STOP0  = 500000;
    parameter PERIOD_STOP1  = 300000;

    wire                     usb_rst_n      ;
    wire                     usb_pw_en      ;
    wire                     usb_clk        ;
    wire [DATA_WIDTH-1:0]    usb_data       ;
    wire [DATA_WIDTH/8-1:0]  usb_be         ;
    wire                     usb_rxf_n      ;
    wire                     usb_txf_n      ;
    wire                     usb_oe_n       ;
    wire                     usb_we_n       ;
    wire                     usb_rd_n       ;
    wire                     usb_siwu       ;
    wire                     usb_wakeup     ;
    wire                     usb_led        ;



    reg sys_clk_p;
    wire sys_clk_n;
    reg [2:0] hit;


    always #(PERIOD/2) sys_clk_p = ~sys_clk_p;
    assign sys_clk_n = !sys_clk_p;

    // always #(PERIOD_START/2) hit[0] = !hit[0];
    always #(PERIOD_STOP0/2) hit[1] = !hit[1];
    always #(PERIOD_STOP1/2) hit[2] = !hit[2];
    initial begin
        sys_clk_p=0;
        #10000
        hit=0;
        #400000
        hit[0]=0;
        #10
        hit[0]=1;
        #10
        hit[0]=0;
        #3000000
        hit[0]=0;
        #10
        hit[0]=1;
        #10
        hit[0]=0;
    end
tdc
#
(
    .INSTR_WIDTH (INSTR_WIDTH ),
    .DATA_WIDTH  (DATA_WIDTH  ),
    .CHANNEL     (CHANNEL     ),
    .CLK_FREQ    (CLK_FREQ    )
)
tdc_inst
(
    .sys_clk_p(sys_clk_p),
    .sys_clk_n(sys_clk_n),
    .hit      (hit      ),
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



usb_model
#
(    
    .DATA_WIDTH  (DATA_WIDTH  )
)
usb_model_inst
(
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
