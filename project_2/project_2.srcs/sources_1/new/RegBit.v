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


module RegBit(Out, In, WriteEn, Flush, Rst, Clk);
    output Out;
    
    input Rst, Clk;
    input In, WriteEn, Flush;
    
    reg OrOut, AndOut1, AndOut2;
    
    initial begin                       //did this because i feel like flushing is a lot easier this way
        AndOut1 = Out & !(WriteEn);
        AndOut2 = In & WriteEn;
        OrOut = AndOut1 | AndOut2;
        if (Flush == 1) begin
            OrOut = 0;
        end
    end
    
    D_FlipFlop D_FF1(Out, OrOut, Rst, Clk);
    
endmodule
