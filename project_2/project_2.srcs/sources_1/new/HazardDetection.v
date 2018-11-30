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

module HazardDetection(ID_BranchC1, ID_Opcode, ID_Func, ID_RegRs, ID_RegRt,
             EX_RegRt, MEM_WriteReg, EX_MemRead, MEM_MemRead, IFID_WrEn,
             IF_PCWrite, IFID_Flush, IDEX_WrEn, IDEX_Flush,
             EX_RegWrite, EX_WriteReg, EXMEM_WrEn, EXMEM_Flush,
             EX_MemtoReg, MEM_MemtoReg);

    input ID_BranchC1, EX_MemRead, MEM_MemRead, EX_RegWrite;
    input EX_MemtoReg, MEM_MemtoReg;
    input [4:0] ID_RegRs, ID_RegRt, EX_RegRt, EX_WriteReg, MEM_WriteReg;
    input [5:0] ID_Opcode, ID_Func;
    
    output IFID_WrEn, IF_PCWrite, IFID_Flush, IDEX_WrEn, IDEX_Flush;
    output EXMEM_WrEn, EXMEM_Flush; // Not used
    
    reg IFID_WrEn_Temp, IF_PCWrite_Temp, IFID_Flush_Temp, IDEX_WrEn_Temp, IDEX_Flush_Temp;
    reg EXMEM_WrEn_Temp, EXMEM_Flush_Temp;
    
    initial begin
        IFID_WrEn_Temp = 1'b1; //Initializations
        IF_PCWrite_Temp = 1'b1;
        IFID_Flush_Temp = 1'b0;
        IDEX_WrEn_Temp = 1'b1;
        IDEX_Flush_Temp = 1'b0;
        EXMEM_WrEn_Temp = 1'b1;
        EXMEM_Flush_Temp = 1'b0;
    end
	
	always @(ID_BranchC1, EX_MemRead, MEM_MemRead, EX_WriteReg, ID_RegRs,
           ID_RegRt, EX_RegRt, EX_RegWrite, MEM_WriteReg, 
           ID_Opcode, ID_Func) begin
	
		if (( EX_MemRead == 1 ) && (( EX_WriteReg == ID_RegRs ) || ( EX_WriteReg == ID_RegRt )) && ( IF_PCWrite_Temp == 1'b1 ) && ( IFID_WrEn_Temp == 1'b1 )) begin
			IFID_WrEn_Temp = 1'b0;
			IF_PCWrite_Temp = 1'b0;
			IFID_Flush_Temp = 1'b0;
            IDEX_WrEn_Temp = 1'b0;
            IDEX_Flush_Temp = 1'b0;
            EXMEM_WrEn_Temp = 1'b1;
            EXMEM_Flush_Temp = 1'b0;
		end 
		
		else if ((EX_RegWrite == 1) && (( EX_WriteReg == ID_RegRs ) || ( EX_WriteReg == ID_RegRt ))&& ( IF_PCWrite_Temp == 1'b1 ) && ( IFID_WrEn_Temp == 1'b1 )) begin
            IFID_WrEn_Temp = 1'b0;
            IF_PCWrite_Temp = 1'b0;
            IFID_Flush_Temp = 1'b0;
            IDEX_WrEn_Temp = 1'b0;
            IDEX_Flush_Temp = 1'b0;
            EXMEM_WrEn_Temp = 1'b1;
            EXMEM_Flush_Temp = 1'b0;
        end 
        
        // lw followed by branch?
        else if (( MEM_MemRead == 1 ) && (( MEM_WriteReg == ID_RegRt) || ( MEM_WriteReg == ID_RegRs)) && ( ID_BranchC1 == 1'b1 )&& ( IF_PCWrite_Temp == 1'b1 ) && ( IFID_WrEn_Temp == 1'b1 ))
        begin
            IF_PCWrite_Temp = 1'b0;
            IFID_WrEn_Temp = 1'b0;
            IFID_Flush_Temp = 1'b0;
            IDEX_WrEn_Temp = 1'b0;
            IDEX_Flush_Temp = 1'b1; 
            EXMEM_WrEn_Temp = 1'b1;
            EXMEM_Flush_Temp = 1'b0;
		end
		  
        else if ((ID_BranchC1 && EX_RegWrite &&
         (EX_WriteReg == ID_RegRs || EX_WriteReg == ID_RegRt)) ||
          (ID_BranchC1 && MEM_MemtoReg && (MEM_WriteReg == ID_RegRs ||
           MEM_WriteReg == ID_RegRt)) && ( IF_PCWrite_Temp == 1'b1 ) && ( IFID_WrEn_Temp == 1'b1 ))
        // lw followed by branch?
       begin
            IF_PCWrite_Temp = 1'b0;
            IFID_WrEn_Temp = 1'b0;
            IFID_Flush_Temp = 1'b0;
            IDEX_WrEn_Temp = 1'b0;
            IDEX_Flush_Temp = 1'b0; 
            EXMEM_WrEn_Temp = 1'b1;
            EXMEM_Flush_Temp = 1'b1;
		end
		//Read after write
		else if ((MEM_MemRead == 1) && (( MEM_WriteReg == ID_RegRt) ||
		 ( MEM_WriteReg == ID_RegRs)) && ( IF_PCWrite_Temp == 1'b1 )
		  && ( IFID_WrEn_Temp == 1'b1 ))
		begin
            IF_PCWrite_Temp = 1'b0;
            IFID_WrEn_Temp = 1'b0;
            IFID_Flush_Temp = 1'b0;
            IDEX_WrEn_Temp = 1'b0;
            IDEX_Flush_Temp = 1'b1; 
            EXMEM_WrEn_Temp = 1'b1;
            EXMEM_Flush_Temp = 1'b0;
		end
		
		else begin
			IFID_WrEn_Temp = 1'b1;
			IF_PCWrite_Temp = 1'b1;
			IFID_Flush_Temp = 1'b0;
            IDEX_WrEn_Temp = 1'b1;
            IDEX_Flush_Temp = 1'b0;
            EXMEM_WrEn_Temp = 1'b1;
            EXMEM_Flush_Temp = 1'b0;
		end
	end
    
    assign IFID_WrEn = IFID_WrEn_Temp;
    assign IF_PCWrite = IF_PCWrite_Temp;
    assign IFID_Flush = IFID_Flush_Temp ;
    assign IDEX_WrEn = IDEX_WrEn_Temp ;
    assign IDEX_Flush = IDEX_Flush_Temp;
    assign EXMEM_WrEn = EXMEM_WrEn_Temp;
    assign EXMEM_Flush = EXMEM_Flush_Temp;
endmodule

