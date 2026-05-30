# Binary to BCD Converter — Double Dabble Algorithm

**Repository:** github.com/Bryanlompo/fpga-journey
**Phase:** 03 — Memory & Arithmetic
**Path:** phase-03-memoire/double-dabble/

---

## Description

A sequential 8-bit binary to BCD converter implementing the Double Dabble
algorithm in VHDL. Given an 8-bit binary input, the circuit produces a 20-bit
BCD output encoding three decimal digits (hundreds, tens, units) over 8 clock
cycles using a 4-state FSM. The conversion requires no division or
multiplication — only conditional additions and left shifts on a 20-bit
working register.

---

## Interface

| Signal    | Direction | Width   | Description                              |
|-----------|-----------|---------|------------------------------------------|
| CLK       | in        | 1-bit   | System clock                             |
| RST       | in        | 1-bit   | Synchronous reset, active high           |
| Start     | in        | 1-bit   | 1-cycle pulse to launch computation      |
| input     | in        | 8-bit   | Binary number to convert (0–255)         |
| Resultat  | out       | 20-bit  | BCD result: cent(19:16) diz(15:12) uni(11:8) + 8 zero bits |

---

## How It Works

The circuit implements the Double Dabble algorithm iteratively,
processing one source bit per clock cycle.

**FSM — 4 states:**
IDLE ──(Start='1')──► LOAD ──► COMPUTE ──(count=8)──► DONE
▲                                                       │
└───────────────────(Start='1')─────────────────────────┘

| State   | Role                                                         |
|---------|--------------------------------------------------------------|
| IDLE    | Wait for Start pulse                                         |
| LOAD    | Capture input, reset BCD groups to zero                      |
| COMPUTE | 8 iterations of correct-then-shift                           |
| DONE    | BCD result stable on Resultat port                           |

**COMPUTE — per cycle logic:**

At each clock cycle, the following sequence executes using VHDL process
variables for immediate same-cycle update:

1. If uni  >= 5 → uni  := uni  + 3
2. If diz  >= 5 → diz  := diz  + 3
3. If cent >= 5 → cent := cent + 3
4. Assemble 20-bit register: BCD := cent & diz & uni & source
5. Shift left by 1:          BCD := BCD(18 downto 0) & '0'
6. Redistribute:             cent/diz/uni/source := BCD slices
7. count <= count + 1 — transition to DONE when count = 8

The +3 correction pre-compensates for binary/decimal misalignment.
When a BCD group reaches 5 or more, the next left shift would produce
an invalid BCD digit (> 9). Adding 3 before the shift ensures the carry
propagates correctly into the next group.

---

## Key Concepts Demonstrated

- **Double Dabble algorithm** — binary-to-BCD conversion using only
  shifts and conditional additions, no division required
- **VHDL variables for multi-step combinational logic** — corrections,
  assembly, shift, and redistribution all happen in one clock cycle
  using variables (`:=`) for immediate update
- **20-bit working register** — 12-bit BCD zone + 8-bit source zone
  treated as a single shift register; bits migrate from source into
  BCD groups naturally through left shifts
- **Independent correction blocks** — three separate `if` statements
  (not `elsif`) ensure all three BCD groups are corrected simultaneously
  before the shift
- **Type discipline with NUMERIC_STD** — all arithmetic done in
  `unsigned`; conversions explicit at boundaries only

---

## Problems Encountered and Solved

| Problem | Root Cause | Fix Applied |
|---------|-----------|-------------|
| Variables declared in architecture | VHDL variables belong inside the process | Moved all variables between `process(CLK)` and `begin` |
| Corrections only on units group | Used `elsif` instead of separate `if` blocks | Three independent `if` statements for uni, diz, cent |
| Shift operating on stale BCD | Corrections applied to variables but BCD not reassembled before shift | Added `BCD := cent & diz & uni & source` before shift |
| Source overwritten in LOAD | `source := (others=>'0')` placed after `source := unsigned(input)` | Reordered: reset uni/diz/cent first, capture source last |
| Type mismatch in concatenation | Mixing `unsigned` variables with `STD_LOGIC_VECTOR` input | Cast input explicitly: `source := unsigned(input)` |
| BCD groups not reset between runs | Variables retain values across process executions | Added `uni/diz/cent := (others=>'0')` in LOAD state |

---

## Simulation Results

Tool: EDA Playground — GHDL 5.1.1 / EPWave

| Input (binary)  | Decimal | Expected BCD | Obtained (20-bit)    | Status |
|-----------------|---------|--------------|----------------------|--------|
| 00000000        | 0       | 0-0-0        | 00000000000000000000 | ✓      |
| 00001001        | 9       | 0-0-9        | 00000000100100000000 | ✓      |
| 01100011        | 99      | 0-9-9        | 00001001100100000000 | ✓      |
| 10010101        | 149     | 1-4-9        | 00010100100100000000 | ✓      |
| 11110101        | 245     | 2-4-5        | 00100100010100000000 | ✓      |
| 11111111        | 255     | 2-5-5        | 00100101010100000000 | ✓      |

All 6 test cases pass. Results stable after ~120 ns (12 cycles × 10 ns).

---

## Skills Demonstrated

- VHDL FSM design with enumerated state types
- Double Dabble algorithm implementation in hardware
- VHDL variables vs signals — immediate update within a clock cycle
- Multi-step datapath sequencing within a single FSM state
- Type-safe arithmetic with NUMERIC_STD unsigned types
- Independent correction logic for parallel BCD group updates
- Testbench design covering edge cases (0, max, boundary values)

---

## Files

| File                  | Description                              |
|-----------------------|------------------------------------------|
| double_dabble.vhd     | Main design — FSM + Double Dabble datapath |
| tb_double_dabble.vhd  | Testbench — 6 test cases (0 to 255)      |
| waveform.png          | EPWave screenshot — all 6 results        |
| README.md             | This file                                |

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

Introduction to cocotb — rewrite the testbench for this module or the
sequential divider using Python-based cocotb, replacing VHDL testbenches
with a more flexible and readable verification flow.
