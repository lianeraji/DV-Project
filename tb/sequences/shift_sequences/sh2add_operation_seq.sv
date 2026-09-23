class sh2add_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(sh2add_operation_seq)
  function new(string name = "sh2add_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_SH2ADD, 32'd4, 32'd7);
    send_case(OP_SH2ADD, 32'h0000_0001, 32'h0000_0000);
    send_case(OP_SH2ADD, 32'h1000_0000, 32'h0000_0001);
    send_case(OP_SH2ADD, 32'hFFFF_FFFF, 32'h0000_0001);
  endtask
endclass
