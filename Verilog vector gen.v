`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ADITHYA

// Create Date: 07/19/2016 10:16:36 AM
// Design Name: 
// Module Name: verilog vectors
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Tause 
(
    input iClk,
    input iRst,
    
    input [31:0] iUrng_seed1,
    input [31:0] iUrng_seed2,
    input [31:0] iUrng_seed3,
    
    input [31:0] iUrng_seed4,
    input [31:0] iUrng_seed5,
    input [31:0] iUrng_seed6,
    
    output [31:0] oTaus1,
    output [31:0] oTaus2
 );


  taus Taus1
  (
    .iClk(iClk), .iReset(iRst), .iUrng_seed1(iUrng_seed1), .iUrng_seed2(iUrng_seed2),
    .iUrng_seed3(iUrng_seed3), .oTaus(oTaus1)
   );

  taus Taus2
  (
    .iClk(iClk), .iReset(iRst), .iUrng_seed1(iUrng_seed4), .iUrng_seed2(iUrng_seed5),
    .iUrng_seed3(iUrng_seed6), .oTaus(oTaus2)
   );   
   
 endmodule