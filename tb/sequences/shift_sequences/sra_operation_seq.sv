class sra_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(sra_operation_seq)
  function new(string name = "sra_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_SRA, 32'h8000_0000, 32'd0);
    send_case(OP_SRA, 32'h8000_0000, 32'd1);
    send_case(OP_SRA, 32'hF000_0000, 32'd4);
    send_case(OP_SRA, 32'h7FFF_FFFF, 32'd4);
    send_case(OP_SRA, 32'h8000_0000, 32'd31);
  endtask
endclass
