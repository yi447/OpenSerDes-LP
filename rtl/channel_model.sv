`timescale 1ns/1ps

module channel_model #(
    parameter integer ERROR_PERIOD = 0
)(
    input  logic clk,
    input  logic rst_n,
    input  logic enable,
    input  logic tx_in,
    output logic rx_out
);

    logic [31:0] bit_count;

    // 計算經過多少個 serial bits
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bit_count <= 0;
        else if (enable)
            bit_count <= bit_count + 1;
    end

    // Channel 本身不增加一個 clock latency
    always_comb begin
        rx_out = tx_in;

        if (ERROR_PERIOD > 0) begin
            if (enable &&
                (((bit_count + 1) % ERROR_PERIOD) == 0))
                rx_out = ~tx_in;
        end
    end

endmodule