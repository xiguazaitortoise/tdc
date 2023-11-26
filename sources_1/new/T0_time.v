`timescale 1ps / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 2021/08/11 16:30:24
// Module Name   : T0_time.v
// Project Name  : T0_time.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : T0_time = stop time - start time
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////
`include"global.v"
module T0_time
#
(
    parameter  DATA_WIDTH  = 32
)
(
    input  wire                 clk              ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire                 start_en         ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [DATA_WIDTH-1:0]start_coarse_data,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [DATA_WIDTH-1:0]start_fine_data  ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire                 stop_en          ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [DATA_WIDTH-1:0]stop_coarse_data ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [DATA_WIDTH-1:0]stop_fine_data   ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output wire                 valid            ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output wire [DATA_WIDTH-1:0]data             
);


(*mark_debug = "true"*) (* dont_touch = "true" *)reg [DATA_WIDTH-1:0] delta_coarse_data;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg [DATA_WIDTH-1:0] delta_fine_data;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg [1:0]stop_en_r;
always @(posedge clk) begin
    if(start_en)begin
        delta_coarse_data<={DATA_WIDTH{1'b0}};
        delta_fine_data<={DATA_WIDTH{1'b0}};
    end
    else if(stop_en)begin
        if(stop_coarse_data>start_coarse_data)
            delta_coarse_data<=stop_coarse_data-start_coarse_data;
        // else
        //     delta_coarse_data<=stop_coarse_data-start_coarse_data;

        
        if(stop_fine_data>start_fine_data)
            delta_fine_data<=stop_fine_data-start_fine_data;
        // else
        //     delta_fine_data<=start_fine_data-stop_fine_data;
    end
end



always @(posedge clk) begin
    stop_en_r[1:0]<={stop_en_r[0],stop_en};
end
`ifdef TDC_SIM
assign data = (delta_coarse_data*357)+delta_fine_data;
`elsif TDC_SYN
//5000ps/13.5ps=370
//'d370='b1_0111_0010
//assign data = (delta_coarse_data*370)+delta_fine_data;

assign data = {delta_coarse_data,8'b0000_0000}+
{delta_coarse_data,6'b00_0000} +
{delta_coarse_data,5'b0_0000} +
{delta_coarse_data,4'b0000} +
{delta_coarse_data,1'b0} +delta_fine_data;
`endif

assign valid = (stop_en_r[1:0]==2'b01);


endmodule

