`timescale 1ns/1ps

module tb_prbs7;

    logic clk;
    logic rst_n;
    logic prbs_out;

    prbs7 dut (
        .clk(clk),
        .rst_n(rst_n),
        .prbs_out(prbs_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;

        #20;
        rst_n = 1;

        #1500;
        $finish;
    end

    initial begin
        $dumpfile("prbs7.vcd");
        $dumpvars(0, tb_prbs7);
    end

endmodule