# Button Debouncer — VHDL

## Description
A debouncer circuit that cleans up the noisy signal from a
mechanical push button. When a button is pressed, the physical
contacts bounce, producing rapid 0-1 oscillations for several
milliseconds. This debouncer ignores that noise and only accepts
the input once it has remained stable for a set number of clock
cycles.

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Clock |
| RST | in | Synchronous reset |
| input | in | Raw (bouncy) button signal |
| Output | out | Clean, debounced signal |

## How It Works
- A counter measures how long the input stays stable
- If input matches the current output → counter resets (no change)
- If input differs from output → counter increments
  - When counter reaches threshold → output accepts the new value
- During bounce, the input changes too fast, so the counter keeps
  resetting and never reaches the threshold → bounce is filtered

## Threshold Design
The threshold is a tradeoff between noise rejection and
responsiveness:
- Too small → bounce slips through as false presses
- Too large → button feels slow, fast presses missed
For simulation, threshold = 7 (3-bit counter). On real hardware
at 100 MHz, a threshold around 1,000,000 covers ~10ms of bounce.

## Observed Behavior
In simulation, the output stayed at 0 throughout the bouncing
phase, then transitioned to 1 only after the input remained
stable long enough to reach the threshold. The visible delay
between stable input and output change is the debounce period —
the cost of guaranteeing a clean signal.

## Skills Demonstrated
- Counter-based stability detection
- Comparing input against internal state
- Interface vs implementation separation
- Engineering tradeoff analysis (threshold sizing)

## Files
| File | Description |
|---|---|
| design.vhd | Debouncer component |
| testbench.vhd | Tests bounce rejection then stable acceptance |
| waveform.png | EPWave screenshot |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
FSM Traffic Light — first finite state machine, introducing
the ASM design methodology.
