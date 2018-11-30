`timescale 1ns / 1ps

module TopModuleV2(Clk, Rst, HiReg, LoReg, WB_RegWD, IF_PCOut);

    input Clk, Rst;
    
    output [31:0] HiReg, LoReg, WB_RegWD, IF_PCOut;
    wire [31:0] index;
    assign index = {2'b00, IF_PCOut[31:2]}; //makes it easier to read in simulation
    // Curt Bansil, Philippe Cutillas
    // Percent Effort: 50/50
    
    // TODO: After everything is working, there are likely stray wire initializations not used
    // for anything due to editing, so it is likely best to remove them.
    
    //----------------------------------------------------------
    //-------------------INITIALIZATIONS------------------------
    
    // IF Wires
    wire IF_PCWrite;
    wire [31:0] IF_PCIn, /*IF_PCOut,*/ IF_PCNext, IF_Instr, IF_PCTemp, IF_PCJump;
    
    // IFID Reg Wires
    wire IFID_WrEn, IFID_Flush;
    
    // ID wires
    wire ID_RegDst, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_BranchC1, ID_BranchC2,
            ID_MemtoReg, ID_ALUSrc, ID_ShamtCtrl, ID_Branch, ID_SignZero, ID_PCJump, ID_JALCtrl;
    wire [1:0] ID_ByteControl;
    wire [3:0] ID_ALUOp;
    wire [3:0] ID_HLGo;
    wire [4:0] ID_RegRs, ID_RegRt, ID_RegRd, ID_ALUControl;
    wire [5:0] ID_Opcode, ID_Function;
    wire [15:0] ID_Imm;
    wire [31:0] ID_Instr, ID_PCNext, ID_ReadData1, ID_ReadData2, ID_ImmExt, ID_ImmExtS,
                ID_ImmExtZ, ID_JAddress, ID_PCBranch, ID_RA;
    
    // IDEX Reg Wires
    
    wire IDEX_Flush, IDEX_WrEn;
    
    // EX Wires
    wire EX_RegDst, EX_RegWrite, EX_MemRead, EX_MemWrite, EX_Zero, EX_JALCtrl,
            EX_MemtoReg, EX_ALUSrc, EX_ShamtCtrl, EX_HLWr, EX_RegWriteMod,
            EX_RegWriteControl, EX_HLFlag;
    wire [1:0] EX_ByteControl;
    wire [2:0] EX_HLType;
    wire [3:0] EX_HLGo;
    wire [4:0] EX_RegRs, EX_RegRt, EX_RegRd, EX_Shamt, EX_ALUControl, EX_WriteRegM, EX_WriteReg;
    wire [5:0] EX_Opcode, EX_Function;
    wire [15:0] EX_Imm;
    wire [31:0] EX_ReadData1, EX_ReadData2, EX_ImmExt, EX_Instr, EX_HLOut, EX_WDMem, EX_ALUInA_Forward,
                EX_ALUInA, EX_ALUInB, EX_ALUOutMSB, EX_ALUOutLSB, EX_OutLSB, EX_RA, EX_lui;
    
    
    // EXMEM Reg Wires
    
    wire EXMEM_Flush;
    
    // MEM Wires
    
    wire MEM_MemWrite, MEM_MemRead, MEM_RegWrite, MEM_MemtoReg, MEM_JALCtrl;
    wire [1:0] MEM_ByteControl;
    wire [4:0] MEM_WriteReg;
    wire [31:0] MEM_ALUOutMSB, MEM_OutLSB, MEM_ReadDataM, MEM_DataIn, MEM_RA, MEM_lui, MEM_WDMem,
                sh, sb;
    
    // MEMWB Reg Wires
    
    wire MEMWB_Flush;
    
    // WB Wires
    
    wire WB_RegWrite, WB_MemtoReg, WB_JALCtrl;
    wire [1:0] WB_ByteControl;
    wire [4:0] WB_WriteReg;
    wire [31:0] WB_WriteData, WB_OutLSB, WB_ALUOutMSB, WB_LoadData,
                WB_lui, WB_ReadDataM, /*WB_RegWD,*/ WB_RA, lb, lh;
    
    // Forwarding/Hazard detection wires
    
    wire ID_ForwardAControl, ID_ForwardBControl;
    wire [1:0] EX_ForwardAControl, EX_ForwardBControl;
    wire [31:0] ID_BOutA, ID_BOutB;
    
    // Jump logic wires
    wire [1:0] Jump;
    wire [31:0] jAddress;
    
    //----------------------------------------------------------
    //------------------------PIPELINE--------------------------
    
//    BranchPredictor BP1(ID_Branch, ID_PCNext, PredictedAd);
    
    ForwardingUnit ForwardUnit1(ID_Opcode, ID_RegRt, ID_RegRs, EX_RegRs, EX_RegRt, MEM_WriteReg, MEM_RegWrite,
        WB_WriteReg, WB_RegWrite, EX_ForwardAControl, EX_ForwardBControl, ID_ForwardAControl, ID_ForwardBControl);
        
    HazardDetection HazardDetection1(ID_BranchC1, ID_Opcode, ID_Function, ID_RegRs, ID_RegRt, EX_RegRt, MEM_WriteReg, EX_MemRead, 
                                          MEM_MemRead, IFID_WrEn, IF_PCWrite, IFID_Flush, IDEX_WrEn, IDEX_Flush, EX_RegWrite, EX_WriteReg);
    
    // Muxes for jumps and branches
    
    assign jAddress = {IF_PCNext[31:28], ID_Instr[25:0], 2'b00};
    
    Mux32Bit2To1 BranchMux1(IF_PCTemp, IF_PCNext, ID_PCBranch, ID_Branch);
    Mux32Bit3To1 JumpMux1(IF_PCJump, IF_PCTemp, jAddress, ID_ReadData1, Jump);
    // 3 to 1 because 3rd is for jr command
    
    //----------------------------------------------------------
    //----------------------IF STAGE----------------------------
    
    ProgramCounter PCReg(IF_PCJump, IF_PCOut, IF_PCWrite, Rst, Clk);
    PCAdder PCAdd1(IF_PCOut, IF_PCNext);
    
    //InstructionMemory InstrMem1(IF_PCOut, IF_Instr);
    InstructionMemoryV2 InstrMem1(IF_PCOut, IF_Instr);
    
    //----------------------------------------------------------
    //----------------------IF/ID REG---------------------------
    
    Reg32Bit IFID_PCNext1(ID_PCNext, IF_PCNext, IFID_WrEn, IFID_Flush, Clk);
    Reg32Bit IFID_Instr1(ID_Instr, IF_Instr, IFID_WrEn, IFID_Flush, Clk);

    //----------------------------------------------------------
    //----------------------ID STAGE----------------------------
    
    assign ID_Opcode = ID_Instr[31:26];
    assign ID_Function = ID_Instr[5:0];
    assign ID_RegRs = ID_Instr[25:21];
    assign ID_RegRt = ID_Instr[20:16];
    assign ID_RegRd = ID_Instr[15:11];
    assign ID_Imm = ID_Instr[15:0];
    
    Controller MainControl(ID_Opcode, ID_RegDst, ID_RegWrite, ID_MemRead, ID_MemWrite,
        ID_MemtoReg, ID_ALUSrc, ID_BranchC1, ID_SignZero, ID_ByteControl,ID_ALUOp);
        
    // ALUController can run at the same time as the rest, but has to run after the controller so may slow our latency
    ALUControl_Block ALUControl1(ID_Function, ID_Instr[10:6], ID_ALUOp, ID_Instr[21], ID_Instr[6],
        ID_ShamtCtrl, ID_ALUControl);
    
    // Takes care of control signals and logic for jumps
    JumpBlock JumpControl1(ID_Opcode, ID_Function, Jump, ID_JALCtrl);
    
    RegisterFile RegFile1(ID_RegRs, ID_RegRt, WB_WriteReg, WB_RegWD, WB_RegWrite, Clk, Rst,
                            ID_ReadData1, ID_ReadData2);
    
    // Forwarding muxes
    Mux32Bit2To1 ID_ForwardA1(ID_BOutA, ID_ReadData1, MEM_OutLSB, ID_ForwardAControl);
    Mux32Bit2To1 ID_ForwardB1(ID_BOutB, ID_ReadData2, MEM_OutLSB, ID_ForwardBControl);
    
    // Branching logic
    Comparator BranchComp1(ID_Opcode, ID_RegRt, ID_BOutA, ID_BOutB, ID_BranchC2);
    AndGate BranchGate1(ID_BranchC1, ID_BranchC2, ID_Branch);
    
    // Detect if hi/lo reg needs to be accessed later
    HLDetect HLDetect1(ID_Opcode, ID_Function, ID_HLGo);
    
    // Extension of immediate
    SignExtension SignExtend1(ID_Imm, ID_ImmExtS);
    ZeroExtension ZeroExtend1(ID_Imm, ID_ImmExtZ);
    Mux32Bit2To1 ExtMux1(ID_ImmExt, ID_ImmExtS, ID_ImmExtZ, ID_SignZero);
    
    // Jump stuff (add more from todo above)
    ShiftLeft ShiftLeft1(ID_ImmExtS, ID_JAddress);
    Adder AddressCalc1(ID_JAddress, ID_PCNext, ID_PCBranch);
    
    // JAL: getting PC+8 to then pass through pipeline
    PCAdder JAL_WDCalc1(ID_PCNext, ID_RA);
    
    //----------------------------------------------------------
    //----------------------ID/EX REG----------------------------
     
    // 32-bit outputs
    Reg32Bit IDEX_RdData1_1(EX_ReadData1, ID_ReadData1, IDEX_WrEn, IDEX_Flush, Clk);
    Reg32Bit IDEX_RdData2_1(EX_ReadData2, ID_ReadData2, IDEX_WrEn, IDEX_Flush, Clk);
    Reg32Bit IDEX_ImmExt1(EX_ImmExt, ID_ImmExt, IDEX_WrEn, IDEX_Flush, Clk);
    Reg32Bit IDEX_Instruction1(EX_Instr, ID_Instr, IDEX_WrEn, IDEX_Flush, Clk);
    Reg32Bit IDEX_RA1(EX_RA, ID_RA, IDEX_WrEn, IDEX_Flush, Clk);
    
    // 5-bit outputs
    RegBit IDEX_ALUControl4_1(EX_ALUControl[4], ID_ALUControl[4], IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_ALUControl3_1(EX_ALUControl[3], ID_ALUControl[3], IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_ALUControl2_1(EX_ALUControl[2], ID_ALUControl[2], IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_ALUControl1_1(EX_ALUControl[1], ID_ALUControl[1], IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_ALUControl0_1(EX_ALUControl[0], ID_ALUControl[0], IDEX_WrEn, IDEX_Flush, Clk);
    
    // 4-bit outputs
    RegBit IDEX_HLGo3_1(EX_HLGo[3], ID_HLGo[3], IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_HLGo2_1(EX_HLGo[2], ID_HLGo[2], IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_HLGo1_1(EX_HLGo[1], ID_HLGo[1], IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_HLGo0_1(EX_HLGo[0], ID_HLGo[0], IDEX_WrEn, IDEX_Flush, Clk);
     
    // 2-bit outputs
    RegBit IDEX_ByteControl1_1(EX_ByteControl[1], ID_ByteControl[1], IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_ByteControl0_1(EX_ByteControl[0], ID_ByteControl[0], IDEX_WrEn, IDEX_Flush, Clk);
     
    // 1-bit outputs
    RegBit IDEX_RegDst1(EX_RegDst, ID_RegDst, IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_ALUSrc1(EX_ALUSrc, ID_ALUSrc, IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_MemtoReg1(EX_MemtoReg, ID_MemtoReg, IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_RegWr1(EX_RegWrite, ID_RegWrite, IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_MemRd1(EX_MemRead, ID_MemRead, IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_MemWr1(EX_MemWrite, ID_MemWrite, IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_ShamtControl1(EX_ShamtCtrl, ID_ShamtCtrl, IDEX_WrEn, IDEX_Flush, Clk);
    RegBit IDEX_JALCtrl1(EX_JALCtrl, ID_JALCtrl, IDEX_WrEn, IDEX_Flush, Clk);
    
    //----------------------------------------------------------
    //----------------------EX STAGE----------------------------
    
    assign EX_Shamt = EX_Instr[10:6];
    assign EX_Opcode = EX_Instr[31:26];
    assign EX_Function = EX_Instr[5:0];
    assign EX_RegRs = EX_Instr[25:21];
    assign EX_RegRt = EX_Instr[20:16];
    assign EX_RegRd = EX_Instr[15:11];
    assign EX_lui = {EX_Instr[15:0], 16'b0000000000000000};
    
    // RegDst Mux for Rt and Rd
    Mux5Bit2To1 RegDstMux1(EX_WriteReg, EX_RegRt, EX_RegRd, EX_RegDst);
    
    // Setting Reg Dst to GPR[31] if instruction is JAL
    Mux5Bit2To1 JALDstMux1(EX_WriteRegM, EX_WriteReg, 5'b11111, EX_JALCtrl);
    
    // For movz/movn
    MovCheck MovControl1(EX_Instr, EX_RegWrite, EX_ReadData2, EX_RegWriteMod);
    
    // Hi/Lo register logic
    HiLoControl HLCtrl1(EX_HLGo, EX_HLWr, EX_HLType, EX_HLFlag);
    
    // Forwarding muxes
    Mux32Bit3To1 EX_ForwardA1(EX_ALUInA_Forward, EX_ReadData1, WB_WriteData, MEM_OutLSB, EX_ForwardAControl);
    Mux32Bit3To1 EX_ForwardB1(EX_WDMem, EX_ReadData2, WB_WriteData, MEM_OutLSB, EX_ForwardBControl);
    
    // ALU Logic, controller is in ID (makes it faster i think)
    Mux32Bit2To1 ALUSrcMux1(EX_ALUInB, EX_WDMem, EX_ImmExt, EX_ALUSrc);
    Mux32Bit2To1 ShamtMux1(EX_ALUInA, EX_ALUInA_Forward, {{27{1'b0}},EX_Shamt}, EX_ShamtCtrl);
    
    ALU32Bit ALU1(EX_ALUInA, EX_ALUInB, EX_ALUControl, EX_ALUOutMSB, EX_ALUOutLSB, EX_Zero); //zero will not be wired
    HiLoReg HiLoReg1(Clk, EX_HLWr, EX_HLType, EX_ALUInA, EX_ALUInB, EX_HLOut, HiReg, LoReg); // Using hte same forwarded inputs to ALU for HL Reg
    
    // Choose between ALU Output and HLReg Output
    Mux32Bit2To1 ALUHLMux1(EX_OutLSB, EX_ALUOutLSB, EX_HLOut, EX_HLFlag);
    
    assign EX_RegWriteControl = EX_RegWriteMod & !(EX_HLWr & !EX_HLFlag);
    //----------------------------------------------------------
    //----------------------EX/MEM REG--------------------------
    
    assign EXMEM_Flush = 1'b0; //won't ever flush EX/MEM and MEM/WB regs so hardcode the flushes to 0
    
    // 32-bit outputs
    Reg32Bit EXMEM_ALUOutMSB1(MEM_ALUOutMSB, EX_ALUOutMSB, 1'b1, EXMEM_Flush, Clk);
    Reg32Bit EXMEM_OutLSB1(MEM_OutLSB, EX_OutLSB, 1'b1, EXMEM_Flush, Clk);
    Reg32Bit EXMEM_lui1(MEM_lui, EX_lui, 1'b1, EXMEM_Flush, Clk);
    Reg32Bit EXMEM_RA1(MEM_RA, EX_RA, 1'b1, EXMEM_Flush, Clk);
    Reg32Bit EXMEM_WDMem1(MEM_WDMem, EX_WDMem, 1'b1, EXMEM_Flush, Clk);
    
    // 5-bit outputs
    RegBit EXMEM_WriteReg4_1(MEM_WriteReg[4], EX_WriteRegM[4], 1'b1, EXMEM_Flush, Clk);
    RegBit EXMEM_WriteReg3_1(MEM_WriteReg[3], EX_WriteRegM[3], 1'b1, EXMEM_Flush, Clk);
    RegBit EXMEM_WriteReg2_1(MEM_WriteReg[2], EX_WriteRegM[2], 1'b1, EXMEM_Flush, Clk);
    RegBit EXMEM_WriteReg1_1(MEM_WriteReg[1], EX_WriteRegM[1], 1'b1, EXMEM_Flush, Clk);
    RegBit EXMEM_WriteReg0_1(MEM_WriteReg[0], EX_WriteRegM[0], 1'b1, EXMEM_Flush, Clk);
    
    // 2-bit outputs
    RegBit EXMEM_ByteControl1_1(MEM_ByteControl[1], EX_ByteControl[1], 1'b1, EXMEM_Flush, Clk);
    RegBit EXMEM_ByteControl0_1(MEM_ByteControl[0], EX_ByteControl[0], 1'b1, EXMEM_Flush, Clk);
     
    // 1-bit outputs
    RegBit EXMEM_MemtoReg1(MEM_MemtoReg, EX_MemtoReg, 1'b1, EXMEM_Flush, Clk);
    RegBit EXMEM_RegWr1(MEM_RegWrite, EX_RegWriteControl, 1'b1, EXMEM_Flush, Clk);
    RegBit EXMEM_MemRd1(MEM_MemRead, EX_MemRead, 1'b1, EXMEM_Flush, Clk);
    RegBit EXMEM_MemWr1(MEM_MemWrite, EX_MemWrite, 1'b1, EXMEM_Flush, Clk);
    RegBit EXMEM_JALCtrl1(MEM_JALCtrl, EX_JALCtrl, 1'b1, EXMEM_Flush, Clk);
    
    //----------------------------------------------------------
    //-----------------------MEM STAGE--------------------------
    
    assign sh = {16'b0000000000000000, MEM_WDMem[15:0]};
    assign sb = {24'b000000000000000000000000, MEM_WDMem[7:0]};
    
    Mux32Bit4To1 StoreDataMux1(MEM_DataIn, MEM_WDMem, sh, sb, 32'h00000000, MEM_ByteControl);
    
    DataMemoryV2 DataMem1(MEM_OutLSB, MEM_DataIn, Clk, MEM_MemWrite, MEM_MemRead, MEM_ReadDataM);
    
    //----------------------------------------------------------
    //----------------------MEM/WB REG--------------------------
    
    assign MEMWB_Flush = 1'b0; //won't ever flush EX/MEM and MEM/WB regs so hardcode the flushes to 0
    
    // 32-bit outputs
    Reg32Bit MEMWB_ReadData1(WB_ReadDataM, MEM_ReadDataM, 1'b1, MEMWB_Flush, Clk);
    Reg32Bit MEMWB_ALUOutMSB1(WB_ALUOutMSB, MEM_ALUOutMSB, 1'b1, MEMWB_Flush, Clk);
    Reg32Bit MEMWB_OutLSB1(WB_OutLSB, MEM_OutLSB, 1'b1, MEMWB_Flush, Clk);
    Reg32Bit MEMWB_lui1(WB_lui, MEM_lui, 1'b1, MEMWB_Flush, Clk);
    Reg32Bit MEMWB_RA1(WB_RA, MEM_RA, 1'b1, MEMWB_Flush, Clk);
    
    // 5-bit outputs
    RegBit MEMWB_WriteReg4_1(WB_WriteReg[4], MEM_WriteReg[4], 1'b1, MEMWB_Flush, Clk);
    RegBit MEMWB_WriteReg3_1(WB_WriteReg[3], MEM_WriteReg[3], 1'b1, MEMWB_Flush, Clk);
    RegBit MEMWB_WriteReg2_1(WB_WriteReg[2], MEM_WriteReg[2], 1'b1, MEMWB_Flush, Clk);
    RegBit MEMWB_WriteReg1_1(WB_WriteReg[1], MEM_WriteReg[1], 1'b1, MEMWB_Flush, Clk);
    RegBit MEMWB_WriteReg0_1(WB_WriteReg[0], MEM_WriteReg[0], 1'b1, MEMWB_Flush, Clk);
    
    // 2-bit outputs
    RegBit MEMWB_ByteControl1_1(WB_ByteControl[1], MEM_ByteControl[1], 1'b1, EXMEM_Flush, Clk);
    RegBit MEMWB_ByteControl0_1(WB_ByteControl[0], MEM_ByteControl[0], 1'b1, EXMEM_Flush, Clk);
    
    // 1-bit outputs
    RegBit MEMWB_MemtoReg1(WB_MemtoReg, MEM_MemtoReg, 1'b1, MEMWB_Flush, Clk);
    RegBit MEMWB_RegWr1(WB_RegWrite, MEM_RegWrite, 1'b1, MEMWB_Flush, Clk);
    RegBit MEMWB_JALCtrl1(WB_JALCtrl, MEM_JALCtrl, 1'b1, MEMWB_Flush, Clk);
    
    //----------------------------------------------------------
    //-----------------------WB STAGE---------------------------
    
    assign lh = {16'b0000000000000000, WB_ReadDataM[15:0]};
    assign lb = {24'b000000000000000000000000, WB_ReadDataM[7:0]};
    
    // Normal muxes to choose which data to send to register
    Mux32Bit4To1 LoadDataMux1(WB_LoadData, WB_ReadDataM, lh, lb, WB_lui, WB_ByteControl);
    // Same mux as in MEM stage^
    Mux32Bit2To1 WBMux(WB_WriteData, WB_LoadData, WB_OutLSB, WB_MemtoReg);
    
    // JAL Mux #2
    Mux32Bit2To1 JALMux(WB_RegWD, WB_WriteData, WB_RA, WB_JALCtrl);
    
endmodule
