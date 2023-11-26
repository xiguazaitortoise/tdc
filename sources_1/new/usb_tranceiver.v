`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: anytao
// Create Date: 2021/07/17 14:54:48
// Module Name: usb_tranceiver.v
// Project Name: usb_if
// Target Devices: xc7k325tffg900-2
// Tool Versions: vivado 2017.4
// Description: usb data and instruction transimitter and receiver
// Revision: 0.0
//////////////////////////////////////////////////////////////////////////////////

`include "global.v"
module usb_tranceiver
#
(
    parameter DATA_WIDTH = 32
)
(
    
    input    wire                                      usb_clk     ,
    input    wire                                      usb_rst_n     ,
    input    wire                                      resetn        ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output    wire                                      usb_wr_ready,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input   wire                                      usb_wr_valid,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input   wire     [DATA_WIDTH-1:0]                 usb_wr_data ,    


    (*mark_debug = "true"*) (* dont_touch = "true" *)input   wire                                      usb_rd_ready,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output    wire                                      usb_rd_valid,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output    wire     [DATA_WIDTH-1:0]                 usb_rd_data ,

    input    wire                                      sys_clk     ,



    (*mark_debug = "true"*) (* dont_touch = "true" *)output   wire                                      user_valid  ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output   wire     [DATA_WIDTH-1:0]                 user_data_o ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output   wire                                      user_ready  ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input    wire                                      user_en     ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input    wire     [DATA_WIDTH-1:0]                 user_data_i

);



(*mark_debug = "true"*) (* dont_touch = "true" *)wire                  usb_wr_fifo_empty   ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire                  usb_wr_fifo_full    ;
wire                  usb_wr_fifo_wr_clk  ;
wire                  usb_wr_fifo_rd_clk  ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire                  usb_wr_fifo_rd_en   ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire                  usb_wr_fifo_rst     ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire                  usb_wr_fifo_wr_en   ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire                  usb_wr_fifo_rd_valid;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [DATA_WIDTH-1:0] usb_wr_fifo_data_out;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [DATA_WIDTH-1:0] usb_wr_fifo_data_in ;


(*mark_debug = "true"*) (* dont_touch = "true" *)wire                  usb_rd_fifo_empty   ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire                  usb_rd_fifo_full    ;
wire                  usb_rd_fifo_wr_clk  ;
wire                  usb_rd_fifo_rd_clk  ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire                  usb_rd_fifo_rd_en   ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire                  usb_rd_fifo_rst     ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire                  usb_rd_fifo_wr_en   ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire                  usb_rd_fifo_rd_valid;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [DATA_WIDTH-1:0] usb_rd_fifo_data_out;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [DATA_WIDTH-1:0] usb_rd_fifo_data_in ;

(*mark_debug = "true"*) (* dont_touch = "true" *)wire usb_rd_fifo_almostfull;

assign                  usb_wr_fifo_wr_clk  =usb_clk;
assign                  usb_wr_fifo_rd_clk  =sys_clk;
assign                  usb_wr_fifo_rd_en   =!usb_wr_fifo_empty;
assign                  usb_wr_fifo_rst     =!usb_rst_n;
assign                  usb_wr_fifo_wr_en   =(!usb_wr_fifo_full)&&(usb_wr_ready)&&(usb_wr_valid);
assign                  usb_wr_fifo_rd_valid=!usb_wr_fifo_empty;
assign                  usb_wr_fifo_data_in =usb_wr_data;



assign                  usb_rd_fifo_wr_clk  =sys_clk;
assign                  usb_rd_fifo_rd_clk  =usb_clk;
assign                  usb_rd_fifo_rd_en   =(!usb_rd_fifo_empty)&&(usb_rd_ready);
assign                  usb_rd_fifo_rd_valid = (!usb_rd_fifo_empty)&&(usb_rd_ready);
assign                  usb_rd_fifo_rst     =!resetn;
assign                  usb_rd_fifo_wr_en   =user_en;
assign                  usb_rd_fifo_data_in =user_data_i;

assign usb_wr_ready = !usb_wr_fifo_full;
assign usb_rd_valid = usb_rd_fifo_rd_valid;
assign usb_rd_data = usb_rd_fifo_data_out;


assign user_data_o = usb_wr_fifo_data_out;
assign user_valid = usb_wr_fifo_rd_valid;
assign user_ready=!usb_rd_fifo_almostfull;


   FIFO_DUALCLOCK_MACRO  #(
      .ALMOST_EMPTY_OFFSET(9'h010), // Sets the almost empty threshold
      .ALMOST_FULL_OFFSET(9'h080),  // Sets almost full threshold
      .DATA_WIDTH(32),   // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
      .DEVICE("7SERIES"),  // Target device: "7SERIES" 
      .FIFO_SIZE ("18Kb"), // Target BRAM: "18Kb" or "36Kb" 
      .FIRST_WORD_FALL_THROUGH ("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE" 
   ) usb_wr_fifo_usb_cdc_32x512 (
      .ALMOSTEMPTY(             ), // 1-bit output almost empty
      .ALMOSTFULL (             ),   // 1-bit output almost full
      .DO         (usb_wr_fifo_data_out),                   // Output data, width defined by DATA_WIDTH parameter
      .EMPTY      (usb_wr_fifo_empty   ),             // 1-bit output empty
      .FULL       (usb_wr_fifo_full    ),               // 1-bit output full
      .RDCOUNT    (             ),         // Output read count, width determined by FIFO depth
      .RDERR      (             ),             // 1-bit output read error
      .WRCOUNT    (             ),         // Output write count, width determined by FIFO depth
      .WRERR      (             ),             // 1-bit output write error
      .DI         (usb_wr_fifo_data_in ),                   // Input data, width defined by DATA_WIDTH parameter
      .RDCLK      (usb_wr_fifo_rd_clk  ),             // 1-bit input read clock
      .RDEN       (usb_wr_fifo_rd_en   ),               // 1-bit input read enable
      .RST        (usb_wr_fifo_rst     ),                 // 1-bit input reset
      .WRCLK      (usb_wr_fifo_wr_clk  ),             // 1-bit input write clock
      .WREN       (usb_wr_fifo_wr_en   )                // 1-bit input write enable
   );

   FIFO_DUALCLOCK_MACRO  #(
      .ALMOST_EMPTY_OFFSET(9'h010), // Sets the almost empty threshold
      .ALMOST_FULL_OFFSET(9'h020),  // Sets almost full threshold
      .DATA_WIDTH(32),   // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
      .DEVICE("7SERIES"),  // Target device: "7SERIES" 
      .FIFO_SIZE ("18Kb"), // Target BRAM: "18Kb" or "36Kb" 
      .FIRST_WORD_FALL_THROUGH ("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE" 
   ) usb_rd_fifo_usb_cdc_32x512 (
      .ALMOSTEMPTY(             ), // 1-bit output almost empty
      .ALMOSTFULL (usb_rd_fifo_almostfull             ),   // 1-bit output almost full
      .DO         (usb_rd_fifo_data_out),                   // Output data, width defined by DATA_WIDTH parameter
      .EMPTY      (usb_rd_fifo_empty   ),             // 1-bit output empty
      .FULL       (usb_rd_fifo_full    ),               // 1-bit output full
      .RDCOUNT    (             ),         // Output read count, width determined by FIFO depth
      .RDERR      (             ),             // 1-bit output read error
      .WRCOUNT    (             ),         // Output write count, width determined by FIFO depth
      .WRERR      (             ),             // 1-bit output write error
      .DI         (usb_rd_fifo_data_in ),                   // Input data, width defined by DATA_WIDTH parameter
      .RDCLK      (~usb_rd_fifo_rd_clk  ),             // 1-bit input read clock
      .RDEN       (usb_rd_fifo_rd_en   ),               // 1-bit input read enable
      .RST        (usb_rd_fifo_rst     ),                 // 1-bit input reset
      .WRCLK      (usb_rd_fifo_wr_clk  ),             // 1-bit input write clock
      .WREN       (usb_rd_fifo_wr_en   )                // 1-bit input write enable
   );

endmodule
