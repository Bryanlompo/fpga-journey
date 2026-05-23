# RAM 16x8 — VHDL (Synchronous)

## Description
A synchronous read/write memory with 16 locations of 8 bits each
(128 bits total). All operations are clocked — reads and writes
only happen on the rising edge of CLK. This is the first memory
component of Phase 03.

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Clock — all operations synchronized to rising edge |
| WE | in | Write Enable — 1=write, 0=read |
| addr | in (4-bit) | Address — selects one of 16 locations (0 to 15) |
| data_in | in (8-bit) | Data to write (used only when WE=1) |
| data_out | out (8-bit) | Data read from memory (updated when WE=0) |

## How It Works
At each rising clock edge:
- WE=1 : ram(addr) receives data_in (write operation)
- WE=0 : data_out receives ram(addr) (read operation)

Only one operation at a time — read or write, never both.

## Internal Structure
type ram_type is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
signal ram : ram_type := (others => "00000000");
A 16-element array where each element is 8 bits. Initialized
to all zeros at startup using (others => "00000000") — this
ensures unwritten addresses return 0x00 instead of undefined.

## Address Conversion
addr is a STD_LOGIC_VECTOR (hardware bus). To use it as an
array index, it must be converted to an integer:

    ram(to_integer(unsigned(addr)))

- unsigned(addr) : interprets the bit vector as a positive number
- to_integer(...) : converts to a VHDL integer usable as index

This is the standard industry approach (NUMERIC_STD library).

## Design Decisions

No reset signal:
A reset would require writing "00000000" to all 16 locations
sequentially. Real industry RAM (DDR3, DDR4, SRAM) does not
implement a global reset for this reason — zeroing gigabytes
would take millions of cycles. Instead, the array is initialized
declaratively at elaboration time.

No internal buffer for data_out:
An internal signal is only needed when you must read your own
output to compute the next value (e.g. Qint <= not Qint in a
flip-flop). Here, data_out is written from ram(...) — it is
never read internally — so no buffer is needed.

NUMERIC_STD instead of STD_LOGIC_UNSIGNED:
STD_LOGIC_UNSIGNED is a non-standard library. NUMERIC_STD is
the official IEEE standard used in industry (Ciena, Nokia, AMD).
The to_integer and unsigned functions both come from NUMERIC_STD.

## Exceptions in VHDL
Unlike software (Python/Java), VHDL has no try/catch or runtime
exceptions. Hardware always produces an output. Edge cases are
handled at design time through type constraints, when others
clauses, and status signals — not at runtime.

## Simulation Results
| Operation | addr | data_in | data_out | Result |
|---|---|---|---|---|
| Write | 1010 | 00011101 | — | ram(10) = 0x1D |
| Read | 0111 | — | 00000000 | Unwritten addr returns 0x00 |
| Read | 1010 | — | 00011101 | Correct recall of written data |
| Overwrite | 1010 | 11111111 | — | ram(10) = 0xFF |
| Read | 1010 | — | 11111111 | New value confirmed |

## Skills Demonstrated
- Synchronous memory design
- Array types in VHDL
- NUMERIC_STD type conversion (to_integer, unsigned)
- Array initialization with (others => ...)
- Understanding of hardware vs software exception handling

## Files
| File | Description |
|---|---|
| design.vhd | RAM component |
| testbench.vhd | Write, read, overwrite sequence |
| waveform.png | EPWave screenshot |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
ROM (Read Only Memory) — memory that can only be read,
initialized at design time with fixed data.
