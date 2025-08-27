
`timescale 1ns / 1ps

module tb_alu_with_mux;

    // Inputs to the ALU
    reg [3:0] A, B;
    reg [1:0] select;

    // Output from the ALU
    wire [3:0] result;

    // Instantiate the Unit Under Test (UUT)
    alu_with_mux uut (
        .A(A),
        .B(B),
        .select(select),
        .result(result)
    );

    initial begin

        $dumpfile("alu_with_mux.vcd"); // Specify the VCD file name
        $dumpvars(0, tb_alu_with_mux); // Dump all variables in this testbench and below


        // Initialize inputs
        A = 4'b0011; // 3
        B = 4'b0101; // 5

        // Test case 1: Addition (select = 00)
        select = 2'b00;
        #10;
        $display("A = %b, B = %b, Select = %b, Result (A+B) = %b", A, B, select, result); // Expected: 1000 (8)

        // Test case 2: Subtraction (select = 01)
        select = 2'b01;
        #10;
        $display("A = %b, B = %b, Select = %b, Result (A-B) = %b", A, B, select, result); // Expected: 1110 (-2)

        // Test case 3: Bitwise AND (select = 10)
        select = 2'b10;
        #10;
        $display("A = %b, B = %b, Select = %b, Result (A&B) = %b", A, B, select, result); // Expected: 0001 (1)

        // Test case 4: Bitwise OR (select = 11)
        select = 2'b11;
        #10;
        $display("A = %b, B = %b, Select = %b, Result (A|B) = %b", A, B, select, result); // Expected: 0111 (7)

        // End simulation
        #10;
        $finish;
    end
endmodule
