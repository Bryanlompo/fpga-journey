# 4-bit ALU — VHDL

## Description
4-bit Arithmetic Logic Unit supporting 8 operations
controlled by a 3-bit opcode. Includes a ZERO flag
that goes high when the result is 0000.
Core component of any processor — executes all
arithmetic and logical instructions.

## Operations
| Opcode | Operation | Description |
|---|---|---|
| 000 | ADD | A + B |
| 001 | SUB | A - B |
| 010 | AND | A and B |
| 011 | OR | A or B |
| 100 | XOR | A xor B |
| 101 | NOT | not A |
| 110 | SHL | Shift left A |
| 111 | SHR | Shift right A |

## Skills Demonstrated
- case/when with 8 operations
- Internal signal RESULT to enable ZERO flag
- ZERO flag — output goes high when result = 0000
- Shift operations using concatenation operator &
- Understanding of ALU role in processor design

## Files
| File | Description |
|---|---|
| design.vhd | ALU component |
| testbench.vhd | Simulation testbench — 8 operations tested |
| waveform.png | EPWave simulation screenshot |

## Simulation Results
| OP | Operation | A | B | Y | ZERO | Status |
|---|---|---|---|---|---|---|
| 000 | ADD | 0101 (5) | 0011 (3) | 1000 (8) | 0 | ✓ |
| 001 | SUB | 0101 (5) | 0101 (5) | 0000 (0) | 1 | ✓ |
| 010 | AND | 1100 | 1010 | 1000 | 0 | ✓ |
| 011 | OR | 1100 | 1010 | 1110 | 0 | ✓ |
| 100 | XOR | 1100 | 1010 | 0110 | 0 | ✓ |
| 101 | NOT | 0101 | — | 1010 | 0 | ✓ |
| 110 | SHL | 0101 | — | 1010 | 0 | ✓ |
| 111 | SHR | 0101 | — | 0010 | 0 | ✓ |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
Phase 02 — Sequential Logic.
First flip-flops, then counters, FSMs, and debouncer.
Introduction of the clock — the real hardware begins.
