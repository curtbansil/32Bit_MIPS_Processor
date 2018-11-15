`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2018 02:03:35 AM
// Design Name: 
// Module Name: Mux32Bit8to1
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


module Mux32Bit8to1(out, inA, inB, inC, inD, sel);

    output reg [31:0] out;
    
    input [31:0] inA, inB, inC, inD;
    input [1:0] sel;

    always @(sel) begin
        case(sel)
            2'b000: begin
                out <= inA;
            end
            2'b001: begin
                out <= inB;
            end
            2'b010: begin
                out <= inC;
            end
            2'b011: begin
                out <= inD;
            end
        endcase
    end
    
    
endmodule
