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


module HiLoControl(HLGo, HLWr, HLType, HLFlag);
    input [3:0] HLGo;
    
    wire Go;
    wire [2:0] ID;
    assign Go = HLGo[3];
    assign ID = HLGo[2:0];
    
    output reg [2:0] HLType;
    output reg HLWr, HLFlag; // HLFlag = 1 tells the processor that the HL Reg Output should be used rather than the ALU Output
    
    initial 
    begin
        HLType <= 3'b000;
        HLFlag <= 1'b0;
        HLWr <= 1'b0;
    end
    
    always @(*) 
    begin
        if (Go == 1'b1) 
        begin
            case(ID)
                3'b000 : // mfhi
                begin
                    HLWr = 1'b0;
                    HLFlag = 1'b1;
                    HLType = 3'b111;
                end
                3'b001 : // mthi
                begin
                    HLWr = 1'b1;
                    HLFlag = 1'b0;
                    HLType = 3'b001;
                end
                3'b010 : // mflo
                begin
                    HLWr = 1'b0;
                    HLFlag = 1'b1;
                    HLType = 3'b110;
                end
                3'b011 : // mtlo
                begin
                    HLWr = 1'b1;
                    HLFlag = 1'b0;
                    HLType = 3'b000;
                end
                3'b100 : // madd
                begin
                    HLWr = 1'b1;
                    HLFlag = 1'b0;
                    HLType = 3'b010;
                end
                3'b101 : // msub
                begin
                    HLWr = 1'b1;
                    HLType = 3'b011;
                end
                3'b110 : // mult
                begin
                    HLWr = 1'b1;
                    HLFlag = 1'b0;
                    HLType = 3'b100; 
                end
                3'b111 : // multu
                begin
                    HLWr = 1'b1;
                    HLFlag = 1'b0;
                    HLType = 3'b101;
                end
                default:
                begin
                    HLWr = 1'b0;
                    HLFlag = 1'b0;
                    HLType = 3'bxxx;
                end
            endcase //removed mul, look at comment in hiloreg file
        end
        else
        begin
            HLWr = 1'b0;
            HLFlag = 1'b0;
            HLType = 3'bxxx;
        end
    end
endmodule
