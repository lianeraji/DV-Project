class max_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(max_operation_seq)
  function new(string name = "max_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_MAX, 32'd10, 32'd20);            
    send_case(OP_MAX, 32'd20, 32'd10);          
    send_case(OP_MAX, 32'hFFFF_FFFF, 32'h0000_0001); 
    send_case(OP_MAX, 32'h8000_0000, 32'h7FFF_FFFF);
    send_case(OP_MAX, 32'hFFFF_FFF0, 32'hFFFF_FFF5); 
  endtask
endclass
