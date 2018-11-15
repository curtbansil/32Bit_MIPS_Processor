`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2017 02:45:04 PM
// Design Name: 
// Module Name: Datapath_top
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


module Datapath_top(Clk, Rst, wd);
    input Clk, Rst;
    output [31:0] wd;
    
    wire Zero, MuxC, Branch, JumpMux, MovControl, PCS, d1, d2, ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemtoReg, PCSrcM, ALUSrcOut,
                        RegDstOut, RegWriteOut, MemReadOut, MemWriteOut, MemtoRegOut, MovControlOut;
    wire [1:0] HLControl, HLControlEX, HLControlMEM, HLControlWB, WDControl;
    wire [2:0] cmprslt;
    wire [3:0] ALUOp;
    wire [4:0] wr;
    wire [31:0] W1, W2, W3, W4, Hi, Lo, RD1, RD2, RD3, N3, N4, PC1, PC2, PC3, IFIDPC, IFIDInst, alui, aluR, instruction, address;
    
    wire [31:0] HiInWB, LoInWB, IdExRegRsOut, IdExRegRtOut, IdExRegRdOut, SignExtOffsetOut, Rd1Out, Rd2Out, ALUOpOut;
    
    //(* mark_debug = "true" *)  wire [31:0] debug_Reg8, debug_Reg16, debug_Reg17, debug_Reg18, debug_Reg19;
    
    //IF
    
    ProgramCounter PC(PC1, address, Rst, Clk);
    PCAdder Add(address, PC2);
    InstructionMemory instMem(address, instruction);
    
    IfIdReg IFID(Clk, PC2, instruction, IFIDPC, IFIDInst);
    
    //ID
    
    Mux5Bit2To1 Mux1(wr, IFIDInst[20:16], IFIDInst[15:11], RegDst);
    RegisterFile Reg(IFIDInst[25:21], IFIDInst[20:16], wr, wd, RegWrite, Clk, RD1, RD2);
    
    Comparator Comp(RD1, RD2, cmprslt);
    
    Controller Cont(IFIDInst[31:26], IFIDInst[10:6], IFIDInst[20:16], IFIDInst[21], IFIDInst[5:0], cmprslt, ALUSrc, RegDst, RegWrite,
                ALUOp, MemRead, MemWrite, MemtoReg, Branch, HLControl, JumpMux, MovControl, WDControl);
                
    SignExtension SE(IFIDInst[15:0], N3);
    ShiftLeft SL(N3, N4);
    Adder A1(PC2, N4, PC3);
    Mux2To1 Mux5(PCS, Branch, Zero, PCSrcM);
    Mux32Bit2To1 Mux4(PC1, PC2, PC3, PCS);
    
    HiLoReg HLR(HLControlWB, HiInWB, LoInWB, Hi, Lo);
    
    IdExReg IDEX(Clk, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemtoReg, HLControl, MovControl, WDControl,
                    IFIDInst[25:21], IFIDInst[20:16], IFIDInst[15:11], N3, RD1, RD2, IdExRegRsOut, IdExRegRtOut, IdExRegRdOut, SignExtOffsetOut, Rd1Out, Rd2Out,
                    ALUSrcOut, RegDstOut, RegWriteOut,  MemReadOut, MemWriteOut, MemtoRegOut, MovControlOut, ALUOpOut);
                    
    //EX
    
    Mux32Bit2To1 Mux6(alui, W1, W3, MuxC);
    ALU32Bit ALU1(ALUOpOut, Rd1Out, B, MSBALUResult, LSBALUResult, Zero);
    
    
    
    
    
//    ProgramCounter PC(PC1, address, Rst, Clk);
//    PCAdder Add(address, PC2);
    
//    InstructionMemory instMem(address, instruction);
    
//    Controller Cont(instruction[31:26], instruction[5:0], MuxC, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemtoReg, PCSrcM);
    
//    Mux5Bit2To1 Mux1(wr, instruction[20:16], instruction[15:11], RegDst);
//    RegisterFile Reg(instruction[25:21], instruction[20:16], wr, wd, RegWrite, Clk, RD1, RD2, debug_Reg8, debug_Reg16, debug_Reg17, debug_Reg18, debug_Reg19);
    
//    SignExtension SE(instruction[15:0], N3);
    
//    Mux32Bit2To1 Mux2(W1, RD2, N3, ALUSrc);
//    Mux32Bit2To1 Mux7(W2, RD1, RD2, MuxC);
    
//    ZeroExtension ZE(instruction[10:6], W3);
//    Mux32Bit2To1 Mux6(alui, W1, W3, MuxC);
//    ALU32Bit Alu1(ALUOp, W2, alui, aluR, Zero);
//    DataMemory DataMem(aluR, RD2, Clk, MemWrite, MemRead, RD3);
//    Mux32Bit2To1 Mux3(wd, aluR, RD3, MemtoReg);
    
//    ShiftLeft SL(N3, N4);
//    Adder A1(PC2, N4, PC3);
//    Mux2To1 Mux5(PCS, 1'b0, Zero, PCSrcM);
//    Mux32Bit2To1 Mux4(PC1, PC2, PC3, PCS);
    
endmodule
