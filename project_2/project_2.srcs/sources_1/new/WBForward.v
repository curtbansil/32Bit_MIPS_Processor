`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2018 04:09:22 AM
// Design Name: 
// Module Name: WBForward_Block
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


module WBForward(RdData1, RdData2, WrData, Rs, Rt, WrRegister,
    RegWrite, RdData1Out, RdData2Out);
    
    input [31:0] RdData1, RdData2, WrData;
    input [4:0] Rs, Rt, WrRegister;
    input RegWrite;
    
    output [31:0] RdData1Out, RdData2Out;
   
    wire ReadSourceRs, ReadSourceRt;
    wire WrRegOr, WrRegRsComp, WrRegRtComp;
    
    // Checking that we're not writing to the Zero Register
    assign WrRegOr = WrRegister[4] | WrRegister[3] | WrRegister[2] | WrRegister[1] | WrRegister[0];
    
    // Compare WrRegister and Rs
    AddressComparator5Bit CompareWrRs(WrRegRsComp, WrRegister, Rs);   
     
    assign ReadSourceRs = RegWrite & WrRegOr & WrRegRsComp;
    
    // Compare WrRegister and Rt
    AddressComparator5Bit CompareWrRt(WrRegRtComp, WrRegister, Rt);
    
    assign ReadSourceRt = RegWrite & WrRegOr & WrRegRtComp;
    
    Mux32Bit2To1 muxRdData1(RdData1Out, RdData1, WrData, ReadSourceRs);
    Mux32Bit2To1 muxRdData2(RdData2Out, RdData2, WrData, ReadSourceRt);
    
endmodule
