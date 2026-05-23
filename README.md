# FPGA Journey — From Zero to Hardware Engineer

A structured self-directed FPGA curriculum, built from scratch.
Every project written by hand, simulated, and documented.
No copying. No shortcuts.

## Goal
Build the foundation for a career in FPGA and hardware security
engineering — targeting roles at Ciena, Nokia, and AMD, and
eventually launching a hardware security consulting agency.

## Tools
- VHDL (behavioral and structural)
- EDA Playground + GHDL 5.1.1 (simulation)
- EPWave (waveform analysis)
- Git / GitHub (version control)
- Target board: Digilent Arty A7-35T (Xilinx Artix-7)

## Progress

### Phase 01 — Combinational Logic (COMPLETE)
| Project | Description | Type |
|---|---|---|
| Adder 4-bit | Basic behavioral adder | Behavioral |
| 7-Segment Decoder | Hex digit to display (0-F) | Behavioral |
| MUX 2x1 | 2-to-1 multiplexer | Behavioral |
| Comparator 4-bit | GT / LT / EQ outputs | Behavioral |
| Full Adder | 1-bit full adder | Behavioral |
| Ripple Carry 4-bit | 4 full adders chained | Structural |
| Carry Lookahead 4-bit | Parallel carry computation | Behavioral |
| MUX 4x1 | Built from 3x MUX 2x1 | Structural |
| ALU 4-bit | 8 operations + zero flag | Behavioral |

### Phase 02 — Sequential Logic (COMPLETE)
| Project | Description | Type |
|---|---|---|
| D Flip-Flop | First sequential circuit, synchronous reset | Behavioral |
| T Flip-Flop | Toggle, frequency division principle | Behavioral |
| JK Flip-Flop | Set / Reset / Hold / Toggle | Behavioral |
| Counter 4-bit | Up/down counter with enable | Behavioral |
| Clock Divider | Generates slow clock from fast clock | Behavioral |
| Shift Register | Bidirectional SIPO 8-bit with DIR control | Behavioral |
| Debouncer | Filters mechanical button bounce | Behavioral |
| FSM Traffic Light | Moore FSM, time-based transitions | Behavioral |
| FSM Vending Machine | Moore FSM, input-driven transitions | Behavioral |
| Sequence Detector 1011 | Overlapping detection, 4 states | Behavioral |
| Stopwatch | MM:SS display, first structural project | Structural |

### Phase 03 — Memory and Arithmetic (in progress)
RAM, ROM, FIFO, fixed-point multiplier, floating-point
arithmetic, integer divider.

### Upcoming
- Phase 04 — Communication Protocols (UART, SPI, I2C, PWM)
- Phase 05 — Video and Audio (VGA, Pong, oscilloscope)
- Phase 06 — Processors (MIPS single-cycle, pipelined, RISC-V)
- Phase 07 — Hardware Security (AES, side-channel analysis)

## Key Milestones

    Phase 01 complete  ->  combinational logic mastered
    Phase 02 complete  ->  sequential logic + FSM mastered
    Phase 04 complete  ->  employable as junior FPGA engineer
    Phase 06 complete  ->  strong hardware engineering profile
    Phase 07 complete  ->  hardware security specialization

## Design Philosophy
Every module includes:
- VHDL source (design.vhd)
- Testbench (testbench.vhd)
- Simulation waveform (waveform.png)
- README with design rationale, debug notes, and lessons learned

Bugs and debugging notes are documented intentionally.
Understanding why something fails is as important as making
it work.

## Author
Bryan Lompo
github.com/Bryanlompo/fpga-journey
plomp040@uottawa.ca
