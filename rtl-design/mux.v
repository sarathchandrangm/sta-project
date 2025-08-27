module mux_4_to_1 (
    input [3:0] in0, // 4-bit data input 0
    input [3:0] in1, // 4-bit data input 1
    input [3:0] in2, // 4-bit data input 2
    input [3:0] in3, // 4-bit data input 3
    input [1:0] sel, // 2-bit select signal
    output reg [3:0] out // 4-bit output
);

    // The logic inside the always block is executed whenever any input changes
    always @(*) begin
        case (sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
            default: out = 4'b0000; // Undefined for invalid select
        endcase
    end
endmodule
