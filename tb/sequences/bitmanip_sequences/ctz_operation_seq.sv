class ctz_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(ctz_operation_seq)
  function new(string name = "ctz_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_CTZ, 32'h0000_0000, 32'h0); 
    send_case(OP_CTZ, 32'h0000_0001, 32'h0); 
    send_case(OP_CTZ, 32'h0000_0008, 32'h0); 
    send_case(OP_CTZ, 32'h0001_0000, 32'h0); 
    send_case(OP_CTZ, 32'h8000_0000, 32'h0);
  endtask
endclass
