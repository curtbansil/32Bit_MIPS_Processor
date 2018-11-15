`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux32Bit2To1(out, inA, inB, sel);

    output [31:0] out;
    
    input [31:0] inA, inB;
    input sel;
    
    Mux2To1 mux0(out[0], inA[0], inB[0], sel);
    Mux2To1 mux1(out[1], inA[1], inB[1], sel);
    Mux2To1 mux2(out[2], inA[2], inB[2], sel);
    Mux2To1 mux3(out[3], inA[3], inB[3], sel);
    Mux2To1 mux4(out[4], inA[4], inB[4], sel);
    Mux2To1 mux5(out[5], inA[5], inB[5], sel);
    Mux2To1 mux6(out[6], inA[6], inB[6], sel);
    Mux2To1 mux7(out[7], inA[7], inB[7], sel);
    Mux2To1 mux8(out[8], inA[8], inB[8], sel);
    Mux2To1 mux9(out[9], inA[9], inB[9], sel);
    Mux2To1 mux10(out[10], inA[10], inB[10], sel);
    Mux2To1 mux11(out[11], inA[11], inB[11], sel);
    Mux2To1 mux12(out[12], inA[12], inB[12], sel);
    Mux2To1 mux13(out[13], inA[13], inB[13], sel);
    Mux2To1 mux14(out[14], inA[14], inB[14], sel);
    Mux2To1 mux15(out[15], inA[15], inB[15], sel);
    Mux2To1 mux16(out[16], inA[16], inB[16], sel);
    Mux2To1 mux17(out[17], inA[17], inB[17], sel);
    Mux2To1 mux18(out[18], inA[18], inB[18], sel);
    Mux2To1 mux19(out[19], inA[19], inB[19], sel);
    Mux2To1 mux20(out[20], inA[20], inB[20], sel);
    Mux2To1 mux21(out[21], inA[21], inB[21], sel);
    Mux2To1 mux22(out[22], inA[22], inB[22], sel);
    Mux2To1 mux23(out[23], inA[23], inB[23], sel);
    Mux2To1 mux24(out[24], inA[24], inB[24], sel);
    Mux2To1 mux25(out[25], inA[25], inB[25], sel);
    Mux2To1 mux26(out[26], inA[26], inB[26], sel);
    Mux2To1 mux27(out[27], inA[27], inB[27], sel);
    Mux2To1 mux28(out[28], inA[28], inB[28], sel);
    Mux2To1 mux29(out[29], inA[29], inB[29], sel);
    Mux2To1 mux30(out[30], inA[30], inB[30], sel);
    Mux2To1 mux31(out[31], inA[31], inB[31], sel);
endmodule
