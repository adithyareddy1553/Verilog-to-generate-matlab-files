`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ADITHYA
// 
// Create Date: 07/19/2016 04:17:04 PM
// Design Name: 
// Module Name: verilog_vector_gen_tb
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


module Verilog_vector_tb();

  reg rClk = 0;
  reg rRst;
  
  reg [31:0] rUrng_seed1;
  reg [31:0] rUrng_seed2;
  reg [31:0] rUrng_seed3;
  reg [31:0] rUrng_seed4;
  reg [31:0] rUrng_seed5;
  reg [31:0] rUrng_seed6;
  
  parameter N = 10000;
  
  wire [31:0] wTaus1;
  wire [31:0] wTaus2;  
  
  Tause uut
    (.iClk(rClk),
     .iRst(rRst),
     
     .iUrng_seed1(rUrng_seed1),
     .iUrng_seed2(rUrng_seed2),
     .iUrng_seed3(rUrng_seed3),
     
     .iUrng_seed4(rUrng_seed4),
     .iUrng_seed5(rUrng_seed5),
     .iUrng_seed6(rUrng_seed6),
     
     .oTaus1(wTaus1),
     .oTaus2(wTaus2)
     );
  

  always
    #10 rClk = ~rClk;
    
   initial 
    begin
      rUrng_seed1 = 32'd1999;
      rUrng_seed2 = 32'd2995;
      rUrng_seed3 = 32'd3666;
      
      rUrng_seed4 = 32'd3658;
      rUrng_seed5 = 32'd1564;
      rUrng_seed6 = 32'd4578;     
    end
     
     integer File3;
     integer File4;
     
     initial begin
         File3 = $fopen("taus_output1.txt", "w");
         File4 = $fopen("taus_output2.txt", "w");
      
         rRst = 1'b1;
         
        #1000
         repeat (N) begin
             @(posedge rClk);
              rRst = 1'b0;
         end
     
         #(20*1)
           $fclose(File3);
           $fclose(File4);
         $stop;
     end    
 //    // Record data
     always@(negedge rClk) 
     begin
         if (~rRst)
          begin
           $fwrite(File3, "%d\n", wTaus1);
           $fwrite(File4, "%d\n", wTaus2);           
          end
     end
 endmodule    
  

