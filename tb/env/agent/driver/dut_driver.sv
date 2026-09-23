class dut_driver extends uvm_driver #(bmu_transaction);
  `uvm_component_utils(dut_driver)

  virtual Bit_Manipulation_intf vif;

  function new(string name = "dut_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual Bit_Manipulation_intf)::get(this, "", "vif", vif))
      `uvm_fatal("NO_VIF", "dut_driver could not get Bit_Manipulation_intf from uvm_config_db")
  endfunction

  task run_phase(uvm_phase phase);

    vif.scan_mode     <= 1'b0;
    vif.valid_in      <= 1'b0;
    vif.ap            <= '0;
    vif.csr_ren_in    <= 1'b0;
    vif.csr_rddata_in <= '0;
    vif.a_in          <= '0;
    vif.b_in          <= '0;

    wait (vif.rst_l === 1'b1);

    forever begin
      seq_item_port.get_next_item(req);
      drive_item(req);
      seq_item_port.item_done();
    end
  endtask

  task drive_item(bmu_transaction tr);

    @(vif.cb_drv);
    vif.cb_drv.scan_mode     <= tr.scan_mode;
    vif.cb_drv.valid_in      <= tr.valid_in;
    vif.cb_drv.ap            <= tr.ap;
    vif.cb_drv.csr_ren_in    <= tr.csr_ren_in;
    vif.cb_drv.csr_rddata_in <= tr.csr_rddata_in;
    vif.cb_drv.a_in          <= tr.a_in;
    vif.cb_drv.b_in          <= tr.b_in;

    `uvm_info("BMU_DRIVER", $sformatf("Driven: %s", tr.convert2string()), UVM_HIGH)


    @(posedge vif.clk);
  endtask

endclass
