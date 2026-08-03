// Testbench: tb_and_gate
`timescale 1ns / 1ps

module tb_and_gate;

    localparam int WIDTH = 4;

    logic [WIDTH-1:0] a;
    logic [WIDTH-1:0] b;
    logic [WIDTH-1:0] y;

    // Instantiate Unit Under Test (UUT)
    and_gate #(
        .WIDTH(WIDTH)
    ) uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Setup GTKWave dump file
        $dumpfile("and_gate.vcd");
        $dumpvars(0, tb_and_gate);

        // Test Vector 1
        a = 4'b0000; b = 4'b1111; #10;
        
        // Test Vector 2
        a = 4'b1010; b = 4'b1100; #10; // Expected y = 1000
        
        // Test Vector 3
        a = 4'b1111; b = 4'b1111; #10; // Expected y = 1111

        $display("Simulation complete.");
        $finish;
    end

endmodule
