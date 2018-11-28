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

module ForwardingUnit(IDEX_Rs, IDEX_Rt, EXMEM_Rd, EXMEM_RegWr, MEMWB_Rd, MEMWB_RegWr, ForwardA, ForwardB);
    input [4:0] IDEX_Rs, IDEX_Rt;
    input [4:0] EXMEM_Rd;
    input [4:0] MEMWB_Rd;
    input EXMEM_RegWr, MEMWB_RegWr;
    output [1:0] ForwardA, ForwardB;
    
    reg [1:0] FA_temp, FB_temp;
    
    initial 
    begin
        FA_temp = 2'b00;
        FB_temp = 2'b00;
    end
    
    always @(*)
    begin
        if((EXMEM_RegWr == 1'b1) && (EXMEM_Rd != 5'b00000) && (EXMEM_Rd == IDEX_Rs))
        begin
            FA_temp = 2'b10;
            FB_temp = 2'b00;
        end 
        else if((MEMWB_RegWr == 1'b1) && (MEMWB_Rd != 5'b00000) && (MEMWB_Rd == IDEX_Rs)) 
        begin
            FA_temp = 2'b01;
            FB_temp = 2'b00;
        end
        
        if((EXMEM_RegWr == 1'b1) && (EXMEM_Rd != 5'b00000) && (EXMEM_Rd == IDEX_Rt)) 
        begin
            FA_temp = 2'b00;
            FB_temp = 2'b10;
        end 
        else if((MEMWB_RegWr == 1'b1) && (MEMWB_Rd != 5'b00000) && (MEMWB_Rd == IDEX_Rt)) 
        begin
            FA_temp = 2'b00;
            FB_temp = 2'b01;
        end
    end
	
    assign ForwardA = FA_temp;
    assign ForwardB = FB_temp;
    
endmodule

