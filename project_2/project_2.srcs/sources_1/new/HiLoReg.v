`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2018 11:14:32 PM
// Design Name: 
// Module Name: HiLoReg
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


module HiLoReg(Clk, HLWr, HLType, Rs, Rt, Out, saved_Hi, saved_Lo);

    input Clk;
    input HLWr;
    input [2:0] HLType;
    input [31:0] Rs, Rt;
    
    output [31:0] Out;
    
    output reg [31:0] saved_Hi, saved_Lo;
    wire [31:0] read_Hi, read_Lo;
    wire [63:0] temp, temp_unsigned;
    wire mfloFlag, mfhiFlag;
    
    initial begin
        // 
        saved_Hi = {32{1'bx}};
        saved_Lo = {32{1'bx}};
    end
    
    assign temp = $signed(Rs) * $signed(Rt); //TODO: Check how verilog works with signed/unsigned numbers (check which is default)
    assign temp_unsigned = ({32{1'b0}} | Rs) * ({32{1'b0}} | Rt);
    assign read_Hi = saved_Hi;
    assign read_Lo = saved_Lo;
    
    always @(posedge Clk) 
    begin
        if (HLWr == 1'b1) 
        begin
            case(HLType)
                3'b000 : // mtlo
                begin
                    saved_Lo = Rs;
                end
                3'b001 : // mthi
                begin
                    saved_Hi = Rs;
                end
                3'b010 : // madd
                begin
                    saved_Hi = saved_Hi + temp[63:32];
                    saved_Lo = saved_Lo + temp[31:0];
                end
                3'b011 : // msub
                begin
                    saved_Hi = saved_Hi - temp[63:32];
                    saved_Lo = saved_Lo - temp[31:0];
                end
                3'b100 : // mult
                begin
                    saved_Hi = temp[63:32];
                    saved_Lo = temp[31:0];
                end
                3'b101 : // multu
                begin
                    saved_Hi = temp_unsigned[63:32];
                    saved_Lo = temp_unsigned[31:0];
                end
//                3'b110 : // mul
//                begin
//                    saved_Hi = {32{1'bx}}; // I feel like mul shouldnt be changing hi and lo. "Unpredictable" prob means you can't know because
//                    saved_Lo = {32{1'bx}}; // other instructions may modify it but mul itself doesnt use them. we should double check
//                end
                
            endcase
            /*case(HLType)
                3'b110 : // mflo
                begin
                    Out = read_Lo;
                end
                3'b111 : // mfhi
                begin
                    Out = read_Hi;
                end
                default :
                begin
                    Out = {32{1'bx}};
                end
            endcase*/
        end
    end
    
    assign mfloFlag = (HLType[2] & 1'b1) & (HLType[1] & 1'b1) & (!HLType[0] & 1'b1);
    assign mfhiFlag = (HLType[2] & 1'b1) & (HLType[1] & 1'b1) & (HLType[0] & 1'b1);
    
    assign Out = ({32{mfloFlag}} & read_Lo) | ({32{mfhiFlag}} & read_Hi);
    
    /*always @(negedge Clk)
    begin
        case(HLType)
    
        endcase
    end*/
endmodule
