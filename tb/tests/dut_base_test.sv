class dut_base_test extends uvm_test;
  `uvm_component_utils(dut_base_test)

  dut_env env;
  virtual Bit_Manipulation_intf vif;

  function new(string name = "dut_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = dut_env::type_id::create("env", this);


    uvm_config_db#(uvm_active_passive_enum)::set(this, "env.agent", "is_active", UVM_ACTIVE);

    if (!uvm_config_db#(virtual Bit_Manipulation_intf)::get(this, "", "vif", vif))
      `uvm_fatal("NO_VIF", "dut_base_test could not get Bit_Manipulation_intf")
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction

  task execute_sequence(uvm_sequence_base seq, uvm_phase phase);
    phase.raise_objection(this);
    seq.start(env.agent.sequencer);

    #1ns;
    phase.drop_objection(this);
  endtask

  function void report_phase(uvm_phase phase);
    uvm_report_server svr;
    super.report_phase(phase);
    svr = uvm_report_server::get_server();

    if ((svr.get_severity_count(UVM_FATAL) +
         svr.get_severity_count(UVM_ERROR)) > 0)
      `uvm_info("TEST_STATUS", "********** TEST FAILED **********", UVM_NONE)
    else
      `uvm_info("TEST_STATUS", "********** TEST PASSED **********", UVM_NONE)
  endfunction

endclass
