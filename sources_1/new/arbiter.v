`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: anytao
// Create Date: 2021/07/06 19:27:48
// Module Name: arbiter.v
// Project Name: arbiter.v
// Target Devices: xc7k325tffg900-2
// Tool Versions: vivado 2017.4
// Description: arbiter multi-channel
// Revision: 0.0
//////////////////////////////////////////////////////////////////////////////////

module arbiter
#
(
    parameter NUM = 2,
    parameter DATA_WIDTH = 32
)
(
    input  wire sys_clk                     ,
    input  wire sys_rstn                    ,

    (*mark_debug = "true"*) (* dont_touch = "true" *)input wire [NUM-1           :0] i_req  ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output  reg [NUM-1           :0] o_grant,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [NUM-1           :0] i_en   ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [NUM*DATA_WIDTH-1:0] i_data ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output wire [0               :0] o_valid,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output  wire [DATA_WIDTH-1    :0] o_data
);

(*mark_debug = "true"*) (* dont_touch = "true" *)reg [NUM-1           :0] i_en_r   ={{NUM}{1'b0}};
(*mark_debug = "true"*) (* dont_touch = "true" *)reg [NUM*DATA_WIDTH-1           :0] i_data_r   ={{NUM*DATA_WIDTH}{1'b0}};

(*mark_debug = "true"*) (* dont_touch = "true" *)reg [NUM-1           :0] busy ={{NUM}{1'b0}};


always @(posedge sys_clk)begin
    i_en_r[NUM-1:0]<=i_en[NUM-1:0];
    i_data_r[NUM*DATA_WIDTH-1:0]<=i_data[NUM*DATA_WIDTH-1:0];
end


generate
    genvar i;
    for(i=0;i<NUM;i=i+1)begin
        //busy is signal for tranferring
        always @(posedge sys_clk)begin
            if(!sys_rstn)begin
                busy[i]<=1'b0;
            end
            else if(i_en[i]&&(!i_en_r[i]))begin
                busy[i]<=1'b1;
            end
            else if((!i_en[i])&&(i_en_r[i]))begin
                busy[i]<=1'b0;
            end
        end

    end
endgenerate



always @(posedge sys_clk)begin
    if(!sys_rstn)begin
        o_grant[0]<=1'b0;
        o_grant[1]<=1'b0;
    end
    else if((i_req[0])&&(!i_en[1]))begin
        o_grant[0]<=1'b1;
        o_grant[1]<=1'b0;
    end
    else if(i_req[1]&&(!i_en[0]))begin
        o_grant[0]<=1'b0;
        o_grant[1]<=1'b1;
    end
    else if((!i_en[0]) || (!i_en[1]))begin
        o_grant[0]<=1'b0;
        o_grant[1]<=1'b0;
    end
end


assign o_valid = busy[0]?i_en_r[0]:
                 busy[1]?i_en_r[1]:1'b0;




assign o_data = busy[0]?i_data_r[0*DATA_WIDTH+:DATA_WIDTH]:
                busy[1]?i_data_r[1*DATA_WIDTH+:DATA_WIDTH]:{{DATA_WIDTH}{1'b0}};




endmodule
