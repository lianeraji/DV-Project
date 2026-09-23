class or_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(or_operation_seq)

  function new(string name = "or_operation_seq"); super.new(name); endfunction

  task body();
    send_case(OP_OR, 32'h0000_0000, 32'h0000_0000);
    send_case(OP_OR, 32'h0000_0000, 32'hFFFF_FFFF);
    send_case(OP_OR, 32'h0F0F_0000, 32'h00FF_00FF);
    send_case(OP_OR, 32'hAAAA_5555, 32'h5555_AAAA);
  endtask
endclass
