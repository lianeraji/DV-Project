class dut_sequencer extends uvm_sequencer #(bmu_transaction);
  `uvm_component_utils(dut_sequencer)

  function new(string name = "dut_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction
endclass
