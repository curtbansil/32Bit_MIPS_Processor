`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2018 12:34:09 PM
// Design Name: 
// Module Name: Datapath_top
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


module Datapath_top(Clk, Rst, out7, en_out);

    input Clk, Rst;
    output [6:0] out7;
    output [7:0] en_out;
    
    wire ClkOut;
    wire [31:0] HiReg, LoReg, Reg_WriteData, PCResult;
    
    //Not sure how to wire the Two4DigitDisplay
    ClkDiv ClockDivider(Clk, Rst, ClkOut);
    Two4DigitDisplay Display(ClkOut, Reg_WriteData[31:16], Reg_WriteData[15:0], out7, en_out);
    
    TopModuleFinal Top(ClkOut, Rst, HiReg, LoReg, Reg_WriteData, PCResult);

endmodule
