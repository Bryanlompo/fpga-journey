# Bidirectional Shift Register (SIPO) — VHDL

## Description
An 8-bit serial-in, parallel-out (SIPO) shift register with
selectable shift direction. On each clock edge, a serial input
bit is shifted into the register, either left or right depending
on the DIR control signal. The full 8-bit value is output in
parallel.

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK | in | Clock |
| RST | in | Synchronous reset |
| EN | in | Enable shifting |
| DIR | in | Direction (0=left, 1=right) |
| Number | in | Serial input bit |
| Output | out (8-bit) | Parallel output |

## Design Choices
- Combined EN and DIR into a 2-bit control vector (EN & DIR)
  to select behavior in a single comparison
- Left shift: A <= A(6 downto 0) & Number (drops MSB)
- Right shift: A <= Number & A(7 downto 1) (drops LSB)
- The dropped bit is the one that "exits" the register

## Key Insight — Control Signal Timing
A subtle behavior was observed at the direction change: the
register performed one final left shift after DIR was meant to
change, because the clock edge sampled the OLD value of DIR.
This illustrates a fundamental principle of synchronous logic:
what matters is the signal value AT the clock edge, not when
it changes in code. This is the basis of setup/hold timing.

## Real-World Connection
Shift registers are the core of serial communication protocols.
UART, SPI, and I2C all use shift registers to convert between
serial and parallel data. Direction matters: UART transmits LSB
first, often using a right shift on the receive side.

## Skills Demonstrated
- Bidirectional shifting with concatenation
- Combined control vector (EN & DIR)
- Serial-to-parallel conversion
- Understanding control signal vs clock edge timing

## Files
| File | Description |
|---|---|
| design.vhd | Shift register component |
| testbench.vhd | Tests left shift, right shift, freeze |
| waveform.png | EPWave screenshot |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
Debouncer — clean up noisy mechanical button signals,
a practical circuit needed for real hardware inputs.
