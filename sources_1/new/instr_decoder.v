`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: anytao
// Create Date: 2021/07/17 17:09:07
// Module Name: instr_decoder.v
// Project Name: usb_if
// Target Devices: xc7k325tffg900-2
// Tool Versions: vivado 2017.4
// Description: decode usb addr and data
// Revision: 0.0
//////////////////////////////////////////////////////////////////////////////////
`include "addr.v"
`include "global.v"
module instr_decoder
#
(
    parameter ADDR_WIDTH = 16,
    parameter DATA_WIDTH = 32,
    parameter CHANNEL = 8
)
(
    input     wire                     sys_clk        ,
    input     wire     [DATA_WIDTH-1:0]usb_data       ,
    input     wire                     usb_en         ,



    (*mark_debug = "true"*) (* dont_touch = "true" *) output    wire                     user_valid     ,
    (*mark_debug = "true"*) (* dont_touch = "true" *) output    wire     [DATA_WIDTH-1:0]user_data      ,

    input    wire   [DATA_WIDTH*CHANNEL-1:0]                  freq        ,
    input    wire   [DATA_WIDTH        -1:0]                  temp        ,
    input    wire   [3*DATA_WIDTH      -1:0]                  dna         ,
    

    output    reg                     capture        ,
    output    reg                     rd_en_instr    ,
    output    reg     [DATA_WIDTH-1:0]max_count      ,
    output    reg     [DATA_WIDTH-1:0]max_time       ,
    output    reg                     channel0_on    ,
    output    reg                     channel1_on    ,
    output    reg                     channel2_on    ,
    output    reg                     channel3_on    ,
    output    reg                     channel4_on    ,
    output    reg                     channel5_on    ,
    output    reg                     channel6_on    ,
    output    reg                     channel7_on    ,

    output    reg     [ADDR_WIDTH-1:0]led
);


/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////usb bus data sync  //////////////////////////////////////
    (*mark_debug = "true"*) (* dont_touch = "true" *)reg usb_en_r0 =1'b0;
    (*mark_debug = "true"*) (* dont_touch = "true" *)reg [DATA_WIDTH-1:0] usb_data_r0 = {DATA_WIDTH{1'b0}};
    always @(posedge sys_clk) begin 
        usb_en_r0<=usb_en;     
        usb_data_r0<=usb_data;  
    end


    reg  update_en =1'b0;


    reg user_valid_r = 1'b0;
    reg [DATA_WIDTH-1:0]user_data_r = {DATA_WIDTH{1'b0}};


///////////////////////////////////////////////////////////////////////////////////////// 
///////////////////////////// usb addr decoder  ///////////////////////////////////////// 
    always @(posedge sys_clk) begin 
        if(usb_en_r0)begin
            case(usb_data_r0[ADDR_WIDTH+:ADDR_WIDTH])
                //genreal addr decoder
                `GENERAL_WR_UPDATE      :begin update_en                        <= usb_data_r0[0+:1];         end
                `GENERAL_WR_LED         :begin led                              <= usb_data_r0[0+:ADDR_WIDTH];end
                `GENERAL_WR_CAPTURE     :begin capture                          <= usb_data_r0[0+:1];         end
                `GENERAL_WR_READ_INSTR  :begin rd_en_instr                      <= usb_data_r0[0+:1];         end
                `GENERAL_WR_MAX_COUNT_L :begin max_count[0+:ADDR_WIDTH]         <= usb_data_r0[0+:ADDR_WIDTH];end
                `GENERAL_WR_MAX_COUNT_H :begin max_count[ADDR_WIDTH+:ADDR_WIDTH]<= usb_data_r0[0+:ADDR_WIDTH];end
                `GENERAL_WR_MAX_TIME_L  :begin max_time[0+:ADDR_WIDTH]          <= usb_data_r0[0+:ADDR_WIDTH];end
                `GENERAL_WR_MAX_TIME_H  :begin max_time[ADDR_WIDTH+:ADDR_WIDTH] <= usb_data_r0[0+:ADDR_WIDTH];end



                //read data
                `GENERAL_RD_VERSION:begin user_valid_r<=1'b1; user_data_r<= {`VERSION}; end 
                `GENERAL_RD_PRODUCT:begin user_valid_r<=1'b1; user_data_r<= {`PAODUCT_MODEL}; end 
                `GENERAL_RD_TEMP   :begin user_valid_r<=1'b1; user_data_r<= temp; end 
                `GENERAL_RD_DNA0   :begin user_valid_r<=1'b1; user_data_r<= dna[DATA_WIDTH*0+:DATA_WIDTH]; end 
                `GENERAL_RD_DNA1   :begin user_valid_r<=1'b1; user_data_r<= dna[DATA_WIDTH*1+:DATA_WIDTH]; end 
                `GENERAL_RD_DNA2   :begin user_valid_r<=1'b1; user_data_r<= dna[DATA_WIDTH*2+:DATA_WIDTH]; end 




                //write channel info
                `CHANNEL0_ON      :begin  channel0_on<= usb_data_r0[0+:1]; end
                `CHANNEL1_ON      :begin  channel1_on<= usb_data_r0[0+:1]; end
                `CHANNEL2_ON      :begin  channel2_on<= usb_data_r0[0+:1]; end
                `CHANNEL3_ON      :begin  channel3_on<= usb_data_r0[0+:1]; end
                `CHANNEL4_ON      :begin  channel4_on<= usb_data_r0[0+:1]; end
                `CHANNEL5_ON      :begin  channel5_on<= usb_data_r0[0+:1]; end
                `CHANNEL6_ON      :begin  channel6_on<= usb_data_r0[0+:1]; end
                `CHANNEL7_ON      :begin  channel7_on<= usb_data_r0[0+:1]; end

                //read channel info
                
                `CHANNEL0_FREQ:begin user_valid_r<=1'b1; user_data_r<= freq[DATA_WIDTH*0+:DATA_WIDTH]; end 
                `CHANNEL1_FREQ:begin user_valid_r<=1'b1; user_data_r<= freq[DATA_WIDTH*1+:DATA_WIDTH]; end 
                // `CHANNEL2_FREQ:begin user_valid_r<=1'b1; user_data_r<= freq[DATA_WIDTH*2+:DATA_WIDTH]; end 
                // `CHANNEL3_FREQ:begin user_valid_r<=1'b1; user_data_r<= freq[DATA_WIDTH*3+:DATA_WIDTH]; end 
                // `CHANNEL4_FREQ:begin user_valid_r<=1'b1; user_data_r<= freq[DATA_WIDTH*4+:DATA_WIDTH]; end 
                // `CHANNEL5_FREQ:begin user_valid_r<=1'b1; user_data_r<= freq[DATA_WIDTH*5+:DATA_WIDTH]; end 
                // `CHANNEL6_FREQ:begin user_valid_r<=1'b1; user_data_r<= freq[DATA_WIDTH*6+:DATA_WIDTH]; end 
                // `CHANNEL7_FREQ:begin user_valid_r<=1'b1; user_data_r<= freq[DATA_WIDTH*7+:DATA_WIDTH]; end 

                default:begin led   <= {ADDR_WIDTH{1'b0}};user_valid_r<=1'b1; user_data_r<= 32'hffff_ffff;end
            endcase
        end
        else begin
          user_valid_r <=1'b0;
        end
    end




assign user_data = user_data_r;
assign user_valid = user_valid_r;
endmodule
