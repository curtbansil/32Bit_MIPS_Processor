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


module ALUControl_Block(Func, shamt, ALUOp, R, R_V, ShamtCtrl, ALUControl);
    input [5:0] Func;
    input [4:0] shamt;
    input [2:0] ALUOp;
    input R, R_V;
    output reg [4:0] ALUControl;
    output reg ShamtCtrl;
    
    always @(Func, ALUOp, shamt) 
    begin
        case(ALUOp)
            3'b000 : 
            begin //general R-types
                case(Func)
                    6'b000000:
                    begin
                        ALUControl <= 5'b01000; //sll
                        ShamtCtrl <= 1'b1;
                    end
                    6'b000010:
                    begin
                        case(R)
                            1'b0:
                            begin
                                ALUControl <= 5'b01001; // srl
                                ShamtCtrl <= 1'b1;
                            end
                            1'b1:
                            begin
                                ALUControl <= 5'b01010; //rotr
                                ShamtCtrl <= 1'b1;
                            end
                        endcase
                    end
                    6'b000011:
                    begin
                        ALUControl <= 5'b10010; //sra
                        ShamtCtrl <= 1'b1;
                    end
                    6'b000100:
                    begin   
                        ALUControl <= 5'b01000; //sllv
                        ShamtCtrl <= 1'b0;
                    end
                    6'b000110: 
                    begin
                        case(R_V)
                            1'b0:
                            begin
                                ALUControl <= 5'b01001; // srlv
                                ShamtCtrl <= 1'b0;
                            end
                            1'b1:
                            begin
                                ALUControl <= 5'b01010; //rotrv
                                ShamtCtrl <= 1'b0;
                            end
                        endcase
                    end
                    6'b000111: 
                    begin
                        ALUControl <= 5'b10010; //srav
                        ShamtCtrl <= 1'b0;
                    end
                    6'b100000:
                    begin
                        ALUControl <= 5'b00000; //add
                        ShamtCtrl <= 1'b0;
                    end
                    6'b100001: 
                    begin
                        ALUControl <= 5'b11001; //addu
                        ShamtCtrl <= 1'b0;
                    end
                    6'b100010: 
                    begin
                        ALUControl <= 5'b00001; //sub
                        ShamtCtrl <= 1'b0;
                    end
                    6'b100100:
                    begin 
                        ALUControl <= 5'b11100; //and
                        ShamtCtrl <= 1'b0;
                    end
                    6'b100101: 
                    begin
                        ALUControl <= 5'b00100; //or
                        ShamtCtrl <= 1'b0;
                    end
                    6'b100110: 
                    begin
                        ALUControl <= 5'b01111; //xor
                        ShamtCtrl <= 1'b0;
                    end
                    6'b100111: 
                    begin
                        ALUControl <= 5'b01110; //nor
                        ShamtCtrl <= 1'b0;
                    end
                    6'b101010:
                    begin
                        ALUControl <= 5'b00101; // slt
                        ShamtCtrl <= 1'b0;
                    end
                    6'b101011:
                    begin
                        ALUControl <= 5'b11000; // sltu
                        ShamtCtrl <= 1'b0;
                    end
                endcase
            end
            3'b001 : 
            begin
                ALUControl <= 5'b00010; //mul
                ShamtCtrl <= 1'b0;
            end
            3'b010 : 
            begin
                ALUControl <= 5'b00000; //addi
                ShamtCtrl <= 1'b0;
            end
            3'b011 : 
            begin
                ALUControl <= 5'b11001; //addiu
                ShamtCtrl <= 1'b0;
            end
            3'b100 : 
            begin
                ALUControl <= 5'b00011; //andi
                ShamtCtrl <= 1'b0;
            end
            3'b101 : 
            begin
                ALUControl <= 5'b00100; //ori
                ShamtCtrl <= 1'b0;
            end
            3'b110 : 
            begin
                ALUControl <= 5'b01111; //xori
                ShamtCtrl <= 1'b0;
            end
            3'b111 : 
            begin //seb, seh
                case (shamt)
                    5'b10000 : 
                    begin
                        ALUControl <= 5'b10000; //seb
                        ShamtCtrl <= 1'b0;
                    end
                    5'b11000 : 
                    begin
                        ALUControl <= 5'b10001; //seh
                        ShamtCtrl <= 1'b0;
                    end
                endcase
            end
            3'b101:
            begin
                ALUControl <= 5'b00101; // Instruction is slti, but using slt operation in ALU
                ShamtCtrl <= 1'b0;
            end
            3'b110:
            begin
                ALUControl <= 5'b11000; // Instruction is sltiu, but using sltu operation in ALU
                ShamtCtrl <= 1'b0;
            end
        endcase
    end
endmodule
