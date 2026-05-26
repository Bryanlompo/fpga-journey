# Multiplicateur Séquentiel Shift-Add 8×8 — VHDL

## Description
A sequential 8x8-bit multiplier using the shift-and-add
algorithm. Computes the product of two 8-bit operands over
8 clock cycles without using the * operator. The result is
16 bits wide (maximum 255 × 255 = 65025). This is the
algorithm used inside real processor ALUs for multiplication
instructions (MIPS MULT, ARM MUL).

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Clock |
| RST | in | Synchronous reset |
| START | in | Pulse high for 1 cycle to begin multiplication |
| A | in (8-bit) | Multiplicand |
| B | in (8-bit) | Multiplier |
| Done | out | Goes high when result is ready |
| Resultat | out (16-bit) | Product A × B (valid when Done=1) |

## Algorithm — Shift and Add

Binary multiplication works like long multiplication by hand,
but simpler because each bit is either 0 or 1:

    If bit of B = 1 → add A (shifted to correct position)
    If bit of B = 0 → add nothing

Example: 6 × 5 = 0110 × 0101

    Cycle 1: B_shift(0)=1 → result += 00000110  (A × 1)
    Cycle 2: B_shift(0)=0 → result unchanged    (A × 0)
    Cycle 3: B_shift(0)=1 → result += 00011000  (A × 4)
    Cycle 4: B_shift(0)=0 → result unchanged    (A × 0)
    ...
    Final: result = 00011110 = 30 ✓

At each cycle:
- Examine B_shift(0) — the rightmost bit
- If 1: add A_shift to result
- Shift A_shift LEFT by 1 (equivalent to × 2)
- Shift B_shift RIGHT by 1 (bring next bit to position 0)
- Increment count

## Internal Signals
| Signal | Width | Description |
|---|---|---|
| A_shift | 16-bit | Shifted copy of A — doubles each cycle |
| B_shift | 8-bit | Shifted copy of B — halves each cycle |
| P | 16-bit | Accumulator — running sum |
| count | integer 0-8 | Cycle counter |

## Why 16-bit result
8-bit × 8-bit → product up to 255 × 255 = 65025
65025 requires 16 bits to represent.
A_shift is also 16 bits because it shifts left 8 times
and can grow to 255 × 128 = 32640.

## Timing
Cycle 0   : START=1 → load A and B, reset P and count
Cycle 1-8 : one shift-add operation per cycle
Cycle 9   : Done=1, Resultat = final product
Total: 9 clock cycles per multiplication.
A combinational multiplier takes 1 cycle but uses far
more LUTs. This is the classic area vs speed tradeoff.

## State Machine
The multiplier has an implicit FSM:
START=1  → LOAD  : charge A_shift, B_shift, reset P, count=0
count<8  → CALC  : one shift-add per cycle
count=8  → DONE  : assert Done, latch Resultat
## Done Signal Usage
Resultat is only valid when Done=1. The caller must
wait for Done before reading the result:

    START <= '1'; wait for 1 cycle;
    START <= '0';
    wait until Done = '1';
    -- now Resultat is valid

## Real-World Connection
This algorithm is used in:
- MIPS MULT instruction (Phase 06 processor)
- ARM MUL instruction (CEG 3536)
- DSP fixed-point multiply-accumulate (MAC) operations
- Any hardware that cannot afford a large combinational multiplier

In CEG 3536 Lab 3, you implemented Euclidean algorithm
using repeated subtraction — same concept: replace a
complex operation with repeated simple operations.

## Problems Encountered and Solved

1. A_shift initialization with port value
Signal initialization cannot reference port values.
Fixed by loading A_shift inside the process when START=1:
    A_shift <= "00000000" & A;

2. count type mismatch
count declared as integer but assigned '0' (STD_LOGIC).
Fixed: count <= 0 (integer literal, no quotes).

3. Double assignment operator
count <= count <= count + 1 written by mistake.
Fixed: count <= count + 1.

4. NUMERIC_STD addition requires explicit conversion
P + A_shift fails with NUMERIC_STD on STD_LOGIC_VECTOR.
Fixed:
    P <= std_logic_vector(unsigned(P) + unsigned(A_shift));

5. START and CALC in same if branch
Loading A/B and computing in the same cycle caused
off-by-one errors. Fixed with if/elsif structure:
    if START=1   → load only
    elsif count<8 → compute only
    elsif count=8 → done

## Simulation Results
| A | B | Expected | Resultat | Status |
|---|---|---|---|---|
| 11 (00001011) | 13 (00001101) | 143 | 143 | ✓ |
| 255 (11111111) | 255 (11111111) | 65025 | 65025 | ✓ |
| 6 (00000110) | 5 (00000101) | 30 | 30 | ✓ |

Done asserts after exactly 8 clock cycles in all tests.

## Skills Demonstrated
- Sequential arithmetic without * operator
- Shift-and-add algorithm implementation
- Multi-cycle operation with done flag
- NUMERIC_STD type conversion for arithmetic
- Area vs speed tradeoff in hardware design

## Files
| File | Description |
|---|---|
| design.vhd | Shift-add multiplier |
| testbench.vhd | Three multiplication tests |
| waveform.png | EPWave screenshot showing all three results |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
Sequential Divider — divide without the / operator,
using non-restoring subtraction algorithm.
