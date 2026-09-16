# OpenSerDes-LP

Low-Power Mixed-Signal SerDes Link in SKY130 CMOS

## Overview

OpenSerDes-LP is a project that demonstrates the core building blocks of a low-power mixed-signal SerDes link.

Current v0.1 focuses on:
- PRBS7 data generation
- 8:1 serializer
- 1:8 deserializer
- BER checking
- channel error injection
- eye diagram generation
- loss / jitter / noise visualization

This project is intended as an educational and portfolio project for mixed-signal / high-speed I/O / SerDes learning.

---

## Features

- **PRBS7 Generator**
- **8-bit Serializer**
- **8-bit Deserializer**
- **Digital SerDes Loopback**
- **BER Checker**
- **Channel Error Injection**
- **Eye Diagram Generation**
- **Loss / Noise / Jitter Simulation**

---

## Project Structure

```text
OpenSerDes-LP/
├── rtl/
│   ├── prbs7.sv
│   ├── prbs7_byte_gen.sv
│   ├── serializer8.sv
│   ├── deserializer8.sv
│   ├── prbs_checker.sv
│   └── channel_model.sv
├── tb/
│   ├── tb_prbs7.sv
│   ├── tb_serializer8.sv
│   ├── tb_serdes_link.sv
│   ├── tb_prbs_serdes.sv
│   └── tb_channel_ber.sv
├── scripts/
│   ├── run_all.sh
│   └── eye_diagram.py
├── docs/
│   └── results/
│       ├── eye_clean.png
│       ├── eye_lossy.png
│       └── eye_jitter_noise.png
├── analog/
├── layout/
├── README.md
└── LICENSE