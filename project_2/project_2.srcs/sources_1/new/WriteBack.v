`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2018 10:01:15 PM
// Design Name: 
// Module Name: WriteBack
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


module WriteBack(Clk, RegWrite, MemtoReg, RegRd, MSBALUResult, LSBALUResult, MemData, RegWriteO, RegRdO, MSBALUResultO, WriteData,
                        HLControlI, WDControlI, HLControlO, WDControlO, MovControlI, MovControlO);

    input Clk, RegWrite, MemtoReg, MovControlI;
    input [2:0] HLControlI;
    input [1:0] WDControlI;
    input [4:0] RegRd;
    input [31:0] MSBALUResult, LSBALUResult, MemData;
    
    output RegWriteO, MovControlO;
    output [2:0] HLControlO;
    output [1:0] WDControlO;
    output [4:0] RegRdO;
    output [31:0] MSBALUResultO;
    output [31:0] WriteData;
    
    assign MSBALUResultO = MSBALUResult;
    assign RegRdO = RegRd;
    assign RegWriteO = RegWrite;
    assign HLControlO = HLControlI;
    assign WDControlO = WDControlI;
    assign MovControlO = MovControlI;
    
    Mux32Bit2To1 WriteBack(WriteData, MemData, LSBALUResult, MemtoReg);

endmodule
