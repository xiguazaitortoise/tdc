`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: anytao
// Create Date: 2021/07/06 19:27:48
// Module Name: RR_arbiter.v
// Project Name: RR_arbiter
// Target Devices: xc7k325tffg900-2
// Tool Versions: vivado 2017.4
// Description: round robin arbiter
// Revision: 0.0
//////////////////////////////////////////////////////////////////////////////////
module RR_arbiter
(
    input  wire             clk   ,
    input  wire             resetn,
    input  wire [7    :0]   req   ,
    output reg  [2    :0]   grant ,
    input  wire [7    :0]   done
);


always @(posedge clk) begin
    if(!resetn)begin
      grant<=3'd0;
    end
    else begin
      case(grant)
        3'd0:begin
               if(req[1]&&done[0])begin grant<=3'd1;end
          else if(req[2]&&done[0])begin grant<=3'd2;end
          else if(req[3]&&done[0])begin grant<=3'd3;end
          else if(req[4]&&done[0])begin grant<=3'd4;end
          else if(req[5]&&done[0])begin grant<=3'd5;end
          else if(req[6]&&done[0])begin grant<=3'd6;end
          else if(req[7]&&done[0])begin grant<=3'd7;end
          else           begin grant<=3'd0;end
        end
        3'd1:begin
               if(req[2]&&done[1])begin grant<=3'd2;end
          else if(req[3]&&done[1])begin grant<=3'd3;end
          else if(req[4]&&done[1])begin grant<=3'd4;end
          else if(req[5]&&done[1])begin grant<=3'd5;end
          else if(req[6]&&done[1])begin grant<=3'd6;end
          else if(req[7]&&done[1])begin grant<=3'd7;end
          else if(req[0]&&done[1])begin grant<=3'd0;end
          else           begin grant<=3'd1;end
        end
        3'd2:begin
               if(req[3]&&done[2])begin grant<=3'd3;end
          else if(req[4]&&done[2])begin grant<=3'd4;end
          else if(req[5]&&done[2])begin grant<=3'd5;end
          else if(req[6]&&done[2])begin grant<=3'd6;end
          else if(req[7]&&done[2])begin grant<=3'd7;end
          else if(req[0]&&done[2])begin grant<=3'd0;end
          else if(req[1]&&done[2])begin grant<=3'd1;end
          else           begin grant<=3'd2;end
        end
        3'd3:begin
               if(req[4]&&done[3])begin grant<=3'd4;end
          else if(req[5]&&done[3])begin grant<=3'd5;end
          else if(req[6]&&done[3])begin grant<=3'd6;end
          else if(req[7]&&done[3])begin grant<=3'd7;end
          else if(req[0]&&done[3])begin grant<=3'd0;end
          else if(req[1]&&done[3])begin grant<=3'd1;end
          else if(req[2]&&done[3])begin grant<=3'd2;end
          else           begin grant<=3'd3;end
        end
        3'd4:begin
               if(req[5]&&done[4])begin grant<=3'd5;end
          else if(req[6]&&done[4])begin grant<=3'd6;end
          else if(req[7]&&done[4])begin grant<=3'd7;end
          else if(req[0]&&done[4])begin grant<=3'd0;end
          else if(req[1]&&done[4])begin grant<=3'd1;end
          else if(req[2]&&done[4])begin grant<=3'd2;end
          else if(req[3]&&done[4])begin grant<=3'd3;end
          else           begin grant<=3'd4;end
        end
        3'd5:begin
               if(req[6]&&done[5])begin grant<=3'd6;end
          else if(req[7]&&done[5])begin grant<=3'd7;end
          else if(req[0]&&done[5])begin grant<=3'd0;end
          else if(req[1]&&done[5])begin grant<=3'd1;end
          else if(req[2]&&done[5])begin grant<=3'd2;end
          else if(req[3]&&done[5])begin grant<=3'd3;end
          else if(req[4]&&done[5])begin grant<=3'd4;end
          else           begin grant<=3'd5;end
        end
        3'd6:begin
               if(req[7]&&done[6])begin grant<=3'd7;end
          else if(req[0]&&done[6])begin grant<=3'd0;end
          else if(req[1]&&done[6])begin grant<=3'd1;end
          else if(req[2]&&done[6])begin grant<=3'd2;end
          else if(req[3]&&done[6])begin grant<=3'd3;end
          else if(req[4]&&done[6])begin grant<=3'd4;end
          else if(req[5]&&done[6])begin grant<=3'd5;end
          else           begin grant<=3'd6;end
        end
        3'd7:begin
               if(req[0]&&done[7])begin grant<=3'd0;end
          else if(req[1]&&done[7])begin grant<=3'd1;end
          else if(req[2]&&done[7])begin grant<=3'd2;end
          else if(req[3]&&done[7])begin grant<=3'd3;end
          else if(req[4]&&done[7])begin grant<=3'd4;end
          else if(req[5]&&done[7])begin grant<=3'd5;end
          else if(req[6]&&done[7])begin grant<=3'd6;end
          else           begin grant<=3'd7;end
        end
        default:begin  grant<=3'd0;end
      endcase
    end
end


endmodule
