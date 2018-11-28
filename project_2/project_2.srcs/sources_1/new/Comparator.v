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

module Comparator(opcode, rt, rd1, rd2, branch);

    input [31:0] rd1, rd2;
    input [5:0] opcode;
    input [4:0] rt;
    output reg branch;
    
    wire [10:0] ID;
    assign ID = {opcode, rt};
    
    initial 
    begin
        branch <= 0;
    end
    
    always @(rd1, rd2, opcode) 
    begin
        casex (ID)
            11'b000111xxxxx: 
            begin // bgtz
                if (rd1 > 0) 
                begin
                    branch <= 1;
                end
            end
            11'b000110xxxxx: 
            begin // blez
                if (rd1 <= 0) 
                begin
                    branch <= 1;
                end
            end
            11'b00000100000: 
            begin //bltz
                if (rd1 < 0) 
                begin
                    branch <= 1;
                end
            end
            11'b00000100001: 
            begin //bgez
                if (rd1 >= 0) 
                begin
                    branch <= 1;
                end
            end
            11'b000101xxxxx: 
            begin // bne
                if (rd1 != rd2) 
                begin
                    branch <= 1;
                end
            end
            11'b000100xxxxx: 
            begin // beq
                if (rd1 == rd2) 
                begin
                    branch <= 1;
                end
            end
            default:
            begin
                branch <= 0;
            end
        endcase
        
    end

endmodule
