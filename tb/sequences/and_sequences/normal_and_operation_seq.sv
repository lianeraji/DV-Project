class normal_and_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(normal_and_operation_seq)

  function new(string name = "normal_and_operation_seq");
    super.new(name);
  endfunction

  task body();
    send_case(OP_AND, 32'h0000_0000, 32'hFFFF_FFFF);
    send_case(OP_AND, 32'hFFFF_FFFF, 32'h0F0F_F0F0);
    send_case(OP_AND, 32'hAAAA_5555, 32'h0F0F_0F0F);
    send_case(OP_AND, 32'h1234_5678, 32'hFFFF_0000);
  endtask
endclass
