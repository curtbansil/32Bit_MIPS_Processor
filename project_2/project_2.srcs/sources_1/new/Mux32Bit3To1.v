`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2018 06:06:23 AM
// Design Name: 
// Module Name: Mux32Bit3To1
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


module Mux32Bit3To1(Out, InA, InB, InC, Select);
    output [31:0] Out;
    input [31:0] InA, InB, InC;
    input [1:0] Select;
    
    wire [31:0] mux1Out, mux2Out;
    
    // if Select[1] == 1 & Select[0] == 0, Out = InC
    // if Select[1] == 0 & Select[0] == 1, Out = InB
    // if Select[1] == 0 & Select[0] == 0, Out = InA
    // TODO: Determine if it's fine to have Out = InA if Sel = 11
    Mux32Bit2To1 mux1(mux1Out, InA, InC, Select[1]);
    Mux32Bit2To1 mux2(mux2Out, InB, InA, Select[1]);
    Mux32Bit2To1 muxOut(Out, mux1Out, mux2Out, Select[0]);
endmodule
