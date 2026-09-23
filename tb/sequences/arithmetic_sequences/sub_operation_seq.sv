class sub_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(sub_operation_seq)
  function new(string name = "sub_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_SUB, 32'd20, 32'd7);
    send_case(OP_SUB, 32'd7, 32'd20);
    send_case(OP_SUB, 32'hFFFF_FFFF, 32'h0000_0001);
    send_case(OP_SUB, 32'h8000_0000, 32'h0000_0001);
    send_case(OP_SUB, 32'h1234_5678, 32'h1234_5678);
  endtask
endclass
