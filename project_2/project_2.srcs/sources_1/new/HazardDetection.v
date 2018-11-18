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

module HazardDetection(ID_Branch, ID_RegRs, ID_RegRt, EX_RegRt, EX_MemRead, IFID_WrEn, IF_PCWrite);

    input ID_Branch, EX_MemRead;
    input [4:0] ID_RegRs, ID_RegRt, EX_RegRt;
    
    output reg IFID_WrEn, IF_PCWrite;
	
	always @(*) begin
		// Load-Use Hazard
		if ((EX_MemRead) && ((EX_RegRt == ID_RegRs) || (EX_RegRt == ID_RegRt)) && (IfIdOp != 6'b001110) && (IfIdOp != 6'b100011)) begin //6'b001110 = xori, 6'b100011 = lw
			IFID_WrEn = 1'b0;
			IF_PCWrite = 1'b0;
		end
		else begin
			IFID_WrEn = 1'b1;
			IF_PCWrite = 1'b1;
		end
	end
    
endmodule

