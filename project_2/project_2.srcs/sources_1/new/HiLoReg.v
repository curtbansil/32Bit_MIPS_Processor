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


module HiLoReg(Clk, HLWr, HLType, Rs, Rt, Out);

    input Clk;
    input HLWr;
    input [2:0] HLType;
    input [31:0] Rs, Rt;
    
    output reg [31:0] Out;
    
    reg [31:0] saved_Hi, saved_Lo;
    wire [31:0] read_Hi, read_Lo;
    wire [63:0] temp, temp_unsigned;
    
    initial begin
        Out = {32{1'b0}};
        
        // 
        saved_Hi = {32{1'bx}};
        saved_Lo = {32{1'bx}};
    end
    
    assign temp = Rs * Rt;
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
                3'b110 : // mul
                begin
                    saved_Hi = {32{1'bx}};
                    saved_Lo = {32{1'bx}};
                end
            endcase
        end
    end
        
    always @(negedge Clk)
    begin
        case(HLType)
            3'b000 : // mflo
            begin
                Out = read_Lo;
            end
            3'b001 : // mfhi
            begin
                Out = read_Hi;
            end
            default :
            begin
                Out = {32{1'bx}};
            end
        endcase
    end
endmodule
