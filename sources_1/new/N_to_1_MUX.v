`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: anytao
// Create Date: 2021/07/06 19:27:48
// Module Name: N_to_1_MUX.v
// Project Name: N_to_1_MUX
// Target Devices: xc7k325tffg900-2
// Tool Versions: vivado 2017.4
// Description: select n channel to 1 channel
// Revision: 0.0
//////////////////////////////////////////////////////////////////////////////////
module N_to_1_MUX
#
(
    parameter DATA_WIDTH=32,
    parameter N = 8
)
(
    input wire                  clk    ,
    input wire                  resetn ,
    

    (*mark_debug = "true"*) (* dont_touch = "true" *)output wire [N-1           :0]                s_ready,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [N-1           :0]                s_valid,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [N*DATA_WIDTH-1:0]                s_data ,

    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [0             :0]                m_ready,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output wire [0             :0]                m_valid,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output wire [DATA_WIDTH-1  :0]                m_data
);


function integer clogb2 (input integer size);
    begin
      size = size - 1;
      for (clogb2=1; size>1; clogb2=clogb2+1)
        size = size >> 1;
    end
endfunction // clogb2


(*mark_debug = "true"*) (* dont_touch = "true" *)wire [N-1        :0] RR_arbiter_req ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [clogb2(N)-1:0] RR_arbiter_grant;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [N-1        :0] RR_arbiter_done;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [N-1        :0] s_ready_r;


assign RR_arbiter_req=s_valid;

assign s_ready_r= (RR_arbiter_grant==3'b000)?8'b00000001:
                  (RR_arbiter_grant==3'b001)?8'b00000010:
                  (RR_arbiter_grant==3'b010)?8'b00000100:
                  (RR_arbiter_grant==3'b011)?8'b00001000:
                  (RR_arbiter_grant==3'b100)?8'b00010000:
                  (RR_arbiter_grant==3'b101)?8'b00100000:
                  (RR_arbiter_grant==3'b110)?8'b01000000:
                  (RR_arbiter_grant==3'b111)?8'b10000000:8'b00000001;

assign RR_arbiter_done=~s_valid;



RR_arbiter RR_arbiter_inst
(
    .clk   (clk   ),
    .resetn(resetn),
    .req   (RR_arbiter_req   ),
    .grant (RR_arbiter_grant ),
    .done  (RR_arbiter_done  )
);



assign s_ready={{N}{m_ready}}&(s_ready_r);



// assign m_valid =(s_ready[0]&&s_valid[0])
//               ||(s_ready[1]&&s_valid[1])
//               ||(s_ready[2]&&s_valid[2])
//               ||(s_ready[3]&&s_valid[3])
//               ||(s_ready[4]&&s_valid[4])
//               ||(s_ready[5]&&s_valid[5])
//               ||(s_ready[6]&&s_valid[6])
//               ||(s_ready[7]&&s_valid[7]);



// assign m_data = (s_ready[0]&&s_valid[0])?s_data[DATA_WIDTH*0+:DATA_WIDTH]:
//                 (s_ready[1]&&s_valid[1])?s_data[DATA_WIDTH*1+:DATA_WIDTH]:
//                 (s_ready[2]&&s_valid[2])?s_data[DATA_WIDTH*2+:DATA_WIDTH]:
//                 (s_ready[3]&&s_valid[3])?s_data[DATA_WIDTH*3+:DATA_WIDTH]:
//                 (s_ready[4]&&s_valid[4])?s_data[DATA_WIDTH*4+:DATA_WIDTH]:
//                 (s_ready[5]&&s_valid[5])?s_data[DATA_WIDTH*5+:DATA_WIDTH]:
//                 (s_ready[6]&&s_valid[6])?s_data[DATA_WIDTH*6+:DATA_WIDTH]:
//                 (s_ready[7]&&s_valid[7])?s_data[DATA_WIDTH*7+:DATA_WIDTH]:s_data[DATA_WIDTH*0+:DATA_WIDTH];





assign m_valid =(s_valid[0])
              ||(s_valid[1])
              ||(s_valid[2])
              ||(s_valid[3])
              ||(s_valid[4])
              ||(s_valid[5])
              ||(s_valid[6])
              ||(s_valid[7]);


assign m_data = (s_valid[0])?s_data[DATA_WIDTH*0+:DATA_WIDTH]:
                (s_valid[1])?s_data[DATA_WIDTH*1+:DATA_WIDTH]:
                (s_valid[2])?s_data[DATA_WIDTH*2+:DATA_WIDTH]:
                (s_valid[3])?s_data[DATA_WIDTH*3+:DATA_WIDTH]:
                (s_valid[4])?s_data[DATA_WIDTH*4+:DATA_WIDTH]:
                (s_valid[5])?s_data[DATA_WIDTH*5+:DATA_WIDTH]:
                (s_valid[6])?s_data[DATA_WIDTH*6+:DATA_WIDTH]:
                (s_valid[7])?s_data[DATA_WIDTH*7+:DATA_WIDTH]:s_data[DATA_WIDTH*0+:DATA_WIDTH];


endmodule
