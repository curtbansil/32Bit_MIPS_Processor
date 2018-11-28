`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ForwardingUnit.v
// Description - Forwarding Unit for Pipeline.
//
// INPUTS:-
//
// OUTPUTS:-
//
// FUNCTIONALITY:-
////////////////////////////////////////////////////////////////////////////////

module ForwardingUnit(IFID_Opcode, IFID_Rt, IFID_Rs, IDEX_Rs, IDEX_Rt, EXMEM_Rd, EXMEM_RegWr, MEMWB_Rd, MEMWB_RegWr,
        EX_ForwardA, EX_ForwardB, ID_ForwardA, ID_ForwardB);
    input [5:0] IFID_Opcode;
    input [4:0] IFID_Rt, IFID_Rs;
    input [4:0] IDEX_Rs, IDEX_Rt;
    input [4:0] EXMEM_Rd;
    input [4:0] MEMWB_Rd;
    input EXMEM_RegWr, MEMWB_RegWr;
    output [1:0] EX_ForwardA, EX_ForwardB;
    output ID_ForwardA, ID_ForwardB;
    
    reg [1:0] EX_FATemp, EX_FBTemp;
    reg ID_FATemp, ID_FBTemp;
    
    wire BranchFlag;
    
    initial 
    begin
        EX_FATemp = 2'b00;
        EX_FBTemp = 2'b00;
        ID_FATemp = 1'b0;
        ID_FBTemp = 1'b0;
    end
    
    // Checking if opcode == 0001xx or 000001, because those are the opcodes for the branch instructions
    assign BranchFlag = ((!IFID_Opcode[5] & 1'b1) & (!IFID_Opcode[4] & 1'b1) & (!IFID_Opcode[3] & 1'b1) & (IFID_Opcode[2] & 1'b1))
            | ((!IFID_Opcode[5] & 1'b1) & (!IFID_Opcode[4] & 1'b1) & (!IFID_Opcode[3] & 1'b1) & (!IFID_Opcode[2] & 1'b1) & (!IFID_Opcode[1] & 1'b1) & (IFID_Opcode[0] & 1'b1));
    
    always @(*)
    begin
        if((EXMEM_RegWr == 1'b1) && (EXMEM_Rd != 5'b00000) && (EXMEM_Rd == IDEX_Rs))
        begin
            EX_FATemp = 2'b10;
            EX_FBTemp = 2'b00;
        end 
        else if((MEMWB_RegWr == 1'b1) && (MEMWB_Rd != 5'b00000) && (MEMWB_Rd == IDEX_Rs)) 
        begin
            EX_FATemp = 2'b01;
            EX_FBTemp = 2'b00;
        end
        
        if((EXMEM_RegWr == 1'b1) && (EXMEM_Rd != 5'b00000) && (EXMEM_Rd == IDEX_Rt)) 
        begin
            EX_FATemp = 2'b00;
            EX_FBTemp = 2'b10;
        end 
        else if((MEMWB_RegWr == 1'b1) && (MEMWB_Rd != 5'b00000) && (MEMWB_Rd == IDEX_Rt)) 
        begin
            EX_FATemp = 2'b00;
            EX_FBTemp = 2'b01;
        end
        
        if ((EXMEM_RegWr == 1'b1) && (EXMEM_Rd != 5'b00000) && (EXMEM_Rd == IFID_Rs) && (BranchFlag == 1)) // if opcode is a branch instruction
        begin
            ID_FATemp = 1'b1;
            ID_FBTemp = 1'b0;
        end
        else if ((EXMEM_RegWr == 1'b1) && (EXMEM_Rd != 5'b00000) && (EXMEM_Rd == IFID_Rt) && (BranchFlag == 1)) // if opcode is a branch instruction
        begin
            ID_FATemp = 1'b0;
            ID_FBTemp = 1'b1;
        end
        
    end
	
    assign EX_ForwardA = EX_FATemp;
    assign EX_ForwardB = EX_FBTemp;
    assign ID_ForwardA = ID_FATemp;
    assign ID_ForwardB = ID_FBTemp;
    
endmodule

