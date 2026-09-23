class orn_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(orn_operation_seq)

  function new(string name = "orn_operation_seq"); super.new(name); endfunction

  task body();
    send_case(OP_ORN, 32'h0000_0000, 32'hFFFF_FFFF);
    send_case(OP_ORN, 32'hFFFF_0000, 32'h0000_00FF);
    send_case(OP_ORN, 32'h1234_5678, 32'hFFFF_0000);
    send_case(OP_ORN, 32'hAAAA_AAAA, 32'h5555_5555);
  endtask
endclass
