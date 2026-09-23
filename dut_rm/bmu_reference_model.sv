class bmu_reference_model extends uvm_object;
  `uvm_object_utils(bmu_reference_model)

  logic [31:0] expected_result_ff;

  function new(string name = "bmu_reference_model");
    super.new(name);
    expected_result_ff = '0;
  endfunction

  function void reset_model();
    expected_result_ff = '0;
  endfunction

  function automatic logic [5:0] count_trailing_zeros(input logic [31:0] value);
    logic found;
    integer i;
    begin
      count_trailing_zeros = 0;
      found = 1'b0;
      for (i = 0; i < 32; i++) begin
        if (!found) begin
          if (value[i] == 1'b0)
            count_trailing_zeros = count_trailing_zeros + 1'b1;
          else
            found = 1'b1;
        end
      end
    end
  endfunction

  function automatic logic [5:0] population_count(input logic [31:0] value);
    integer i;
    begin
      population_count = 0;
      for (i = 0; i < 32; i++)
        population_count = population_count + value[i];
    end
  endfunction

  function automatic logic [31:0] rotate_right32(input logic [31:0] value,
                                                  input logic [4:0] amount);
    begin
      if (amount == 0)
        rotate_right32 = value;
      else
        rotate_right32 = (value >> amount) | (value << (32 - amount));
    end
  endfunction

  function automatic logic calculate_error(input bmu_transaction tr);
    begin
      if (!tr.rst_l)
        calculate_error = 1'b0;
      else if (tr.csr_ren_in && (tr.ap != '0))
        calculate_error = 1'b1;
      else if (!tr.ap.zba && (tr.ap.sh1add || tr.ap.sh2add || tr.ap.sh3add))
        calculate_error = 1'b1;
      else if (tr.ap.zba && (tr.ap.add || tr.ap.sub))
        calculate_error = 1'b1;
      else
        calculate_error = 1'b0;
    end
  endfunction

  function automatic logic [31:0] calculate_comb_result(input bmu_transaction tr);
    logic [4:0] shamt;
    begin
      shamt = tr.b_in[4:0];

      case (tr.op)
        OP_IDLE:          calculate_comb_result = 32'h0000_0000;

        OP_AND:           calculate_comb_result = tr.a_in & tr.b_in;
        OP_ANDN:          calculate_comb_result = tr.a_in & ~tr.b_in;
        OP_OR:            calculate_comb_result = tr.a_in | tr.b_in;
        OP_ORN:           calculate_comb_result = tr.a_in | ~tr.b_in;
        OP_XOR:           calculate_comb_result = tr.a_in ^ tr.b_in;
        OP_XNOR:          calculate_comb_result = tr.a_in ^ ~tr.b_in;

        OP_SRL:           calculate_comb_result = $unsigned(tr.a_in) >> shamt;
        OP_SRA:           calculate_comb_result = $signed(tr.a_in) >>> shamt;
        OP_ROR:           calculate_comb_result = rotate_right32(tr.a_in, shamt);
        OP_BINV:          calculate_comb_result = tr.a_in ^ (32'h0000_0001 << shamt);

        OP_SH2ADD:        calculate_comb_result = (tr.a_in << 2) + tr.b_in;
        OP_SUB:           calculate_comb_result = tr.a_in - tr.b_in;

        OP_SLT: begin
          calculate_comb_result = 32'h0;
          calculate_comb_result[0] = ($signed(tr.a_in) < $signed(tr.b_in));
        end
        OP_SLTU: begin
          calculate_comb_result = 32'h0;
          calculate_comb_result[0] = ($unsigned(tr.a_in) < $unsigned(tr.b_in));
        end

        OP_CTZ:           calculate_comb_result = {26'b0, count_trailing_zeros(tr.a_in)};
        OP_CPOP:          calculate_comb_result = {26'b0, population_count(tr.a_in)};
        OP_SEXT_B:        calculate_comb_result = {{24{tr.a_in[7]}}, tr.a_in[7:0]};

        OP_MAX: begin
          if ($signed(tr.a_in) >= $signed(tr.b_in))
            calculate_comb_result = tr.a_in;
          else
            calculate_comb_result = tr.b_in;
        end


        OP_PACK:          calculate_comb_result = {tr.b_in[15:0], tr.a_in[15:0]};


        OP_GREV: begin
          if (tr.b_in[4:0] == 5'b11000)
            calculate_comb_result = {tr.a_in[7:0], tr.a_in[15:8],
                                     tr.a_in[23:16], tr.a_in[31:24]};
          else
            calculate_comb_result = 32'h0000_0000;
        end

        OP_CSR_READ:      calculate_comb_result = tr.csr_rddata_in;


        OP_CSR_WRITE:     calculate_comb_result = tr.a_in;
        OP_CSR_WRITE_IMM: calculate_comb_result = tr.b_in;


        OP_INVALID:       calculate_comb_result = 32'h0000_0000;

        default:          calculate_comb_result = 32'h0000_0000;
      endcase
    end
  endfunction

  function void predict(input  bmu_transaction tr,
                        output logic [31:0] expected_result,
                        output logic        expected_error);
    logic [31:0] comb_result;
    begin
      expected_error = calculate_error(tr);

      if (!tr.rst_l) begin
        expected_result_ff = 32'h0000_0000;
      end
      else if (tr.valid_in) begin
        comb_result = calculate_comb_result(tr);
        expected_result_ff = expected_error ? 32'h0000_0000 : comb_result;
      end

      expected_result = expected_result_ff;
    end
  endfunction

endclass
