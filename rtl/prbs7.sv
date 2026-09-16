`timescale 1ns/1ps

module prbs7 (
    input  logic clk,
    input  logic rst_n,
    output logic prbs_out
);

    logic [6:0] lfsr;

    wire feedback = lfsr[6] ^ lfsr[5];

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            lfsr <= 7'b0000001;
        else
            lfsr <= {lfsr[5:0], feedback};
    end

    assign prbs_out = lfsr[6];

endmodule