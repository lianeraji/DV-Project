class dut_reg_test extends dut_base_test;
  `uvm_component_utils(dut_reg_test)

  function new(string name = "dut_reg_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    normal_and_operation_seq and_seq;
    andn_operation_seq       andn_seq;
    or_operation_seq         or_seq;
    orn_operation_seq        orn_seq;
    xor_operation_seq        xor_seq;
    xnor_operation_seq       xnor_seq;
    srl_operation_seq        srl_seq;
    sra_operation_seq        sra_seq;
    ror_operation_seq        ror_seq;
    binv_operation_seq       binv_seq;
    sh2add_operation_seq     sh2add_seq;
    sub_operation_seq        sub_seq;
    slt_operation_seq        slt_seq;
    sltu_operation_seq       sltu_seq;
    ctz_operation_seq        ctz_seq;
    cpop_operation_seq       cpop_seq;
    sext_b_operation_seq     sext_b_seq;
    max_operation_seq        max_seq;
    pack_operation_seq       pack_seq;
    grev_operation_seq       grev_seq;
    csr_operation_seq        csr_seq;
    unsupported_operation_seq negative_seq;
    valid_hold_sequence      hold_seq;
    bmu_random_sequence      random_seq;

    phase.raise_objection(this);

    and_seq      = normal_and_operation_seq::type_id::create("and_seq");
    andn_seq     = andn_operation_seq::type_id::create("andn_seq");
    or_seq       = or_operation_seq::type_id::create("or_seq");
    orn_seq      = orn_operation_seq::type_id::create("orn_seq");
    xor_seq      = xor_operation_seq::type_id::create("xor_seq");
    xnor_seq     = xnor_operation_seq::type_id::create("xnor_seq");
    srl_seq      = srl_operation_seq::type_id::create("srl_seq");
    sra_seq      = sra_operation_seq::type_id::create("sra_seq");
    ror_seq      = ror_operation_seq::type_id::create("ror_seq");
    binv_seq     = binv_operation_seq::type_id::create("binv_seq");
    sh2add_seq   = sh2add_operation_seq::type_id::create("sh2add_seq");
    sub_seq      = sub_operation_seq::type_id::create("sub_seq");
    slt_seq      = slt_operation_seq::type_id::create("slt_seq");
    sltu_seq     = sltu_operation_seq::type_id::create("sltu_seq");
    ctz_seq      = ctz_operation_seq::type_id::create("ctz_seq");
    cpop_seq     = cpop_operation_seq::type_id::create("cpop_seq");
    sext_b_seq   = sext_b_operation_seq::type_id::create("sext_b_seq");
    max_seq      = max_operation_seq::type_id::create("max_seq");
    pack_seq     = pack_operation_seq::type_id::create("pack_seq");
    grev_seq     = grev_operation_seq::type_id::create("grev_seq");
    csr_seq      = csr_operation_seq::type_id::create("csr_seq");
    negative_seq = unsupported_operation_seq::type_id::create("negative_seq");
    hold_seq     = valid_hold_sequence::type_id::create("hold_seq");
    random_seq   = bmu_random_sequence::type_id::create("random_seq");

    `uvm_info("REGRESSION", "Starting directed BMU regression", UVM_NONE)

    and_seq.start(env.agent.sequencer);
    andn_seq.start(env.agent.sequencer);
    or_seq.start(env.agent.sequencer);
    orn_seq.start(env.agent.sequencer);
    xor_seq.start(env.agent.sequencer);
    xnor_seq.start(env.agent.sequencer);
    srl_seq.start(env.agent.sequencer);
    sra_seq.start(env.agent.sequencer);
    ror_seq.start(env.agent.sequencer);
    binv_seq.start(env.agent.sequencer);
    sh2add_seq.start(env.agent.sequencer);
    sub_seq.start(env.agent.sequencer);
    slt_seq.start(env.agent.sequencer);
    sltu_seq.start(env.agent.sequencer);
    ctz_seq.start(env.agent.sequencer);
    cpop_seq.start(env.agent.sequencer);
    sext_b_seq.start(env.agent.sequencer);
    max_seq.start(env.agent.sequencer);
    pack_seq.start(env.agent.sequencer);
    grev_seq.start(env.agent.sequencer);
    csr_seq.start(env.agent.sequencer);
    negative_seq.start(env.agent.sequencer);
    hold_seq.start(env.agent.sequencer);

    `uvm_info("REGRESSION", "Starting constrained-random BMU phase", UVM_NONE)
    random_seq.start(env.agent.sequencer);

    #1ns;
    phase.drop_objection(this);
  endtask

endclass
