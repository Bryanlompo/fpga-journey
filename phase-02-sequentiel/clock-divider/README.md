# Clock Divider — VHDL

## Description
A configurable clock divider that takes a fast input clock and
produces a slower output clock. Uses an internal counter: when
the counter reaches a threshold, the output toggles and the
counter resets.

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Fast input clock |
| RST | in | Synchronous reset |
| EN | in | Enable |
| S_CLK | out | Slow output clock |

## How It Works
- Counter increments each input clock cycle
- When counter reaches threshold (here "011" = 3):
  - S_CLK toggles (not S_CLK)
  - Counter resets to 0
- Division formula: to divide by N, count to (N/2 - 1)
  - Divide by 8 → count to 3
  - Divide by 16 → count to 7

## Design Discussion
For a fixed power-of-2 division, the counter's natural overflow
could be used. However, resetting the counter explicitly makes
the design generic — it works for any division factor (e.g. by 5
or 10), not just powers of 2. This robustness is preferred in
production code.

## Real-World Use
On the Arty A7 (100 MHz), large thresholds produce useful clocks:
- 1 Hz for LED blinking (count to 50,000,000)
- Baud rate generation for UART
- 60 Hz refresh for VGA

## Files
| File | Description |
|---|---|
| design.vhd | Clock divider component |
| testbench.vhd | Testbench showing fast vs slow clock |
| waveform.png | EPWave screenshot |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
Shift Register — serial-to-parallel and parallel-to-serial
data conversion, foundation for UART and SPI.
