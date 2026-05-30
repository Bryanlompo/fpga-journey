import cocotb
from cocotb.triggers import RisingEdge, Timer

async def clock_gen(dut):
    while True :
        dut.CLK.value=0
        await Timer(5, units='ns')
        dut.CLK.value=1 
        await Timer(5, units='ns')

async def reset(dut):
    dut.RST.value=1
    dut.Start.value=0 
    await RisingEdge(dut.CLK)
    await RisingEdge(dut.CLK)
    dut.RST.value=0

async def run_division(dut,Dividende,Diviseur):
    dut.Start.value=1
    dut.Dividende.value=Dividende
    dut.Diviseur.value= Diviseur
    await RisingEdge(dut.CLK)
    dut.Start.value=0
    for _ in range(15):
        await RisingEdge(dut.CLK)
    return dut.Resultat.value
@cocotb.test()
async def test_diviseur(dut):
    cocotb.start_soon(clock_gen(dut))
    await reset(dut)
    cas = [
    (37,  5,  7),
    (20,  4,  5),
    (255, 3, 85),
    (0,   5,  0),
    (7,   9,  0),
]
    for Dividende, Diviseur, expected in cas:
        result = await run_division(dut, Dividende, Diviseur)
        assert result == expected, f"Attendu {expected}, obtenu {result}"
