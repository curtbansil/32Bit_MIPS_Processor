`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2018 09:29:09 PM
// Design Name: 
// Module Name: Comparator
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

module Comparator(rd1, rd2, out);

    input [31:0] rd1, rd2;
    output reg [2:0] out;
    
    initial begin
        out <= 3'b000;
    end
    
    always @(rd1, rd2) begin
        if (rd1 > 0) begin
            out <= 3'b000;
        end
        else if (!(rd1 > 0)) begin
            out <= 3'b001;
        end
        else if (rd1 != rd2) begin
            out <= 3'b010;
        end
        else if (rd1 == rd2) begin
            out <= 3'b011;
        end
        else if (rd1 < 0) begin
            out <= 3'b100;
        end
        else if (!(rd1 < 0)) begin
            out <= 3'b101;
        end
    end

endmodule
