`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2018 11:34:56 AM
// Design Name: 
// Module Name: DiscardInstrBlock
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


module DiscardInstrBlock(Jump, DoBranch, Jr, ID_Flush, IF_Flush );

    input Jump, DoBranch, Jr;
    
    output ID_Flush, IF_Flush;
    
    assign IF_Flush = Jump | DoBranch | Jr;
    assign ID_Flush = DoBranch | Jr;

endmodule
