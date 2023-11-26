`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: anytao
// Create Date: 2021/08/07 18:34:35
// Module Name: calc_freq.v
// Project Name: calc_freq
// Target Devices: xc7k325tffg900-2
// Tool Versions: vivado 2017.4
// Description: calculate clock frequency
// Revision: 0.0
//////////////////////////////////////////////////////////////////////////////////

module calc_freq
#
(
    parameter CLK_FREQ = 200000000,
    parameter WIDTH = 32
)
(
    input wire clk,
    input wire resetn,
    input wire in,
    output reg [WIDTH-1:0]freq
);


reg [WIDTH-1:0] clk_cnt = {{WIDTH}{1'b0}};
reg [WIDTH-1:0] in_cnt = {{WIDTH}{1'b0}};

reg in_reg = 1'b0;
always @(posedge clk)begin
  if(!resetn)begin
    clk_cnt<={{WIDTH}{1'b0}};
  end
  else if(clk_cnt==CLK_FREQ)begin
    clk_cnt<={{WIDTH}{1'b0}};
  end
  else begin
    clk_cnt<=clk_cnt+1'b1;
  end
end



always @(posedge clk)begin
  in_reg<=in;
end


always @(posedge clk)begin
  if(!resetn)begin
    in_cnt<={{WIDTH}{1'b0}};
  end
  else if(clk_cnt==CLK_FREQ)begin
    in_cnt<={{WIDTH}{1'b0}};
    freq<=in_cnt;
  end
  else if(in&&(!in_reg))begin
    in_cnt<=in_cnt+1'b1;
  end
end


endmodule
