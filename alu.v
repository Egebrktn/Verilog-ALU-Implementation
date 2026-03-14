module alu #(
    parameter N = 32 // Bit sayısı parametrik
)(
    input [N-1:0] A,      // Birinci işlenen 
    input [N-1:0] B,      // İkinci işlenen 
    input [2:0] OpCode,   // İşlem opcode
    output reg [N-1:0] Result // İşlem sonucu 
);

    // OpCode tanımlamaları 
    parameter ADD = 3'b000;
    parameter SUB = 3'b001;
    parameter AND = 3'b010;
    parameter XOR = 3'b011;

    always @(*) begin
        case(OpCode)
            ADD: Result = A + B; // Toplama 
            SUB: Result = A - B; // Çıkarma 
            AND: Result = A & B; // Mantıksal VE 
            XOR: Result = A ^ B; // Mantıksal XOR 
            default: Result = 0;
        endcase
    end

endmodule