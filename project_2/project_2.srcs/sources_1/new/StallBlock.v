`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2018 11:51:22 AM
// Design Name: 
// Module Name: StallBlock
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


module StallBlock(ID_Rs, ID_Rt, EX_MemRd, EX_Rt, ID_Op, 
    PCWriteEn, IFID_WriteEn, StallFlag);
     
    // Need to stall when reading from memory and the 
    // destination register, EX_Rt, of the current memory instruction
    // is the same as the source register, ID_Rs or ID_rt, of the 
    // instruction coming from the ID stage.
    // The exceptions for this are for the xori and lw instructions,
    // where Rt is not the source register, but rather the destination
    // register
    // TODO: Find other instructions where Rt isn't the source reg
                                  
    input ID_Rs, ID_Rt, EX_MemRd, EX_Rt;
    wire [4:0] ID_Rs, ID_Rt, EX_Rt;
    wire EX_MemRd;
    input [5:0] ID_Op;
    
    output PCWriteEn, IFID_WriteEn, StallFlag;
    wire PCWriteen, IFID_WriteEn, StallFlag;
    
    wire [4:0] XorRsRt, XorRtRt;
    wire [5:0] XorOpLw, XorOpXori;
    wire OrRsRt, NotOrRsRt, OrRtRt, NotOrRtRt;
    wire Exception1, Exception2;
    wire XorOp, XorOpRt, OrOut, Stall;
    
    // We use bit-wise operations so that our code is more structural.
    // ^ = xor
    // if EX_Rt == ID_Rs, then XorRsRt = 5'b00000. Then NotOrRsRt = 1
    assign XorRsRt[4] = EX_Rt[4] ^ ID_Rs[4]; 
    assign XorRsRt[3] = EX_Rt[3] ^ ID_Rs[3]; 
    assign XorRsRt[2] = EX_Rt[2] ^ ID_Rs[2]; 
    assign XorRsRt[1] = EX_Rt[1] ^ ID_Rs[1]; 
    assign XorRsRt[0] = EX_Rt[0] ^ ID_Rs[0]; 
    assign OrRsRt = XorRsRt[4] | XorRsRt[3] | XorRsRt[2] | XorRsRt[1] | XorRsRt[0];
    assign NotOrRsRt = !(OrRsRt); 
    
    // if EX_Rt == ID_Rt, then XorRtRt = 5'b00000. Then NotOrRtRt = 1
    assign XorRtRt[4] = EX_Rt[4] ^ ID_Rt[4];
    assign XorRtRt[3] = EX_Rt[3] ^ ID_Rt[3];
    assign XorRtRt[2] = EX_Rt[2] ^ ID_Rt[2];
    assign XorRtRt[1] = EX_Rt[1] ^ ID_Rt[1];
    assign XorRtRt[0] = EX_Rt[0] ^ ID_Rt[0];
    assign OrRtRt = XorRtRt[4] | XorRtRt[3] | XorRtRt[2] | XorRtRt[1] | XorRtRt[0];
    assign NotOrRtRt = !(OrRtRt);
    
    // if opcode != opcode for lw , Exception1 = 1
    assign XorOpLw[5] = ID_Op[5] ^ 1'b1;
    assign XorOpLw[4] = ID_Op[4] ^ 1'b0;
    assign XorOpLw[3] = ID_Op[3] ^ 1'b0;
    assign XorOpLw[2] = ID_Op[2] ^ 1'b0;
    assign XorOpLw[1] = ID_Op[1] ^ 1'b1;
    assign XorOpLw[0] = ID_Op[0] ^ 1'b1;
    assign Exception1 = XorOpLw[5] | XorOpLw[4] | XorOpLw[3] | XorOpLw[2] | XorOpLw[1] | XorOpLw[0]; 
    
    // if opcode != opcode for xori, Exception2 = 1
    assign XorOpXori[5] = ID_Op[5] ^ 1'b0;
    assign XorOpXori[4] = ID_Op[4] ^ 1'b0;
    assign XorOpXori[3] = ID_Op[3] ^ 1'b1;
    assign XorOpXori[2] = ID_Op[2] ^ 1'b1;
    assign XorOpXori[1] = ID_Op[1] ^ 1'b1;
    assign XorOpXori[0] = ID_Op[0] ^ 1'b0;
    assign Exception1 = XorOpXori[5] | XorOpXori[4] | XorOpXori[3] | XorOpXori[2] | XorOpXori[1] | XorOpXori[0]; 
    
    assign XorOp = Exception1 & Exception2;
    assign XorOpRt = XorOp & NotOrRtRt;
    assign OrOut = NotOrRsRt | XorOpRt;
    assign Stall = EX_MemRd & OrOut;
    
    assign PCWriteEn = !Stall;
    assign IFID_WriteEn = !Stall;
    assign StallFlag = !Stall;
endmodule
