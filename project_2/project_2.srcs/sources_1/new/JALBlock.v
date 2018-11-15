`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 09:54:08 AM
// Design Name: 
// Module Name: JALBlock
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


module JALBlock(JALFlag, ALUOp, Func);

    input [2:0] ALUOp;
    input [5:0] Func;
    
    output reg JALFlag;
    
    wire [8:0] val;
    assign val = {ALUOp, Func};
    
    always @(val)
    begin
        case(val)
            11'b000001000 : JALFlag = 1'b1;
            default : JALFlag = 1'b0;
        endcase
    end
endmodule
