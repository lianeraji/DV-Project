class slt_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(slt_operation_seq)
  function new(string name = "slt_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_SLT, 32'hFFFF_FFFF, 32'h0000_0001); 
    send_case(OP_SLT, 32'h0000_0001, 32'hFFFF_FFFF); 
    send_case(OP_SLT, 32'h8000_0000, 32'h7FFF_FFFF);
    send_case(OP_SLT, 32'h0000_0005, 32'h0000_0005);
  endtask
endclass
