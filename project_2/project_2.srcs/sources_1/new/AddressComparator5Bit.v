`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2018 04:59:41 AM
// Design Name: 
// Module Name: AddressComparator
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


module AddressComparator5Bit(Address1, Address2, Result);
    output Result;
    input [4:0] Address1, Address2;
    
    wire Result;
    wire orAddrResult;
    wire [4:0] Address1, Address2, xorAddress;
    
    assign xorAddress[4] = Address1[4] ^ Address2[4];
    assign xorAddress[3] = Address1[3] ^ Address2[3];
    assign xorAddress[2] = Address1[2] ^ Address2[2];
    assign xorAddress[1] = Address1[1] ^ Address2[1];
    assign xorAddress[0] = Address1[0] ^ Address2[0];
    assign orAddrResult = xorAddress[4] | xorAddress[3] | xorAddress[2] | xorAddress[1] | xorAddress[0];
    assign Result = !(orAddrResult);
    
endmodule
