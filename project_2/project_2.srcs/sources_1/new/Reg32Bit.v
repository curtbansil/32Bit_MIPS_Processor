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


module Reg32Bit(Out, In, WriteEn, Flush, Rst, Clk);
    output [31:0] Out;
    
    input [31:0] In;
    input Rst, Clk;
    input WriteEn, Flush;
    
    RegBit Bit31(Out[31], In[31], WriteEn, Flush, Rst, Clk);
    RegBit Bit30(Out[30], In[30], WriteEn, Flush, Rst, Clk);
    RegBit Bit29(Out[29], In[29], WriteEn, Flush, Rst, Clk);
    RegBit Bit28(Out[28], In[28], WriteEn, Flush, Rst, Clk);
    RegBit Bit27(Out[27], In[27], WriteEn, Flush, Rst, Clk);
    RegBit Bit26(Out[26], In[26], WriteEn, Flush, Rst, Clk);
    RegBit Bit25(Out[25], In[25], WriteEn, Flush, Rst, Clk);
    RegBit Bit24(Out[24], In[24], WriteEn, Flush, Rst, Clk);
    RegBit Bit23(Out[23], In[23], WriteEn, Flush, Rst, Clk);
    RegBit Bit22(Out[22], In[22], WriteEn, Flush, Rst, Clk);
    RegBit Bit21(Out[21], In[21], WriteEn, Flush, Rst, Clk);
    RegBit Bit20(Out[20], In[20], WriteEn, Flush, Rst, Clk);
    RegBit Bit19(Out[19], In[19], WriteEn, Flush, Rst, Clk);
    RegBit Bit18(Out[18], In[18], WriteEn, Flush, Rst, Clk);
    RegBit Bit17(Out[17], In[17], WriteEn, Flush, Rst, Clk);
    RegBit Bit16(Out[16], In[16], WriteEn, Flush, Rst, Clk);
    RegBit Bit15(Out[15], In[15], WriteEn, Flush, Rst, Clk);
    RegBit Bit14(Out[14], In[14], WriteEn, Flush, Rst, Clk);
    RegBit Bit13(Out[13], In[13], WriteEn, Flush, Rst, Clk);
    RegBit Bit12(Out[12], In[12], WriteEn, Flush, Rst, Clk);
    RegBit Bit11(Out[11], In[11], WriteEn, Flush, Rst, Clk);
    RegBit Bit10(Out[10], In[10], WriteEn, Flush, Rst, Clk);
    RegBit Bit9(Out[9], In[9], WriteEn, Flush, Rst, Clk);
    RegBit Bit8(Out[8], In[8], WriteEn, Flush, Rst, Clk);
    RegBit Bit7(Out[7], In[7], WriteEn, Flush, Rst, Clk);
    RegBit Bit6(Out[6], In[6], WriteEn, Flush, Rst, Clk);
    RegBit Bit5(Out[5], In[5], WriteEn, Flush, Rst, Clk);
    RegBit Bit4(Out[4], In[4], WriteEn, Flush, Rst, Clk);
    RegBit Bit3(Out[3], In[3], WriteEn, Flush, Rst, Clk);
    RegBit Bit2(Out[2], In[2], WriteEn, Flush, Rst, Clk);
    RegBit Bit1(Out[1], In[1], WriteEn, Flush, Rst, Clk);
    RegBit Bit0(Out[0], In[0], WriteEn, Flush, Rst, Clk);
    
endmodule
