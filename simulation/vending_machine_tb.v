`timescale 1ns / 1ps

module vending_machine_tb;

    reg clk;
    reg reset;
    reg nickel_in;
    reg dime_in;

    wire dispense_item;
    wire change_out;

    vending_machine uut (
        .clk(clk),
        .reset(reset),
        .nickel_in(nickel_in),
        .dime_in(dime_in),
        .dispense_item(dispense_item),
        .change_out(change_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        nickel_in = 0;
        dime_in = 0;

        #20;
        reset = 0;
        #10;

        // Test Case 1: Two dimes = 20 cents
        dime_in = 1; #10;
        dime_in = 0; #10;
        dime_in = 1; #10;
        dime_in = 0; #10;
        #20;

        // Test Case 2: Dime + Nickel + Dime = 25 cents
        // Expected: Dispense + 5 cents change
        dime_in = 1; #10;
        dime_in = 0; #10;
        nickel_in = 1; #10;
        nickel_in = 0; #10;
        dime_in = 1; #10;
        dime_in = 0; #10;
        #20;

        $finish;
    end
endmodule
