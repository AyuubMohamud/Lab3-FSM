module f1_fsm (
    input   logic       rst,
    input   logic       en,
    input   logic       clk,
    output  logic [7:0] data_out
);
    typedef enum {S0, S1, S2, S3, S4, S5, S6, S7, S8} state_t;
    state_t myState;

    always_ff @(posedge clk) begin
        if (rst) begin
            myState <= S0;
            data_out <= 8'd0;
        end else begin
            case (myState)
                S0: begin
                    myState <= en ? S1 : S0;
                    data_out <= en ? 8'h01 : 8'h00;
                end
                S1: begin
                    myState <= en ? S2 : S1;
                    data_out <= en ? 8'h03 : 8'h01;
                end
                S2: begin
                    myState <= en ? S3 : S2;
                    data_out <= en ? 8'h07 : 8'h03;
                end
                S3: begin
                    myState <= en ? S4 : S3;
                    data_out <= en ? 8'h0F : 8'h07;
                end
                S4: begin
                    myState <= en ? S5 : S4;
                    data_out <= en ? 8'h1F : 8'h0F;
                end
                S5: begin
                    myState <= en ? S6 : S5;
                    data_out <= en ? 8'h3F : 8'h1F;
                end
                S6: begin
                    myState <= en ? S7 : S6;
                    data_out <= en ? 8'h7F : 8'h3F;
                end
                S7: begin
                    myState <= en ? S8 : S7;
                    data_out <= en ? 8'hFF : 8'h7F;
                end
                S8: begin
                    myState <= en ? S0 : S8;
                    data_out <= en ? 8'h00 : 8'hFF;
                end
            endcase
        end
    end
endmodule
