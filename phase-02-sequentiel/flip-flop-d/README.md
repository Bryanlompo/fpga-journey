# D Flip-Flop — VHDL

## Description
First sequential circuit. A D flip-flop stores 1 bit of data,
synchronized to a clock. On each rising clock edge, Q captures
the value of D. Includes a synchronous reset.

This marks the transition from combinational to sequential
logic — the circuit now has MEMORY.

## Behavior
- On rising clock edge:
  - If RST = '1' → Q <= '0'
  - Else → Q <= D
- Between clock edges → Q holds its value

## Key Concept
Unlike combinational circuits, Q does not change immediately
when D changes. Q only updates on the rising clock edge.
This is synchronized memory — the foundation of all
sequential hardware.

## Skills Demonstrated
- rising_edge(CLK) for clock edge detection
- Synchronous reset
- Clock generation in testbench
- Controlled simulation with done flag
- Understanding combinational vs sequential logic

## Files
| File | Description |
|---|---|
| design.vhd | D flip-flop component |
| testbench.vhd | Testbench with clock generation |
| waveform.png | EPWave screenshot showing clocked behavior |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
T and JK flip-flops — other types of memory elements
with toggle and set/reset behavior.
