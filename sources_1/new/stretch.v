`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/08/11 14:49:52
// Design Name: 
// Module Name: stretch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/07/06 19:27:48
// Module Name   : stretch.v
// Project Name  : stretch.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : Once the hit signal occurs at a channel,
//                 its falling edge is stetched
//                 aligned to the next rising of running clock
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////
module stretch
( 
    input  wire                     clr                 , 
    input  wire                     hit                 ,
    output reg                     stretch_hit      =1'b0
);


// assign stretch_hit = clr ? 1'b0 : hit ;
always @(*) begin
    // if(clr)begin
    //     stretch_hit<=1'b0;
    // end
    // else if(hit)begin
    //     stretch_hit<=1'b1;
    // end

    
    if(hit)begin
        stretch_hit=1'b1;
    end
    else if(clr)begin
        stretch_hit=1'b0;
    end

end

endmodule
