class bmu_and_test extends dut_base_test;
  `uvm_component_utils(bmu_and_test)
  function new(string name = "bmu_and_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    normal_and_operation_seq seq;
    seq = normal_and_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_andn_test extends dut_base_test;
  `uvm_component_utils(bmu_andn_test)
  function new(string name = "bmu_andn_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    andn_operation_seq seq;
    seq = andn_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_or_test extends dut_base_test;
  `uvm_component_utils(bmu_or_test)
  function new(string name = "bmu_or_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    or_operation_seq seq;
    seq = or_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_orn_test extends dut_base_test;
  `uvm_component_utils(bmu_orn_test)
  function new(string name = "bmu_orn_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    orn_operation_seq seq;
    seq = orn_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_xor_test extends dut_base_test;
  `uvm_component_utils(bmu_xor_test)
  function new(string name = "bmu_xor_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    xor_operation_seq seq;
    seq = xor_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_xnor_test extends dut_base_test;
  `uvm_component_utils(bmu_xnor_test)
  function new(string name = "bmu_xnor_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    xnor_operation_seq seq;
    seq = xnor_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_srl_test extends dut_base_test;
  `uvm_component_utils(bmu_srl_test)
  function new(string name = "bmu_srl_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    srl_operation_seq seq;
    seq = srl_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_sra_test extends dut_base_test;
  `uvm_component_utils(bmu_sra_test)
  function new(string name = "bmu_sra_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    sra_operation_seq seq;
    seq = sra_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_ror_test extends dut_base_test;
  `uvm_component_utils(bmu_ror_test)
  function new(string name = "bmu_ror_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    ror_operation_seq seq;
    seq = ror_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_binv_test extends dut_base_test;
  `uvm_component_utils(bmu_binv_test)
  function new(string name = "bmu_binv_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    binv_operation_seq seq;
    seq = binv_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_sh2add_test extends dut_base_test;
  `uvm_component_utils(bmu_sh2add_test)
  function new(string name = "bmu_sh2add_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    sh2add_operation_seq seq;
    seq = sh2add_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_sub_test extends dut_base_test;
  `uvm_component_utils(bmu_sub_test)
  function new(string name = "bmu_sub_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    sub_operation_seq seq;
    seq = sub_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_slt_test extends dut_base_test;
  `uvm_component_utils(bmu_slt_test)
  function new(string name = "bmu_slt_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    slt_operation_seq seq;
    seq = slt_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_sltu_test extends dut_base_test;
  `uvm_component_utils(bmu_sltu_test)
  function new(string name = "bmu_sltu_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    sltu_operation_seq seq;
    seq = sltu_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_ctz_test extends dut_base_test;
  `uvm_component_utils(bmu_ctz_test)
  function new(string name = "bmu_ctz_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    ctz_operation_seq seq;
    seq = ctz_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_cpop_test extends dut_base_test;
  `uvm_component_utils(bmu_cpop_test)
  function new(string name = "bmu_cpop_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    cpop_operation_seq seq;
    seq = cpop_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_sext_b_test extends dut_base_test;
  `uvm_component_utils(bmu_sext_b_test)
  function new(string name = "bmu_sext_b_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    sext_b_operation_seq seq;
    seq = sext_b_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_max_test extends dut_base_test;
  `uvm_component_utils(bmu_max_test)
  function new(string name = "bmu_max_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    max_operation_seq seq;
    seq = max_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_pack_test extends dut_base_test;
  `uvm_component_utils(bmu_pack_test)
  function new(string name = "bmu_pack_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    pack_operation_seq seq;
    seq = pack_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_grev_test extends dut_base_test;
  `uvm_component_utils(bmu_grev_test)
  function new(string name = "bmu_grev_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    grev_operation_seq seq;
    seq = grev_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_csr_test extends dut_base_test;
  `uvm_component_utils(bmu_csr_test)
  function new(string name = "bmu_csr_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    csr_operation_seq seq;
    seq = csr_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_negative_test extends dut_base_test;
  `uvm_component_utils(bmu_negative_test)
  function new(string name = "bmu_negative_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    unsupported_operation_seq seq;
    seq = unsupported_operation_seq::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_valid_hold_test extends dut_base_test;
  `uvm_component_utils(bmu_valid_hold_test)
  function new(string name = "bmu_valid_hold_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    valid_hold_sequence seq;
    seq = valid_hold_sequence::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass

class bmu_random_test extends dut_base_test;
  `uvm_component_utils(bmu_random_test)
  function new(string name = "bmu_random_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  task run_phase(uvm_phase phase);
    bmu_random_sequence seq;
    seq = bmu_random_sequence::type_id::create("seq");
    execute_sequence(seq, phase);
  endtask
endclass
