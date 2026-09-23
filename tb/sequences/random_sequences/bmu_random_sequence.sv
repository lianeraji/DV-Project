class bmu_random_sequence extends bmu_base_sequence;
  `uvm_object_utils(bmu_random_sequence)

  int unsigned num_items = 250;

  function new(string name = "bmu_random_sequence");
    super.new(name);
  endfunction

  task body();
    bmu_transaction req;
    bmu_op_e selected_op;
    int unsigned pick;

    repeat (num_items) begin
      req = bmu_transaction::type_id::create($sformatf("random_req_%0d", item_no++));
      start_item(req);

      if (!req.randomize())
        `uvm_fatal("RAND_FAIL", "Randomization failed in bmu_random_sequence")

      req.scan_mode = 1'b0;
      req.valid_in  = 1'b1;


      pick = $urandom_range(0, 18);
      case (pick)
        0:  selected_op = OP_OR;
        1:  selected_op = OP_ORN;
        2:  selected_op = OP_XOR;
        3:  selected_op = OP_XNOR;
        4:  selected_op = OP_SRL;
        5:  selected_op = OP_SRA;
        6:  selected_op = OP_ROR;
        7:  selected_op = OP_BINV;
        8:  selected_op = OP_SH2ADD;
        9:  selected_op = OP_SUB;
        10: selected_op = OP_SLT;
        11: selected_op = OP_SLTU;
        12: selected_op = OP_CTZ;
        13: selected_op = OP_CPOP;
        14: selected_op = OP_SEXT_B;
        15: selected_op = OP_MAX;
        16: selected_op = OP_PACK;
        17: selected_op = OP_GREV;
        default: selected_op = OP_CSR_READ;
      endcase

      req.set_operation(selected_op);

      if (selected_op == OP_GREV)
        req.b_in[4:0] = 5'b11000;


      if ($urandom_range(0, 15) == 0)
        req.valid_in = 1'b0;

      finish_item(req);
    end
  endtask
endclass
