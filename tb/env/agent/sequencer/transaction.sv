class bmu_transaction extends uvm_sequence_item;
  rand logic signed [31:0] a_in;
  rand logic        [31:0] b_in;
  rand logic        [31:0] csr_rddata_in;

  logic                    scan_mode;
  logic                    valid_in;
  logic                    csr_ren_in;
  rtl_alu_pkt_t            ap;

  logic                    rst_l;
  logic             [31:0] result_ff;
  logic                    error;

  bmu_op_e                 op;

  `uvm_object_utils(bmu_transaction)

  function new(string name = "bmu_transaction");
    super.new(name);
    scan_mode     = 1'b0;
    valid_in      = 1'b1;
    csr_ren_in    = 1'b0;
    csr_rddata_in = '0;
    a_in          = '0;
    b_in          = '0;
    ap            = '0;
    rst_l         = 1'b1;
    result_ff     = '0;
    error         = 1'b0;
    op            = OP_IDLE;
  endfunction


  function void set_operation(bmu_op_e new_op);
    ap         = '0;
    csr_ren_in = 1'b0;
    op         = new_op;

    case (new_op)
      OP_IDLE: begin end
      OP_AND:  ap.land = 1'b1;
      OP_ANDN: begin ap.land = 1'b1; ap.zbb = 1'b1; end
      OP_OR:   ap.lor = 1'b1;
      OP_ORN:  begin ap.lor = 1'b1; ap.zbb = 1'b1; end
      OP_XOR:  ap.lxor = 1'b1;
      OP_XNOR: begin ap.lxor = 1'b1; ap.zbb = 1'b1; end

      OP_SRL:  ap.srl = 1'b1;
      OP_SRA:  ap.sra = 1'b1;
      OP_ROR:  ap.ror = 1'b1;
      OP_BINV: ap.binv = 1'b1;

      OP_SH2ADD: begin ap.sh2add = 1'b1; ap.zba = 1'b1; end
      OP_SUB:    ap.sub = 1'b1;

      OP_SLT:  begin ap.slt = 1'b1; ap.sub = 1'b1; ap.unsign = 1'b0; end
      OP_SLTU: begin ap.slt = 1'b1; ap.sub = 1'b1; ap.unsign = 1'b1; end

      OP_CTZ:    ap.ctz = 1'b1;
      OP_CPOP:   ap.cpop = 1'b1;
      OP_SEXT_B: ap.siext_b = 1'b1;
      OP_MAX:    begin ap.max = 1'b1; ap.sub = 1'b1; ap.unsign = 1'b0; end
      OP_PACK:   ap.pack = 1'b1;
      OP_GREV:   ap.grev = 1'b1;

      OP_CSR_READ: begin
        csr_ren_in = 1'b1;
      end
      OP_CSR_WRITE: begin
        ap.csr_write = 1'b1;
        ap.csr_imm   = 1'b0;
      end
      OP_CSR_WRITE_IMM: begin
        ap.csr_write = 1'b1;
        ap.csr_imm   = 1'b1;
      end

      OP_INVALID: begin end
      default:    begin end
    endcase
  endfunction


  function int primary_control_count();
    int count;
    count = 0;
    count += ap.land;
    count += ap.lor;
    count += ap.lxor;
    count += ap.sll;
    count += ap.srl;
    count += ap.sra;
    count += ap.clz;
    count += ap.ctz;
    count += ap.cpop;
    count += ap.siext_b;
    count += ap.siext_h;
    count += ap.min;
    count += ap.max;
    count += ap.pack;
    count += ap.packu;
    count += ap.packh;
    count += ap.rol;
    count += ap.ror;
    count += ap.grev;
    count += ap.gorc;
    count += ap.bset;
    count += ap.bclr;
    count += ap.binv;
    count += ap.bext;
    count += ap.sh1add;
    count += ap.sh2add;
    count += ap.sh3add;
    count += ap.add;
    count += ap.sub;
    count += ap.slt;
    count += ap.csr_write;

    if (ap.slt && ap.sub) count--;
    if ((ap.min || ap.max) && ap.sub) count--;
    return count;
  endfunction

  function void decode_operation();
    if (csr_ren_in && (ap != '0)) begin
      op = OP_INVALID;
      return;
    end

    if (primary_control_count() > 1) begin
      op = OP_INVALID;
      return;
    end

    if (csr_ren_in && (ap == '0)) begin
      op = OP_CSR_READ;
    end
    else if (ap.csr_write) begin
      op = ap.csr_imm ? OP_CSR_WRITE_IMM : OP_CSR_WRITE;
    end
    else if (ap.slt) begin
      op = ap.unsign ? OP_SLTU : OP_SLT;
    end
    else if (ap.max) begin
      op = OP_MAX;
    end
    else if (ap.sh2add) begin
      op = OP_SH2ADD;
    end
    else if (ap.land) begin
      op = ap.zbb ? OP_ANDN : OP_AND;
    end
    else if (ap.lor) begin
      op = ap.zbb ? OP_ORN : OP_OR;
    end
    else if (ap.lxor) begin
      op = ap.zbb ? OP_XNOR : OP_XOR;
    end
    else if (ap.srl) begin
      op = OP_SRL;
    end
    else if (ap.sra) begin
      op = OP_SRA;
    end
    else if (ap.ror) begin
      op = OP_ROR;
    end
    else if (ap.binv) begin
      op = OP_BINV;
    end
    else if (ap.sub) begin
      op = OP_SUB;
    end
    else if (ap.ctz) begin
      op = OP_CTZ;
    end
    else if (ap.cpop) begin
      op = OP_CPOP;
    end
    else if (ap.siext_b) begin
      op = OP_SEXT_B;
    end
    else if (ap.pack) begin
      op = OP_PACK;
    end
    else if (ap.grev) begin
      op = OP_GREV;
    end
    else if (ap == '0) begin
      op = OP_IDLE;
    end
    else begin
      op = OP_INVALID;
    end
  endfunction

  function string convert2string();
    return $sformatf(
      "op=%s valid=%0b a=0x%08h b=0x%08h csr_ren=%0b csr_data=0x%08h ap=%p result=0x%08h error=%0b",
      bmu_op_name(op), valid_in, a_in, b_in, csr_ren_in, csr_rddata_in,
      ap, result_ff, error
    );
  endfunction

endclass
