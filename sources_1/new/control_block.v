`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/08/11 15:11:54
// Module Name   : control_block.v
// Project Name  : control_block.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : control clear and write
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////
module control_block
(
    input  wire                     clk         ,   
    input  wire                     clr         ,
    output wire                     latch
);


reg clr_r=1'b0;


always @(posedge clk)begin
  clr_r<=clr;
end

assign latch = (clr)&&(!clr_r);


endmodule
