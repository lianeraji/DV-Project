class sext_b_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(sext_b_operation_seq)
  function new(string name = "sext_b_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_SEXT_B, 32'h0000_007F, 32'h0);
    send_case(OP_SEXT_B, 32'h0000_0080, 32'h0);
    send_case(OP_SEXT_B, 32'h1234_56FF, 32'h0);
    send_case(OP_SEXT_B, 32'hFFFF_FF01, 32'h0);
  endtask
endclass
