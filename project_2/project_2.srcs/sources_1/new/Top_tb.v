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
    
    //TopModule Top(Clk, Rst);
    TopModuleV2 Top(Clk, Rst);
    
    initial begin
        Clk = 1;
        forever #50 Clk = ~Clk;
    end
    
    initial begin
        #100;
        Rst = 1;
        #100;
        Rst = 0;
    end
    
    

endmodule
