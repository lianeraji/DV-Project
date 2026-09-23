class srl_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(srl_operation_seq)
  function new(string name = "srl_operation_seq"); super.new(name); endfunction
  task body();
    send_case(OP_SRL, 32'h8000_0000, 32'd0);
    send_case(OP_SRL, 32'h8000_0000, 32'd1);
    send_case(OP_SRL, 32'hFFFF_FFFF, 32'd16);
    send_case(OP_SRL, 32'h8000_0000, 32'd31);
    send_case(OP_SRL, 32'h1234_5678, 32'd4);
  endtask
endclass
