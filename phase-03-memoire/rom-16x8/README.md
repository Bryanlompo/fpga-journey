# ROM 16x8 — VHDL (Synchronous Read-Only Memory)

## Description
A synchronous read-only memory with 16 locations of 8 bits each.
Data is fixed at design time through signal initialization —
it cannot be modified during operation. This is the fundamental
difference from RAM: no write port, no WE signal, no data_in.

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Clock — read synchronized to rising edge |
| addr | in (4-bit) | Address — selects one of 16 locations (0 to 15) |
| data_out | out (8-bit) | Data read from the selected address |

## Difference from RAM
| Feature | RAM | ROM |
|---|---|---|
| WE signal | yes | no |
| data_in | yes | no |
| Write during operation | yes | no |
| Data initialization | runtime | design time |
| Typical use | variables, stack | program, constants |

## Data Initialization
ROM content is defined at elaboration time using signal
initialization — not inside a process:

    signal ROM : ROM_type := (
        0 => "00000000",
        1 => "00000001",
        2 => "00000010",
        3 => "11100000",
        others => "00000000"
    );

The others clause fills all unspecified addresses with the
given value. This is cleaner and safer than initializing
each address individually.

## Why Not Initialize Inside the Process
Assigning ROM(0) <= "00000000" inside a process would be a
write operation at runtime — which contradicts the definition
of ROM. Data must be fixed before simulation starts. Signal
initialization happens at elaboration time, before any clock
edge, making it the correct approach for ROM content.

## Real-World Connection
In FPGA design, ROM is used for:
- Instruction memory (your MIPS processor in Phase 06 will
  use a ROM to store the program — exactly like the MIF files
  from CEG 3556 Lab 2)
- Lookup tables (sin/cos for DSP, gamma correction for video)
- Configuration constants
- Bootloader code

## Simulation Results
| addr | data_out | Notes |
|---|---|---|
| 0000 | 00000000 | initialized value |
| 0001 | 00000001 | initialized value |
| 1111 | 00000000 | covered by others clause |

One clock cycle delay observed between addr change and
data_out update — expected behavior for synchronous ROM.

## Skills Demonstrated
- Read-only memory design
- Signal initialization with aggregate notation
- others clause for default values
- Understanding design-time vs runtime initialization
- Distinction between ROM and RAM interfaces

## Files
| File | Description |
|---|---|
| design.vhd | ROM component with initialized content |
| testbench.vhd | Reads three addresses including an others address |
| waveform.png | EPWave screenshot |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
FIFO (First In First Out) — a queue buffer combining RAM with
read/write pointer logic and full/empty status signals.
