module alu_with_mux (
    input [3:0] A,
    input [3:0] B,
    input [1:0] select,
    output [3:0] result
);

    // Wires to hold the intermediate results of each operation
    wire [3:0] sum, difference, and_result, or_result;

    // ALU operations
    // Note: The specific implementation can use a single ALU module
    // or separate modules for each operation as shown below.
    // For simplicity, we can use assign statements.
    assign sum = A + B;
    assign difference = A - B;
    assign and_result = A & B;
    assign or_result = A | B;

    // Instantiate the 4-to-1 multiplexer to select the final result
    mux_4_to_1 mux_inst (
        .in0(sum),
        .in1(difference),
        .in2(and_result),
        .in3(or_result),
        .sel(select),
        .out(result)
    );

endmodule
