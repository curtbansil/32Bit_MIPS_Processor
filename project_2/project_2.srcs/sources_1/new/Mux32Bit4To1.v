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


module Mux32Bit4To1(out, inA, inB, inC, inD, sel);

    output reg [31:0] out;
    
    input [31:0] inA, inB, inC, inD;
    input [1:0] sel;
    
    initial begin
        out <= 32'h00000000;
    end
    
    always @(sel, inA, inB, inC, inD) begin
        case(sel)
            2'b00: begin // sw/lw
                out <= inA;
            end
            2'b01: begin // sh/lh
                out <= inB;
            end
            2'b10: begin // sb/lb
                out <= inC;
            end
            2'b11: begin // lui
                out <= inD;
            end
        endcase
    end
    
    
endmodule
