`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2018 12:54:34 PM
// Design Name: 
// Module Name: IfIdReg
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


module IfIdReg(Clk, Rst, PCNext, Instruction, IF_Flush, IFID_WriteEn,
    ID_PCNext, ID_Instruction, IFID_Flush );
    
    input Clk, Rst;
    input [31:0] PCNext, Instruction;
    input IF_Flush, IFID_WriteEn;
    
    output [31:0] ID_PCNext, ID_Instruction;
    output IFID_Flush;
    
    /*output reg [31:0] ID_PCNext, ID_Instruction;
    output reg IFID_Flush;
    
    reg [31:0] saved_Instruction, saved_PCNext;
    reg saved_IF_Flush;
    
    wire [31:0] out_Instruction, out_PCNext;
    wire out_IF_Flush;*/
    
    /*initial begin 
        // TODO: Determine whether initializing saved regs is needed
        saved_Instruction = {32{1'b0}};
        saved_PCNext = {32{1'b0}};
        saved_IF_Flush = {32{1'b0}};
        
        ID_PCNext = {32{1'b0}};
        ID_Instruction = {32{1'b0}};
        IFID_Flush = {32{1'b0}};
    end
 
    assign out_Instruction = saved_Instruction;
    assign out_PCNext = saved_PCNext;
    assign out_IF_Flush = saved_IF_Flush;
    
    always @(posedge Clk) begin
       if (IFID_WriteEn == 1'b1)
       begin
            if (Rst == 1'b1)
            begin
                saved_Instruction = {32{1'b0}};
                saved_PCNext = {32{1'b0}};
                saved_IF_Flush = 1'b1; // TODO: Check if this is correct
            end
            else
            begin
                saved_Instruction = Instruction;
                saved_PCNext = PCNext;
                saved_IF_Flush = IF_Flush;
            end
       end
    end
    
    always @(negedge Clk) begin
        ID_PCNext = out_PCNext;
        ID_Instruction = out_Instruction;
        IFID_Flush = out_IF_Flush;
    end*/
    
    
    
    
endmodule
