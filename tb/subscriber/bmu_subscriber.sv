class bmu_subscriber extends uvm_subscriber #(bmu_transaction);
  `uvm_component_utils(bmu_subscriber)

  real coverage_value;

  covergroup bmuCoverage with function sample(
      bmu_op_e op,
      logic [31:0] a,
      logic [31:0] b,
      logic valid,
      logic err
  );
    option.per_instance = 1;

    cp_op: coverpoint op {
      ignore_bins idle = {OP_IDLE};
      bins and_op       = {OP_AND};
      bins andn_op      = {OP_ANDN};
      bins or_op        = {OP_OR};
      bins orn_op       = {OP_ORN};
      bins xor_op       = {OP_XOR};
      bins xnor_op      = {OP_XNOR};
      bins srl_op       = {OP_SRL};
      bins sra_op       = {OP_SRA};
      bins ror_op       = {OP_ROR};
      bins binv_op      = {OP_BINV};
      bins sh2add_op    = {OP_SH2ADD};
      bins sub_op       = {OP_SUB};
      bins slt_op       = {OP_SLT};
      bins sltu_op      = {OP_SLTU};
      bins ctz_op       = {OP_CTZ};
      bins cpop_op      = {OP_CPOP};
      bins sext_b_op    = {OP_SEXT_B};
      bins max_op       = {OP_MAX};
      bins pack_op      = {OP_PACK};
      bins grev_op      = {OP_GREV};
      bins csr_read     = {OP_CSR_READ};
      bins csr_write    = {OP_CSR_WRITE};
      bins csr_write_i  = {OP_CSR_WRITE_IMM};
      bins invalid_op   = {OP_INVALID};
    }

    cp_valid: coverpoint valid {
      bins invalid_cycle = {0};
      bins valid_cycle   = {1};
    }

    cp_error: coverpoint err {
      bins no_error = {0};
      bins error    = {1};
    }

    cp_a_special: coverpoint a {
      bins zero     = {32'h0000_0000};
      bins ones     = {32'hFFFF_FFFF};
      bins min_int  = {32'h8000_0000};
      bins max_int  = {32'h7FFF_FFFF};
      bins lsb_only = {32'h0000_0001};
      bins other    = default;
    }

    cp_shamt: coverpoint b[4:0] iff
      (op inside {OP_SRL, OP_SRA, OP_ROR, OP_BINV, OP_GREV}) {
      bins zero = {0};
      bins one  = {1};
      bins mid[] = {[2:30]};
      bins max  = {31};
    }

    op_x_error: cross cp_op, cp_error;
    op_x_valid: cross cp_op, cp_valid;
  endgroup

  function new(string name = "bmu_subscriber", uvm_component parent = null);
    super.new(name, parent);
    bmuCoverage = new();
  endfunction

  function void write(bmu_transaction tr);
    bmuCoverage.sample(tr.op, tr.a_in, tr.b_in, tr.valid_in, tr.error);
  endfunction

  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    coverage_value = bmuCoverage.get_inst_coverage();
    `uvm_info("BMU_COVERAGE",
              $sformatf("FUNCTIONAL_COVERAGE=%0.2f%%", coverage_value),
              UVM_NONE)
  endfunction

endclass
