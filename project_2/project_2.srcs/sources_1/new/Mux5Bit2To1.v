`timescale 1ns / 1ps

module Mux5Bit2To1(out, inA, inB, sel);

    output [31:0] out;
    
    input [31:0] inA, inB;
    input sel;
    
    Mux2To1 mux0(out[0], inA[0], inB[0], sel);
    Mux2To1 mux1(out[1], inA[1], inB[1], sel);
    Mux2To1 mux2(out[2], inA[2], inB[2], sel);
    Mux2To1 mux3(out[3], inA[3], inB[3], sel);
    Mux2To1 mux4(out[4], inA[4], inB[4], sel);
    Mux2To1 mux5(out[5], inA[5], inB[5], sel);

endmodule
