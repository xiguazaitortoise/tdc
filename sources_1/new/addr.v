
//////////////////////////////////////////////////////////////////////////////////
// Engineer: anytao
// Create Date: 2021/07/17 18:08:33
// Module Name: addr_define.v
// Target Devices: xc7k325tffg900-2
// Tool Versions: vivado 2017.4
// Description: usb addr
// Revision: 0.0
//////////////////////////////////////////////////////////////////////////////////




`define GENERAL_WR_BASE_ADDR  16'hE000
`define GENERAL_WR_UPDATE      {`GENERAL_WR_BASE_ADDR+16'h0000}
`define GENERAL_WR_LED         {`GENERAL_WR_BASE_ADDR+16'h0001}
`define GENERAL_WR_CAPTURE     {`GENERAL_WR_BASE_ADDR+16'h0002}
`define GENERAL_WR_READ_INSTR  {`GENERAL_WR_BASE_ADDR+16'h0003}
`define GENERAL_WR_MAX_COUNT_L {`GENERAL_WR_BASE_ADDR+16'h0004}
`define GENERAL_WR_MAX_COUNT_H {`GENERAL_WR_BASE_ADDR+16'h0005}
`define GENERAL_WR_MAX_TIME_L  {`GENERAL_WR_BASE_ADDR+16'h0006}
`define GENERAL_WR_MAX_TIME_H  {`GENERAL_WR_BASE_ADDR+16'h0007}



`define GENERAL_RD_BASE_ADDR  16'hF000
`define GENERAL_RD_VERSION   {`GENERAL_RD_BASE_ADDR+16'h0000}
`define GENERAL_RD_PRODUCT   {`GENERAL_RD_BASE_ADDR+16'h0001}
`define GENERAL_RD_TEMP      {`GENERAL_RD_BASE_ADDR+16'h0002}
`define GENERAL_RD_DNA0      {`GENERAL_RD_BASE_ADDR+16'h0003}
`define GENERAL_RD_DNA1      {`GENERAL_RD_BASE_ADDR+16'h0004}
`define GENERAL_RD_DNA2      {`GENERAL_RD_BASE_ADDR+16'h0005}

`define CHANNEL0_BASE_ADDR  16'h0000
`define CHANNEL1_BASE_ADDR  16'h0100
`define CHANNEL2_BASE_ADDR  16'h0200
`define CHANNEL3_BASE_ADDR  16'h0300
`define CHANNEL4_BASE_ADDR  16'h0400
`define CHANNEL5_BASE_ADDR  16'h0500
`define CHANNEL6_BASE_ADDR  16'h0600
`define CHANNEL7_BASE_ADDR  16'h0700
`define CHANNEL8_BASE_ADDR  16'h0800
`define CHANNEL9_BASE_ADDR  16'h0900
`define CHANNEL10_BASE_ADDR 16'h0A00
`define CHANNEL11_BASE_ADDR 16'h0B00
`define CHANNEL12_BASE_ADDR 16'h0C00
`define CHANNEL13_BASE_ADDR 16'h0D00
`define CHANNEL14_BASE_ADDR 16'h0E00
`define CHANNEL15_BASE_ADDR 16'h0F00

`define CHANNEL0_FREQ    {`CHANNEL0_BASE_ADDR+16'h0000}
`define CHANNEL1_FREQ    {`CHANNEL1_BASE_ADDR+16'h0000}
`define CHANNEL2_FREQ    {`CHANNEL2_BASE_ADDR+16'h0000}
`define CHANNEL3_FREQ    {`CHANNEL3_BASE_ADDR+16'h0000}
`define CHANNEL4_FREQ    {`CHANNEL4_BASE_ADDR+16'h0000}
`define CHANNEL5_FREQ    {`CHANNEL5_BASE_ADDR+16'h0000}
`define CHANNEL6_FREQ    {`CHANNEL6_BASE_ADDR+16'h0000}
`define CHANNEL7_FREQ    {`CHANNEL7_BASE_ADDR+16'h0000}



`define CHANNEL0_ON      {`CHANNEL0_BASE_ADDR+16'h0001}
`define CHANNEL1_ON      {`CHANNEL1_BASE_ADDR+16'h0001}
`define CHANNEL2_ON      {`CHANNEL2_BASE_ADDR+16'h0001}
`define CHANNEL3_ON      {`CHANNEL3_BASE_ADDR+16'h0001}
`define CHANNEL4_ON      {`CHANNEL4_BASE_ADDR+16'h0001}
`define CHANNEL5_ON      {`CHANNEL5_BASE_ADDR+16'h0001}
`define CHANNEL6_ON      {`CHANNEL6_BASE_ADDR+16'h0001}
`define CHANNEL7_ON      {`CHANNEL7_BASE_ADDR+16'h0001}