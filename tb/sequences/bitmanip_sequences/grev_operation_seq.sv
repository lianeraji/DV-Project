class grev_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(grev_operation_seq)
  function new(string name = "grev_operation_seq"); super.new(name); endfunction
  task body();

    send_case(OP_GREV, 32'h1234_5678, 32'd24);
    send_case(OP_GREV, 32'hA1B2_C3D4, 32'd24);
    send_case(OP_GREV, 32'h0000_00FF, 32'd24);

    send_case(OP_GREV, 32'h1234_5678, 32'd8);
  endtask
endclass
