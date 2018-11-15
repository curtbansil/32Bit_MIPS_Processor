`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2018 10:01:15 PM
// Design Name: 
// Module Name: InstructionFetch
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


module IFStage(Clk, Rst, PCWriteEn, PCIn, PCNext, Instruction);

    input Clk, Rst;
    input PCWriteEn; // This signal comes from the Stall Control
    input [31:0] PCIn; // This input comes from the Jump Register Mux
    
    output [31:0] PCNext, Instruction;
    
    wire [31:0] PC;
    
    

endmodule
