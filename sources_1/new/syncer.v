`timescale 1ns / 1ps

module syncer# (
  parameter DP = 2,
  parameter DW = 32,
  parameter RST_VAL = {DW{1'b0}}
) (
  input  [DW-1:0] din_a,
  output [DW-1:0] dout,

  input           rst_n,
  input           clk
);

  wire [DW-1:0] sync_dat [DP-1:0];

  genvar i;

  generate
  for(i=0;i<DP;i=i+1) begin:gen_sync
    if(i==0) begin:gen_i_is_0
      dffrs #(DW, RST_VAL) sync_dffrs(din_a,         sync_dat[0], clk, rst_n);
    end
    else begin:gen_i_is_not_0
      dffrs #(DW, RST_VAL) sync_dffrs(sync_dat[i-1], sync_dat[i], clk, rst_n);
    end
  end
  endgenerate

  assign dout = sync_dat[DP-1];
endmodule



module dffrs # (
  parameter DW   = 32
, parameter [DW-1:0]  RST  = {DW{1'b1}}
) (
  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout,

  input               clk,
  input               rst_n
);
reg [DW-1:0] qout_r;

always @(posedge clk or negedge rst_n)
begin : DFF_PROC
  if (rst_n == 1'b0)
    qout_r <= RST;
  else
    qout_r <= dnxt;
end

assign qout = qout_r[DW-1:0];

endmodule
