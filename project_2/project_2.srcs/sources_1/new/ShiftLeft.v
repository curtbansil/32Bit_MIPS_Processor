`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2017 04:49:23 PM
// Design Name: 
// Module Name: ShiftLeft
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


module ShiftLeft(in, out);
    input [31:0] in;
    output reg [31:0] out;
    
    initial begin
        out <= 32'h00000000;
    end

    
    always @ (in) begin
        out <= in << 2;
    end

endmodule
