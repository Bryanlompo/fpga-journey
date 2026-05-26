# ROM with MIF File Loading — VHDL (textio)

## Description
A synchronous ROM that loads its content from an external text
file at simulation startup, using VHDL's textio library. This
separates memory content from hardware behavior — the same
approach used by Quartus (MIF files) and Vivado (COE files)
in real FPGA development.

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Clock — read synchronized to rising edge |
| addr | in (4-bit) | Address — selects one of 16 locations |
| data_out | out (8-bit) | Data read from selected address |

## Why This Matters
The previous ROM hardcoded data directly in VHDL:
    signal ROM : ROM_type := (0 => "00000000", ...);
Changing data required modifying VHDL and recompiling.

This ROM loads from an external file:
    signal ROM : ROM_type := load_rom("rom_init.txt");
Changing data only requires editing the text file.
This is how real tools work — Quartus reads .mif files,
Vivado reads .coe files, without touching the RTL.

## Key Concepts

### textio
VHDL standard library for file I/O during simulation.
Provides file, line, readline, read, endfile primitives.

### impure function
A function that can access external resources (files,
global signals). Required for file I/O because it has
side effects. Pure functions cannot open files.

### variable vs signal
Inside functions, variables (:=) are used instead of
signals (<=). Variables update immediately — signals
are deferred until end of process. Immediate updates
are required when building a table iteratively.

### How the loader works
Open "rom_init.txt" for reading
Initialize result array to all zeros
Loop until end of file or 16 addresses filled:
a. readline(f, l)  — read one line into buffer
b. read(l, data)   — extract binary vector from buffer
c. result(addr) := data  — store in array
d. addr := addr + 1
Return completed array
File closed automatically at end of function
### The text file format
One binary value per line, one line per address:
00000000    <- address 0
10110101    <- address 1
11111111    <- address 2

## Simulation Results
| addr | data_out | Notes |
|---|---|---|
| 0000 | 00000000 | matches line 1 of rom_init.txt |
| 0001 | 10110101 | matches line 2 of rom_init.txt |
| 1111 | 00000000 | matches line 16 of rom_init.txt |

One clock cycle delay between addr change and data_out
update — expected behavior for synchronous ROM.

## Real-World Connection
In CEG 3556 Lab 2 (MIPS single-cycle processor), MIF files
were used to initialize the instruction memory and data memory.
This project implements the same concept from scratch, without
relying on Quartus LPM blocks or GUI tools.

On a real Arty A7 with Vivado, the load_rom function would
be replaced by a Block Memory Generator IP configured with
a .coe initialization file — same concept, different tool.

## Skills Demonstrated
- VHDL file I/O with textio library
- impure functions for side-effecting initialization
- variable vs signal distinction
- Separation of data and behavior (MIF/COE pattern)
- Industrial memory initialization methodology

## Files
| File | Description |
|---|---|
| design.vhd | ROM component with textio loader |
| testbench.vhd | Reads addresses 0, 1, and 15 |
| rom_init.txt | Memory initialization file (16 binary values) |
| waveform.png | EPWave screenshot confirming file loading |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
Block RAM Single-Port — inferring BRAM on FPGA fabric,
write/read synchronous operations, Vivado verification.
