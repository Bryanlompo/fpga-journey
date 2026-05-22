# Vending Machine (FSM) — VHDL

## Description
A finite state machine modeling a vending machine. The product
costs 15 cents. The machine accepts 5-cent and 10-cent coins.
When the inserted amount reaches 15, the product is dispensed.
Unlike the traffic light FSM, transitions here depend on an
INPUT (coins), not on time.

## State Diagram (ASM)
ETAT0 (0¢) → ETAT5 → ETAT10 → ETAT15 (dispense) → back to ETAT0
Each transition depends on the coin inserted (5 or 10).
## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Clock |
| RST | in | Synchronous reset (returns to ETAT0) |
| Coin | in (2-bit) | "01"=5¢, "10"=10¢, "00"=none, "11"=invalid |
| PRODUCT | out | Dispense signal (1 = product released) |

## Design Decisions
- States represent accumulated money (0, 5, 10, 15 cents)
- A single 2-bit input encodes the coin (chosen for a clean case
  structure and extensibility)
- Invalid input "11" is ignored — the machine stays in its current
  state (defensive design)
- Surplus is kept by the machine (e.g. 10+10=20 dispenses and
  returns to 0; the extra 5¢ is not returned) — simplest design
- PRODUCT defaults to 0 every cycle and is set to 1 only in ETAT15,
  guaranteeing a clean one-cycle pulse regardless of input timing

## Key Concept — Input-Dependent FSM
This FSM reacts to external input (coins), making it event-driven
rather than time-driven. The state acts as memory, accumulating
the total inserted across clock cycles. This is the foundation of
all interactive sequential systems.

## Default Output Pattern
Setting PRODUCT <= '0' as a default before the case, then
overriding to '1' only in the dispensing state, is a standard FSM
pattern. It prevents the output from getting stuck high and
avoids timing-dependent bugs.

## Skills Demonstrated
- Input-dependent state transitions
- State as accumulator (memory)
- Defensive handling of invalid input
- Default output value pattern for clean pulses

## Files
| File | Description |
|---|---|
| design.vhd | Vending machine FSM |
| testbench.vhd | Simulates coin insertion to reach 15¢ |
| waveform.png | EPWave screenshot showing dispense |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Possible Improvements
- Return change (option 2): add a change-dispensing output
- Keep credit (option 3): return to ETAT5 instead of ETAT0 on surplus

## Next Step
Sequence Detector "1011" — an FSM that detects a specific bit
pattern in a serial stream, introducing overlapping detection.
