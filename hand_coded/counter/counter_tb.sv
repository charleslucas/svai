module counter_tb ();

    // Internal signal declaration
    logic clk;
    logic rst_n;
    logic in;
    logic [7:0] counter;

    initial begin
        rst_n = 1'b0; // Reset the counter
        clk = 1'b0; // Initialize clock
        in = 1'b0; // Initialize input
        #50 rst_n = 1'b1; // Release reset after 50 time units

        #100 in = 1'b1; // Set input to high after 100 time units
        #200 in = 1'b0; // Set input to low after 200 time units
        #300 in = 1'b1; // Set input to high after 100 time units
        #400 in = 1'b0; // Set input to low after 200 time units
        #500 in = 1'b1; // Set input to high after 100 time units
        #600 in = 1'b0; // Set input to low after 200 time units
        #700 $finish; // End simulation after 300 time units
    end

    // Combinational logic block
    always_comb begin
        #5 clk = ~clk; // Toggle clock every 5 time units
    end
    
    counter counter_dut (
        .clk(clk),
        .rst_n(rst_n),
        .in(in),
        .counter(counter)
    );
    
endmodule