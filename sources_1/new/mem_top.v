`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 
// Module Name   : mem_top.v
// Project Name  : mem_top.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : memory read and write
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////
`include"global.v"
module mem_top
#
(
    parameter INSTR_WIDTH = 32,
    parameter ADDR_WIDTH = 16,
    parameter DATA_WIDTH = 16,
    parameter  CHANNEL= 8
)
(
    input  wire                                                clk       ,
    input  wire                                                resetn    ,
    input  wire                                                capture   ,
    input  wire                                                rd_en     ,
    input  wire [INSTR_WIDTH-1                     :0]         max_count ,
    input  wire [INSTR_WIDTH-1                     :0]         max_time  ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [INSTR_WIDTH-1                     :0]         channel_on,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [CHANNEL-1                         :0]         time_en   ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [(ADDR_WIDTH+DATA_WIDTH)*CHANNEL-1 :0]         time_addr ,
    input  wire                                                m_ready   ,
    output wire                                                m_valid   ,
    output wire [ADDR_WIDTH+DATA_WIDTH-1           :0]         m_data
);



wire [CHANNEL-1                        :0] ready  ;
wire [CHANNEL-1                        :0] valid  ;
wire [(ADDR_WIDTH+DATA_WIDTH)*CHANNEL-1:0] data   ;
wire [CHANNEL-1                        :0] s_ready;
wire [CHANNEL-1                        :0] s_valid;
wire [(ADDR_WIDTH+DATA_WIDTH)*CHANNEL-1:0] s_data ;

wire [15:0] channel_num;
    genvar i;
    generate
    for(i=1;i<CHANNEL;i=i+1)begin
        assign channel_num = i;
        sram_top
        #
        (
            .INSTR_WIDTH (INSTR_WIDTH ) ,
            .ADDR_WIDTH  (ADDR_WIDTH  ) ,
            .DATA_WIDTH  (DATA_WIDTH  ) 
        )
        sram_top_inst
        (
            .clk       (clk       ),
            .resetn    (resetn    ),
            .time_en   (time_en   [i]&&channel_on[i]),
            .time_addr (time_addr [(i*(ADDR_WIDTH+DATA_WIDTH))+:(DATA_WIDTH)]),
            .capture   (capture   ),
            .rd_en     (rd_en     ),
            .max_count (max_count ),
            .max_time  (max_time  ),
            .header    ({`DATA_HEAD,channel_num}),
            .ready     (ready     [i]),
            .valid     (valid     [i]),
            .data      (data      [(i*(ADDR_WIDTH+DATA_WIDTH))+:(ADDR_WIDTH+DATA_WIDTH)])
        );
    end
    endgenerate




    assign ready[1+:(CHANNEL-1)]=s_ready[0+:(CHANNEL-1)];
    assign s_valid[0+:(CHANNEL-1)]=valid[1+:(CHANNEL-1)];
    assign s_data[(ADDR_WIDTH+DATA_WIDTH)*0+:(CHANNEL-1)*(ADDR_WIDTH+DATA_WIDTH)]=data[(ADDR_WIDTH+DATA_WIDTH)*1+:(CHANNEL-1)*(ADDR_WIDTH+DATA_WIDTH)];


    (*dont_touch = "true"*)N_to_1_MUX
    #
    (
        .DATA_WIDTH(ADDR_WIDTH+DATA_WIDTH),
        .N(CHANNEL-1)
    )
    N_to_1_MUX_inst
    (
        .clk    (clk    ),
        .resetn (resetn ),
        .s_ready(s_ready),
        .s_valid(s_valid),
        .s_data (s_data ),
        .m_ready(m_ready),
        .m_valid(m_valid),
        .m_data (m_data )
    );

endmodule
