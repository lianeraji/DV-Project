# BMU DV Turn-In Package

This package contains the BMU RTL/support files, the UVM verification environment, regression scripts, documentation, and presentation.

## 1) Upload to Linux/Cadence server

```bash
unzip BMU_DV_TurnIn_Code.zip
cd BMU_DV_TurnIn_Code/sim
```

## 2) Confirm Xcelium is available

```bash
which xrun
```

If `xrun` is not found, load the Cadence environment first.

## 3) First smoke test

```bash
make clean
make run_nocov TEST=bmu_or_test
```

## 4) Run one full `dut_reg_test` with coverage

```bash
make run TEST=dut_reg_test SEED=1
```

## 5) Run planned multi-seed campaign

```bash
chmod +x run_campaign.sh
./run_campaign.sh
python3 summarize_results.py logs
```

Generated summary files:

```text
bmu_results_summary.md
bmu_results_summary.csv
```

## 6) Code-derived planned metrics

```bash
python3 count_stimulus.py ..
```

Current expected planned metrics from the implemented sequence files:

```text
Directed vectors: 103
Random vectors/seed: 250
Full dut_reg_test vectors/seed: 353
10-seed campaign vectors: 3,530
```

