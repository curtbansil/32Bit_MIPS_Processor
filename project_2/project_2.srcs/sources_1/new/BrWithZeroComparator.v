`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2018 07:20:37 AM
// Design Name: 
// Module Name: BrWithZeroComparator
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


module BrWithZeroCompare(Out, Rt, ALUOp, Branch);
    // This module is for the bgez, bgtz, blez, bltz instructions. We're doing
    // this because the beq and bne instructions don't use 0 as the B input 
    // for the ALU
    
    output [31:0] Out;
    input [31:0] Rt;
    input [4:0] ALUOp;
    input Branch;
    
    wire seq, sne, check, notCheck;
    
    // Check if ALUOp = 00110 (seq)
    assign seq = !ALUOp[4] & !ALUOp[3] & ALUOp[2] & ALUOp[1] & !ALUOp[0];
    
    // Check if ALUOp = 00111 (sne)
    assign sne = !ALUOp[4] & !ALUOp[3] & ALUOp[2] & ALUOp[1] & ALUOp[0];
    
    // if Branch == 1, and not Seq or Sne, then check = 1, Out = 32'b{check}
    assign check = Branch & !(seq | sne);
    assign notCheck = !(check);
    
    assign Out = {32{notCheck}} & Rt;
endmodule
