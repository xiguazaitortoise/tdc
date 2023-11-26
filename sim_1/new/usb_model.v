`timescale 1ps / 1ps

`include"global.v"
module usb_model
#
(    
    parameter  DATA_WIDTH  = `DATA_WIDTH 
)
(
    output  wire                    usb_rst_n    ,//fpga reset
    input   wire                    usb_pw_en    ,//power enbale
    output   wire                   usb_clk      ,
    inout   wire [DATA_WIDTH-1:0]   usb_data     ,
    inout   wire [DATA_WIDTH/8-1:0] usb_be       ,
    output   wire                   usb_rxf_n    ,
    output   wire                   usb_txf_n    ,
    input  wire                     usb_oe_n     ,
    input  wire                     usb_we_n     ,    
    input  wire                     usb_rd_n     ,
    input  wire                     usb_siwu     ,
    input  wire                     usb_wakeup   ,
    input  wire                     usb_led      
);


    reg usb_rst_n_r;
    reg usb_clk_r;
    reg usb_rxf_n_r;
    reg usb_txf_n_r;

    reg usb_data_oe;
    reg usb_be_oe;

    reg [DATA_WIDTH-1:0]   usb_data_r;
    reg [DATA_WIDTH/8-1:0] usb_be_r;


    assign usb_data=usb_data_oe?usb_data_r:{DATA_WIDTH{1'bz}};
    assign usb_be=usb_be_oe?usb_be_r:{{DATA_WIDTH/8}{1'bz}};

    initial begin
        usb_rxf_n_r=1;
        usb_txf_n_r=1;
        usb_data_r=0;
        usb_be_r=0;
            usb_data_oe=1'b0;
            usb_be_oe=1'b0;

        usb_rst_n_r=0;
        usb_clk_r=0;

        #1000000
        usb_rst_n_r=1;
        #100000
        usb_rxf_n_r=1'b0;
        #40000
        usb_rxf_n_r=1'b1;

        #100000
        usb_txf_n_r=0;
        #100000
        usb_txf_n_r=1'b1;
    end




    assign usb_rst_n = usb_rst_n_r;
    always #5000 usb_clk_r=~usb_clk_r;
    assign usb_clk = usb_clk_r;
    assign usb_rxf_n = usb_rxf_n_r;
    assign usb_txf_n = usb_txf_n_r;

    always @(posedge usb_clk_r)begin
        if(!((usb_oe_n)||(usb_rd_n)))begin
            usb_data_oe=1'b1;
            usb_be_oe=1'b1;
        usb_data_r=32'hf000_0000;
        usb_be_r<=4'b1111;
        usb_be_r=0;
        end
        else begin            
            usb_data_oe=1'b0;
            usb_be_oe=1'b0;
        end
    end



endmodule
