class sltu_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(sltu_operation_seq)
  function new(string name = "sltu_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_SLTU, 32'h0000_0001, 32'h0000_0002);
    send_case(OP_SLTU, 32'hFFFF_FFFF, 32'h0000_0001);
    send_case(OP_SLTU, 32'h0000_0000, 32'hFFFF_FFFF);
    send_case(OP_SLTU, 32'h8000_0000, 32'h7FFF_FFFF);
    send_case(OP_SLTU, 32'h1234_5678, 32'h1234_5678);
  endtask
endclass
