# Traffic Light Controller (FSM) — VHDL

## Description
A finite state machine (FSM) that controls a traffic light,
cycling through green, yellow, and red with different durations
for each. This is the first state machine in the project and
introduces the ASM (Algorithmic State Machine) design methodology.

## State Diagram (ASM)
S_VERT (15 cycles) → S_JAUNE (5 cycles) → S_ROUGE (15 cycles) → back to S_VERT
## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Clock |
| RST | in | Synchronous reset (returns to S_VERT) |
| VERT | out | Green light |
| JAUNE | out | Yellow light |
| ROUGE | out | Red light |

## Design Approach
- Enumerated type for states (S_VERT, S_JAUNE, S_ROUGE)
- A single shared counter measures time in the current state
  (one counter is enough — only one state is active at a time)
- case statement handles state transitions
- Outputs are driven by the current state (one-hot: exactly one
  light on at any moment)

## Methodology — ASM to VHDL
The design started as an ASM chart:
- Each state rectangle → a "when" branch in the case
- Each decision diamond (counter = limit?) → an if statement
- Each transition arrow → a state assignment
This direct translation from diagram to code is the standard
FSM design flow taught in CEG 3555.

## Key Concept
A FSM combines three elements: states (where we are), transitions
(how we move between states), and outputs (what each state
produces). The state signal acts as the machine's memory,
updated on each clock edge.

## Skills Demonstrated
- Finite state machine design
- Enumerated state types
- ASM chart methodology
- One-hot output encoding (one light at a time)
- Shared counter for state timing

## Files
| File | Description |
|---|---|
| design.vhd | Traffic light FSM |
| testbench.vhd | Runs multiple full cycles |
| waveform.png | EPWave screenshot showing the cycle |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Academic Note
This corresponds to CEG 3555 Lab 3 (traffic light FSM).
Reimplemented from scratch for mastery.

## Next Step
Vending Machine FSM — a state machine with INPUT-dependent
transitions (coins), more complex than the time-based traffic light.
