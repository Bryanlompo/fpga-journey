# 4-bit Comparator — VHDL

## Description
Combinational circuit that compares two 4-bit inputs A and B.
Produces three 1-bit outputs: GT (A>B), LT (A<B), and EQ (A=B).
Only one output is high at a time.

## Skills Demonstrated
- Concurrent signal assignment with when/else
- Multi-output combinational logic
- STD_LOGIC vs STD_LOGIC_VECTOR usage
- Comparison operators on STD_LOGIC_VECTOR

## Files
| File | Description |
|---|---|
| design.vhd | Comparator component |
| testbench.vhd | Simulation testbench |
| waveform.png | EPWave simulation screenshot |

## Simulation Results
| A | B | GT | LT | EQ | Status |
|---|---|---|---|---|---|
| 0110 (6) | 0010 (2) | 1 | 0 | 0 | ✓ |
| 0001 (1) | 1000 (8) | 0 | 1 | 0 | ✓ |
| 0101 (5) | 0101 (5) | 0 | 0 | 1 | ✓ |
| 1111 (15) | 0000 (0) | 1 | 0 | 0 | ✓ |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
4-bit Ripple Carry Adder — build a full adder
from basic half-adders and chain them together.
