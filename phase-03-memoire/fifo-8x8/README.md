# FIFO 8x8 — VHDL (Synchronous First-In First-Out Buffer)

## Description
A synchronous FIFO buffer with 8 locations of 8 bits each.
Data is stored and retrieved in first-in first-out order.
Includes full and empty status flags to prevent overflow
and underflow. This is a portfolio project — FIFOs are
universal components found in every communication system.

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Clock |
| RST | in | Synchronous reset — clears pointers and flags |
| WE_EN | in | Write Enable — write data_in when full=0 |
| RD_EN | in | Read Enable — read data_out when empty=0 |
| data_in | in (8-bit) | Data to write |
| data_out | out (8-bit) | Data read (FIFO order) |
| full | out | 1 when FIFO is full — writes will be ignored |
| empty | out | 1 when FIFO is empty — reads will be ignored |

## How It Works

Internal structure:
- A RAM array of 8 locations (the buffer)
- write_ptr : points to the next write location
- read_ptr : points to the next read location
- Both pointers wrap around (0 to 7 then back to 0)

EMPTY detection:
    write_ptr = read_ptr
    Both pointers at the same location means everything
    written has been read — nothing left to read.

FULL detection:
    write_ptr + 1 = read_ptr
    The next write would land on an unread location —
    writing would overwrite data not yet consumed.

## Back-Pressure

When the FIFO is full, new writes are silently ignored
(WE_EN=1 but full=1 → no write occurs). The producer
must check full before writing. This is called
back-pressure — the FIFO signals to the producer
that it must wait.

Two ways to handle back-pressure:
- Simple: wait until full = '0' in testbench
- Robust: a producer FSM with WRITE/WAIT states that
  automatically resumes when space is available

This is the pattern used in UART TX buffers, DMA engines,
and network packet buffers — anywhere a fast producer
feeds a slow consumer.

## NUMERIC_STD and Unsigned Pointers
Pointers are declared as unsigned instead of
STD_LOGIC_VECTOR to enable direct arithmetic (+1)
without explicit conversion. This is the correct
approach with the NUMERIC_STD library.

    signal write_ptr : unsigned(2 downto 0) := "000";
    signal read_ptr  : unsigned(2 downto 0) := "000";

## VHDL Signal Assignment Timing
A key insight during development: in VHDL, signal
assignments (<=) are deferred — the new value only
takes effect after the process ends. To test the
future value of a pointer after incrementing:

    write_ptr <= write_ptr + 1;
    if write_ptr + 1 = read_ptr then  -- tests future value
        full_int <= '1';
    end if;

write_ptr still holds its old value during the test,
so write_ptr + 1 gives the value it will have next cycle.

## Simulation Results
- 8 values written successfully, FIFO reaches full=1
- 9th write ignored (full=1) — correct behavior
- Values read back in FIFO order (first written = first read)
- empty=1 after all data consumed
- RST resets pointers and flags correctly

## Skills Demonstrated
- Circular buffer with wrap-around pointers
- Full and empty flag logic
- unsigned type for arithmetic in NUMERIC_STD
- Deferred signal assignment timing in VHDL
- Back-pressure concept and producer/consumer pattern

## Files
| File | Description |
|---|---|
| design.vhd | FIFO component |
| testbench.vhd | Write 8 values, trigger full, read all, test RST |
| waveform.png | EPWave screenshot |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
ROM initialized from MIF/COE file — pre-loading memory
with fixed data (lookup tables, program instructions).
