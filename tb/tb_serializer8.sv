`timescale 1ns/1ps

module tb_serializer8;

    logic clk;
    logic rst_n;
    logic load;
    logic [7:0] parallel_in;
    logic serial_out;
    logic busy;

    serializer8 dut (
        .clk(clk),
        .rst_n(rst_n),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out),
        .busy(busy)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        load = 0;
        parallel_in = 8'b10110010;

        #20;
        rst_n = 1;

        #10;
        load = 1;

        #10;
        load = 0;

        wait (!busy);

        #20;
        $finish;
    end

    initial begin
        $dumpfile("serializer8.vcd");
        $dumpvars(0, tb_serializer8);
    end

endmodule