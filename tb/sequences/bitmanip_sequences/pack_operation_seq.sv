class pack_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(pack_operation_seq)
  function new(string name = "pack_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_PACK, 32'h1234_5678, 32'hABCD_EF12);
    send_case(OP_PACK, 32'hAAAA_1111, 32'hBBBB_2222);
    send_case(OP_PACK, 32'hFFFF_0000, 32'h0000_FFFF);
    send_case(OP_PACK, 32'h0000_1234, 32'h0000_5678);
  endtask
endclass
