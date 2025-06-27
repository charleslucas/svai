module counter (
    input logic clk,
    input logic rst_n,
    input logic in,
    output logic [7:0] counter
);

    // Internal signal declaration
    logic [7:0] counter_next;

    // Sequential logic block
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
         counter <= 8'h00; // Reset value
        end else begin
         counter <= data_in ? counter_next : counter;
        end
    end

    // Combinational logic block
    always_comb begin
        counter_next = counter + 8'h01; // Increment the captured data
    end

endmodule