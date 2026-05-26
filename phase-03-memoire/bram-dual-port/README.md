# BRAM Dual-Port — VHDL (True Dual-Port)

## Description
A True Dual-Port Block RAM with two fully independent and
symmetric ports. Both ports can read and write simultaneously
to any address. Each port has its own write enable, address,
data input, and data output. This is the most powerful BRAM
configuration — used in video RAM, caches, FIFOs, and any
system where two independent masters need concurrent memory
access.

## Interface
| Signal | Direction | Description |
|---|---|---|
| CLK_A | in | Clock for Port A |
| WE_A | in | Write Enable for Port A |
| addr_A | in (4-bit) | Address for Port A |
| din_A | in (8-bit) | Data input for Port A |
| dout_A | out (8-bit) | Data output for Port A |
| CLK_B | in | Clock for Port B |
| WE_B | in | Write Enable for Port B |
| addr_B | in (4-bit) | Address for Port B |
| din_B | in (8-bit) | Data input for Port B |
| dout_B | out (8-bit) | Data output for Port B |

## Architecture — shared variable
The memory array is declared as a shared variable instead
of a signal. This is the fundamental difference from
Single-Port BRAM.

Why shared variable and not signal:
- A signal can only have one driver in VHDL
- Two processes writing to the same signal = conflict = X
- A shared variable can be written by multiple processes
- Writes use := (immediate) instead of <= (deferred)

    shared variable Bram : Bram_type := (others => "00000000");

    -- Process A writes immediately
    Bram(to_integer(unsigned(addr_A))) := din_A;

    -- Process B writes immediately
    Bram(to_integer(unsigned(addr_B))) := din_B;

Reads still use <= to drive output signals:
    dout_A <= Bram(to_integer(unsigned(addr_A)));

## Single Process Implementation
To avoid GHDL delta-cycle ordering issues with shared
variables accessed by two simultaneous clock edges,
both ports are managed in a single process using CLK_A.
Both ports remain fully independent (separate WE, addr,
din, dout) but share the same clock edge for simulation
compatibility.

    process(CLK_A)
    begin
        if rising_edge(CLK_A) then
            if WE_A = '1' then Bram(addr_A) := din_A; end if;
            dout_A <= Bram(addr_A);
            if WE_B = '1' then Bram(addr_B) := din_B; end if;
            dout_B <= Bram(addr_B);
        end if;
    end process;

On ModelSim or Vivado Simulator, two separate processes
with independent clocks work correctly. The single-process
approach is a GHDL simulation workaround.

## Write-First Pattern
Both ports use Write-First — unconditional read after
conditional write ensures dout always reflects the most
recent value at the given address.

## Conflict Handling
When both ports write to the same address simultaneously,
the result is implementation-dependent.

In this simulation:
- Port A wrote "11100111" to addr="0101"
- Port B wrote "01100111" to addr="0101"
- Result: Port A won — not guaranteed on all tools

In production systems conflicts are avoided by:
1. Architectural convention (disjoint address spaces)
2. External arbiter FSM with GRANT_A / GRANT_B states
3. Protocol guarantees (one master writes at a time)

## Problems Encountered and Solved

1. Two processes driving same signal produced X
   Signal can only have one driver in VHDL. Fixed by
   declaring memory as shared variable with := writes.

2. GHDL delta-cycle ordering with simultaneous clocks
   When CLK_A and CLK_B rose at the same time, GHDL
   evaluated the two processes in undefined order,
   causing one port to read a stale value. Fixed by
   merging both ports into a single process.

3. := vs <= confusion
   Inside a process, shared variable writes must use :=
   (immediate assignment). Using <= on a shared variable
   caused simulation errors. Output signals still use <=.

## Simulation Results
- Simultaneous writes to different addresses confirmed
- dout_A and dout_B show correct values after writes
- Write conflict at same address demonstrated
- Simultaneous read of same address by both ports
  dout_A = dout_B = same value confirmed

## Real-World Applications
- Video RAM: CPU writes pixels, VGA reads for display
- MIPS pipeline (Phase 06): IF reads instructions,
  MEM reads/writes data simultaneously
- DMA + CPU concurrent memory access
- Dual-clock FIFO across clock domains

## Skills Demonstrated
- True Dual-Port BRAM design
- shared variable for multi-process memory
- := vs <= distinction (immediate vs deferred)
- GHDL tool limitation analysis and workaround
- Write conflict documentation and mitigation strategies

## Files
| File | Description |
|---|---|
| design.vhd | BRAM True Dual-Port with shared variable |
| testbench.vhd | Simultaneous access and conflict test |
| waveform.png | EPWave screenshot |

## Tools Used
- EDA Playground (online simulation)
- GHDL 5.1.1 (VHDL compiler)
- EPWave (waveform viewer)

## Next Step
Sequential Shift-Add Multiplier — multiply 8x8 bits
without the * operator, using bit shifting and addition
over multiple clock cycles.
