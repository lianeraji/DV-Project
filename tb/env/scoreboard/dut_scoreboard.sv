class dut_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(dut_scoreboard)

  uvm_analysis_imp #(bmu_transaction, dut_scoreboard) analysis_export;
  bmu_reference_model rm;

  int unsigned checked_count;
  int unsigned pass_count;
  int unsigned fail_count;

  function new(string name = "dut_scoreboard", uvm_component parent = null);
    super.new(name, parent);
    analysis_export = new("analysis_export", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    rm = bmu_reference_model::type_id::create("rm");
    checked_count = 0;
    pass_count    = 0;
    fail_count    = 0;
  endfunction

  function void write(bmu_transaction tr);
    logic [31:0] expected_result;
    logic        expected_error;
    bit          match;

    rm.predict(tr, expected_result, expected_error);
    checked_count++;

    match = ((tr.result_ff === expected_result) &&
             (tr.error     === expected_error));

    if (match) begin
      pass_count++;
      `uvm_info("BMU_SCOREBOARD",
                $sformatf("PASS %-13s exp_result=0x%08h actual=0x%08h exp_error=%0b actual_error=%0b",
                          bmu_op_name(tr.op), expected_result, tr.result_ff,
                          expected_error, tr.error),
                UVM_MEDIUM)
    end
    else begin
      fail_count++;
      `uvm_error("BMU_MISMATCH",
                 $sformatf({"FAIL %-13s\n",
                            "  a_in          = 0x%08h\n",
                            "  b_in          = 0x%08h\n",
                            "  valid_in      = %0b\n",
                            "  csr_ren_in    = %0b\n",
                            "  csr_rddata_in = 0x%08h\n",
                            "  ap             = %p\n",
                            "  expected       = 0x%08h\n",
                            "  actual         = 0x%08h\n",
                            "  expected_error = %0b\n",
                            "  actual_error   = %0b"},
                           bmu_op_name(tr.op), tr.a_in, tr.b_in, tr.valid_in,
                           tr.csr_ren_in, tr.csr_rddata_in, tr.ap,
                           expected_result, tr.result_ff,
                           expected_error, tr.error))
    end
  endfunction

  function void report_phase(uvm_phase phase);
    real pass_rate;

    super.report_phase(phase);

    if (checked_count != 0) begin
      pass_rate = (real'(pass_count) / real'(checked_count)) * 100.0;
    end
    else begin
      pass_rate = 0.0;
    end

    `uvm_info("BMU_SCOREBOARD_SUMMARY",
              $sformatf("CHECKED=%0d PASSED=%0d FAILED=%0d PASS_RATE=%0.2f%%",
                        checked_count, pass_count, fail_count, pass_rate),
              UVM_NONE)
  endfunction

endclass
