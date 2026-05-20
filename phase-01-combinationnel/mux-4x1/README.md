# MUX 4x1 — VHDL Structural

## Description
4-to-1 multiplexer built structurally by instantiating
three MUX 2x1 components. Selects one of four 1-bit
inputs based on a 2-bit selector S.

S=00 → Y=A | S=01 → Y=B | S=10 → Y=C | S=11 → Y=D

## Architecture
MUX0 selects between A and B using S(0)
MUX1 selects between C and D using S(0)
MUX2 selects between MUX0 and MUX1 using S(1)

## Skills Demonstrated
- Structural VHDL architecture
- Hierarchical design — reusing mux_2x1 component
- Internal signals W0, W1 for intermediate connections
- Multi-level component instantiation

## Files
| File | Description |
|---|---|
| design.vhd | mux_2x1 + mux_4x1 components |
| testbench.vhd | Simulation testbench |
| waveform.png | EPWave screenshot |

## Simulation Results
| S | Y | Selected Input | Status |
|---|---|---|---|
| 00 | 1 | A=1 | ✓ |
| 01 | 0 | B=0 | ✓ |
| 10 | 1 | C=1 | ✓ |
| 11 | 0 | D=0 | ✓ |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
ALU 4-bit — final project of Phase 01.
Combines ADD, SUB, AND, OR, XOR, NOT, shift
controlled by a 3-bit opcode.
