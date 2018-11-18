`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux2To1(out, inA, inB, sel);
    output reg out;
    input inA, inB;
    input sel;
    
//    wire notSel, andOut1, andOut2;
    
//    assign notSel = !(sel);
//    assign andOut1 = inA & notSel;   //I dont understand how this works lmao, we can uncomment it but its just to get
//    assign andOut2 = inB & sel;      //functionality of bigger modules first
//    assign out = andOut1 | andOut2;
    
    always @(inA, inB, sel) begin
        case (sel)
            0: out <= inA;
            1: out <= inB;
        endcase
    end
    
endmodule
