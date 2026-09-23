#!/usr/bin/env bash
set -euo pipefail

SEEDS="${SEEDS:-1 7 11 21 42 77 101 256 1024 2026}"
TEST="${TEST:-dut_reg_test}"
VERBOSITY="${VERBOSITY:-UVM_LOW}"
XRUN="${XRUN:-xrun}"

mkdir -p logs

printf "BMU UVM campaign\n"
printf "TEST=%s\n" "$TEST"
printf "SEEDS=%s\n" "$SEEDS"
printf "XRUN=%s\n" "$XRUN"

for seed in $SEEDS; do
  echo "============================================================"
  echo "Running $TEST seed $seed"
  echo "============================================================"
  $XRUN -64bit -sv -uvm -f filelist.f \
    -access +rwc +UVM_TESTNAME=$TEST +UVM_VERBOSITY=$VERBOSITY \
    -svseed $seed -coverage all -covoverwrite -covtest ${TEST}_seed${seed} \
    -l logs/${TEST}_seed${seed}.log || true

done

echo "============================================================"
echo "Campaign log summary"
echo "============================================================"
grep -h "BMU_SCOREBOARD_SUMMARY" logs/${TEST}_seed*.log || true
grep -h "BMU_COVERAGE" logs/${TEST}_seed*.log || true
grep -h "TEST_STATUS" logs/${TEST}_seed*.log || true

echo "Campaign complete. Use Cadence IMC to inspect cov_work for line/toggle/path coverage."
