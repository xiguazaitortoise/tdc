`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/08/11 15:08:15
// Module Name   : coarse_cnt.v
// Project Name  : coarse_cnt.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : coarse count time
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////

module coarse_cnt
#
(    
    parameter  DATA_WIDTH  = 32
)
(
    input  wire                     clk         ,   
    input  wire                     clr         ,
    input  wire                     latch       ,
    output reg   [DATA_WIDTH-1 :0]  coarse_time            
);

    reg [DATA_WIDTH-1:0]  clk_cnt={{DATA_WIDTH}{1'b0}};


    always @(posedge clk)begin   
        if(clr&&latch)begin
            clk_cnt[DATA_WIDTH-1:0]<={{DATA_WIDTH}{1'b0}};
            coarse_time[DATA_WIDTH-1:0]   <=  clk_cnt[DATA_WIDTH-1:0];
        end 
        else if(clr)begin
            clk_cnt[DATA_WIDTH-1:0]<={{DATA_WIDTH}{1'b0}};
        end
        else if(latch)begin
            coarse_time[DATA_WIDTH-1:0]   <=  clk_cnt[DATA_WIDTH-1:0];
            clk_cnt[DATA_WIDTH-1:0]   <=  clk_cnt[DATA_WIDTH-1:0]+1'b1;
        end    
        else begin
            clk_cnt[DATA_WIDTH-1:0]   <=  clk_cnt[DATA_WIDTH-1:0]+1'b1;
        end
    end


endmodule
