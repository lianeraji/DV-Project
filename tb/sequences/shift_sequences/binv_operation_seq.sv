class binv_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(binv_operation_seq)
  function new(string name = "binv_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_BINV, 32'h0000_0000, 32'd0);
    send_case(OP_BINV, 32'h0000_0000, 32'd31);
    send_case(OP_BINV, 32'hFFFF_FFFF, 32'd0);
    send_case(OP_BINV, 32'hAAAA_5555, 32'd7);
    send_case(OP_BINV, 32'h1234_5678, 32'd15);
  endtask
endclass
