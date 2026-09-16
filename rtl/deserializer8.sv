`timescale 1ns/1ps

module deserializer8 (
    input  logic       clk,
    input  logic       rst_n,
    input  logic       enable,
    input  logic       serial_in,
    output logic [7:0] parallel_out,
    output logic       valid
);

    logic [7:0] shift_reg;
    logic [2:0] count;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_reg    <= 8'b0;
            parallel_out <= 8'b0;
            count        <= 0;
            valid        <= 0;
        end
        else begin
            valid <= 0;

            if (enable) begin
                shift_reg <= {shift_reg[6:0], serial_in};

                if (count == 7) begin
                    parallel_out <= {shift_reg[6:0], serial_in};
                    count <= 0;
                    valid <= 1;
                end
                else begin
                    count <= count + 1;
                end
            end
        end
    end

endmodule