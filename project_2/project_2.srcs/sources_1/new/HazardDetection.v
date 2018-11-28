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

module HazardDetection(ID_Branch, ID_Opcode, ID_Func, ID_RegRs, ID_RegRt, EX_RegRt, EX_MemRead, IFID_WrEn, IF_PCWrite, IFID_Flush, IDEX_WrEn);

    input ID_Branch, EX_MemRead;
    input [4:0] ID_RegRs, ID_RegRt, EX_RegRt;
    input [5:0] ID_Opcode, ID_Func;
    
    output reg IFID_WrEn, IF_PCWrite, IFID_Flush, IDEX_WrEn;
    
    initial begin
        IFID_WrEn = 1'b1; //Initializations
        IF_PCWrite = 1'b1;
        IFID_Flush = 1'b0;
        IDEX_WrEn = 1'b1;
    end
	
	always @(*) begin
		if ((EX_MemRead == 1) && ((EX_RegRt == ID_RegRs) || (EX_RegRt == ID_RegRt)) && (ID_Opcode != 6'b001110) && (ID_Opcode != 6'b100011)) begin //6'b001110 = xori, 6'b100011 = lw
			IFID_WrEn = 1'b0;
			IF_PCWrite = 1'b0;
			IFID_Flush = 1'b0;
            IDEX_WrEn = 1'b1;
		end else if (((ID_Opcode == 6'b000010)|| ((ID_Opcode == 6'b000000) && (ID_Func == 6'b001000)) || 
		              (ID_Opcode == 6'b000100 && (ID_Branch == 1'b1)) || (ID_Opcode == 6'b000101 && (ID_Branch == 1'b0)))) begin
            IFID_WrEn = 1'b1;
            IF_PCWrite = 1'b0;
            IFID_Flush = 1'b0;
            IDEX_WrEn = 1'b1;
		end else begin
			IFID_WrEn = 1'b1;
			IF_PCWrite = 1'b1;
			IFID_Flush = 1'b0;
            IDEX_WrEn = 1'b1;
		end
	end
    
endmodule

