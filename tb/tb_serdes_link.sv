`timescale 1ns/1ps

module tb_serdes_link;

    logic clk;
    logic rst_n;
    logic load;

    logic [7:0] tx_data;
    logic serial_data;
    logic busy;

    logic [7:0] rx_data;
    logic valid;

    serializer8 tx (
        .clk(clk),
        .rst_n(rst_n),
        .load(load),
        .parallel_in(tx_data),
        .serial_out(serial_data),
        .busy(busy)
    );

    deserializer8 rx (
        .clk(clk),
        .rst_n(rst_n),
        .enable(busy),
        .serial_in(serial_data),
        .parallel_out(rx_data),
        .valid(valid)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n   = 0;
        load    = 0;
        tx_data = 8'b10110010;

        #20;
        rst_n = 1;

        #10;
        load = 1;

        #10;
        load = 0;

        wait(valid);

        #1;

        $display("TX = %b", tx_data);
        $display("RX = %b", rx_data);

        if (rx_data == tx_data)
            $display("SERDES TEST PASSED");
        else
            $fatal("SERDES TEST FAILED");

        #20;
        $finish;
    end

    initial begin
        $dumpfile("serdes_link.vcd");
        $dumpvars(0, tb_serdes_link);
    end

endmodule