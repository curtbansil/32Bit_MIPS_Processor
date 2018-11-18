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


module Mux32Bit4To1SP(out, inA, imm, sel);

    output reg [31:0] out;
    
    input [31:0] inA, imm;
    input [1:0] sel;
    
    initial begin
        out <= 32'h00000000;
    end
    
    always @(sel, inA) begin
        case(sel)
            2'b00: begin // sw/lw
                out <= inA;
            end
            2'b01: begin // sh/lh
                out <= {16'b0000000000000000, inA[15:0]};
            end
            2'b10: begin // sb/lb
                out <= {24'b000000000000000000000000, inA[7:0]};
            end
            2'b11: begin // lui
                out <= {imm[15:0], 16'b0000000000000000};
            end
        endcase
    end
    
    
endmodule
