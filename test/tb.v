`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg [47:0] li_tb;
  reg [47:0] ri_tb;
  reg [47:0] ki_tb;
  
  
  // Outputs
  wire [47:0] lio_tb;
  wire [47:0] rio_tb;
  
  // Instantiate the module under test
  tt_um_example dut (
     .clk(clk),
    .li(li_tb),
    .ri(ri_tb),
    .ki(ki_tb),
    .lio(lio_tb),
    .rio(rio_tb)
  );
  
  // Generate clock

  reg clk = 0;
  always #5 clk = ~clk;  // Toggle clock every 5 time units

  // Testbench code
  integer i;
  initial begin
    // Initialize inputs
    li_tb = 48'h000000000000;  // Initial left input
    ri_tb = 48'h111111111111;  // Initial right input
    ki_tb = 48'h123456789abc;  // Initial key
    
    // Apply stimulus and monitor outputs
    for (i = 0; i < NUM_TESTS; i = i + 1) begin
      // Display test number
      $display("Test %0d:", i);
      
      // Display inputs
      $display("  Input:  LI=%h, RI=%h, KI=%h", li_tb, ri_tb, ki_tb);
      
      // Apply inputs
      #1;  // Wait for 1 time unit
      // Generate test vectors for inputs (you can adjust these)
      li_tb = $random;
      ri_tb = $random;
      ki_tb = $random;
      
      // Wait for a few clock cycles for outputs to stabilize
      #10;
      
      // Display outputs
      $display("  Output: LIO=%h, RIO=%h", lio_tb, rio_tb);
    end
    
    // End simulation
    $finish;
  end
endmodule

