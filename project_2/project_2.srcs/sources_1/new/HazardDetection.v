`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Hazard Detection Unit.v
// Description - Hazard Detection Unit for Pipeline.
//
// INPUTS:-
//
// OUTPUTS:-
//
// FUNCTIONALITY:-
////////////////////////////////////////////////////////////////////////////////

module HazardDetection(ID_BranchC1, ID_Opcode, ID_Func, ID_RegRs, ID_RegRt, EX_RegRt, MEM_RegRt, EX_MemRead, MEM_MemRead, IFID_WrEn,
                         IF_PCWrite, IFID_Flush, IDEX_WrEn, IDEX_Flush, EX_RegWrite);

    input ID_BranchC1, EX_MemRead, MEM_MemRead, EX_RegWrite;
    input [4:0] ID_RegRs, ID_RegRt, EX_RegRt, MEM_RegRt;
    input [5:0] ID_Opcode, ID_Func;
    
    output reg IFID_WrEn, IF_PCWrite, IFID_Flush, IDEX_WrEn, IDEX_Flush;
    
    initial begin
        IFID_WrEn <= 1'b1; //Initializations
        IF_PCWrite <= 1'b1;
        IFID_Flush <= 1'b0;
        IDEX_WrEn <= 1'b1;
        IDEX_Flush <= 1'b0;
    end
	
	always @(ID_BranchC1, EX_MemRead, MEM_MemRead, ID_RegRs, ID_RegRt, EX_RegRt, MEM_RegRt, ID_Opcode, ID_Func, EX_RegWrite) begin
	
		if (( EX_MemRead == 1 ) && (( EX_RegRt == ID_RegRs ) || ( EX_RegRt == ID_RegRt )) && ( IF_PCWrite == 1'b1 ) && ( IFID_WrEn == 1'b1 )) begin
			IFID_WrEn <= 1'b0;
			IF_PCWrite <= 1'b0;
			IFID_Flush <= 1'b0;
            IDEX_WrEn <= 1'b0;
            IDEX_Flush <= 1'b0;
		end 
		
		else if ((EX_RegWrite == 1) && (( EX_RegRt == ID_RegRs ) || ( EX_RegRt == ID_RegRt )) && ( IF_PCWrite == 1'b1 ) && ( IFID_WrEn == 1'b1 )) begin
            IFID_WrEn <= 1'b0;
            IF_PCWrite <= 1'b0;
            IFID_Flush <= 1'b0;
            IDEX_WrEn <= 1'b0;
            IDEX_Flush <= 1'b0;
        end 
        
        else if (( MEM_MemRead == 1 ) && (( MEM_RegRt == ID_RegRt) || ( MEM_RegRt == ID_RegRs)) && ( ID_BranchC1 == 1'b1 ))
        begin
            IF_PCWrite <= 1'b0;
            IFID_WrEn <= 1'b0;
            IFID_Flush <= 1'b0;
            IDEX_WrEn <= 1'b0;
            IDEX_Flush <= 1'b1; 
		end
		
		else begin
			IFID_WrEn <= 1'b1;
			IF_PCWrite <= 1'b1;
			IFID_Flush <= 1'b0;
            IDEX_WrEn <= 1'b1;
            IDEX_Flush <= 1'b0;
		end
	end
    
endmodule

