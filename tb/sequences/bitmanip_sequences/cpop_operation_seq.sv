class cpop_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(cpop_operation_seq)
  function new(string name = "cpop_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_CPOP, 32'h0000_0000, 32'h0); 
    send_case(OP_CPOP, 32'hFFFF_FFFF, 32'h0); 
    send_case(OP_CPOP, 32'h0000_FFFF, 32'h0);
    send_case(OP_CPOP, 32'hFFFF_0000, 32'h0); 
    send_case(OP_CPOP, 32'h8000_0000, 32'h0); 
    send_case(OP_CPOP, 32'hAAAA_5555, 32'h0); 
  endtask
endclass
