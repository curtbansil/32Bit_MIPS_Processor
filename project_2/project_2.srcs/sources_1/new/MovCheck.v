`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2018 05:51:48 AM
// Design Name: 
// Module Name: MovCheck
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


module MovCheck(EX_Instr, EX_RegWrite, EX_ReadData2, EX_RegWriteMod);

    input [31:0] EX_ReadData2, EX_Instr;
    input EX_RegWrite;
    
    output reg EX_RegWriteMod;
    
    wire [11:0] ID;
    assign ID = {EX_Instr[31:26], EX_Instr[5:0]};
    
    initial begin
        EX_RegWriteMod <= EX_RegWrite;
    end
    
    always @(EX_Instr, EX_RegWrite) begin
        case (ID)
            default : begin //so that regwrite doesn't get messed up when any other instruction passes through
                EX_RegWriteMod <= EX_RegWrite;
            end
            12'b000000001011 : begin //movn
                if (EX_ReadData2 != 0) begin
                    EX_RegWriteMod <= 1;
                end else begin
                    EX_RegWriteMod <= 0;
                end
            end
            12'b000000001010 : begin //movz
                if (EX_ReadData2 == 0) begin
                    EX_RegWriteMod <= 1;
                end else begin
                    EX_RegWriteMod <= 0;
                end
            end
        endcase
    end

endmodule
