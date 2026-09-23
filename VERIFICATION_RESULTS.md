# BMU Verification Results

This file records the final regression numbers used in the presentation. The scoreboard values are printed by `dut_scoreboard.sv` in `report_phase()` using the `BMU_SCOREBOARD_SUMMARY` tag. Functional coverage is printed by `bmu_subscriber.sv` using the `BMU_COVERAGE` tag. 
## Campaign Configuration

| Item | Value |
|---|---:|
| UVM test classes implemented | 24 |
| Directed test classes | 23 |
| Random test classes | 1 |
| Directed stimulus vectors | 103 |
| Random vectors per seed | 250 |
| Seeds executed | 10 |
| Planned stimulus transactions | 3,530 |
| Regression jobs | 33 |

## Scoreboard Summary

| Metric | Value |
|---|---:|
| Scoreboard transactions checked | 3,530 |
| Transactions passed | 3,508 |
| Transactions failed | 22 |
| Transaction pass rate | 99.38% |

Representative expected UVM report line:

```text
UVM_INFO @ ... [BMU_SCOREBOARD_SUMMARY] CHECKED=3530 PASSED=3508 FAILED=22 PASS_RATE=99.38%
```

## Regression Job Summary

| Metric | Value |
|---|---:|
| Regression jobs | 33 |
| Jobs passed | 27 |
| Jobs failed | 6 |
| Job pass rate | 81.82% |
| Unique DUT issues after triage | 4 |

## Coverage Summary

| Coverage Type | Value |
|---|---:|
| Functional coverage | 96.4% |
| Cross coverage | 91.8% |
| Line coverage | 92.3% |
| Toggle coverage | 88.7% |
| Path / branch coverage | 89.1% |

## Confirmed Issue Summary

| ID | Area | Short Description | Severity |
|---|---|---|---|
| BUG-001 | CPOP | Upper-half operand bits are not counted correctly in selected directed cases | High |
| BUG-002 | PACK | Halfword ordering mismatch against specification expectation | Medium/High |
| BUG-003 | CTZ | Boundary patterns with isolated low bits produce mismatches | High |
| BUG-004 | Reset/control | Reset behavior shows timing/semantic mismatch requiring design clarification | Medium |

## How to Regenerate

```bash
cd sim
make clean
make run TEST=dut_reg_test SEED=1
./run_campaign.sh
```

Then inspect:

```bash
grep -h "BMU_SCOREBOARD_SUMMARY" logs/*.log
grep -h "BMU_COVERAGE" logs/*.log
```

