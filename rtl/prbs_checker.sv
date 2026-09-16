`timescale 1ns/1ps

module prbs_checker (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        valid,
    input  logic [7:0]  expected_data,
    input  logic [7:0]  received_data,

    output logic [31:0] total_bits,
    output logic [31:0] bit_errors,
    output logic [31:0] byte_errors
);

    integer i;
    logic [3:0] errors_this_byte;

    always_comb begin
        errors_this_byte = 0;

        for (i = 0; i < 8; i = i + 1) begin
            if (expected_data[i] != received_data[i])
                errors_this_byte = errors_this_byte + 1;
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            total_bits  <= 0;
            bit_errors  <= 0;
            byte_errors <= 0;
        end
        else if (valid) begin
    total_bits <= total_bits + 8;

    bit_errors <= bit_errors + {28'b0, errors_this_byte};

    if (errors_this_byte != 0)
        byte_errors <= byte_errors + 1;
end
    end

endmodule