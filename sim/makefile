XRUN ?= xrun
TEST ?= dut_reg_test
SEED ?= 1
VERBOSITY ?= UVM_MEDIUM

COMMON = -64bit -sv -uvm -f filelist.f \
         -access +rwc +UVM_TESTNAME=$(TEST) +UVM_VERBOSITY=$(VERBOSITY) \
         -svseed $(SEED)

COV = -coverage all -covoverwrite -covtest $(TEST)

TESTS = \
 bmu_and_test bmu_andn_test bmu_or_test bmu_orn_test bmu_xor_test bmu_xnor_test \
 bmu_srl_test bmu_sra_test bmu_ror_test bmu_binv_test bmu_sh2add_test bmu_sub_test \
 bmu_slt_test bmu_sltu_test bmu_ctz_test bmu_cpop_test bmu_sext_b_test bmu_max_test \
 bmu_pack_test bmu_grev_test bmu_csr_test bmu_negative_test bmu_valid_hold_test \
 bmu_random_test

.PHONY: run run_nocov gui regression clean help

help:
	@echo "make run TEST=bmu_or_test SEED=1"
	@echo "make run_nocov TEST=bmu_cpop_test"
	@echo "make gui TEST=dut_reg_test"
	@echo "make regression"
	@echo "make clean"

run:
	@mkdir -p logs
	$(XRUN) $(COMMON) $(COV) -l logs/$(TEST)_seed$(SEED).log

run_nocov:
	@mkdir -p logs
	$(XRUN) $(COMMON) -l logs/$(TEST)_seed$(SEED).log

gui:
	@mkdir -p logs
	$(XRUN) $(COMMON) $(COV) -gui -input xrun.tcl -l logs/$(TEST)_gui.log

regression:
	@mkdir -p logs
	@set -e; \
	for t in $(TESTS); do \
	  echo "============================================================"; \
	  echo "Running $$t"; \
	  echo "============================================================"; \
	  $(XRUN) -64bit -sv -uvm -f filelist.f \
	    -access +rwc +UVM_TESTNAME=$$t +UVM_VERBOSITY=$(VERBOSITY) \
	    -svseed $(SEED) -coverage all -covoverwrite -covtest $$t \
	    -l logs/$${t}_seed$(SEED).log || true; \
	done
	@echo "Regression complete. Inspect logs/*.log and the Cadence coverage database."

clean:
	rm -rf xcelium.d INCA_libs xrun.* *.key *.log logs cov_work waves.shm .simvision
