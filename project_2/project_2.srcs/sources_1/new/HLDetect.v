`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2018 01:46:48 AM
// Design Name: 
// Module Name: HLDetect
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module HLDetect(Opcode, Function, HLGo);

    input [5:0] Opcode, Function;
    output reg [3:0] HLGo;
    
    wire [11:0] ID;
    assign ID = {Opcode, Function};
    
    initial begin
        HLGo <= 4'b0000;
    end
    
    always @(ID) begin
        case (ID)
            default : begin
                HLGo <= 4'b0000;    //unused
            end
            12'b000000010000: begin //mfhi
                HLGo <= 4'b1000;
            end
            12'b000000010001: begin //mthi
                HLGo <= 4'b1001;
            end
            12'b000000010010: begin //mflo
                HLGo <= 4'b1010;
            end
            12'b000000010011: begin //mtlo
                HLGo <= 4'b1011;
            end
            12'b011100000000: begin //madd
                HLGo <= 4'b1100;
            end
            12'b011100000100: begin //msub
                HLGo <= 4'b1101;
            end
            12'b000000011000: begin //mult
                HLGo <= 4'b1110;
            end
            12'b000000011001: begin //multu
                HLGo <= 4'b1111;
            end
        endcase
    end

endmodule
