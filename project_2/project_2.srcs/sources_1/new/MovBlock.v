`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2018 07:09:22 PM
// Design Name: 
// Module Name: MovBlock
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


module MovBlock(Rt, MovControl);
    input [31:0] Rt;
    output reg MovControl;
    
    wire [31:0] Result;
    assign Result = Rt & {32{1'b1}};
    
    always@(Rt)
    begin
        case(Result) 
            {32{1'b0}} : MovControl = 1'b1; // if Rt == 0, output is 1
            default : MovControl = 1'b0; // else output is 0
        endcase
    end
endmodule
