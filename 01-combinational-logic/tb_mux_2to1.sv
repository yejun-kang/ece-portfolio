`timescale 1ns / 1ps

module tb_mux_2to1;

    localparam int WIDTH = 4;

    logic [WIDTH-1:0] in0;
    logic [WIDTH-1:0] in1;
    logic             sel;
    logic [WIDTH-1:0] out;

    // Instantiate Unit Under Test (UUT)
    mux_2to1 #(
        .WIDTH(WIDTH)
    ) uut (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("mux_2to1.vcd");
        $dumpvars(0, tb_mux_2to1);

        // Test 1: Select in0 (sel = 0)
        in0 = 4'b1010; in1 = 4'b1100; sel = 0; #10;
        assert(out === 4'b1010) else $error("Test 1 Failed!");

        // Test 2: Select in1 (sel = 1)
        sel = 1; #10;
        assert(out === 4'b1100) else $error("Test 2 Failed!");

        // Test 3: Change in0 while sel = 1 (out shouldn't change)
        in0 = 4'b1111; #10;
        assert(out === 4'b1100) else $error("Test 3 Failed!");

        // Test 4: Select in0 with new value (sel = 0)
        sel = 0; #10;
        assert(out === 4'b1111) else $error("Test 4 Failed!");

        $display("ALL MUX TESTS PASSED!");
        $finish;
    end

endmodule
