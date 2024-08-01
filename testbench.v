module tb_vending_machine;

  reg clk;
  reg rst;
  reg [1:0] coin;
  wire nw_pa;

  // Instantiate the vending machine module
  vending_machine uut (
    .nw_pa(nw_pa),
    .coin(coin),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // 10 ns clock period
  end

  initial begin
    // Initialize inputs
    clk = 0;
    rst = 0;
    coin = 2'b00;

    // Apply reset
    rst = 1;
    #10;
    rst = 0;
    #10;

    // Insert 5 cent coin
    coin = 2'b01;
    #10;
    coin = 2'b00;
    #10;

    // Insert another 5 cent coin (total 10 cents)
    coin = 2'b01;
    #10;
    coin = 2'b00;
    #10;

    // Insert another 5 cent coin (total 15 cents)
    coin = 2'b01;
    #10;
    coin = 2'b00;
    #10;

    // Insert coin and check output
    coin = 2'b10; // Add 10 cents (total now 15 cents)
    #10;
    coin = 2'b00;
    #10;

    // Check output when in state s15
    #10;

    $stop;
  end

endmodule
