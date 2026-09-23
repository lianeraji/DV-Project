class dut_env extends uvm_env;
  `uvm_component_utils(dut_env)

  dut_agent      agent;
  dut_scoreboard scoreboard;
  bmu_subscriber subscriber;

  function new(string name = "dut_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent      = dut_agent::type_id::create("agent", this);
    scoreboard = dut_scoreboard::type_id::create("scoreboard", this);
    subscriber = bmu_subscriber::type_id::create("subscriber", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.monitor.analysis_port.connect(scoreboard.analysis_export);
    agent.monitor.analysis_port.connect(subscriber.analysis_export);
  endfunction

endclass
