`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2018 10:01:15 PM
// Design Name: 
// Module Name: Decode
// Project Name: 
// Target Devices: 
// Tool VeRsions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IDStage(Clk, Rst, ID_Instruction, WB_WriteData, WB_WriteReg,
    IFID_Flush, Stall_Flush, DoBranch, EX_JRFlag, WB_RegWrite,
    RdData1Out, RdData2Out, Imm16Ext, ID_ALUOp, ID_ByteControl, ID_WrDataControl,
    ID_RegDst, ID_ALUSrc, ID_MemtoReg, ID_RegWr, ID_MemRd,
    ID_MemWr, ID_Branch, ID_JRFlag, ID_ShamtControl, IF_Flush,
    ID_HLType, ID_HLWr, ID_VarControl);
    
    input Clk, Rst;
    input [31:0] ID_Instruction, WB_WriteData;
    input [4:0] WB_WriteReg;
    input IFID_Flush, Stall_Flush;
    input DoBranch, EX_JRFlag, WB_RegWrite;
    
    output [31:0] RdData1Out, RdData2Out, Imm16Ext;
    output [4:0] ID_ALUOp;
    output [2:0] ID_HLType;
    output [1:0] ID_ByteControl, ID_WrDataControl;
    output ID_RegDst, ID_ALUSrc, ID_MemtoReg, ID_RegWr, ID_MemRd,
        ID_MemWr, ID_Branch, ID_JRFlag, ID_ShamtControl, ID_HLWr, 
        ID_VarControl, IF_Flush;
        
    wire [4:0] ALUOp;
           wire [2:0] HLType;
           wire [1:0] ByteControl, WrDataControl; 
           wire RegDst, ALUSrc, MemtoReg, RegWr, MemRd, MemWr,
               Branch, Jump, SignZero, ShamtControl, JRFlag, HLWr, VarControl;
               
           wire Flush, ID_Flush;
           wire [5:0] Opcode, Function;
           wire [15:0] Imm16;
           wire [4:0] Rs, Rt, Rd;
           
           wire [31:0] RdData1, RdData2;
           wire [31:0] SignExtOut, ZeroExtOut;
    
    
endmodule
