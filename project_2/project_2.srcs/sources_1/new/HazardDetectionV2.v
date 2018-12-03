`timescale 1ns / 1ps

module HazardDetectionV2(ID_Opcode, ID_Func, ID_RegRs, ID_RegRt, EX_MemRead, EX_RegRt,
                        ID_BranchC2, EX_RegRd, MEM_WriteReg, EX_RegWrite, MEM_RegWrite, IF_PCWrite,
                        IDEX_Flush, IFID_Flush, IFID_WrEn);

    input [5:0] ID_Opcode, ID_Func;
    input [4:0] ID_RegRs, ID_RegRt, EX_RegRt, EX_RegRd, MEM_WriteReg;
    input EX_MemRead, ID_BranchC2, EX_RegWrite, MEM_RegWrite;
    output reg IF_PCWrite, IDEX_Flush, IFID_Flush, IFID_WrEn;
    
    always @(ID_Opcode, ID_RegRs, ID_RegRt, EX_MemRead, MEM_WriteReg, EX_RegWrite, EX_RegRt, ID_BranchC2, EX_RegRd, MEM_RegWrite) begin
        
        if (( EX_MemRead == 1'b1 ) && (( EX_RegRt == ID_RegRs ) || ( EX_RegRt == ID_RegRt ))) begin
            IDEX_Flush <= 1'b1;
            IF_PCWrite <= 1'b0;
            IFID_Flush <= 1'b0;
            IFID_WrEn <= 1'b0;
        end else if ((( ID_Opcode == 6'b000100 ) || ( ID_Opcode == 6'b000101 ) || (( ID_Opcode == 6'b000000 ) && ( ID_Func == 6'b001000 ))) 
                && ((( EX_RegRd == ID_RegRs || EX_RegRd == ID_RegRt ) && ( EX_RegWrite == 1'b1 )) || (( MEM_WriteReg == ID_RegRs || MEM_WriteReg == ID_RegRt ) && ( MEM_RegWrite == 1'b1 )))) begin
            IDEX_Flush <= 1'b1;
            IF_PCWrite <= 1'b0;
            IFID_Flush <= 1'b0;
            IFID_WrEn <= 1'b0;
        end else if (( ID_Opcode == 6'b000010 ) || (( ID_Opcode == 6'b000000 ) && ( ID_Func == 6'b001000 )) || ( ID_Opcode == 6'b000100 && ( ID_BranchC2 == 1'b1 )) ||
                ( ID_Opcode == 6'b000101 && ( ID_BranchC2 == 1'b0 ))) begin
            IDEX_Flush <= 1'b0;
            IF_PCWrite <= 1'b1;
            IFID_Flush <= 1'b1;
            IFID_WrEn <= 1'b1;
        end else if ( ID_Opcode == 6'b000011 ) begin
            IDEX_Flush <= 1'b0;
            IF_PCWrite <= 1'b1;
            IFID_Flush <= 1'b1;
            IFID_WrEn <= 1'b1;
        end else begin
            IDEX_Flush <= 1'b0;
            IF_PCWrite <= 1'b1;
            IFID_Flush <= 1'b0;
            IFID_WrEn <= 1'b1;
        end
    end
    
endmodule
