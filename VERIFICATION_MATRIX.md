# Verification Matrix

| Area | Operation/Test | Directed intent | Key corner cases |
|---|---|---|---|
| Logical | `bmu_and_test` | Supplemental AND smoke | 0, all-1, masks |
| Logical | `bmu_andn_test` | Supplemental ANDN smoke | inverted B masks |
| Logical | `bmu_or_test` | Standard OR | zero, all-1, complementary patterns |
| Logical | `bmu_orn_test` | OR with inverted B | zero/all-1/patterns |
| Logical | `bmu_xor_test` | Standard XOR | equal, complementary patterns |
| Logical | `bmu_xnor_test` | XOR with inverted B | equal, complementary patterns |
| Shift/mask | `bmu_srl_test` | Logical right shift | shift 0,1,16,31; MSB set |
| Shift/mask | `bmu_sra_test` | Arithmetic right shift | positive/negative, shift 0/31 |
| Shift/mask | `bmu_ror_test` | Rotate right | rotate 0,1,4,16,31 |
| Shift/mask | `bmu_binv_test` | Invert indexed bit | index 0,7,15,31 |
| Zba | `bmu_sh2add_test` | `(a<<2)+b` | simple, overflow/wrap |
| Arithmetic | `bmu_sub_test` | `a-b` | positive, negative/wrap, equal |
| Compare | `bmu_slt_test` | Signed less-than | negative/positive, equal, extremes |
| Compare | `bmu_sltu_test` | Unsigned less-than | `0xffffffff`, MSB boundary, equal |
| Bit manipulation | `bmu_ctz_test` | Count trailing zeros | 0, bit0, bit3, bit16, bit31 |
| Bit manipulation | `bmu_cpop_test` | Population count | 0, 32 ones, lower/upper half, MSB-only |
| Bit manipulation | `bmu_sext_b_test` | Sign-extend low byte | 0x7f, 0x80, 0xff |
| Bit manipulation | `bmu_max_test` | Signed maximum | a<b, a>b, negative/positive, both negative |
| Packing | `bmu_pack_test` | Pack low halves | exact specification example + patterns |
| Permutation | `bmu_grev_test` | REV8 subset | exact spec example; invalid b=8 |
| CSR | `bmu_csr_test` | Read/write | read bypass, immediate/non-immediate write |
| Negative | `bmu_negative_test` | Error/guard behavior | CSR conflict, missing Zba, Zba+SUB/ADD, conflicting ops |
| Pipeline | `bmu_valid_hold_test` | `valid_in` behavior | valid result then invalid cycles then valid resume |
| Random | `bmu_random_test` | Random exploration | 250 transactions/seed across plan operations |

