class andn_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(andn_operation_seq)

  function new(string name = "andn_operation_seq");
    super.new(name);
  endfunction

  task body();
    send_case(OP_ANDN, 32'hFFFF_FFFF, 32'h0000_0000);
    send_case(OP_ANDN, 32'hFFFF_FFFF, 32'hFFFF_0000);
    send_case(OP_ANDN, 32'hF0F0_F0F0, 32'h0FF0_0FF0);
    send_case(OP_ANDN, 32'h1234_5678, 32'h00FF_00FF);
  endtask
endclass
