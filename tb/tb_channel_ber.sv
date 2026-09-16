`timescale 1ns/1ps

module tb_channel_ber;

    localparam integer NUM_BYTES    = 1000;
    localparam integer ERROR_PERIOD = 1000;

    logic clk;
    logic rst_n;

    logic advance;
    logic load;

    logic [7:0] prbs_data;
    logic [7:0] expected_data;

    logic tx_serial;
    logic ch_serial;
    logic busy;

    logic [7:0] rx_data;
    logic valid;

    logic [31:0] total_bits;
    logic [31:0] bit_errors;
    logic [31:0] byte_errors;

    integer packet_count;

    prbs7_byte_gen prbs_gen (
        .clk      (clk),
        .rst_n    (rst_n),
        .advance  (advance),
        .data_out (prbs_data)
    );

    serializer8 tx (
        .clk         (clk),
        .rst_n       (rst_n),
        .load        (load),
        .parallel_in (prbs_data),
        .serial_out  (tx_serial),
        .busy        (busy)
    );

    channel_model #(
        .ERROR_PERIOD(ERROR_PERIOD)
    ) channel (
        .clk    (clk),
        .rst_n  (rst_n),
        .enable (busy),
        .tx_in  (tx_serial),
        .rx_out (ch_serial)
    );

    deserializer8 rx (
        .clk          (clk),
        .rst_n        (rst_n),
        .enable       (busy),
        .serial_in    (ch_serial),
        .parallel_out (rx_data),
        .valid        (valid)
    );

    prbs_checker u_checker (
        .clk           (clk),
        .rst_n         (rst_n),
        .valid         (valid),
        .expected_data (expected_data),
        .received_data (rx_data),
        .total_bits    (total_bits),
        .bit_errors    (bit_errors),
        .byte_errors   (byte_errors)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n         = 0;
        load          = 0;
        advance       = 0;
        expected_data = 0;
        packet_count  = 0;

        #20;
        rst_n = 1;

        repeat (NUM_BYTES) begin

            @(negedge clk);

            expected_data = prbs_data;

            load    = 1;
            advance = 1;

            @(negedge clk);

            load    = 0;
            advance = 0;

            wait(valid);

            @(negedge clk);

            packet_count = packet_count + 1;
        end

        #20;

        $display("");
        $display("======================================");
        $display(" OpenSerDes-LP Milestone 3");
        $display(" Channel BER Test");
        $display("======================================");
        $display("Bytes tested : %0d", packet_count);
        $display("Total bits   : %0d", total_bits);
        $display("Bit errors   : %0d", bit_errors);
        $display("Byte errors  : %0d", byte_errors);

        if (total_bits != 0)
            $display("BER x 1e6   : %0d",
                     (bit_errors * 1000000) / total_bits);

        if (bit_errors > 0)
            $display("STATUS       : ERROR DETECTION PASS");
        else
            $display("STATUS       : NO ERRORS DETECTED");

        $display("======================================");

        $finish;
    end

    initial begin
        $dumpfile("channel_ber.vcd");
        $dumpvars(0, tb_channel_ber);
    end

endmodule