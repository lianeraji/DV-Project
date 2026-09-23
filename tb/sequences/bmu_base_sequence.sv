class bmu_base_sequence extends uvm_sequence #(bmu_transaction);
  `uvm_object_utils(bmu_base_sequence)

  int unsigned item_no;

  function new(string name = "bmu_base_sequence");
    super.new(name);
    item_no = 0;
  endfunction

  task automatic send_case(
      input bmu_op_e op,
      input logic [31:0] a,
      input logic [31:0] b,
      input logic valid = 1'b1,
      input logic [31:0] csr_data = 32'h0000_0000
  );
    bmu_transaction req;
    req = bmu_transaction::type_id::create($sformatf("req_%0d", item_no++));
    start_item(req);
    req.scan_mode     = 1'b0;
    req.valid_in      = valid;
    req.a_in          = a;
    req.b_in          = b;
    req.csr_rddata_in = csr_data;
    req.set_operation(op);
    finish_item(req);
  endtask

  task automatic send_raw(
      input logic [31:0] a,
      input logic [31:0] b,
      input rtl_alu_pkt_t controls,
      input logic csr_ren = 1'b0,
      input logic [31:0] csr_data = 32'h0000_0000,
      input logic valid = 1'b1
  );
    bmu_transaction req;
    req = bmu_transaction::type_id::create($sformatf("raw_req_%0d", item_no++));
    start_item(req);
    req.scan_mode     = 1'b0;
    req.valid_in      = valid;
    req.a_in          = a;
    req.b_in          = b;
    req.ap            = controls;
    req.csr_ren_in    = csr_ren;
    req.csr_rddata_in = csr_data;
    req.decode_operation();
    finish_item(req);
  endtask

endclass
