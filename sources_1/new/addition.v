`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/08/13 14:04:05
// Module Name   : addition.v
// Project Name  : addition.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : other module
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////
module addition
(
    input wire clk,
    input wire resetn,
    output wire [15:0] MEASURED_TEMP,
    output wire [15:0] MEASURED_VCCINT,
    output wire [15:0] MEASURED_VCCAUX,
    output wire [15:0] MEASURED_VCCBRAM,
    output wire [15:0] MEASURED_AUX0,
    output wire [15:0] MEASURED_AUX1,
    output wire [15:0] MEASURED_AUX2,
    output wire [15:0] MEASURED_AUX3,
    output wire [15:0] ALM        ,
    output wire        dna_valid  ,
    output wire [56:0]dna_data 

);



    wire [3:0]      VAUXP, VAUXN;

    assign DCLK = clk;
    assign RESET = !resetn;



ug480 ug480_inst (
.VAUXP  (VAUXP),
.VAUXN  (VAUXN),
.RESET  (RESET),
.ALM  (ALM),
.DCLK   (DCLK),

.MEASURED_TEMP    (MEASURED_TEMP), 
.MEASURED_VCCINT  (MEASURED_VCCINT), 
.MEASURED_VCCAUX  (MEASURED_VCCAUX),
.MEASURED_VCCBRAM (MEASURED_VCCBRAM),
.MEASURED_AUX0    (MEASURED_AUX0),
.MEASURED_AUX1    (MEASURED_AUX1),
.MEASURED_AUX2    (MEASURED_AUX2),
.MEASURED_AUX3    (MEASURED_AUX3)
);

DNA_capture DNA_capture_inst
(    
    .sys_clk    (clk      ),    
    .dna_rdy    (resetn   ),
    .dna_data   (dna_data ),
    .dna_valid  (dna_valid)
);


endmodule
