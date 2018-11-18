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

module ForwardingUnit(MEM_WrReg, WB_WrReg, EX_RsAddr, EX_RtAddr,
    MEM_RegWr, WB_RegWr, ForwardAControl, ForwardBControl);

	input [4:0] MEM_WrReg, WB_WrReg, EX_RsAddr, EX_RtAddr; 
	input MEM_RegWr, WB_RegWr;
	
	output [1:0] ForwardAControl, ForwardBControl;
	wire [1:0] ForwardAControl, ForwardBControl;
	
	wire andResult1, andResult2, andResult3, andResult4;
	wire notAndResult1, notAndResult3;
	wire MEM_WrRegOr, MEM_WrRegRsComp, MEM_WrRegRtComp;
	wire WB_WrRegOr, WB_WrRegRsComp, WB_WrRegRtComp;
	
	// Check if MEM_WrReg is not the Zero Reg
	assign MEM_WrRegOr = MEM_WrReg[4] | MEM_WrReg [3] | MEM_WrReg[2] | MEM_WrReg[1] | MEM_WrReg[0];
	// Compare MEM_WrReg to EX_RsAddr
	AddressComparator5Bit AC1(MEM_WrRegRsComp, MEM_WrReg, EX_RsAddr);
	// If MEM_RegWr == 1, MEM_WrRegOr == 1, MEM_WrRegRsComp == 1, then ForwardA[1] = 1
	assign andResult1 = MEM_RegWr & MEM_WrRegOr & MEM_WrRegRsComp;
	
	// Check if WB_WrReg is not the Zero Reg
    assign WB_WrRegOr = WB_WrReg[4] | WB_WrReg [3] | WB_WrReg[2] | WB_WrReg[1] | WB_WrReg[0];
    // Compare WB_WrReg to EX_RsAddr
    AddressComparator5Bit AC2(WB_WrRegRsComp, WB_WrReg, EX_RsAddr);
    // If WB_RegWr == 1, WB_WrRegOr == 1, WB_WrRegRsComp == 1, then ForwardA[1] = 1
    assign andResult2 = WB_RegWr & WB_WrRegOr & WB_WrRegRsComp;
    
    // ForwardAControl: Bit 1 is andResult1 because MEM_WrReg is 10 in the Forward Muxes
    // Bit 0 is !(andResult1) & andResult2 because if WB_WrReg is also EX_Rs, MEM_WrReg 
    // has the more updated value for Rs
    // Otherwise, if MEM_WrReg isn't Rs but WB_WrReg is, then we want 10 as the signal
    assign ForwardAControl[1] = andResult1;
    assign notAndResult1 = !(andResult1);
    assign ForwardAControl[0] = notAndResult1 & andResult2;
    
    // Compare MEM_WrReg to EX_RtAddr
    AddressComparator5Bit AC3(MEM_WrRegRtComp, MEM_WrReg, EX_RtAddr);
    // If MEM_RegWr == 1, MEM_WrRegOr == 1, MEM_WrRegRtComp == 1, then ForwardA[1] = 1
    assign andResult3 = MEM_RegWr & MEM_WrRegOr & MEM_WrRegRtComp;
    
    // Compare WB_WrReg to EX_RtAddr
    AddressComparator5Bit AC4(WB_WrRegRtComp, WB_WrReg, EX_RtAddr);
    // If WB_RegWr == 1, WB_WrRegOr == 1, WB_WrRegRtComp == 1, then ForwardA[1] = 1
    assign andResult4 = WB_RegWr & WB_WrRegOr & WB_WrRegRtComp;
    
    // ForwardAControl: Bit 1 is andResult1 because MEM_WrReg is 10 in the Forward Muxes
    // Bit 0 is !(andResult1) & andResult2 because if WB_WrReg is also EX_Rt, MEM_WrReg 
    // has the more updated value for Rt
    // Otherwise, if MEM_WrReg isn't Rt but WB_WrReg is, then we want 10 as the signal
    assign ForwardBControl[1] = andResult3;
    assign notAndResult3 = !(andResult3);
    assign ForwardBControl[0] = notAndResult3 & andResult4;
    
endmodule

