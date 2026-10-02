module vending_machine (
    input clk,
    input reset,
    input nickel_in,        // 5 cents
    input dime_in,          // 10 cents
    output reg dispense_item,
    output reg change_out
);

    // FSM states
    parameter IDLE      = 3'b000;
    parameter S5        = 3'b001;
    parameter S10       = 3'b010;
    parameter S15       = 3'b011;
    parameter DISPENSE  = 3'b100;

    // State registers
    reg [2:0] current_state, next_state;

    // State register
    always @(posedge clk, posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next-state and output logic
    always @(*) begin
        next_state = current_state;
        dispense_item = 1'b0;
        change_out = 1'b0;

        case (current_state)

            IDLE: begin
                if (nickel_in)
                    next_state = S5;
                else if (dime_in)
                    next_state = S10;
            end

            S5: begin
                if (nickel_in)
                    next_state = S10;
                else if (dime_in)
                    next_state = S15;
            end

            S10: begin
                if (nickel_in)
                    next_state = S15;
                else if (dime_in)
                    next_state = DISPENSE;
            end

            S15: begin
                if (nickel_in)
                    next_state = DISPENSE;
                else if (dime_in) begin
                    next_state = DISPENSE;
                    change_out = 1'b1;
                end
            end

            DISPENSE: begin
                dispense_item = 1'b1;
                next_state = IDLE;
            end

            default: begin
                next_state = IDLE;
            end

        endcase
    end

endmodule