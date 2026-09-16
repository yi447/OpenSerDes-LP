`timescale 1ns/1ps

module prbs7_byte_gen (
    input  logic       clk,
    input  logic       rst_n,
    input  logic       advance,
    output logic [7:0] data_out
);

    logic [6:0] state;
    logic [6:0] temp;
    integer i;

    always_comb begin
        temp = state;

        for (i = 0; i < 8; i = i + 1) begin
            data_out[7-i] = temp[6];
            temp = {temp[5:0], temp[6] ^ temp[5]};
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= 7'b0000001;
        else if (advance)
            state <= temp;
    end

endmodule