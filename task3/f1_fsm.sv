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
        end else begin
            case (myState)
                S0: begin
                    myState <= en ? S1 : S0;
                end
                S1: begin
                    myState <= en ? S2 : S1;
                end
                S2: begin
                    myState <= en ? S3 : S2;
                end
                S3: begin
                    myState <= en ? S4 : S3;
                end
                S4: begin
                    myState <= en ? S5 : S4;
                end
                S5: begin
                    myState <= en ? S6 : S5;
                end
                S6: begin
                    myState <= en ? S7 : S6;
                end
                S7: begin
                    myState <= en ? S8 : S7;
                end
                S8: begin
                    myState <= en ? S0 : S8;
                end
            endcase
        end
    end
    always_comb begin
        data_out = '0;
        case (myState)
            S0: begin
                data_out = 8'd0;
            end
            S1: begin
                data_out = 8'b00000001;
            end
            S2: begin
                data_out = 8'b00000011;
            end
            S3: begin
                data_out = 8'b00000111;
            end
            S4: begin
                data_out = 8'b00001111;
            end
            S5: begin
                data_out = 8'b00011111;
            end
            S6: begin
                data_out = 8'b00111111;
            end
            S7: begin
                data_out = 8'b01111111;
            end
            S8: begin
                data_out = 8'b11111111;
            end
        endcase
    end
endmodule
