`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2018 07:49:22 PM
// Design Name: 
// Module Name: ZeroExtension
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


module ZeroExtension(in, out);
    input [15:0] in;
    output [31:0] out;
    assign out = {{16{1'b0}}, in};
endmodule
