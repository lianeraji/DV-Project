class xor_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(xor_operation_seq)

  function new(string name = "xor_operation_seq"); super.new(name); endfunction

  task body();
    send_case(OP_XOR, 32'h0000_0000, 32'h0000_0000);
    send_case(OP_XOR, 32'hFFFF_FFFF, 32'hFFFF_FFFF);
    send_case(OP_XOR, 32'hAAAA_5555, 32'h5555_AAAA);
    send_case(OP_XOR, 32'h0F0F_0F0F, 32'h00FF_00FF);
  endtask
endclass
