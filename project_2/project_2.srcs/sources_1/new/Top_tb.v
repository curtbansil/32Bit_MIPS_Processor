`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2018 12:25:19 PM
// Design Name: 
// Module Name: Top_tb
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


module Top_tb();

    reg Clk, Rst;
//    wire [31:0] HiReg, LoReg, Reg_WriteData, PCResult;
    
//    TopModuleFinal Top(Clk, Rst, HiReg, LoReg, Reg_WriteData, PCResult);
    Datapath_top Datapath1(Clk, Rst);
    
    initial begin
        Rst = 0;
        Clk = 1;
        forever #50 Clk = ~Clk;
    end

endmodule
