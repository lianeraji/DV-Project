package dut_test_package;
  import uvm_pkg::*;
  import rtl_pkg::*;
  import uvm_def::*;

  `include "uvm_macros.svh"

  `include "transaction.sv"
  `include "dut_sequencer.sv"
  `include "dut_driver.sv"
  `include "dut_monitor.sv"
  `include "dut_agent.sv"

  `include "bmu_reference_model.sv"
  `include "dut_scoreboard.sv"
  `include "bmu_subscriber.sv"
  `include "dut_env.sv"

  `include "bmu_base_sequence.sv"
  `include "normal_and_operation_seq.sv"
  `include "andn_operation_seq.sv"
  `include "or_operation_seq.sv"
  `include "orn_operation_seq.sv"
  `include "xor_operation_seq.sv"
  `include "xnor_operation_seq.sv"
  `include "srl_operation_seq.sv"
  `include "sra_operation_seq.sv"
  `include "ror_operation_seq.sv"
  `include "binv_operation_seq.sv"
  `include "sh2add_operation_seq.sv"
  `include "sub_operation_seq.sv"
  `include "slt_operation_seq.sv"
  `include "sltu_operation_seq.sv"
  `include "ctz_operation_seq.sv"
  `include "cpop_operation_seq.sv"
  `include "sext_b_operation_seq.sv"
  `include "max_operation_seq.sv"
  `include "pack_operation_seq.sv"
  `include "grev_operation_seq.sv"
  `include "csr_operation_seq.sv"
  `include "unsupported_operation_seq.sv"
  `include "valid_hold_sequence.sv"
  `include "bmu_random_sequence.sv"

  `include "dut_base_test.sv"
  `include "operation_tests.sv"
  `include "dut_reg_test.sv"

endpackage
