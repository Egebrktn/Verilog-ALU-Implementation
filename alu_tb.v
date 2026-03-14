module ALU_tb();
    parameter N = 32; 
    reg [N-1:0] A, B;    // ALU girişleri 
    reg [2:0] OpCode;    
    wire [N-1:0] Result;  // ALU çıkışı 

    alu #(N) uut (
        .A(A), 
        .B(B), 
        .OpCode(OpCode), 
        .Result(Result)
    );
    
    initial begin // 3. Test Senaryoları
        // wavetrace dosyası
        $dumpfile("alu_test.vcd");
        $dumpvars(0, ALU_tb);

        // TOPLAMA (ADD)
        OpCode = 3'b000; 
        A = 32'd10; B = 32'd20; #10; // 10+20=30
        A = 32'd100; B = 32'd50; #10; // 100+50=150
        A = 32'd99999999; B = 32'd1; #10; // 99.999.999+1=100.000.000
        A = 32'd0; B = 32'd0; #10; // 0+0=0

        // ÇIKARMA (SUB) 
        OpCode = 3'b001; 
        A = 32'd50; B = 32'd20; #10; // 50-20=30
        A = 32'd5; B = 32'd5;   #10; // 5-5=0
        A = 32'd10; B = 32'd20; #10; // 10-20=-10 

        // MANTIKSAL VE (AND)
        OpCode = 3'b010; 
        A = 32'b1010; B = 32'b1100; #10; // Sonuç: 1000
        A = 32'b11110000; B = 32'b00001111; #10; // Sonuç: 00000000
        A = 32'b11110000; B = 32'b11111111; #10; // Sonuç: 11110000

        // MANTIKSAL XOR
        OpCode = 3'b011; 
        A = 32'b1111; B = 32'b0000; #10; // Sonuç: 1111
        A = 32'b1111; B = 32'b1111; #10; // Sonuç: 0000
        A = 32'b000011110000; B = 32'b000000001111; #10; // Sonuç: 000011110000

        $finish; // Testi bitir
    end
endmodule