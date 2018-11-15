`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux2To1(out, inA, inB, sel);
    output out;
    input inA, inB;
    input sel;
    
    wire notSel, andOut1, andOut2;
    
    assign notSel = !(sel);
    assign andOut1 = inA & notSel;
    assign andOut2 = inB & sel;
    assign out = andOut1 | andOut2;
    
endmodule
