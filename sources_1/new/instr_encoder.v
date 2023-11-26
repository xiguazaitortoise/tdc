`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: anytao
// Create Date: 2021/07/06 19:27:48
// Module Name: instr_encoder.v
// Project Name: instr_encoder
// Target Devices: xc7k325tffg900-2
// Tool Versions: vivado 2017.4
// Description: add head and tail for instruct
// Revision: 0.0
//////////////////////////////////////////////////////////////////////////////////
`include "addr.v"
`include "global.v"
module instr_encoder
#
(
    parameter DATA_WIDTH = 32
)
(
    input  wire sys_clk  ,
    input  wire sys_rstn ,
    input  wire pre_en   ,
    input  wire [DATA_WIDTH-1:0]pre_data ,
    output reg  req,
    input  wire grant,
    input wire post_ready,
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
parameter INSTR = 2;
parameter TAIL = 3;
parameter CHECK = 4;

(*mark_debug = "true"*) (* dont_touch = "true" *)reg [DATA_WIDTH-1:0] checksum;

(*mark_debug = "true"*) (* dont_touch = "true" *)reg [7:0] cur_state =8'b0;

always @(posedge sys_clk) begin
    if(!sys_rstn)begin
      cur_state<=IDLE;
    end
    else begin
    case(cur_state)        
        IDLE:
        begin 
            if(pre_en)
            begin 
                cur_state<=HEAD; 
                post_en_r<=1'b0;
                post_data_r<= {{DATA_WIDTH}{1'b0}};
                req<=1'b1;
            end
            else 
            begin 
                cur_state<=IDLE; 
                post_en_r <= 1'b0;
                post_data_r<= {{DATA_WIDTH}{1'b0}};
                checksum <= {{DATA_WIDTH}{1'b0}};
                req<=1'b0;
            end
        end
        HEAD:
        begin 
            if(grant)
            begin 
                req<=1'b0;
                post_en_r <= 1'b1;
                post_data_r<={`INSTR_HEAD};
                checksum<={`INSTR_HEAD};
                cur_state<=INSTR;
            end
            else 
            begin 
                cur_state<=HEAD; 
                post_en_r <= 1'b0;
                checksum <= {{DATA_WIDTH}{1'b0}};
            end
        end
        INSTR:
        begin 
            cur_state<=TAIL; 
            post_en_r <= 1'b1;
            post_data_r<={pre_data_r}; 
            checksum<=checksum+{pre_data_r};
        end
        TAIL:
        begin 
            cur_state<=CHECK;
            post_en_r <= 1'b1;
            post_data_r<={`INSTR_TAIL};
            checksum<=checksum+{`INSTR_TAIL};
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
            post_data_r<= {{DATA_WIDTH}{1'b0}};
            req<=1'b0;
        end
    endcase
    end
end


assign post_en = post_en_r;
assign post_data = post_data_r;



endmodule