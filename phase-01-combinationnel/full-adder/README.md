# Full Adder — VHDL

## Description
1-bit full adder that takes three 1-bit inputs (A, B, Cin)
and produces two 1-bit outputs (SUM and COUT).
Building block for the 4-bit Ripple Carry Adder.

SUM  = A XOR B XOR Cin
COUT = (A AND B) OR (Cin AND (A XOR B))

## Skills Demonstrated
- Boolean logic equations in VHDL
- XOR, AND, OR operators
- Multi-output combinational circuit
- Exhaustive testbench — all 8 input combinations tested

## Files
| File | Description |
|---|---|
| design.vhd | Full adder component |
| testbench.vhd | Simulation testbench — 8 test cases |
| waveform.png | EPWave simulation screenshot |

## Simulation Results
| A | B | Cin | SUM | COUT | Status |
|---|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 | ✓ |
| 0 | 0 | 1 | 1 | 0 | ✓ |
| 0 | 1 | 0 | 1 | 0 | ✓ |
| 0 | 1 | 1 | 0 | 1 | ✓ |
| 1 | 0 | 0 | 1 | 0 | ✓ |
| 1 | 0 | 1 | 0 | 1 | ✓ |
| 1 | 1 | 0 | 0 | 1 | ✓ |
| 1 | 1 | 1 | 1 | 1 | ✓ |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
4-bit Ripple Carry Adder — chain 4 full adders
and connect carry signals between each stage.
