`timescale 1ns/1ps

module serializer8 (
    input  logic       clk,
    input  logic       rst_n,
    input  logic       load,
    input  logic [7:0] parallel_in,
    output logic       serial_out,
    output logic       busy
);

    logic [7:0] shift_reg;
    logic [3:0] count;

    assign serial_out = shift_reg[7];

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_reg <= 8'b0;
            count     <= 0;
            busy      <= 0;
        end
        else if (load) begin
            shift_reg <= parallel_in;
            count     <= 8;
            busy      <= 1;
        end
        else if (busy) begin
            shift_reg <= {shift_reg[6:0], 1'b0};

            if (count == 1) begin
                count <= 0;
                busy  <= 0;
            end
            else begin
                count <= count - 1;
            end
        end
    end

endmodule