module lfsr_7 (
    input   logic       clk,
    input   logic       rst,
    input   logic       en,
    output  logic [6:0] data_out
);
    initial data_out = 7'b0000001;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 7'b0000001;
        end else if (en) begin
            data_out[0] <= data_out[2]^data_out[6];
            data_out[1] <= data_out[0];
            data_out[2] <= data_out[1];
            data_out[3] <= data_out[2];
            data_out[4] <= data_out[3];
            data_out[5] <= data_out[4];
            data_out[6] <= data_out[5];
        end
    end
endmodule
