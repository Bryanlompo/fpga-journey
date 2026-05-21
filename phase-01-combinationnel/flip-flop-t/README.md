# T Flip-Flop — VHDL

## Description
A T (Toggle) flip-flop. On each rising clock edge, if T=1 the
output Q inverts its value; if T=0, Q holds. Includes synchronous
reset. Uses an internal signal to enable reading the current
state for the toggle operation.

## Behavior
| RST | T | Action |
|---|---|---|
| 1 | x | Q <= 0 (reset) |
| 0 | 1 | Q <= not Q (toggle) |
| 0 | 0 | Q holds value |

## Key Concept
When T=1 is held, Q toggles every clock cycle — meaning Q
oscillates at HALF the clock frequency. This is the basis of
a frequency divider: chaining T flip-flops divides frequency
by powers of 2.

## Debugging Note
First version used two separate if statements for reset and
toggle, causing a conflict that left Q stuck at undefined (X).
Fixed by using a single if/elsif/else chain making the
conditions mutually exclusive.

## Skills Demonstrated
- Internal signal for read-modify-write (toggle)
- if/elsif/else for mutually exclusive conditions
- Debugging undefined (X) states
- Understanding frequency division

## Files
| File | Description |
|---|---|
| design.vhd | T flip-flop component |
| testbench.vhd | Testbench with clock generation |
| waveform.png | EPWave screenshot showing toggle behavior |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
JK flip-flop — the most versatile flip-flop, combining
set, reset, hold, and toggle in one component.
