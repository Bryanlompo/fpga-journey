# 4-bit Up/Down Counter — VHDL

## Description
A 4-bit synchronous counter that increments or decrements on each
rising clock edge. Supports enable control, direction control, and
synchronous reset. Wraps around naturally (15→0 counting up,
0→15 counting down) due to 4-bit overflow.

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Clock |
| RST | in | Synchronous reset (RST=1 → count=0) |
| EN | in | Enable (EN=0 → count frozen) |
| UP_DOWN | in | Direction (0=up, 1=down) |
| Count | out (4-bit) | Current count value |

## Behavior
- RST=1 → Count = 0000
- EN=0 → Count holds (frozen)
- EN=1, UP_DOWN=0 → Count + 1
- EN=1, UP_DOWN=1 → Count - 1

## Skills Demonstrated
- Synchronous counter design
- Priority logic (reset > enable > direction)
- Internal signal for read-modify-write (count + 1)
- Natural wrap-around with 4-bit overflow
- Multi-cycle testbench observation

## Files
| File | Description |
|---|---|
| design.vhd | Counter component |
| testbench.vhd | Multi-cycle testbench (up, down, freeze) |
| waveform.png | EPWave screenshot showing full count cycle |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
Clock Divider — use a counter to slow down a fast clock
(100 MHz → 1 Hz) for visible LED blinking and timing.
