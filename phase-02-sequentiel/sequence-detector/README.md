# Sequence Detector "1011" — VHDL

## Description
A finite state machine that detects the bit pattern "1011" in a
serial input stream. Supports overlapping detection — the last
bit of one match can be the first bit of the next.

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Clock |
| RST | in | Synchronous reset (returns to S0) |
| Input | in | Serial bit stream (1 bit per cycle) |
| Output | out | High for 1 cycle when "1011" is detected |

## Key Concept — Overlapping Detection
When "1011" is detected, the FSM returns to S1 (not S0).
The last '1' of one match becomes the first '1' of the next.
For the sequence "1011011", two detections occur:
- First at bits 1-4
- Second at bits 4-7 (overlapping)

The transition S3+'0' → S2 (not S0) is also subtle: after
seeing "101", a '0' gives "1010". The suffix "10" is a valid
prefix of "1011", so we reuse it by going to S2.

## Moore vs Mealy
This implementation uses a Moore machine:
- Outputs depend only on the current state (not the input)
- Output flag is set to '0' by default before the case statement
- Overridden to '1' only in S3 when bit=1
- Guarantees a clean 1-cycle pulse per detection

A Mealy implementation would use 4 states as well, but attach
the output to the S3+'1' transition instead of a dedicated state.
Moore was chosen for clarity and easier debugging on waveforms.

## Methodology — FSM Design (CEG 3555)
Following the formal FSM method taught in CEG 3555:
1. Specification: detect "1011" with overlap
2. State diagram: 4 states (S0-S3)
3. State table: transitions for bit=0 and bit=1
4. Minimization: 4 states, none reducible
5. State assignment: enumerated type (synthesizer handles encoding)
6-8: Behavioral VHDL (synthesizer generates equations and circuit)

## Design Journey
Initially attempted to design the detector without using a
formal FSM methodology (Moore/Mealy). This approach quickly
became complex and hard to reason about — especially for
handling overlapping detection and partial match reuse.

After studying the Moore/Mealy distinction, the Moore approach
was chosen: outputs attached to states, clean separation between
state transitions and output logic. This immediately simplified
the design to 4 states with clear, traceable transitions.

The lesson: for sequence detection problems, a formal FSM
methodology is not just academic — it directly reduces
complexity and prevents subtle bugs.

## Problems Encountered and Solved

**1. Initial 16-bit parallel input approach abandoned**
First attempt used a 16-bit input vector, extracting bits one
by one with a shift register. The problem: once a bit is
consumed by the shift, it is gone. If the FSM needed to reuse
a bit for overlapping detection, it was impossible to recover.
Solution: switched to a 1-bit serial input — the FSM states
act as memory, making the shift register unnecessary.

**2. Unnecessary intermediate signal**
Created a signal `present_bit` to hold the current input bit.
This was redundant — `Input` can be read directly inside the
process. Removed to simplify the design.

**3. State not reset to S0**
The reset block only reset the output flag, not the state.
After a reset, the FSM could restart from any state instead
of S0. Fixed by adding `state <= S0` in the reset block.

**4. Missing state transition after detection**
In state S3, when bit=1 (detection), the `state <= S1`
assignment was missing. The FSM would detect once and then
stay stuck in S3 forever. Fixed by adding the transition
to support overlapping detection.

## Simulation Result
Input sequence "1,1,0,1,1,0,1,1" produced two detections,
confirming overlapping behavior. Output pulse lasts exactly
1 clock cycle per detection.

## Skills Demonstrated
- Moore FSM for sequence detection
- Overlapping pattern matching
- Careful state transition design (reusing partial matches)
- Formal FSM methodology (CEG 3555)
- Debugging FSM logic from waveform analysis

## Files
| File | Description |
|---|---|
| design.vhd | Sequence detector FSM |
| testbench.vhd | Tests "1,1,0,1,1,0,1,1" — two detections |
| waveform.png | EPWave screenshot showing both detections |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
Stopwatch — combining clock divider, counter, and 7-segment
decoder into a first structural project.
