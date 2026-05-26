# BRAM Single-Port — VHDL (Write-First)

## Description
A Block RAM single-port implementation using the Write-First
pattern. Written in behavioral VHDL using the exact pattern
that Vivado and Quartus recognize for automatic BRAM inference
— no explicit instantiation needed. On a real FPGA, this maps
to dedicated BRAM blocks instead of LUTs, saving logic
resources and improving timing.

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Clock |
| WE | in | Write Enable — 1=write, 0=read only |
| addr | in (4-bit) | Address — 16 locations |
| data_in | in (8-bit) | Data to write |
| data_out | out (8-bit) | Data always reflects ram(addr) |

## RAM behavioral vs BRAM

    RAM behavioral (Phase 03 first project):
    → read only when WE=0 (mutually exclusive)
    → synthesized with LUTs and flip-flops
    → inefficient for large memories

    BRAM (this project):
    → read always active regardless of WE
    → write conditional on WE=1
    → synthesized to dedicated BRAM blocks on FPGA
    → faster, uses zero LUTs for storage

## Write-First Pattern
Write-First means when writing and reading the same address
simultaneously, data_out shows the NEW value being written.
In VHDL, this is expressed by placing the write before
the read in the process:

    if WE = '1' then
        Bram(addr) <= data_in;    -- write first
    end if;
    data_out <= Bram(addr);       -- read always (after write)

Vivado recognizes this ordering and infers WRITE_FIRST mode
on the physical BRAM block.

## Read-First vs Write-First
| Mode | data_out when writing | VHDL pattern |
|---|---|---|
| Write-First | new value | write before read |
| Read-First | old value | read before write |

Write-First chosen because writes are more frequent
than reads in this design — data_out always reflects
the most recently written value immediately.

## Why BRAM Inference Matters
On Artix-7 (Arty A7 target board):
- Each BRAM block = 36Kb of dedicated memory
- Using LUTs for memory wastes routing resources
- Vivado reports BRAM usage separately from LUT usage
- A good FPGA engineer maximizes BRAM usage and
  minimizes LUT-based memory

## Simulation Results
- Write "00011101" to addr="1010" — data_out reflects value
- Write "11111111" to addr="0111" — data_out follows address
- Overwrite addr="1010" with "11111111" — data_out updates
- data_out always active — no WE=0 required for reading

## Skills Demonstrated
- BRAM inference pattern (Write-First)
- Always-active read port
- Difference between behavioral RAM and BRAM
- Synthesis-aware VHDL coding
- Understanding of FPGA physical resources

## Files
| File | Description |
|---|---|
| design.vhd | BRAM single-port Write-First |
| testbench.vhd | Write and read multiple addresses |
| waveform.png | EPWave screenshot |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
BRAM Dual-Port — simultaneous read and write on two
independent ports. Base of video RAM and cache memories.
