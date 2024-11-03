module clkfsm (
    input   logic       rst,
    input   logic       clk,
    output  logic [7:0] data_out
);
    wire en;
    clktick #(16) clktick0 (clk, rst, 1'b1, 16'd150, en);
    f1_fsm f1_fsm0 (rst, en, clk, data_out);
endmodule
