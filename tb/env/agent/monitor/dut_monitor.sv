class dut_monitor extends uvm_monitor;
  `uvm_component_utils(dut_monitor)

  virtual Bit_Manipulation_intf vif;
  uvm_analysis_port #(bmu_transaction) analysis_port;

  function new(string name = "dut_monitor", uvm_component parent = null);
    super.new(name, parent);
    analysis_port = new("analysis_port", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual Bit_Manipulation_intf)::get(this, "", "vif", vif))
      `uvm_fatal("NO_VIF", "dut_monitor could not get Bit_Manipulation_intf from uvm_config_db")
  endfunction

  task run_phase(uvm_phase phase);
    bmu_transaction tr;
    forever begin
      @(vif.cb_mon);

      tr = bmu_transaction::type_id::create("tr");
      tr.rst_l         = vif.cb_mon.rst_l;
      tr.scan_mode     = vif.cb_mon.scan_mode;
      tr.valid_in      = vif.cb_mon.valid_in;
      tr.ap            = vif.cb_mon.ap;
      tr.csr_ren_in    = vif.cb_mon.csr_ren_in;
      tr.csr_rddata_in = vif.cb_mon.csr_rddata_in;
      tr.a_in          = vif.cb_mon.a_in;
      tr.b_in          = vif.cb_mon.b_in;
      tr.result_ff     = vif.cb_mon.result_ff;
      tr.error         = vif.cb_mon.error;
      tr.decode_operation();

      `uvm_info("BMU_MONITOR", $sformatf("Observed: %s", tr.convert2string()), UVM_HIGH)
      analysis_port.write(tr);
    end
  endtask

endclass
