`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer      : anytao
// Create Date   : 
// Module Name   : sram_top.v
// Project Name  : sram_top.v
// Target Devices: xc7k325tffg900-2
// Tool Versions : vivado 2017.4
// Description   : sram write and read controller
// Revision      : 0.0
//////////////////////////////////////////////////////////////////////////////////

module sram_top
#
(
    parameter INSTR_WIDTH = 32,
    parameter ADDR_WIDTH = 16,
    parameter DATA_WIDTH = 16
)
(
    input  wire                                     clk       ,
    input  wire                                     resetn    ,
    input  wire                                     time_en   ,
    input  wire [ADDR_WIDTH-1           :0]         time_addr ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire                                     capture   ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire                                     rd_en     ,
    input  wire [INSTR_WIDTH-1          :0]         max_count ,
    input  wire [INSTR_WIDTH-1          :0]         max_time  ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire [ADDR_WIDTH+DATA_WIDTH-1:0]         header    ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)input  wire                                     ready     ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output wire                                     valid     ,
    (*mark_debug = "true"*) (* dont_touch = "true" *)output wire [ADDR_WIDTH+DATA_WIDTH-1:0]         data 
);

localparam ADDR_WIDTH_A = ADDR_WIDTH;
localparam ADDR_WIDTH_B = ADDR_WIDTH;
localparam BYTE_WRITE_WIDTH_A = DATA_WIDTH                 ;
localparam WRITE_DATA_WIDTH_A = DATA_WIDTH                 ;
localparam READ_DATA_WIDTH_B  = DATA_WIDTH                 ;
localparam MEMORY_SIZE        = DATA_WIDTH*(1<<ADDR_WIDTH_A);
localparam DATANUM = (1<<ADDR_WIDTH);
wire                            clka                         ;
wire                            clkb                         ;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg                             ena                          ;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg                             enb                          ;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg                             enb_r                        ;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg  [ADDR_WIDTH_A-1      :0]   addra                        ;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg  [ADDR_WIDTH_B-1      :0]   addrb                        ;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg  [WRITE_DATA_WIDTH_A-1:0]   dina                         ;
(*mark_debug = "true"*) (* dont_touch = "true" *)wire [READ_DATA_WIDTH_B-1 :0]   doutb                        ;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg                             rstb                         ;

assign clka = clk;
assign clkb = clk;

(*mark_debug = "true"*) (* dont_touch = "true" *)reg  [ADDR_WIDTH_B-1      :0]   addrb_r                     ;

(*mark_debug = "true"*) (* dont_touch = "true" *)reg [ADDR_WIDTH_A:0] data_cnt = {{ADDR_WIDTH_A+1}{1'b0}};

(*mark_debug = "true"*) (* dont_touch = "true" *)reg   [1                      :0]         capture_r   =2'b00  ;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg   [1                      :0]         rd_en_r     =2'b00  ;
reg   [INSTR_WIDTH-1          :0]         max_count_r =0      ;
reg   [INSTR_WIDTH-1          :0]         max_time_r  =0      ;

always @(posedge clk)begin
    capture_r[1:0]<={capture_r[0],capture};
    rd_en_r[1:0]<={rd_en_r[0],rd_en};
    max_count_r<=max_count;
    max_time_r<=max_time;
end

//input stop number cnt
reg [31:0] num_cnt = 32'd0;
reg [31:0] time_cnt = 32'd0;
(*mark_debug = "true"*) (* dont_touch = "true" *)reg        finish   = 1'b0  ;
//finish signal
always @(posedge clk)begin
  if(!resetn)begin
    finish<=1'd0;
  end
  // else if((num_cnt==max_count_r)||(time_cnt==max_time_r)||(capture_r[1:0]==2'b10))begin
  else if((capture_r[1:0]==2'b10))begin
    finish<=1'b1;
  end
  else if(capture_r[1:0]==2'b01)begin
    finish<=1'b0;
  end
end


always @(posedge clk)begin
  if(!resetn)begin
    num_cnt<=32'd0;
  end
  else if(finish)begin
    num_cnt<=32'd0;
  end
  else if(time_en&&(capture_r[0]))begin
    num_cnt<=num_cnt+1'b1;
  end
end


always @(posedge clk)begin
  if(!resetn)begin
    time_cnt<=32'd0;
  end
  else if(finish)begin
    time_cnt<=32'd0;
  end
  else if(capture_r[0])begin
    time_cnt<=time_cnt+1'b1;
  end
end

/////////////////////////////////////////////////////////////////////////////////////////////
(*mark_debug = "true"*) (* dont_touch = "true" *)reg [7:0]  state = 8'd0;
parameter IDLE      = 8'd0;
parameter RD_RAM    = 8'd1;
parameter WR_RAM    = 8'd2;
parameter SEND      = 8'd3;
always @(posedge clk)begin
  if(!resetn)begin
    state<=IDLE;
  end
  else begin
    case(state)
        IDLE:begin
          if(finish)begin
            state<=IDLE;
          end
          else if(capture_r[0])begin
            state<=RD_RAM;
          end          
            enb<=1'b0;
            ena<=1'b0;
            dina<={{WRITE_DATA_WIDTH_A}{1'b0}};
            rstb<=1'b1;         //reset ram data
        end
        RD_RAM:begin          
          rstb<=1'b0;
          if(finish)begin
            // state<=IDLE;
            // dina<={{WRITE_DATA_WIDTH_A}{1'b0}};
            // data_cnt<={{ADDR_WIDTH+1}{1'b0}}; 


            
              if(data_cnt==DATANUM)begin   //65536 data:from 1 to 65536
                  addra<={{ADDR_WIDTH}{1'b0}}; 
                  ena<=1'b1;
                  data_cnt<= {{ADDR_WIDTH+1}{1'b1}}; 
                  state<=IDLE;   
                  rstb<=1'b1;       
              end
              else begin
                  addra<=addra+1'b1;
                  ena<=1'b1;
                  dina<={{DATA_WIDTH}{1'b0}};
                  state<=RD_RAM;
                  data_cnt<=data_cnt+1'b1;
              end

          end
          else if((rd_en_r[1:0]==2'b01))begin
            state<=SEND;
            ena<=1'b0;
            enb<=1'b0;
            addrb<={{ADDR_WIDTH}{1'b1}}; 
            data_cnt<={{ADDR_WIDTH+1}{1'b0}}; 
          end          
          else if(time_en)begin
            enb<=1'b1;
            addrb<=time_addr;
            state<=WR_RAM;
            ena<=1'b0;
          end
          else begin
            enb<=1'b0;
            ena<=1'b0;
            state<=RD_RAM;
          end
        end
        WR_RAM:begin    
            enb<=1'b0;
            ena<=1'b1;
            addra<=time_addr;
            dina<=doutb+1'b1;
            state<=RD_RAM;
        end
        SEND:begin
            if(ready)begin
              if(data_cnt==DATANUM)begin   //65536 data:from 1 to 65536
                  addra<={{ADDR_WIDTH}{1'b0}}; 
                  addrb<={{ADDR_WIDTH}{1'b0}}; 
                  enb<=1'b1;
                  data_cnt<= {{ADDR_WIDTH+1}{1'b0}}; 
                  state<=RD_RAM;   
                  rstb<=1'b1;       
              end
              else begin
                  addrb<=addrb+1'b1;
                  enb<=1'b1;
                  state<=SEND;
                  data_cnt<=data_cnt+1'b1;
              end
          end
          else begin
            enb<=1'b0;
            addrb<=addrb;
            state<=SEND;
            data_cnt<=data_cnt;
          end
        end
    endcase
  end   

end

always @(posedge clk)begin
addrb_r<=addrb;
end


always @(posedge clk)begin
  enb_r<=enb;
end
// always @(posedge clk)begin
//   if((rd_en_r[1:0]==2'b01)||(finish))begin
//     valid<=1'b1;
//   end
//   else if((state==SEND)&&enb)begin
//     // valid <=enb;
//   valid<=1'b1;
//   end
//   else begin
//     valid <=1'b0;
//   end
// end

assign valid = ((rd_en_r[1:0]==2'b01)||(((state==SEND)||(state==IDLE))&enb_r));
assign data = ((rd_en_r[1:0]==2'b01))?header:{addrb_r,doutb};
// always @(posedge clk)begin
//   if((rd_en_r[1:0]==2'b01)||(finish))begin
//     data<=header;
//   end
//   else begin
//     data<={addrb,doutb};
//   end
// end






////////////////////////////////////////////////////////////////////////////////////////////
// IMPORTANT: For 7 series family architectures, though the diagram below shows port A as write port
// and port B as Read Port, in the FPGA the block RAM primitives perform Read access through port A
// and Write access through port B

   xpm_memory_sdpram #(
      .ADDR_WIDTH_A           (ADDR_WIDTH_A      ),               // DECIMAL
      .ADDR_WIDTH_B           (ADDR_WIDTH_B      ),               // DECIMAL
      .AUTO_SLEEP_TIME        (0                 ),               // DECIMAL
      .BYTE_WRITE_WIDTH_A     (BYTE_WRITE_WIDTH_A),               // DECIMAL
      .CASCADE_HEIGHT         (0                 ),               // DECIMAL
      .CLOCKING_MODE          ("common_clock"    ),               // String
      .ECC_MODE               ("no_ecc"          ),               // String
      .MEMORY_INIT_FILE       ("none"            ),               // String
      .MEMORY_INIT_PARAM      ("0"               ),               // String
      .MEMORY_OPTIMIZATION    ("true"            ),               // String
      .MEMORY_PRIMITIVE       ("block"           ),               // String
      .MEMORY_SIZE            (MEMORY_SIZE       ),               // DECIMAL
      .MESSAGE_CONTROL        (0                 ),               // DECIMAL
      .READ_DATA_WIDTH_B      (READ_DATA_WIDTH_B ),               // DECIMAL
      .READ_LATENCY_B         (1                 ),               // DECIMAL
      .READ_RESET_VALUE_B     ("0"               ),               // String
      .RST_MODE_A             ("SYNC"            ),               // String
      .RST_MODE_B             ("SYNC"            ),               // String
      .SIM_ASSERT_CHK         (0                 ),               // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
      .USE_EMBEDDED_CONSTRAINT(0                 ),               // DECIMAL
      .USE_MEM_INIT           (1                 ),               // DECIMAL
      .WAKEUP_TIME            ("disable_sleep"   ),               // String
      .WRITE_DATA_WIDTH_A     (WRITE_DATA_WIDTH_A),               // DECIMAL
      .WRITE_MODE_B           ("read_first"      )                // String
   )
   xpm_memory_sdpram_wr (
      .dbiterrb      (       ),
      .sbiterrb      (       ),
      .clka          (clka   ),
      .clkb          (clkb   ),
      .ena           (ena    ),
      .enb           (enb    ),
      .addra         (addra  ),
      .addrb         (addrb  ),
      .dina          (dina   ),
      .doutb         (doutb  ),
      .injectdbiterra(1'b0   ), 
      .injectsbiterra(1'b0   ),
      .regceb        (1'b1   ), 
      .rstb          (rstb   ),
      .sleep         (1'b0   ),
      .wea           (4'b1111) 

   );


endmodule
