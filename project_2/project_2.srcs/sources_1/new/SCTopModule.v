`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 05:02:23 PM
// Design Name: 
// Module Name: SCTopModule
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


module SCTopModule(Clk, Rst);

    input Clk, Rst;
    
    wire [31:0] Hi, Lo, WriteDataI, PCNext;
    
    wire PCSrc, Jump, RegDst0, MemRead0, MemWrite0, MemtoReg0, ALUSrc0, RegWrite0, RegWriteI,
                      RegDst1, MemRead1, MemWrite1, MemtoReg1, ALUSrc1, RegWrite1,
                      MemRead2, MemWrite2, MemtoReg2, RegWrite2, Zero,
                      MemRead3, MemWrite3, MemtoReg3, RegWrite3, Zero3,
                      MemtoReg4, RegWrite4,
                      MemtoReg5, RegWrite5,
                      MovControlI, MovControl0, MovControl1, MovControl2, MovControl3, MovControl4, MovControl5;
                      
    wire [1:0] WDControl0, WDControlI, WDControl1, WDControl2, WDControl3, WDControl4, WDControl5;
    wire [2:0] HLControlI, HLControl0, HLControl1, HLControl2, HLControl3, HLControl4, HLControl5;
    wire [4:0] ALUOp0, ALUOp1, rs0, rt0, rd0, rs1, rt1, rd1, RegRdI, RegRd2, RegRd3, RegRd4, RegRd5;
    
    wire [31:0] JumpAddress, PCBranch, PCNextJ, PCOut, Instruction, InstOut,
                /*WriteDataI,*/ WriteData2, WriteData3, WriteData4, WriteData5,
                Data10, Data11, Data20, Data21, Data22, Data23,
                Immediate0, Immediate1,
                MSBALUResultI, MSBALUResult2, MSBALUResult3, MSBALUResult4, MSBALUResult5,
                MemData4, MemData5;
    
    
    InstructionFetch1 IF(Clk, Rst, PCBranch, Jump, JumpAddress, PCNext, Instruction);
    
    //IfIdReg IFID(Clk, PCNext, Instruction, PCOut, InstOut);
    
    Decode ID(Clk, Instruction, PCNext, RegRdI, WriteDataI, PCBranch, RegDst0, Jump, MemRead0, MemtoReg0, ALUOp0, MemWrite0, ALUSrc0, RegWriteI, RegWrite0,
                          Data10, Data20, Immediate0, rs0, rt0, rd0, MSBALUResultI, HLControlI, HLControl0, MovControlI, MovControl0, PCNextJ,  WDControlI, WDControl0, Hi, Lo);
                  
          /*Clk, Instruction, PCNext, WriteRegister, WriteData, PCBranch, RegDst, Jump, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWriteI, RegWriteO,
                    Data1, Data2, Immediate, rs, rt, rd, MSBALUResult, HLControlI, HLControlO, MovControlI, MovControlO, PCNextJ, WDControlI, WDControlO, Hi, Lo*/
                  
    //IdExReg IDEX(Clk, ALUSrc0, RegDst0, RegWrite0, ALUOp0, MemRead0, MemWrite0, MemtoReg0, HLControl0, MovControl0, WDControl0,
    //                      rs0, rt0, rd0, Immediate0, Data10, Data20, rs1, rt1, rd1, Immediate1, Data11, Data21,
    //                      ALUSrc1, RegDst1, RegWrite1, MemRead1, MemWrite1, MemtoReg1, MovControl1, ALUOp1, HLControl1, WDControl1);
                          
    Execute EX(Clk, RegDst0, MemRead0, MemRead2, MemtoReg0, MemtoReg2, ALUOp0, MemWrite0, MemWrite2, ALUSrc0, RegWrite0, RegWrite2,
                          Data10, Data20, Data22, Immediate0, rs0, rt0, rd0, RegRd2, WriteData2, MSBALUResult2, HLControl0, HLControl2, WDControl0,
                          WDControl2, MovControl0, MovControl2, Zero);
                          
              /*Clk, RegDst, MemRead, MemReadO, MemtoReg, MemtoRegO, ALUOp, MemWrite, MemWriteO, ALUSrc, RegWrite, RegWriteO,
                        Data1, Data2, Data2O, Immediate, rs, rt, rd, RegRd, WriteData, MSBALUResult, HLControlI, HLControlO, WDControlI,
                        WDControlO, MovControlI, MovControlO, Zero*/
    
//    ExMemReg EXMEM(Clk, RegWrite2, MemRead2, MemWrite2, MemtoReg2, HLControl2, MovControl2, WDControl2,
//                          RegRd2, Data22, RegRd3, Data23, Zero, Zero3, RegWrite3, MemRead3, MemWrite3, MemtoReg3, MovControl3,
//                          WriteData2, MSBALUResult2, WriteData3, MSBALUResult3, HLControl3, WDControl3);
                          
    MemoryAccess MEM(Clk, RegWrite2, MemWrite2, MemRead2, MemtoReg2, Data22, MSBALUResult2, WriteData2, RegRd2, RegWrite4,
                          MemtoReg4, MemData4, MSBALUResult4, WriteData4, RegRd4, HLControl2, WDControl2, HLControl4, WDControl4,
                          MovControl2, MovControl4);
                          
      /*Clk, RegWrite, MemWrite, MemRead, MemtoReg, Data, MSBALUResult, LSBALUResult, RegRd, RegWriteO,
                  MemtoRegO, MemData, MSBALUResultO, LSBALUResultO, RegRdO, HLControlI, WDControlI,
                  HLControlO, WDControlO, MovControlI, MovControlO*/
                          
//    MemWbReg MEMWB(Clk, RegWrite4, MemtoReg4, HLControl4, MovControl4, WDControl4,
//                          RegRd4, RegRd5, MemData4, MemData5, RegWrite5, MemtoReg5, MovControl5,
//                          WriteData4, MSBALUResult4, WriteData5, MSBALUResult5, HLControl5, WDControl5);
                          
    WriteBack WB(Clk, RegWrite4, MemtoReg4, RegRd4, MSBALUResult4, WriteData4, MemData4, RegWriteI, RegRdI,
                            MSBALUResultI, WriteDataI, HLControl5, WDControl5, HLControlI, WDControlI,
                              MovControl4, MovControlI);
                              
  /*Clk, RegWrite, MemtoReg, RegRd, MSBALUResult, LSBALUResult, MemData, RegWriteO, RegRdO, MSBALUResultO, WriteData,
                      HLControlI, WDControlI, HLControlO, WDControlO, MovControlI, MovControlO*/
    
endmodule
