# 4-bit Ripple Carry Adder — VHDL

## Description
A 4-bit adder built by chaining 4 full adders together.
Each full adder processes one bit and passes its carry
to the next stage. This is the first structural design
in this repository — components are instantiated and
wired together rather than described behaviorally.

Inputs  : A(3:0), B(3:0), Cin
Outputs : SUM(3:0), Cout

## Architecture
FA0 --C1--> FA1 --C2--> FA2 --C3--> FA3
C1, C2, C3 are internal signals carrying the ripple
between each full adder stage.

## Skills Demonstrated
- Structural VHDL architecture
- Component instantiation and port mapping
- Internal signals for carry propagation
- Hierarchical design — reusing full_adder component
- Understanding of carry ripple and overflow

## Files
| File | Description |
|---|---|
| ripple_carry_4bits.vhd | Top-level structural design |
| testbench.vhd | Simulation testbench |
| waveform.png | EPWave screenshot showing internal carry signals |

## Simulation Results
| A | B | Cin | SUM | Cout | Status |
|---|---|---|---|---|---|
| 0101 (5) | 0110 (6) | 0 | 1011 (11) | 0 | ✓ |
| 1111 (15) | 0001 (1) | 0 | 0000 (0) | 1 | ✓ overflow |
| 1000 (8) | 1000 (8) | 0 | 0000 (0) | 1 | ✓ overflow |
| 0011 (3) | 0011 (3) | 1 | 0111 (7) | 0 | ✓ |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
Carry Lookahead Adder — optimize timing by computing
all carry signals in parallel instead of waiting
for each stage to propagate.
