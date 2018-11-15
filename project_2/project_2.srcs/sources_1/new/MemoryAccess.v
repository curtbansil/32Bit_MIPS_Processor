`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2018 10:01:15 PM
// Design Name: 
// Module Name: MemoryAccess
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


module MemoryAccess(Clk, RegWrite, MemWrite, MemRead, MemtoReg, Data, MSBALUResult, LSBALUResult, RegRd, RegWriteO,
                                    MemtoRegO, MemData, MSBALUResultO, LSBALUResultO, RegRdO, HLControlI, WDControlI,
                                    HLControlO, WDControlO, MovControlI, MovControlO);

    input Clk, RegWrite, MemWrite, MemRead, MemtoReg, MovControlI;
    input [2:0] HLControlI;
    input [1:0] WDControlI;
    input [4:0] RegRd;
    input [31:0] Data, MSBALUResult, LSBALUResult;
    
    output RegWriteO, MemtoRegO, MovControlO;
    output [2:0] HLControlO;
    output [1:0] WDControlO;
    output [4:0] RegRdO;
    output [31:0] MSBALUResultO, LSBALUResultO;
    output [31:0] MemData;
    
    assign RegWriteO = RegWrite;
    assign MemtoRegO = MemtoReg;
    assign RegRdO = RegRd;
    assign MSBALUResultO = MSBALUResult;
    assign LSBALUResultO = LSBALUResult;
    assign HLControlO = HLControlI;
    assign WDControlO = WDControlI;
    assign MovControlO = MovControlI;
    
    DataMemory DataMem(LSBALUResult, Data, Clk, MemWrite, MemRead, MemData);

endmodule
