`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/24 12:19:44
// Design Name: 
// Module Name: tb_DNA_capture
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


module tb_DNA_capture(

    );



reg sys_clk  ;
reg dna_rdy  ;
wire [56:0]dna_data ;
wire dna_valid;

initial begin
    sys_clk=0;
    dna_rdy=0;

    #100
    dna_rdy=1;
end

always #5 sys_clk=!sys_clk;
    DNA_capture DNA_capture_inst(
    
    .sys_clk    (sys_clk  ),    
    .dna_rdy    (dna_rdy  ),
    .dna_data   (dna_data ),
    .dna_valid  (dna_valid)
);

endmodule
