`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2018 12:54:34 PM
// Design Name: 
// Module Name: FlushBlcok
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


module FlushBlock(Flush, RegDst, ALUSrc, MemToReg, RegWr, MemRd, MemWr, Branch, JRFlag,
    ShamtControl, WrDataControl, ByteControl, ALUOp,HLWr, HLType, VarControl, ID_HLWr,
    ID_RegDst, ID_ALUSrc, ID_MemToReg, ID_RegWr, ID_MemRd, ID_MemWr, ID_Branch, ID_JRFlag,
    ID_ShamtControl, ID_WrDataControl, ID_ByteControl, ID_ALUOp, ID_HLType, ID_VarControl);

    input Flush, RegDst, ALUSrc, MemToReg, RegWr, MemRd, MemWr,
        Branch, JRFlag, ShamtControl, HLWr, VarControl;
    input [1:0] WrDataControl, ByteControl;
    input [2:0] HLType;
    input [4:0] ALUOp;
    
    output ID_RegDst, ID_ALUSrc, ID_MemToReg, ID_RegWr, ID_MemRd,
        ID_MemWr, ID_Branch, ID_JRFlag, ID_ShamtControl, ID_HLWr, ID_VarControl;
    output [1:0] ID_WrDataControl, ID_ByteControl;
    output [2:0] ID_HLType;
    output [4:0] ID_ALUOp;
    
    wire NotFlush;
    
    // If we're flushing, set all values to 0.
    // Else, set values to their respective values
    assign NotFlush = !(Flush);
   
    assign ID_RegDst = RegDst & NotFlush;
    assign ID_ALUSrc = ALUSrc & NotFlush;
    assign ID_MemToReg = MemToReg & NotFlush;
    assign ID_RegWr = RegWr & NotFlush;
    assign ID_MemRd = MemRd & NotFlush;
    assign ID_Branch = Branch & NotFlush;
    assign ID_JRFlag = JRFlag & NotFlush;
    assign ID_ShamtControl = ShamtControl & NotFlush;
    assign ID_HLWr = HLWr & NotFlush;
    assign ID_VarControl = VarControl & NotFlush;
    assign ID_WrDataControl[1] = WrDataControl[1] & NotFlush;
    assign ID_WrDataControl[0] = WrDataControl[0] & NotFlush;
    assign ID_ByteControl[1] = ByteControl[1] & NotFlush;
    assign ID_ByteControl[0] = ByteControl[0] & NotFlush;
    assign ID_HLType[1] = HLType[1] & NotFlush;
    assign ID_HLType[0] = HLType[0] & NotFlush;
    assign ID_ALUOp[4] = ALUOp[4] & NotFlush;
    assign ID_ALUOp[3] = ALUOp[3] & NotFlush;
    assign ID_ALUOp[2] = ALUOp[2] & NotFlush;
    assign ID_ALUOp[1] = ALUOp[1] & NotFlush;
    assign ID_ALUOp[0] = ALUOp[0] & NotFlush;

endmodule
