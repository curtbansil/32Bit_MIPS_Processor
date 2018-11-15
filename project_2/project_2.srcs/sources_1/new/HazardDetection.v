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

module HazardDetection(IfIdWriteEn, PCWriteEn, StallFlushIfIdRegRs, IfIdRegRt, IdExRegRt, IdExMemRead, IfIdOp);

	input [4:0] IfIdRegRt, IfIdRegRd; 
	input [5:0] IfIdOp;
	input IdExMemRead;
	
	output reg IfIdWrite, PCWrite, ControllerInp;
	
	always @(*) begin
		// Load-Use Hazard
		if ((IdExMemRead) && ((IdExRegRt == IfIdRegRs) || (IdExRegRt == IfIdRegRt)) && (IfIdOp != 6'b001110) && (IfIdOp != 6'b100011)) begin //6'b001110 = xori, 6'b100011 = lw
			IfIdWrite = 1'b0;
			PCWrite = 1'b0;
			ControllerInp = 1'b1;
		end
		else begin
			IfIdWrite = 1'b1;
			PCWrite = 1'b1;
			ControllerInp = 1'b0;
		end
	end
    
endmodule

