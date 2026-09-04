`timescale 1ns / 1ps

module mux_2to1 #(
    parameter int WIDTH = 4
) (
    input  logic [WIDTH-1:0] in0,
    input  logic [WIDTH-1:0] in1,
    input  logic             sel,
    output logic [WIDTH-1:0] out
);

    // Continuous assignment using ternary operator
    assign out = sel ? in1 : in0;

endmodule

