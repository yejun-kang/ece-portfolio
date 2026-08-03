// Module: and_gate
// Description: Parameterized N-bit bitwise AND gate

`timescale 1ns / 1ps

module and_gate #(
    parameter int WIDTH = 4
)(
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    output logic [WIDTH-1:0] y
);

    // Continuous assignment for combinational logic
    assign y = a & b;

endmodule
