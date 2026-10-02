\# Vending Machine Controller using Verilog HDL



A digital vending machine controller designed using \*\*Verilog HDL\*\* and

implemented using a \*\*Finite State Machine (FSM)\*\*. The design accepts

5-cent and 10-cent coins, dispenses a product when the inserted amount

reaches 20 cents, and provides 5-cent change when the customer overpays.



\## Project Overview



This project was developed as a mini project during a VLSI and Digital

Electronics internship.



The vending machine controller demonstrates the use of:



\- Verilog HDL

\- Finite State Machine (FSM)

\- Sequential and combinational logic

\- Testbench-based functional verification

\- Vivado simulation



\## Features



\- Accepts 5-cent and 10-cent coins

\- Product price: 20 cents

\- FSM-based control

\- Automatic product dispensing

\- 5-cent change for 25-cent payment

\- Dedicated Verilog testbench

\- Simulation using Vivado



\## FSM States



| State | Description |

|---|---|

| `IDLE` | Waiting for a coin |

| `S5` | 5 cents inserted |

| `S10` | 10 cents inserted |

| `S15` | 15 cents inserted |

| `DISPENSE` | Product is dispensed |



\## Inputs



| Signal | Description |

|---|---|

| `clk` | System clock |

| `reset` | Reset signal |

| `nickel\_in` | 5-cent coin input |

| `dime\_in` | 10-cent coin input |



\## Outputs



| Signal | Description |

|---|---|

| `dispense\_item` | Activates when the product is dispensed |

| `change\_out` | Activates when 5-cent change is returned |



\## Working Principle



The controller tracks the amount inserted using FSM states.



\### Example 1 — Exact Payment



```text

10 cents → 10 cents → DISPENSE



