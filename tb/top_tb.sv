module top_tb;
  import uvm_pkg::*;
  import rtl_pkg::*;
  import dut_test_package::*;

  timeunit 1ns;
  timeprecision 1ps;

  logic clk;

  Bit_Manipulation_intf bmu_if(.clk(clk));

  Bit_Manipulation_Unit dut (
    .clk           (clk),
    .rst_l         (bmu_if.rst_l),
    .scan_mode     (bmu_if.scan_mode),
    .valid_in      (bmu_if.valid_in),
    .ap            (bmu_if.ap),
    .csr_ren_in    (bmu_if.csr_ren_in),
    .csr_rddata_in (bmu_if.csr_rddata_in),
    .a_in          (bmu_if.a_in),
    .b_in          (bmu_if.b_in),
    .result_ff     (bmu_if.result_ff),
    .error         (bmu_if.error)
  );

  initial begin
    clk = 1'b0;
    forever #5ns clk = ~clk;
  end

  initial begin
    bmu_if.rst_l = 1'b0;
    repeat (3) @(posedge clk);
    @(negedge clk);
    bmu_if.rst_l = 1'b1;
  end

  initial begin
    uvm_config_db#(virtual Bit_Manipulation_intf)::set(null, "*", "vif", bmu_if);


    if ($test$plusargs("UVM_TESTNAME"))
      run_test();
    else
      run_test("dut_reg_test");
  end


  initial begin
    #1ms;
    $fatal(1, "Simulation timeout");
  end

endmodule
