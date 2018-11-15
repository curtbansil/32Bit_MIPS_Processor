`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2018 10:01:15 PM
// Design Name: 
// Module Name: Execute
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


module EXStage(Clk, EX_RegDst, EX_ALUSrc, EX_MemtoReg, EX_RegWr,
            EX_MemRd,EX_MemWr, EX_Branch, EX_JRFlag, EX_ShamtControl,
            EX_HLWr, EX_VarControl, EX_WrDataControl, EX_ByteControl, EX_HLType,
            EX_ALUOp, EX_PCNext, EX_RdData1, EX_RdData2, EX_Imm16Ext,
            EX_Instr, MEM_WrReg, WB_WrReg, MEM_RegWr, WB_RegWr,
            EX_MSBALUResult, EX_LSBALUResult, EX_HLOut, EX_WrReg);
            
    output [31:0] EX_MSBALUResult, EX_LSBALUResult, EX_HLOut;
    output [4:0] EX_WrReg;
    
    input [31:0] EX_PCNext, EX_RdData1, EX_RdData2, EX_Imm16Ext,
    EX_Instr;
    input [4:0] EX_ALUOp;
    input [2:0] EX_HLType;
    input [1:0] EX_WrDataControl, EX_ByteControl;
    input EX_RegDst, EX_ALUSrc, EX_MemtoReg, EX_RegWr, EX_MemRd,EX_MemWr,
    EX_Branch, EX_JRFlag, EX_ShamtControl, EX_HLWr, EX_VarControl;
    input Clk, Jump;
    
    // Forwarding inputs
    input [4:0] MEM_WrReg, WB_WrReg;
    input MEM_RegWr, WB_RegWr;
    
    // For Forwarding
    wire [31:0] AInpForwarded, BInpForwarded, EX_RdData1, EX_RdData2,
        MEM_ALUResult, WB_WrData;
    wire [31:0] ShamtOut, RtResult;
    wire ForwardA, ForwardB;
    
    wire [31:0] ALUInpAMux, ALUInpA, ALUInpB;
    wire [4:0] EX_Rs, EX_Rt, EX_Rd, EX_Shamt, EX_RdData1Shamt;
    wire [4:0] RtRdOut;
    wire NotBrAndSrc, NotMovInstr, ZeroFlag, OverflowFlag;
    
    assign EX_Rs = EX_Instr[25:21];
    assign EX_Rt = EX_Instr[20:16];
    assign EX_Rd = EX_Instr[15:11];
    assign EX_Shamt = EX_Instr[10:6];
    assign EX_RdData1Shamt = EX_RdData1[4:0];
    
    // if WrDataControl = 01, then we have MovInstr, so set this to 0. Else, 1
    assign NotMovInstr = EX_WrDataControl[1] | !(EX_WrDataControl[0]);
    
    // Forwarding
    ForwardingUnit ForwardingUnit1(MEM_WrReg, WB_WrReg, EX_Rs, EX_Rt, 
        MEM_RegWr, WB_RegWr, ForwardA, ForwardB);
        
    // Choosing ALU Input A
    // First choose the Rs Data based on Forwarding
    Mux32Bit3To1 Mux3A1(AInpForwarded, EX_RdData1, MEM_ALUResult, WB_WrData, ForwardA);
    // Choose Shamt input
    Mux32Bit2To1 MuxVarControl1(ShamtOut, {{27{1'b0}}, EX_Shamt},
        {{27{1'b0}}, EX_RdData1Shamt}, EX_VarControl);
    // Then choose Input A based on ShamtControl
    Mux32Bit2To1 MuxShamtControl1(ALUInpAMux, AInpForwarded, ShamtOut,
        EX_ShamtControl);
    // And Input A with WrDataControl. If WrDataControl = 01, 
    // then Input A must be 0--> !(!WrDataControl[1] & WrDataControl[0]) & A
    // --> (WrDataControl[1] | !WrDataControl[0]) & A
    assign ALUInpA = {32{NotMovInstr}} & ALUInpAMux;
    
    // Choosing ALU Input B
    // First choose the Rt Data based on Forwarding
    Mux32Bit3To1 MuxB1(BInpForwarded, EX_RdData2, MEM_ALUResult, WB_WrData, ForwardB);
    // If Branch is 1 and not seq/sne, Rt must be 0. Else Rt goes through
    BrWithZeroCompare BrWithZero1(RtResult, BInpForwarded, EX_ALUOp, EX_Branch);
    // Then choose Input B based on ALUSrc
    Mux32Bit2To1 MuxALUSrc1(ALUInpB, RtResult, EX_Imm16Ext, EX_ALUSrc);
    
    ALU32Bit ALUBlock1(ALUInpA, ALUInpB, EX_ShamtControl, EX_ALUOp, 
        EX_MSBALUResult, EX_LSBALUResult, ZeroFlag, OverflowFlag);
        
    HiLoReg HiLoReg1(Clk, EX_HLWr, EX_HLType, EX_RdData1, EX_RdData2,EX_HLOut);
    
    // Setting EX_WrReg
    Mux5Bit2To1 MuxRtRd1(RtRdOut, EX_Rt, EX_Rd, EX_RegDst);
    Mux5Bit2To1 MuxWrReg1(EX_WrReg, RtRdOut, {5{1'b1}}, Jump);
endmodule
