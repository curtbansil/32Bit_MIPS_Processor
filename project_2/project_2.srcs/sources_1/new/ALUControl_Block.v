`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2018 12:20:21 AM
// Design Name: 
// Module Name: ALUControl_Block
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


module ALUControl_Block(Opcode, Func, ALUControl);
    input [5:0] Opcode, Func;
    output reg [4:0] ALUControl;
    
    wire [11:0] val;
    assign val = {Opcode, Func};
    
    always @(val)
    begin
        case(val)
        12'b000000000000 : ALUControl = 5'b0100; // sll
        12'b000000000100 : ALUControl = 5'b0100; // sllv
        
    end
endmodule
