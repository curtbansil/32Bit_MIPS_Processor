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

module HazardDetection(ID_BranchC1, ID_Opcode, ID_Func, ID_RegRs, ID_RegRt, EX_RegRt, MEM_WriteReg, EX_MemtoReg, MEM_MemtoReg, IFID_WrEn,
                         IF_PCWrite, IFID_Flush, IDEX_WrEn, IDEX_Flush, EX_RegWrite, EX_WriteReg, EXMEM_Flush);

    input ID_BranchC1, EX_MemtoReg, MEM_MemtoReg, EX_RegWrite;
    input [4:0] ID_RegRs, ID_RegRt, EX_RegRt, EX_WriteReg, MEM_WriteReg;
    input [5:0] ID_Opcode, ID_Func;
    
    output reg IFID_WrEn, IF_PCWrite, IFID_Flush, IDEX_WrEn, IDEX_Flush, EXMEM_Flush;
    
    initial begin
        IFID_WrEn <= 1'b1; //Initializations
        IF_PCWrite <= 1'b1;
        IFID_Flush <= 1'b0;
        IDEX_WrEn <= 1'b1;
        IDEX_Flush <= 1'b0;
        EXMEM_Flush <= 1'b0;
    end
	
	always @(*) begin
	
		if (( EX_MemtoReg == 1 ) && (( EX_WriteReg == ID_RegRs ) || ( EX_WriteReg == ID_RegRt )) && ( IF_PCWrite == 1'b1 ) && ( IFID_WrEn == 1'b1 )) begin
			IFID_WrEn <= 1'b0;
			IF_PCWrite <= 1'b0;
			IFID_Flush <= 1'b0;
            IDEX_WrEn <= 1'b0;
            IDEX_Flush <= 1'b0;
            EXMEM_Flush <= 1'b1;
		end 
		
		else if ((EX_RegWrite == 1) && (( EX_WriteReg == ID_RegRs ) || ( EX_WriteReg == ID_RegRt )) && ( IF_PCWrite == 1'b1 ) && ( IFID_WrEn == 1'b1 )) begin
            IFID_WrEn <= 1'b0;
            IF_PCWrite <= 1'b0;
            IFID_Flush <= 1'b0;
            IDEX_WrEn <= 1'b0;
            IDEX_Flush <= 1'b0;
            EXMEM_Flush <= 1'b1;
        end 
        
        else if ((ID_BranchC1 && EX_RegWrite && (EX_WriteReg == ID_RegRs || EX_WriteReg == ID_RegRt)) || (ID_BranchC1 && MEM_MemtoReg && (MEM_WriteReg == ID_RegRs || MEM_WriteReg == ID_RegRt)))
        begin
            IF_PCWrite <= 1'b0;
            IFID_WrEn <= 1'b0;
            IFID_Flush <= 1'b0;
            IDEX_WrEn <= 1'b0;
            IDEX_Flush <= 1'b0;
            EXMEM_Flush <= 1'b1; 
		end
		
		else begin
			IFID_WrEn <= 1'b1;
			IF_PCWrite <= 1'b1;
			IFID_Flush <= 1'b0;
            IDEX_WrEn <= 1'b1;
            IDEX_Flush <= 1'b0;
            EXMEM_Flush <= 1'b0;
		end
	end
    
endmodule

