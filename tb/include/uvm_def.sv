package uvm_def;
  import rtl_pkg::*;

  typedef enum int unsigned {
    OP_IDLE,
    OP_AND,
    OP_ANDN,
    OP_OR,
    OP_ORN,
    OP_XOR,
    OP_XNOR,
    OP_SRL,
    OP_SRA,
    OP_ROR,
    OP_BINV,
    OP_SH2ADD,
    OP_SUB,
    OP_SLT,
    OP_SLTU,
    OP_CTZ,
    OP_CPOP,
    OP_SEXT_B,
    OP_MAX,
    OP_PACK,
    OP_GREV,
    OP_CSR_READ,
    OP_CSR_WRITE,
    OP_CSR_WRITE_IMM,
    OP_INVALID
  } bmu_op_e;

  function automatic string bmu_op_name(bmu_op_e op);
    case (op)
      OP_IDLE:          return "IDLE";
      OP_AND:           return "AND";
      OP_ANDN:          return "ANDN";
      OP_OR:            return "OR";
      OP_ORN:           return "ORN";
      OP_XOR:           return "XOR";
      OP_XNOR:          return "XNOR";
      OP_SRL:           return "SRL";
      OP_SRA:           return "SRA";
      OP_ROR:           return "ROR";
      OP_BINV:          return "BINV";
      OP_SH2ADD:        return "SH2ADD";
      OP_SUB:           return "SUB";
      OP_SLT:           return "SLT";
      OP_SLTU:          return "SLTU";
      OP_CTZ:           return "CTZ";
      OP_CPOP:          return "CPOP";
      OP_SEXT_B:        return "SEXT.B";
      OP_MAX:           return "MAX";
      OP_PACK:          return "PACK";
      OP_GREV:          return "GREV/REV8";
      OP_CSR_READ:      return "CSR_READ";
      OP_CSR_WRITE:     return "CSR_WRITE";
      OP_CSR_WRITE_IMM: return "CSR_WRITE_IMM";
      OP_INVALID:       return "INVALID";
      default:          return "UNKNOWN";
    endcase
  endfunction

endpackage
