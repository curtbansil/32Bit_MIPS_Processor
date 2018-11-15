`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2018 04:15:50 PM
// Design Name: 
// Module Name: D_FlipFlog
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


module D_FlipFlop(Out, In, Rst, Clk);

    output Out;
    input In, Rst, Clk;
    reg Out; // Out holds its value
    
    always @(posedge Clk or posedge Rst)
    begin
        if (Rst)
        begin
            Out = 0;
        end
        else
        begin
            Out = In;
        end
    end

endmodule
