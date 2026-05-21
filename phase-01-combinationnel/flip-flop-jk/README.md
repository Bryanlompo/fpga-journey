# JK Flip-Flop — VHDL

## Description
The most versatile flip-flop, combining all behaviors of D and
T flip-flops. Based on inputs J and K, it can hold, reset, set,
or toggle the output on each rising clock edge.

## Behavior
| J | K | Action |
|---|---|---|
| 0 | 0 | Hold (Q unchanged) |
| 0 | 1 | Reset (Q <= 0) |
| 1 | 0 | Set (Q <= 1) |
| 1 | 1 | Toggle (Q <= not Q) |

## Implementation Notes
- Uses an internal signal Qint to enable read-modify-write
- J and K concatenated into a 2-bit vector for case statement
- Required an intermediate signal (JK) to resolve the type
  ambiguity of the & operator under GHDL

## Debugging Note
The expression "case J & K is" failed to compile because GHDL
could not resolve the type of the concatenation. Fixed by
declaring an explicit signal JK : STD_LOGIC_VECTOR(1 downto 0)
and assigning JK <= J & K before the case statement.

## Skills Demonstrated
- Concatenation operator & with explicit typing
- case statement on multi-bit vector
- Synchronous reset priority over JK logic
- Debugging type resolution errors

## Files
| File | Description |
|---|---|
| design.vhd | JK flip-flop component |
| testbench.vhd | Testbench covering all 4 JK states |
| waveform.png | EPWave screenshot |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
4-bit Counter — using flip-flops to build a counter that
increments on each clock edge.
