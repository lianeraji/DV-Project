class valid_hold_sequence extends bmu_base_sequence;
  `uvm_object_utils(valid_hold_sequence)
  function new(string name = "valid_hold_sequence"); super.new(name); endfunction

  task body();

    send_case(OP_OR, 32'h1234_0000, 32'h0000_5678, 1'b1);

    send_case(OP_XOR, 32'hFFFF_FFFF, 32'hFFFF_0000, 1'b0);
    send_case(OP_CPOP, 32'hFFFF_FFFF, 32'h0, 1'b0);

    send_case(OP_OR, 32'h0000_0001, 32'h0000_0002, 1'b1);
  endtask
endclass
