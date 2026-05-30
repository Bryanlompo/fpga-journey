# Introduction to cocotb — Sequential Divider Verification

**Repository:** github.com/Bryanlompo/fpga-journey
**Phase:** 03 — Memory & Arithmetic
**Path:** phase-03-memoire/cocotb-intro/

---

## Description

First cocotb testbench replacing a VHDL testbench with a Python-based
verification flow. The design under test is the sequential 8-bit divider
from the previous project. The testbench drives inputs, waits for the FSM
to complete, and asserts results automatically across 5 test cases using
Python async coroutines and cocotb triggers.

---

## Interface (DUT — diviseur_8bits)

| Signal    | Direction | Width  | Description                        |
|-----------|-----------|--------|------------------------------------|
| CLK       | in        | 1-bit  | System clock                       |
| RST       | in        | 1-bit  | Synchronous reset, active high     |
| Start     | in        | 1-bit  | 1-cycle pulse to launch computation|
| Dividende | in        | 8-bit  | Dividend operand                   |
| Diviseur  | in        | 8-bit  | Divisor operand                    |
| Resultat  | out       | 8-bit  | Quotient, stable in DONE state     |

---

## How It Works

The testbench is structured around three async coroutines:

**`clock_gen(dut)`** — runs in background via `cocotb.start_soon`,
toggles CLK every 5ns to produce a 10ns clock period.

**`reset(dut)`** — asserts RST for 2 rising edges then releases,
ensuring the FSM starts cleanly in IDLE state.

**`run_division(dut, Dividende, Diviseur)`** — sets operands, pulses
Start for one cycle, waits 15 rising edges for the FSM to reach DONE,
and returns the Resultat value.

**`test_diviseur(dut)`** — the main cocotb test, iterates over all
test cases and asserts each result automatically.

---

## Key Concepts Demonstrated

- **cocotb async coroutines** — `async/await` for hardware-aware
  Python testbenches that synchronize with simulation time
- **RisingEdge trigger** — synchronize testbench actions to clock
  edges, equivalent to `wait until rising_edge(CLK)` in VHDL
- **cocotb.start_soon** — launch clock generator as background task,
  parallel to the main test coroutine
- **assert with f-string** — automatic pass/fail reporting with
  descriptive error messages on failure
- **Python loop over test vectors** — concise multi-case testing
  without repeating code, not possible in VHDL without generate
- **Virtual environment** — isolated Python environment to avoid
  system-wide package conflicts with GHDL

---

## Problems Encountered and Solved

| Problem | Root Cause | Fix Applied |
|---------|-----------|-------------|
| `ModuleNotFoundError: No module named 'pygpi'` | GHDL using system Python, cocotb installed elsewhere | Created Python venv, installed cocotb inside it |
| `MODULE is deprecated` warning | Old Makefile variable name | Noted — functional, can update to `COCOTB_TEST_MODULES` |

---

## Simulation Results

Tool: GitHub Codespaces — GHDL 5.1.1 + cocotb 1.8.1

| Dividende | Diviseur | Expected | Result | Status |
|-----------|----------|----------|--------|--------|
| 37        | 5        | 7        | 7      | ✓      |
| 20        | 4        | 5        | 5      | ✓      |
| 255       | 3        | 85       | 85     | ✓      |
| 0         | 5        | 0        | 0      | ✓      |
| 7         | 9        | 0        | 0      | ✓      |

TESTS=1 PASS=1 FAIL=0 SKIP=0 — 815ns total simulation time

---

## Skills Demonstrated

- Python async/await for hardware simulation
- cocotb testbench structure — clock, reset, stimulus, assertion
- GHDL + cocotb integration via VPI interface
- Virtual environment setup for reproducible simulation
- Automated test vector iteration with Python loops
- Transition from VHDL testbenches to Python-based verification

---

## Files

| File               | Description                              |
|--------------------|------------------------------------------|
| design.vhd         | Sequential 8-bit divider (DUT)           |
| test_diviseur.py   | cocotb testbench — 5 test cases          |
| Makefile           | cocotb + GHDL simulation configuration   |
| README.md          | This file                                |

---

## Tools Used

| Tool           | Version | Role                        |
|----------------|---------|-----------------------------|
| GitHub Codespaces | —    | Cloud Linux environment     |
| GHDL           | 5.1.1   | VHDL simulation             |
| cocotb         | 1.8.1   | Python testbench framework  |
| Python         | 3.12.4  | Testbench language          |
| NUMERIC_STD    | IEEE    | Arithmetic type library     |

---

## Next Step

Phase 04 — Communication Protocols: implement a UART transmitter
in VHDL, verified with a cocotb testbench from the start.
