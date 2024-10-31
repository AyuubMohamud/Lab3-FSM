module lfsr(
    input   logic       clk,
    input   logic       rst,
    input   logic       en,
    output  logic [3:0] data_out
);
    initial data_out = 4'b0001;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 4'b0001;
        end else if (en) begin
            data_out[0] <= data_out[3]^data_out[2];
            data_out[1] <= data_out[0];
            data_out[2] <= data_out[1];
            data_out[3] <= data_out[2];
        end
    end
endmodule
