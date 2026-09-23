class ror_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(ror_operation_seq)
  function new(string name = "ror_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_ROR, 32'h1234_5678, 32'd0);
    send_case(OP_ROR, 32'h8000_0001, 32'd1);
    send_case(OP_ROR, 32'h1234_5678, 32'd4);
    send_case(OP_ROR, 32'hAAAA_5555, 32'd16);
    send_case(OP_ROR, 32'h0000_0001, 32'd31);
  endtask
endclass
