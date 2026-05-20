# FPGA Journey — From Zero to Hardware Engineer

A structured learning path through digital hardware design,
building from basic combinational logic up to processors
and hardware security. Each project includes VHDL source,
testbench, simulation waveforms, and documentation.

## Goal
Build the foundation for a career in FPGA / hardware
security engineering — targeting roles at Ciena, Nokia,
Ericsson, and eventually hardware security consulting.

## Tools
- VHDL (and Verilog, coming soon)
- EDA Playground + GHDL for simulation
- EPWave for waveform analysis
- Target board: Digilent Arty A7-35T (Xilinx Artix-7)

## Progress

### Phase 01 — Combinational Logic ✓ Complete
| Project | Description | Type |
|---|---|---|
| [Adder 4-bit](phase-01-combinationnel/additionneur-4bits) | Basic behavioral adder | Behavioral |
| [7-Segment Decoder](phase-01-combinationnel/decodeur-7-segments) | Hex digit to display | Behavioral |
| [MUX 2x1](phase-01-combinationnel/mux-2x1) | 2-to-1 multiplexer | Behavioral |
| [Comparator 4-bit](phase-01-combinationnel/comparateur-4bits) | GT/LT/EQ outputs | Behavioral |
| [Full Adder](phase-01-combinationnel/full-adder) | 1-bit full adder | Behavioral |
| [Ripple Carry 4-bit](phase-01-combinationnel/ripple-carry-4bits) | Chained full adders | Structural |
| [Carry Lookahead 4-bit](phase-01-combinationnel/carry-lookahead-4bits) | Parallel carry computation | Behavioral |
| [MUX 4x1](phase-01-combinationnel/mux-4x1) | Built from MUX 2x1 | Structural |
| [ALU 4-bit](phase-01-combinationnel/alu-4bits) | 8 operations + zero flag | Behavioral |

### Phase 02 — Sequential Logic (in progress)
Flip-flops, counters, FSMs, debouncing.

### Upcoming
- Phase 03 — Memory & Arithmetic
- Phase 04 — Communication Protocols (UART, SPI, I²C)
- Phase 05 — Video/Audio (VGA, Pong)
- Phase 06 — Processors (MIPS, RISC-V)
- Phase 07 — Hardware Security (AES, side-channel)
