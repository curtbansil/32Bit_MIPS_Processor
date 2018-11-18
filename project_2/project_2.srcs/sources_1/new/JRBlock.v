`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2018 01:54:43 PM
// Design Name: 
// Module Name: JRBlock
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


module JRBlock(JRFlag, ALUOp, Func);

    input [4:0] ALUOp;
    input [5:0] Func;
    
    output reg JRFlag;
    
    wire [10:0] val;
    assign val = {ALUOp, Func};
    
    always @(val)
    begin
        case(val)
            11'b00000001000 : JRFlag = 1'b1;
            default : JRFlag = 1'b0;
        endcase
    end
endmodule
