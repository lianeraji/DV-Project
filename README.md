# BMU UVM Verification Project

This repository implements the UVM verification environment requested for the **Bit Manipulation Unit (BMU)** final project.  The supplied RTL is kept unchanged; the verification environment independently predicts expected behavior from the supplied BMU Specification v1.1 and compares it with the DUT.

## 1. What is being verified?

The DUT is `rtl/Bit_Manipulation_Unit.sv`.  The submitted verification plan explicitly targets:

- Standard OR and inverted OR (ORN)
- Standard XOR and inverted XOR (XNOR)
- SRL, SRA, ROR, BINV, SH2ADD
- SUB
- Signed SLT and unsigned SLTU
- CTZ, CPOP, SEXT.B, MAX, PACK, GREV/REV8
- CSR operations
- Unsupported/invalid control cases
- Random cases

The provided project skeleton also contains an AND sequence directory, so AND and ANDN directed smoke tests are included as supplemental checks.

## 2. UVM data flow

```text
Test -> Sequence -> Sequencer -> Driver -> Interface -> DUT
                                                |
DUT -> Interface -> Monitor --------------------+
                    |             |
                    v             v
                Scoreboard    Subscriber
                (checking)    (coverage)
```

The scoreboard uses `dut_rm/bmu_reference_model.sv`; it does **not** copy the DUT equations.  This is intentional so that an RTL defect does not get duplicated in the checker.

## 3. Project layout

```text
Bit_Manipulation_complete/
├── rtl/                      
│   └── library/rtl_param.vh   
├── dut_rm/
│   └── bmu_reference_model.sv
├── tb/
│   ├── top_tb.sv
│   ├── include/uvm_def.sv
│   ├── interface/Bit_Manipulation_intf.sv
│   ├── packages/dut_test_package.sv
│   ├── env/
│   │   ├── dut_env.sv
│   │   ├── agent/
│   │   └── scoreboard/
│   ├── subscriber/bmu_subscriber.sv
│   ├── sequences/
│   └── tests/
├── sim/
│   ├── filelist.f
│   ├── makefile
│   └── xrun.tcl

```

>Is anyone reading this or am I just typing for nothing? Hi Salam and Rami and Naser?

## 4. Running on the Cadence server

The makefile is written for **Cadence Xcelium (`xrun`)**.

```bash
cd sim
make run TEST=bmu_or_test
```

Run a different test:

```bash
make run TEST=bmu_cpop_test SEED=7
```

Run the default all-in-one UVM regression test:

```bash
make run TEST=dut_reg_test
```

Run the 10-seed campaign 

```bash
chmod +x run_campaign.sh
./run_campaign.sh
```

The scoreboard and subscriber print the final UVM summaries directly in the Xcelium logs:

```text
[BMU_SCOREBOARD_SUMMARY] CHECKED=<n> PASSED=<n> FAILED=<n> PASS_RATE=<n>%
[BMU_COVERAGE] FUNCTIONAL_COVERAGE=<n>%
```

Run the individual-test regression loop:

```bash
make regression
```

Open a debug-oriented run:

```bash
make gui TEST=bmu_cpop_test
```


## 5. Main tests

- `bmu_or_test`, `bmu_orn_test`
- `bmu_xor_test`, `bmu_xnor_test`
- `bmu_srl_test`, `bmu_sra_test`, `bmu_ror_test`, `bmu_binv_test`, `bmu_sh2add_test`
- `bmu_sub_test`
- `bmu_slt_test`, `bmu_sltu_test`
- `bmu_ctz_test`, `bmu_cpop_test`, `bmu_sext_b_test`, `bmu_max_test`, `bmu_pack_test`, `bmu_grev_test`
- `bmu_csr_test`
- `bmu_negative_test`
- `bmu_valid_hold_test`
- `bmu_random_test`
- `dut_reg_test` runs the complete directed set and then the random phase

## 6. Coverage

`tb/subscriber/bmu_subscriber.sv` implements functional coverage for:

- Operation type
- Valid/invalid cycles
- Error/no-error
- Important operand patterns (zero, all ones, sign boundaries, LSB-only)
- Shift/bit index values, including 0 and 31
- Operation x error
- Operation x valid





