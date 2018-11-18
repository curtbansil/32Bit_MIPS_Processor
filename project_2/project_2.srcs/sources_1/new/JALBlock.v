`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 09:54:08 AM
// Design Name: 
// Module Name: JALBlock
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


module JumpBlock(Opcode, Func, Jump, JALCtrl);

    input [5:0] Opcode, Func;
    
    output reg [1:0] Jump;
    output reg JALCtrl;
    
    wire [11:0] val;
    assign val = {Opcode, Func};
    
    initial begin
        Jump <= 2'b00;
        JALCtrl <= 1'b0;
    end
    
    always @(Opcode, Func) begin
        casex(val)
            12'b000010xxxxxx : begin //j
                Jump <= 2'b10;
            end
            12'b000011xxxxxx : begin //jal
                Jump <= 2'b10;
                JALCtrl <= 1'b1;
            end
            12'b000000001000 : begin //jr
                Jump <= 2'b01;
            end
        endcase
    end
endmodule
