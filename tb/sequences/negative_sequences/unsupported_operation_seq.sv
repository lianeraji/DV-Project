class unsupported_operation_seq extends bmu_base_sequence;
  `uvm_object_utils(unsupported_operation_seq)
  function new(string name = "unsupported_operation_seq"); super.new(name); endfunction

  task body();
    rtl_alu_pkt_t controls;


    controls.lor = 1'b1;
    send_raw(32'h0F0F_0000, 32'h00FF_00FF, controls,
             1'b1, 32'hCAFE_BABE, 1'b1);


    controls = '0;
    controls.sh2add = 1'b1;
    send_raw(32'd4, 32'd7, controls, 1'b0, '0, 1'b1);

   
    controls = '0;
    controls.sub = 1'b1;
    controls.zba = 1'b1;
    send_raw(32'd20, 32'd7, controls, 1'b0, '0, 1'b1);

   
    controls = '0;
    controls.lor  = 1'b1;
    controls.lxor = 1'b1;
    send_raw(32'h0F0F_0000, 32'h00FF_00FF, controls,
             1'b0, '0, 1'b1);


    controls = '0;
    controls.add = 1'b1;
    controls.zba = 1'b1;
    send_raw(32'd2, 32'd3, controls, 1'b0, '0, 1'b1);
  endtask
endclass
