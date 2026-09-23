class xnor_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(xnor_operation_seq)

  function new(string name = "xnor_operation_seq"); super.new(name); endfunction

  task body();
    send_case(OP_XNOR, 32'h0000_0000, 32'h0000_0000);
    send_case(OP_XNOR, 32'hFFFF_FFFF, 32'hFFFF_FFFF);
    send_case(OP_XNOR, 32'hAAAA_5555, 32'h5555_AAAA);
    send_case(OP_XNOR, 32'h1234_5678, 32'h8765_4321);
  endtask
endclass
