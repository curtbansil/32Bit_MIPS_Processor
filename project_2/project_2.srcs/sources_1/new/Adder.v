`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2017 04:44:39 PM
// Design Name: 
// Module Name: Adder
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


module Adder(in1, in2, AddResult);

    input [31:0] in1, in2;

    output reg [31:0] AddResult;

    initial begin
        AddResult <= 32'h00000000;
    end


    always @(in1, in2) begin
        AddResult <= in1 + in2;
    end
    
endmodule
