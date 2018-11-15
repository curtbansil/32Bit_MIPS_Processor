`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2018 12:54:34 PM
// Design Name: 
// Module Name: IfIdReg
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


module IdExReg(Clk, Rst, ID_RegDst, ID_ALUSrc, ID_MemtoReg, ID_RegWr, ID_MemRd,
            ID_MemWr, ID_Branch, ID_JRFlag, ID_ShamtControl,
            ID_HLWr, ID_VarControl, ID_WrDataControl, ID_ByteControl, ID_HLType,
            ID_ALUOp, ID_PCNext, RdData1Out, RdData2Out, Imm16Ext,
            ID_Instr, EX_RegDst, EX_ALUSrc, EX_MemtoReg, EX_RegWr,
            EX_MemRd,EX_MemWr, EX_Branch, EX_JRFlag, EX_ShamtControl,
            EX_HLWr, EX_VarControl, EX_WrDataControl, EX_ByteControl, EX_HLType,
            EX_ALUOp, EX_PCNext, EX_RdData1, EX_RdData2, EX_Imm16Ext,
            EX_Instr);
            
    input Clk, Rst;
    input [31:0] ID_PCNext, RdData1Out, RdData2Out, Imm16Ext,
        ID_Instr;
    input [4:0] ID_ALUOp;
    input [2:0] ID_HLType;
    input [1:0] ID_WrDataControl, ID_ByteControl;
    input ID_RegDst, ID_ALUSrc, ID_MemtoReg, ID_RegWr, ID_MemRd,
            ID_MemWr, ID_Branch, ID_JRFlag, ID_ShamtControl,
            ID_HLWr, ID_VarControl;
            
    output [31:0] EX_PCNext, EX_RdData1, EX_RdData2, EX_Imm16Ext,
        EX_Instr;
    output [4:0] EX_ALUOp;
    output [2:0] EX_HLType;
    output [1:0] EX_WrDataControl, EX_ByteControl;
    output EX_RegDst, EX_ALUSrc, EX_MemtoReg, EX_RegWr, EX_MemRd,
            EX_MemWr, EX_Branch, EX_JRFlag, EX_ShamtControl,
            EX_HLWr, EX_VarControl;
            
    // 32-bit outputs
    Reg32Bit IDEX_PCNext1(EX_PCNext, ID_PCNext, 1'b1, Rst, Clk);
    
    Reg32Bit IDEX_RdData1_1(EX_RdData1, RdData1Out, 1'b1, Rst, Clk);
    Reg32Bit IDEX_RdData2_1(EX_RdData2, RdData2Out, 1'b1, Rst, Clk);
    
    Reg32Bit IDEX_Imm16Ext1(EX_Imm16Ext, Imm16Ext, 1'b1, Rst, Clk);
    Reg32Bit IDEX_Instruction1(EX_Instr, ID_Instr, 1'b1, Rst, Clk);
    
    // 5-bit outputs
    RegBit IDEX_ALUOp4_1(EX_ALUOp[4], ID_ALUOp[4], 1'b1, Rst, Clk);
    RegBit IDEX_ALUOp3_1(EX_ALUOp[3], ID_ALUOp[3], 1'b1, Rst, Clk);
    RegBit IDEX_ALUOp2_1(EX_ALUOp[2], ID_ALUOp[2], 1'b1, Rst, Clk);
    RegBit IDEX_ALUOp1_1(EX_ALUOp[1], ID_ALUOp[1], 1'b1, Rst, Clk);
    RegBit IDEX_ALUOp0_1(EX_ALUOp[0], ID_ALUOp[0], 1'b1, Rst, Clk);
    
    // 3-bit outputs
    RegBit IDEX_HLType2_1(EX_HLType[2], ID_HLType[2], 1'b1, Rst, Clk);
    RegBit IDEX_HLType1_1(EX_HLType[1], ID_HLType[1], 1'b1, Rst, Clk);
    RegBit IDEX_HLType0_1(EX_HLType[0], ID_HLType[0], 1'b1, Rst, Clk);
    
    // 2-bit outputs
    RegBit IDEX_ByteControl1_1(EX_ByteControl[1], ID_ByteControl[1],
        1'b1, Rst, Clk);
    RegBit IDEX_ByteControl0_1(EX_ByteControl[0], ID_ByteControl[0],
        1'b1, Rst, Clk);
    
    RegBit IDEX_WrDataControl1_1(EX_WrDataControl[1],
        ID_WrDataControl[1], 1'b1, Rst, Clk);
    RegBit IDEX_WrDataControl0_1(EX_WrDataControl[0],
        ID_WrDataControl[0], 1'b1, Rst, Clk);
    
    // 1-bit outputs
    RegBit IDEX_RegDst1(EX_RegDst, ID_RegDst, 1'b1, Rst, Clk);
    RegBit IDEX_ALUSrc1(EX_ALUSrc, ID_ALUSrc, 1'b1, Rst, Clk);
    RegBit IDEX_MemtoReg1(EX_MemtoReg, ID_MemtoReg, 1'b1, Rst, Clk);
    RegBit IDEX_RegWr1(EX_RegWr, ID_RegWr, 1'b1, Rst, Clk);
    RegBit IDEX_MemRd1(EX_MemRd, ID_MemRd, 1'b1, Rst, Clk);
    RegBit IDEX_MemWr1(EX_MemWr, ID_MemWr, 1'b1, Rst, Clk);
    RegBit IDEX_Branch1(EX_Branch, ID_Branch, 1'b1, Rst, Clk);
    RegBit IDEX_JRFlag1(EX_JRFlag, ID_JRFlag, 1'b1, Rst, Clk);
    RegBit IDEX_ShamtControl1(EX_ShamtControl, ID_ShamtControl, 1'b1, Rst, Clk);
    RegBit IDEX_HLWr1(EX_HLWr, ID_HLWr, 1'b1, Rst, Clk);
    RegBit IDEX_VarControl1(EX_VarControl, ID_VarControl, 1'b1, Rst, Clk);
    
    /*output reg [31:0] EX_PCNext, EX_RdData1, EX_RdData2, EX_Imm16Ext,
        EX_Instr;
    output reg [4:0] EX_ALUOp;
    output reg [2:0] EX_HLType;
    output reg [1:0] EX_WrDataControl, EX_ByteControl;
    output reg EX_RegDst, EX_ALUSrc, EX_MemtoReg, EX_RegWr, EX_MemRd,
            EX_MemWr, EX_Branch, EX_JRFlag, EX_ShamtControl,
            EX_HLWr;
            
    reg [31:0] saved_PCNext, saved_RdData1, saved_RdData2, saved_Imm16Ext,
        saved_Instr;
    reg [4:0] saved_ALUOp;
    reg [2:0] saved_HLType;
    reg [1:0] saved_WrDataControl, saved_ByteControl;
    reg saved_RegDst, saved_ALUSrc, saved_MemtoReg, saved_RegWr, saved_MemRd,
            saved_MemWr, saved_Branch, saved_JRFlag, saved_ShamtControl,
            saved_HLWr;
            
    wire [31:0] out_PCNext, out_RdData1, out_RdData2, out_Imm16Ext,
        out_Instr;
    wire [4:0] out_ALUOp;
    wire [2:0] out_HLType;
    wire [1:0] out_WrDataControl, out_ByteControl;
    wire out_RegDst, out_ALUSrc, out_MemtoReg, out_RegWr, out_MemRd,
            out_MemWr, out_Branch, out_JRFlag, out_ShamtControl,
            out_HLWr;
            
    initial begin
        saved_PCNext = {32{1'b0}};
        saved_RdData1 = {32{1'b0}};
        saved_RdData2 = {32{1'b0}};
        saved_Imm16Ext = {32{1'b0}};
        saved_Instr = {32{1'b0}};
        saved_ALUOp = {5{1'b0}};
        saved_HLType = 3'b000;
        saved_WrDataControl = 2'b00;
        saved_ByteControl = 2'b00;
        saved_RegDst = 1'b0;
        saved_ALUSrc = 1'b0; 
        saved_MemtoReg = 1'b0;
        saved_RegWr = 1'b0;
        saved_MemRd = 1'b0;
        saved_MemWr = 1'b0;
        saved_Branch = 1'b0;
        saved_JRFlag = 1'b0;
        saved_ShamtControl = 1'b0;
        saved_HLWr = 1'b0;
        
        EX_PCNext = {32{1'b0}};
        EX_RdData1 = {32{1'b0}};
        EX_RdData2 = {32{1'b0}};
        EX_Imm16Ext = {32{1'b0}};
        EX_Instr = {32{1'b0}};
        EX_ALUOp = {5{1'b0}};
        EX_HLType = 3'b000;
        EX_WrDataControl = 2'b00;
        EX_ByteControl = 2'b00;
        EX_RegDst = 1'b0;
        EX_ALUSrc = 1'b0; 
        EX_MemtoReg = 1'b0;
        EX_RegWr = 1'b0;
        EX_MemRd = 1'b0;
        EX_MemWr = 1'b0;
        EX_Branch = 1'b0;
        EX_JRFlag = 1'b0;
        EX_ShamtControl = 1'b0;
        EX_HLWr = 1'b0;
    end
    
    assign out_PCNext = saved_PCNext;
    assign out_RdData1 = saved_RdData1;
    assign out_RdData2 = saved_RdData2;
    assign out_Imm16Ext = saved_Imm16Ext;
    assign out_Instr = saved_Instr;
    assign out_ALUOp = saved_ALUOp;
    assign out_HLType = saved_HLType;
    assign out_WrDataControl = saved_WrDataControl;
    assign out_ByteControl = saved_ByteControl;
    assign out_RegDst = saved_RegDst;
    assign out_ALUSrc = saved_ALUSrc;
    assign out_MemtoReg = saved_MemtoReg;
    assign out_RegWr = saved_RegWr;
    assign out_MemRd = saved_MemRd;
    assign out_MemWr = saved_MemWr;
    assign out_Branch = saved_Branch;
    assign out_JRFlag = saved_JRFlag;
    assign out_ShamtControl = saved_ShamtControl;
    assign out_HLWr = saved_HLWr;
    
    always @(posedge Clk) begin
        
    end
    
    always @(negedge Clk) begin
    
    end*/
endmodule
