`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2018 12:20:21 AM
// Design Name: 
// Module Name: ALUControl_Block
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


module ALUControl_Block(Func, R1, R2, shamt, ALUOp, ALUControl);
    input [5:0] Func;
    input [4:0] shamt;
    input [2:0] ALUOp;
    input R1, R2; //R1 = Instr[21], R2 = Instr[6]
    output reg [4:0] ALUControl;
    
    always @(Func, ALUOp, shamt) begin
        case(ALUOp)
            3'b000 : begin //general R-types
                case(Func)
                    6'b000000: ALUControl <= 5'b01000; //sll
                    6'b000010: begin //srl/rotr
                        case (R1)
                            1'b0: ALUControl <= 5'b00000; //srl
                            1'b1: ALUControl <= 5'b01010; //rotr
                        endcase
                    end
                    6'b000011: ALUControl <= 5'b10010; //sra
                    6'b000100: ALUControl <= 5'b01000; //sllv
                    6'b000110: begin //srlv/rotrv
                        case (R2)
                            1'b0: ALUControl <= 5'b00000; //srlv
                            1'b1: ALUControl <= 5'b00000; //rotrv
                        endcase
                    end
                    6'b000111: ALUControl <= 5'b10010; //srav
                    6'b100000: ALUControl <= 5'b00000; //add
                    6'b100001: ALUControl <= 5'b11001; //addu
                    6'b100010: ALUControl <= 5'b00001; //sub
                    6'b100100: ALUControl <= 5'b11100; //and
                    6'b100101: ALUControl <= 5'b00100; //or
                    6'b100110: ALUControl <= 5'b01111; //xor
                    6'b100111: ALUControl <= 5'b01110; //nor
                endcase
            end
            3'b001 : ALUControl <= 5'b00010; //mul
            3'b010 : ALUControl <= 5'b00000; //addi
            3'b011 : ALUControl <= 5'b11001; //addiu
            3'b100 : ALUControl <= 5'b00011; //andi
            3'b101 : ALUControl <= 5'b00100; //ori
            3'b110 : ALUControl <= 5'b01111; //xori
            3'b111 : begin //seb, seh
                case (shamt)
                    5'b10000 : ALUControl <= 5'b10000; //seb
                    5'b11000 : ALUControl <= 5'b10001; //seh
                endcase
            end
        endcase
    end
endmodule
