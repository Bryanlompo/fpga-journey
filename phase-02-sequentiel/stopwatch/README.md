# Stopwatch — VHDL (Structural + Behavioral)

## Description
A digital stopwatch that counts seconds and minutes, displaying
the result on four 7-segment displays (MM:SS format). This is
the first structural project of Phase 02 — it combines three
previously built components: the clock divider, the 7-segment
decoder, and new behavioral counter logic.

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Fast input clock |
| RST | in | Synchronous reset (returns to 00:00) |
| EN | in | Enable — starts/stops the stopwatch |
| seg_min_diz | out (7-bit) | 7-segment output for minutes tens |
| seg_min_uni | out (7-bit) | 7-segment output for minutes units |
| seg_sec_diz | out (7-bit) | 7-segment output for seconds tens |
| seg_sec_uni | out (7-bit) | 7-segment output for seconds units |

## Architecture — Structural Design
This project instantiates two previously built components.

    CLK (fast)
        |
    clock_div (Phase 02)        -> generates clk_1hz
        |
    Counter logic (behavioral)  -> sec_uni, sec_diz, min_uni, min_diz
        |
    decodeur_7_segment x 4      -> seg_sec_uni, seg_sec_diz,
    (Phase 01)                     seg_min_uni, seg_min_diz

Component instantiation follows the same pattern as testbenches
(component declaration + port map), but used here in production
code — the first real structural design of the roadmap.

## Counter Logic
The counter uses nested if statements to handle cascading:

    if sec_uni = 9 -> reset to 0, increment sec_diz
        if sec_diz = 5 -> reset to 0, increment min_uni
            if min_uni = 9 -> reset to 0, increment min_diz
                if min_diz = 5 -> reset all to 0 (wraps to 00:00)
                else -> min_diz + 1
            else -> min_uni + 1
        else -> sec_diz + 1
    else -> sec_uni + 1

This nested structure correctly handles cascading resets — when
seconds reach 59, minutes increment and seconds reset to 00.

## Simulation vs Real Hardware
The clock divider uses a small threshold for simulation.

    Simulation  -> counter threshold = "011" (divides by 8)
                   1 simulated second = 80ns
                   counters change rapidly, visible on waveforms

    Real board  -> threshold = 49,999,999 (divides by 100,000,000)
                   1 real second = 1 second at 100 MHz
                   only the threshold constant changes

## Waveform Notes
At full simulation scale, seg_sec_uni shows asterisks (*) in
EPWave. This is a display artifact — the signal changes too
frequently to render at 100% zoom. Zooming in reveals correct
transitions. The other signals (seg_sec_diz, seg_min_uni)
show clean transitions confirming correct operation.

## Key Concepts Demonstrated

Structural VHDL:
Instantiating existing components with port map connects
previously verified modules without rewriting their logic.
This is the standard approach for building complex systems
from smaller, tested building blocks.

Cascading counters:
Rather than a single large counter with division, cascaded
counters (0 to 9 for units, 0 to 5 for tens) directly model
the decimal counting structure of a clock display.

Component reuse:
Both clock_div (Phase 02) and decodeur_7_segment (Phase 01)
are reused unchanged. This demonstrates the value of building
well-tested components — they become library elements for
future designs.

## Problems Encountered and Solved

1. Wrong architecture name
Architecture declared as Sequence_detector instead of stopwatch.
VHDL requires the architecture name to match the entity.

2. Assignment to clk_1hz inside process
Attempted else clk_1hz <= 0 inside the counter process.
clk_1hz is driven by the clock_div component and cannot be
assigned from another process. Removed — EN=0 stops counting
naturally without touching clk_1hz.

3. Wrong logical operator
Used & (concatenation) instead of and for compound conditions.
Fixed: sec_diz = "0101" and sec_uni = "1001".

4. Flat if/elsif instead of nested if for counter logic
Flat structure caused incorrect cascading — sec_diz could
increment without sec_uni having reached 9. Fixed with nested
if structure that properly gates each counter level.

5. Missing end if and end process
Several closing keywords were missing or duplicated. Systematic
counting of open/close pairs resolved the issue.

6. All components must be in one design.vhd
GHDL requires all instantiated components to be visible in the
same compilation unit. clock_div, decodeur_7_segment, and
stopwatch were combined into one design.vhd file.

## Files
| File | Description |
|---|---|
| design.vhd | clock_div + decodeur_7_segment + stopwatch |
| testbench.vhd | Runs stopwatch for 2000ns |
| waveform.png | EPWave screenshot showing MM:SS counting |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Phase 02 Complete
This is the final project of Phase 02. All 11 components built:
D flip-flop, T flip-flop, JK flip-flop, 4-bit counter, clock
divider, shift register, debouncer, traffic light FSM, vending
machine FSM, sequence detector 1011, and this stopwatch.

## Next
Phase 03 — Memory and Arithmetic:
RAM, ROM, FIFO, fixed-point multiplier, floating-point arithmetic.
