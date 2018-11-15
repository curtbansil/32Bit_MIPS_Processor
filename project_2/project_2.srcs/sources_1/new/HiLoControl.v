`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2018 11:58:58 PM
// Design Name: 
// Module Name: HiLoControl
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


module HiLoControl(ALUOp, Func, HLWr, HLType);
    input [5:0] Func;
    input [2:0] ALUOp;
    
    output reg [2:0] HLType;
    output reg HLWr;

    wire [8:0] val;
    assign val = {ALUOp, Func};
    
    always @(val)
    begin
        casex(val)
        9'b000010000 : // mfhi
        begin
            HLWr = 1'b0;
            HLType = 3'b001;
        end
        9'b000010001 : // mthi
        begin
            HLWr = 1'b1;
            HLType = 3'b001;
        end
        9'b000010010 : // mflo
        begin
            HLWr = 1'b0;
            HLType = 3'b000;
        end
        9'b000010011 : // mtlo
        begin
            HLWr = 1'b1;
            HLType = 3'b000;
        end
        9'b001000000 : // madd
        begin
            HLWr = 1'b1;
            HLType = 3'b010;
        end
        9'b001000100 : // msub
        begin
            HLWr = 1'b1;
            HLType = 3'b011;
        end
        9'b000011000 : // mult
        begin
            HLWr = 1'b1;
            HLType = 3'b100; 
        end
        9'b000011001 : // multu
        begin
            HLWr = 1'b1;
            HLType = 3'b101;
        end
        9'b00100010 : // mul
        begin
            HLWr = 1'b1;
            HLType = 3'b110;
        end
        endcase
    end
endmodule
