`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: anytao
// Create Date: 2021/07/06 19:27:48
// Module Name: usb_if.v
// Project Name: usb_if
// Target Devices: xc7k325tffg900-2
// Tool Versions: vivado 2017.4
// Description: ft601 usb controller
// Revision: 0.0
//////////////////////////////////////////////////////////////////////////////////

`include "global.v"

module usb_if
#
(
    parameter DATA_WIDTH = 32
)
(
    input  wire                   usb_rst_n    ,//fpga reset
    output  wire                  usb_pw_en    ,//power enbale

    //  user interface
      (*mark_debug = "true"*) (* dont_touch = "true" *) input   wire                   usb_wr_ready,
      (*mark_debug = "true"*) (* dont_touch = "true" *) output  wire                    usb_wr_valid,
      (*mark_debug = "true"*) (* dont_touch = "true" *) output  wire [DATA_WIDTH-1:0]   usb_wr_data,

    
   (*mark_debug = "true"*) (* dont_touch = "true" *) output wire                    usb_rd_ready,
   (*mark_debug = "true"*) (* dont_touch = "true" *) input  wire                   usb_rd_valid,
   (*mark_debug = "true"*) (* dont_touch = "true" *) input  wire [DATA_WIDTH-1:0]  usb_rd_data,

    //  usb fifo interface     
    input  wire                   usb_clk      ,
    inout  wire [DATA_WIDTH-1:0]  usb_data     ,
    inout  wire [DATA_WIDTH/8-1:0]usb_be       ,
    (*mark_debug = "true"*) (* dont_touch = "true" *) input  wire                   usb_rxf_n    ,   
    (*mark_debug = "true"*) (* dont_touch = "true" *) input  wire                   usb_txf_n    ,
    output wire                   usb_oe_n     ,
    (*mark_debug = "true"*) (* dont_touch = "true" *) output wire                   usb_we_n     ,    
    (*mark_debug = "true"*) (* dont_touch = "true" *) output wire                   usb_rd_n     ,
    output wire                   usb_siwu     ,
    output wire                   usb_wakeup   ,
    output wire                   usb_led     
);


parameter USB_FIFO_SIZE = 1024;


(*mark_debug = "true"*) (* dont_touch = "true" *)reg  usb_oe_n_r = 1'b1;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg  usb_rd_n_r = 1'b1;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire  usb_we_n_r;
// (*mark_debug = "true"*) (* dont_touch = "true" *)reg  usb_we_n_r = 1'b1;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg  usb_txf_n_r = 1'b1;


 
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [DATA_WIDTH-1:0] usb_data_ival ;
wire  usb_data_oe   ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [DATA_WIDTH-1:0] usb_data_oval  ;





wire [DATA_WIDTH/8-1:0] usb_be_ival ;
wire  usb_be_oe   ;
wire [DATA_WIDTH/8-1:0] usb_be_oval  ;


(*mark_debug = "true"*) (* dont_touch = "true" *)reg [DATA_WIDTH-1:0] usb_rd_data_r = {(DATA_WIDTH/8){1'b0}};



//reset synchronous
 (* ASYNC_REG="true" *)reg [1:0]usb_rst_n_asyn =2'b00;
reg usb_rst_n_syn ;

always @(posedge usb_clk)begin
  usb_rst_n_asyn[1:0]<={usb_rst_n_asyn[0],usb_rst_n};
end
always @(posedge usb_clk)begin
  usb_rst_n_syn<=usb_rst_n_asyn[1];
end





//generate usb oe signal timing
always @(posedge usb_clk)begin
    if(!usb_rst_n_syn)begin
      usb_oe_n_r<=1'b1;
    end
    else if(usb_rxf_n)begin
      usb_oe_n_r<=1'b1;
    end
    else if(!usb_rxf_n)begin
      usb_oe_n_r<=1'b0;
    end
end


//generate usb rd signal timing
always @(posedge usb_clk)begin
    if(!usb_rst_n_syn)begin
      usb_rd_n_r<=1'b1;
    end
    else if(usb_rxf_n)begin
      usb_rd_n_r<=1'b1;
    end
    else if((!usb_oe_n_r)&&(usb_wr_ready))begin
      usb_rd_n_r<=1'b0;
    end
    else begin
      usb_rd_n_r<=1'b1;
    end
end

always @(negedge usb_clk)begin
  usb_txf_n_r<=usb_txf_n;
end
// //generate usb we signal timing
// always @(posedge usb_clk)begin
//     if(!usb_rst_n_syn)begin
//       usb_we_n_r<=1'b1;
//     end
//     else if(usb_txf_n)begin
//       usb_we_n_r<=1'b1;
//     end
//     // else if((!usb_txf_n_r))begin
//     else if((!usb_txf_n_r)&&(usb_rd_valid))begin
//       usb_we_n_r<=1'b0;
//     end
//     // else begin
//     //   usb_we_n_r<=1'b1;
//     // end
// end

assign usb_we_n_r = (!usb_rd_valid)&&(usb_txf_n_r);

always @(negedge usb_clk)begin
    if(!usb_rst_n_syn)begin
      usb_rd_data_r<={DATA_WIDTH{1'b0}};
    end
    else begin
      usb_rd_data_r<=usb_rd_data;
    end
end


assign usb_data_ival[DATA_WIDTH-1:0] = usb_data_oe?32'h0:usb_rd_data;

// assign usb_data_ival[DATA_WIDTH-1:0] = usb_data_oe?32'h0:usb_rd_data_r;
assign usb_be_ival[DATA_WIDTH/8-1:0] = usb_be_oe?4'h0:{4'hf};



generate

genvar i ;

for(i=0;i<DATA_WIDTH;i=i+1)begin
   IOBUF #(
      .DRIVE(12), // Specify the output drive strength
      .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
      .IOSTANDARD("DEFAULT"), // Specify the I/O standard
      .SLEW("SLOW") // Specify the output slew rate
   ) iobuf_usb_data (
      .O(usb_data_oval[i]),     // Buffer output
      .IO(usb_data[i]),   // Buffer inout port (connect directly to top-level port)
      .I(usb_data_ival[i]),     // Buffer input
      .T(usb_data_oe)      // 3-state enable input, high=input, low=output
   );
end

endgenerate




generate

genvar j ;

for(j=0;j<(DATA_WIDTH/8);j=j+1)begin
   IOBUF #(
      .DRIVE(12), // Specify the output drive strength
      .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
      .IOSTANDARD("DEFAULT"), // Specify the I/O standard
      .SLEW("SLOW") // Specify the output slew rate
   ) iobuf_usb_be (
      .O(usb_be_oval[j]),     // Buffer output
      .IO(usb_be[j]),   // Buffer inout port (connect directly to top-level port)
      .I(usb_be_ival[j]),     // Buffer input
      .T(usb_be_oe)      // 3-state enable input, high=input, low=output
   );
end

endgenerate


assign usb_oe_n = usb_oe_n_r;
assign usb_rd_n = usb_rd_n_r;
assign usb_we_n = usb_we_n_r;



assign usb_data_oe=usb_txf_n;
assign usb_be_oe=usb_txf_n;


// assign usb_data_oe=usb_we_n_r;
// assign usb_be_oe=usb_we_n_r;

assign usb_pw_en  = 1'b1;    
assign usb_siwu   = 1'b0;
assign usb_wakeup = 1'b1;
assign usb_led    = 1'b0;    




// assign usb_wr_valid = (!usb_oe_n_r) &&(!usb_rd_n);
assign usb_wr_valid = (!usb_rxf_n) &&(!usb_rd_n);
assign usb_wr_data  = usb_data_oval;


// reg usb_rd_ready_r =1'b0;
// always @(posedge usb_clk)begin
//   if(!usb_rst_n_syn)begin
//     usb_rd_ready_r<=1'b0;
//   end
//   else begin
//     usb_rd_ready_r<=!usb_txf_n;
//   end
// end
// assign usb_rd_ready = (!usb_txf_n)&&(usb_rd_ready_r);



// always @(posedge usb_clk)begin
//   if(!usb_rst_n_syn)begin
//     usb_rd_ready<=1'b0;
//   end
//   else begin
//     usb_rd_ready<=(!usb_txf_n_r)&&(!usb_txf_n);
//   end
// end

// assign usb_rd_ready=(!usb_txf_n);




////////////////////////////usb bug is here////////////////////////
(*mark_debug = "true"*) (* dont_touch = "true" *)reg [15:0] usb_fifo_size=16'h0;

always @(negedge usb_clk)begin
  if(!usb_rst_n_syn)begin
    usb_fifo_size<=16'b0;
  end
  else if((usb_txf_n_r)&&(!usb_txf_n))begin
    usb_fifo_size<=16'b0;
  end
  else if(usb_rd_ready&&usb_rd_valid)begin
    usb_fifo_size<=usb_fifo_size+1'b1;
  end
end

//////////////////////////////////////////////////////////////////


assign usb_rd_ready=(!usb_txf_n_r)&&(!usb_txf_n)&&(usb_fifo_size<(USB_FIFO_SIZE));




endmodule
