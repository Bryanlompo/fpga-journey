# 4-bit Carry Lookahead Adder — VHDL

## Description
A 4-bit adder that computes all carry signals in parallel
using Generate (G) and Propagate (P) logic, eliminating
the carry ripple delay of the Ripple Carry Adder.

Inputs  : A(3:0), B(3:0), Cin
Outputs : SUM(3:0), Cout

## How It Works
For each bit i:
- G(i) = A(i) AND B(i)  — carry generated regardless of Cin
- P(i) = A(i) XOR B(i)  — carry propagated if Cin exists
- C(i+1) = G(i) OR (P(i) AND C(i))  — carry lookahead
- SUM(i) = P(i) XOR C(i)

All carry signals computed simultaneously — no waiting.

## Ripple Carry vs Carry Lookahead

| Criteria | Ripple Carry | Carry Lookahead |
|---|---|---|
| Speed | Slow — carry ripples stage by stage | Fast — all carries computed in parallel |
| Gate count | ~28 gates | ~50 gates |
| Silicon area | Small | Larger |
| Power consumption | Low | Higher |
| Design complexity | Simple | More complex |
| Cost | Lower | Higher |
| Best use case | Low power, area-constrained | Speed-critical (CPU, DSP) |

This is the classic PPA tradeoff (Power, Performance, Area)
that hardware engineers optimize every day.

## Skills Demonstrated
- Carry lookahead logic — G and P signals
- Parallel carry computation
- Internal signals for intermediate values
- Understanding of PPA tradeoffs in hardware design

## Files
| File | Description |
|---|---|
| design.vhd | Carry Lookahead Adder component |
| testbench.vhd | Simulation testbench |
| waveform.png | EPWave screenshot showing G, P, C internal signals |

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
MUX 4:1 Structural — build a 4-to-1 multiplexer
by instantiating three MUX 2x1 components.
