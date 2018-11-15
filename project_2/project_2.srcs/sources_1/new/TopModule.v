`timescale 1ns / 1ps

module TopModule(Clk, Rst);

    input Clk, Rst;
    
    wire [31:0] PC, PCIn;
    wire [31:0] PCNext, ID_PCNext, EX_PCNext;
    wire [31:0] EX_PC8, MEM_PC8, WB_PC8;
    wire [31:0] PCDoBr, PCNextDoBr, PCJump, PCNextDoBrJump,
        PCJumpR; // PC Signals that go through MUXes
    
    wire [31:0] Instr, ID_Instr, EX_Instr; // Output of Instruction Memory
    
    wire [5:0] Opcode, Function;
    
    // Register File Vars
    wire [4:0] Rs, Rt, Rd, EX_Rs, EX_Rt, EX_Rd;
    wire [4:0] EX_WriteReg, MEM_WriteReg, WB_WriteReg;
    wire [31:0] RdData1, RdData2, RdData1Out, RdData2Out,
        EX_RdData1, EX_RdData2, WB_WriteData;
    
    // Extend Var
    wire [31:0] SignExtOut, ZeroExtOut, Imm16Ext, EX_Imm16Ext;
    wire [15:0] Imm16;
    
    // Controller Vars
    wire RegDst, ALUSrc, MemtoReg, RegWr, MemRd,
       MemWr, Branch, JRFlag, ShamtControl, HLWr, VarControl,
       Jump, SignZero;
    wire ID_RegDst, ID_ALUSrc, ID_MemtoReg, ID_RegWr, ID_MemRd,
        ID_MemWr, ID_Branch, ID_JRFlag,ID_ShamtControl,
        ID_HLWr, ID_VarControl;
    wire EX_RegDst, EX_ALUSrc, EX_MemtoReg, EX_RegWr, EX_MemRd,
        EX_MemWr, EX_Branch, EX_JRFlag, EX_ShamtControl, EX_HLWr, EX_VarControl;
    wire MEM_MemToReg, MEM_RegWr, MEM_MemRd, MEM_MemWr;
    wire WB_MemToReg, WB_RegWr;
    
    wire [1:0] ByteControl, ID_ByteControl, EX_ByteControl, 
        MEM_ByteControl, WB_ByteControl;
    wire [1:0] WrDataControl, ID_WrDataControl, EX_WrDataControl,
        MEM_WrDataControl, WB_WrDataControl;
    
    wire [2:0] HLType, ID_HLType, EX_HLType;
    
    wire [4:0] ALUOp, ID_ALUOp, EX_ALUOp;
    wire [4:0] EX_Shamt, EX_RdData1Shamt;
    wire [1:0] ALUControl;
    wire [1:0] ForwardA, ForwardB;
    
    // Comparator Vars
    wire ImmFlag, CompControl;
    
    wire BranchFlag, NotBranchFlag;
    
    wire JumpFlag, JumpFlush;
    
    // Flush Vars
    wire Flush, ID_Flush, IF_Flush, IFID_Flush, NotIFID_Flush,
        Stall_Flush;
    
    // Shift Left Outputs
    wire [31:0] ShiftLeft_DoBrOut, ShiftLeft_JumpOut;
    
    // PC Write Enable, IF/ID Reg Write Enable
    wire PCWrEn, IFID_WrEn;
    
    // ALU Vars
    wire [31:0] EX_ALUResult, MEM_ALUResult, WB_ALUResult;
    //wire [31:0] EX_MSBALUResult, MEM_MSBALUResult, WB_MSBALUResult;
    //wire [31:0] EX_LSBALUResult, MEM_LSBALUResult, WB_LSBALUResult;
    wire [31:0] ALUInp1, ALUInp2, MSBALUOutForward, LSBALUOutForward;
    wire [31:0] EX_HLLResult, MEM_HLResult, WB_HLResult;
    wire Zero, Overflow, NotZero;
    
    wire [31:0] WrDataOfMem, MEM_RdDataOfMem, WB_RdDataOfMem;
    
    //----------------------------------------------------------
    //----------------------IF STAGE----------------------------
    ProgramCounter PCReg(PC, PCIn, Rst, Clk);
    PCAdder PCAdd1(PC, PCNext);
    
    InstructionMemory InstrMem1(PC, Instr);
    
    //----------------------------------------------------------
    //----------------------IF/ID REG---------------------------
    Reg32Bit IFID_PCNext1(ID_PCNext, PCNext, IFID_WrEn, Rst, Clk);
    Reg32Bit IFID_Instr1(ID_Instr, Instr, IFID_WrEn, Rst, Clk);
    RegBit   IF_Flush1(IFID_Flush, IF_Flush, IFID_WrEn, Rst,Clk);

    //----------------------------------------------------------
    //----------------------ID STAGE----------------------------
     assign Opcode = ID_Instr[31:26];
     assign Function = ID_Instr[5:0];
     assign Rs = ID_Instr[25:21];
     assign Rt = ID_Instr[20:16];
     assign Rd = ID_Instr[15:11];
     assign Imm16 = ID_Instr[15:0];
     
     Controller MainControl(
     Opcode,
     ID_Instr[10:6],
     Rt, 
     ID_Instr[21],
     Function,
     ALUSrc,
     RegDst,
     RegWr,
     ALUOp,
     MemRd,
     MemWr,
     MemtoReg,
     Jump,
     Branch,
     SignZero,
     ByteControl,
     ShamtControl,
     WrDataControl, 
     VarControl);
     
     RegisterFile RegFile1(
     Rs,
     Rt,
     WB_WriteReg,
     WB_WriteData,
     WB_RegWr,
     Clk,
     RdData1, 
     RdData2);
     
     // Forward the Read Data if writing and reading at the same time;
     WBForward WBForward1(RdData1, RdData2, WB_WriteData, Rs, Rt, 
         WB_WriteReg, WB_RegWr, RdData1Out, RdData2Out);
      
     // Sign Extend and Zero Extend
     SignExtension SignExtension1(Imm16, SignExtOut); 
     ZeroExtension ZeroExtension1(Imm16, ZeroExtOut);
     
     Mux32Bit2To1 MuxExtOut(Imm16Ext, SignExtOut, ZeroExtOut, SignZero);
     
     // JR Block
     JRBlock JRBlock1(JRFlag, ALUOp, Function);
     
     // Discard Instruction Block
     DiscardInstrBlock DiscardInstrBlock1(Jump, BranchFlag, EX_JRFlag,
         ID_Flush, IF_Flush);
     
     // Flush Block
     assign Flush = ID_Flush | IFID_Flush | Stall_Flush;
     FlushBlock FlushBlock1(Flush, RegDst,ALUSrc, MemtoReg,
         RegWr, MemRd, MemWr, Branch, JRFlag, ShamtControl, 
         WrDataControl, ByteControl, ALUOp,HLWr, HLType,VarControl, ID_HLWr, ID_RegDst, ID_ALUSrc,
         ID_MemtoReg, ID_RegWr, ID_MemRd, ID_MemWr, ID_Branch,
         ID_JRFlag, ID_ShamtControl, ID_WrDataControl, ID_ByteControl,
         ID_ALUOp, ID_HLType, ID_VarControl);
         
      //----------------------------------------------------------
     //----------------------ID/EX REG----------------------------
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
     
     //----------------------------------------------------------
     //----------------------EX STAGE----------------------------
     assign EX_Shamt = EX_Instr[10:6];
     assign EX_RdData1Shamt = EX_RdData1[4:0];
     
     // Forwarding
     ForwardingUnit ForwardingUnit1(MEM_WriteReg, WB_WriteReg,
        EX_Rs, EX_Rt,MEM_RegWr, WB_RegWr, ForwardA, ForwardB);
         
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
         
     HiLoControl HLControlBlock1(
              EX_Instr,
              Function,
              HLWr,
              HLType);
              
     HiLoReg HiLoReg1(Clk, EX_HLWr, EX_HLType, EX_RdData1, EX_RdData2,EX_HLOut);
     
     // Setting EX_WrReg
     Mux5Bit2To1 MuxRtRd1(RtRdOut, EX_Rt, EX_Rd, EX_RegDst);
     Mux5Bit2To1 MuxWrReg1(EX_WrReg, RtRdOut, {5{1'b1}}, Jump);
     
endmodule
