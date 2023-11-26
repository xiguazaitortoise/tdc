`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/08/11 15:16:21
// Module Name   : d_flip_flop.v
// Project Name  : d_flip_flop.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : D-register
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////
module d_flip_flop
(
    input  wire                     clk       , 
    input  wire    [399:0]          delay_tap , 
    output wire    [399:0]          step_data  
);

genvar i;
generate
    for(i=0; i<400; i=i+1) begin:FF_DELAY
    FDCE #(
        .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
    ) FDCE_inst (
        .Q(step_data[i]),      // 1-bit Data output
        .C(clk),                // 1-bit Clock input
        .CE(1'b1),              // 1-bit Clock enable input
        .CLR(1'b0),             // 1-bit Asynchronous clear input
        .D(delay_tap[i])       // 1-bit Data input
    );
    end
endgenerate


endmodule
