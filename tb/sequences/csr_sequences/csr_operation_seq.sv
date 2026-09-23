class csr_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(csr_operation_seq)
  function new(string name = "csr_operation_seq"); super.new(name); endfunction
  task body();

    send_case(OP_CSR_READ, 32'h0, 32'h0, 1'b1, 32'hDEAD_BEEF);
    send_case(OP_CSR_READ, 32'h0, 32'h0, 1'b1, 32'h1234_5678);


    send_case(OP_CSR_WRITE,     32'h1122_3344, 32'hAABB_CCDD);
    send_case(OP_CSR_WRITE_IMM, 32'h1122_3344, 32'hAABB_CCDD);
  endtask
endclass
