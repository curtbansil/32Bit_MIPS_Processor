`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2018 04:21:07 PM
// Design Name: 
// Module Name: Reg32Bit
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


module RegBit(Out, In, WriteEn, Rst, Clk);
    output Out;
    
    input Rst, Clk;
    input In, WriteEn;
    
    wire OrOut, AndOut1, AndOut2;
    
    assign AndOut1 = Out & !(WriteEn);
    assign AndOut2 = In & WriteEn;
    assign OrOut = AndOut1 | AndOut2;
    
    D_FlipFlop D_FF1(Out, OrOut, Rst, Clk);
    
endmodule
