`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: anytao
// Create Date: 2021/07/24 13:29:12
// Module Name: data_encoder.v
// Project Name: data_encoder
// Target Devices: xc7k325tffg900-2
// Tool Versions: vivado 2017.4
// Description: add head and tail for data
// Revision: 0.0
//////////////////////////////////////////////////////////////////////////////////
`include "addr.v"
`include "global.v"
module data_encoder
#
(
    parameter DATA_WIDTH = 32
)
(
    input  wire sys_clk  ,
    input  wire sys_rstn ,

    input  wire pre_en   ,
    output reg  pre_ready,
    input  wire [DATA_WIDTH-1:0]pre_data ,
    output reg  req,
    input  wire grant,

    input wire  post_ready,
    output wire post_en  ,
    output wire [DATA_WIDTH-1:0]post_data
);

reg post_en_r = 1'b0;
reg  [DATA_WIDTH-1:0] pre_data_r = {{DATA_WIDTH}{1'b0}};
reg  [DATA_WIDTH-1:0] post_data_r = {{DATA_WIDTH}{1'b0}};


always @(posedge sys_clk) begin
    if(pre_en)begin
    pre_data_r<=pre_data;
    end
end

parameter IDLE = 0;
parameter HEAD = 1;
parameter DATA = 2;
parameter TAIL = 3;
parameter CHECK = 4;

parameter DATA_SIZE = 65536;
reg [DATA_WIDTH-1:0] checksum = {{DATA_WIDTH}{1'b0}};

reg [7:0] cur_state =8'b0;


reg [16:0] data_cnt=17'd0;

always @(posedge sys_clk) begin
    if(!sys_rstn)begin
      cur_state<=IDLE;
    end
    else begin
    case(cur_state)
        IDLE:begin
            if(pre_en)
            begin 
                cur_state<=HEAD; 
                pre_ready<=1'b0;
                post_en_r<=pre_en;
                post_data_r<=pre_data;
                req<=1'b1;
            end
            else 
            begin 
                cur_state<=IDLE; 
                post_en_r<=pre_en;
                pre_ready<=1'b0;
                checksum <= {{DATA_WIDTH}{1'b0}};
                req<=1'b0;
            end
        end
        HEAD:
        begin 
            if(grant)
            begin 
                req<=1'b0;
                pre_ready<=post_ready;
                post_en_r<=pre_en;
                // post_data_r={`DATA_HEAD};
                // checksum=checksum+{`DATA_HEAD};
                checksum <= {{DATA_WIDTH}{1'b0}};
                cur_state<=DATA;
            end
            else 
            begin 
                cur_state<=HEAD; 
                pre_ready<=1'b0;
                post_en_r<=pre_en;
                checksum <= {{DATA_WIDTH}{1'b0}};
            end
        end
        DATA:
        begin
          if(data_cnt==DATA_SIZE)begin      //65536+1 data:from 0 to 65536
            cur_state<=TAIL;
            pre_ready<=1'b1;
            post_en_r <= 1'b1;
            post_data_r<=pre_data;
            checksum<=checksum+pre_data;
          end
          else if(pre_en)begin 
        //   else if(pre_en&&pre_ready)begin            
            cur_state<=DATA;
            post_en_r <= 1'b1;
            post_data_r<=pre_data;
            checksum<=checksum+pre_data;
          end
          else begin
            post_en_r <= 1'b0;
          end
            pre_ready<=post_ready;
        end
        TAIL:
        begin          
            cur_state<=CHECK;
            pre_ready<=1'b0;
            post_en_r <= 1'b1;
            post_data_r<={`DATA_TAIL};
            checksum<=checksum+{`DATA_TAIL};
        end
        CHECK:
        begin
            cur_state<=IDLE; 
            post_en_r <= 1'b1;
            post_data_r<=~checksum;
        end
        default:
        begin 
            cur_state<=IDLE; 
            post_en_r <= 1'b0;
            req<=1'b0;
        end
    endcase
    end
end



always @(posedge sys_clk) begin
    if(!sys_rstn)begin
      data_cnt<=17'h0;
    end
    else if(cur_state==TAIL)begin
      data_cnt<=17'h0;
    end
    else if(pre_en)begin
    // else if((pre_en&&pre_ready)&&(cur_state==DATA))begin
      data_cnt<=data_cnt+1'b1;
    end
end

assign post_en = post_en_r;
assign post_data = post_data_r;

endmodule
