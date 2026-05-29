# Sequential 8-bit Divider — Restoring Division Algorithm

**Repository:** github.com/Bryanlompo/fpga-journey  
**Phase:** 03 — Memory & Arithmetic  
**Path:** phase-03-memoire/diviseur-8bits/

---

## Description

A sequential 8-bit unsigned divider implementing the Restoring Division
algorithm in VHDL. Given an 8-bit dividend and an 8-bit divisor, the circuit
computes the quotient over exactly 8 clock cycles using a 4-state FSM and a
single 9-bit subtractor reused at each iteration. A 9-bit accumulator is used
so that bit 8 acts exclusively as a sign indicator after each subtraction,
enabling a clean restore decision without additional comparison logic.

---

## Interface

| Signal    | Direction | Width  | Description                         |
|-----------|-----------|--------|-------------------------------------|
| CLK       | in        | 1-bit  | System clock                        |
| RST       | in        | 1-bit  | Synchronous reset, active high      |
| Start     | in        | 1-bit  | 1-cycle pulse to launch computation |
| Dividende | in        | 8-bit  | Dividend operand                    |
| Diviseur  | in        | 8-bit  | Divisor operand                     |
| Resultat  | out       | 8-bit  | Quotient, stable in DONE state      |

---

## How It Works

The circuit implements binary long division iteratively, processing one
dividend bit per clock cycle from MSB to LSB.

**FSM — 4 states:**

IDLE ──(Start='1')──► LOAD ──► COMPUTE ──(count=7)──► DONE
▲                                                       │
└───────────────────(Start='1')─────────────────────────┘
| State   | Role                                                      |
|---------|-----------------------------------------------------------|
| IDLE    | Wait for Start pulse                                      |
| LOAD    | Capture inputs into internal registers, reset accumulator |
| COMPUTE | Execute one algorithm iteration per clock cycle (×8)      |
| DONE    | Quotient stable on Resultat port, await next Start        |

**COMPUTE — per cycle logic:**

At each clock cycle in COMPUTE, the following sequence executes using
VHDL process variables for immediate same-cycle update:

1. Shift accumulator left by 1, bring in MSB of dividend register A
2. Subtract zero-extended divisor from shifted accumulator (9-bit)
3. Shift A left by 1 to expose next dividend bit
4. Check bit 8 of subtraction result:
   - 0 (positive): keep result → quotient bit = 1
   - 1 (negative): restore accumulator → quotient bit = 0
5. Shift quotient left, insert new bit on the right
6. Increment count — transition to DONE when count reaches 7

---

## Key Concepts Demonstrated

- **Restoring Division algorithm** — binary long division via iterative
  subtract-and-restore over N cycles for an N-bit operand
- **9-bit accumulator as sign detector** — extending by 1 bit isolates
  the sign without a separate comparison unit
- **FSM + Datapath pattern** — single subtractor reused across all
  iterations; FSM controls flow, datapath handles arithmetic
- **VHDL variables vs signals** — variables (`:=`) update immediately
  within the process, enabling shift → subtract → decide in one cycle
- **Zero-extension** — `'0' & B` aligns operand widths before subtraction
- **Concatenation for shift-in** — `&` operator used to bring dividend
  bits into the accumulator each iteration

---

## Problems Encountered and Solved

| Problem | Root Cause | Fix Applied |
|---------|-----------|-------------|
| Sign bit lost after subtraction | Accumulator declared 8-bit | Widened to 9-bit (`8 downto 0`) |
| Stale value read on `C(8)` | Signal assigned and read same cycle | Replaced with VHDL process variables |
| Wrong bits after shift | `unsigned(acc(6 downto 0)) & A(7)` dropped bit 7 | Corrected to `unsigned(acc(7 downto 0) & A(7))` |
| Type mismatch in concatenation | Concatenating `unsigned` with `std_logic` | Concatenate in `std_logic` domain first, then cast |
| A register never advancing | Shift not repeated in COMPUTE | Added `A <= A(6 downto 0) & '0'` each iteration |
| Wrong result on second run | `count` not reset between runs | Added `count <= 0` in LOAD state |
| FSM active during reset | `case` outside the `else` of RST block | Moved entire `case` into `else` branch |
| Comparison using wrong operator | `Start <= '1'` instead of `Start = '1'` | Corrected to equality operator |

---

## Simulation Results

Tool: EDA Playground — GHDL 5.1.1 / EPWave

| Dividende     | Diviseur     | Expected Quotient | Obtained | Status |
|---------------|--------------|-------------------|----------|--------|
| 37 (00100101) | 5 (00000101) | 7 (00000111)      | 00000111 | ✓      |

Result stable on output after ~120 ns (12 cycles × 10 ns clock period).

---

## Skills Demonstrated

- VHDL FSM design with enumerated state types
- Sequential arithmetic circuit design via iterative algorithm
- VHDL variables vs signals — understanding same-cycle timing
- Operand width management and zero-extension in arithmetic
- Concatenation operator for type-safe shift-in operations
- Synchronous reset with FSM state initialization
- Testbench design with controlled Start pulse timing

---

## Files

| File                  | Description                    |
|-----------------------|--------------------------------|
| diviseur_8bits.vhd    | Main design — FSM + datapath   |
| tb_diviseur_8bits.vhd | Testbench with 37÷5 test case  |
| waveform.png          | EPWave screenshot — result = 7 |
| README.md             | This file                      |

---

## Tools Used

| Tool           | Version | Role                    |
|----------------|---------|-------------------------|
| EDA Playground | —       | Online IDE              |
| GHDL           | 5.1.1   | VHDL simulation         |
| EPWave         | —       | Waveform visualization  |
| NUMERIC_STD    | IEEE    | Arithmetic type library |

---

## Next Step

Convertisseur Binaire → BCD (Double Dabble) — convert an 8-bit binary
result to packed BCD digits for decimal display on a 7-segment module.
