#!/bin/bash
set -e

echo "======================================"
echo " OpenSerDes-LP Simulation Runner"
echo "======================================"

echo ""
echo "[1/4] PRBS7 testbench"
verilator --binary --trace rtl/prbs7.sv tb/tb_prbs7.sv --top-module tb_prbs7
./obj_dir/Vtb_prbs7

echo ""
echo "[2/4] Serializer testbench"
verilator --binary --trace rtl/serializer8.sv tb/tb_serializer8.sv --top-module tb_serializer8
./obj_dir/Vtb_serializer8

echo ""
echo "[3/4] PRBS SerDes BER test"
verilator --binary --trace \
rtl/prbs7_byte_gen.sv \
rtl/prbs_checker.sv \
rtl/serializer8.sv \
rtl/deserializer8.sv \
tb/tb_prbs_serdes.sv \
--top-module tb_prbs_serdes
./obj_dir/Vtb_prbs_serdes

echo ""
echo "[4/4] Channel BER test"
verilator --binary --trace \
rtl/prbs7_byte_gen.sv \
rtl/prbs_checker.sv \
rtl/serializer8.sv \
rtl/channel_model.sv \
rtl/deserializer8.sv \
tb/tb_channel_ber.sv \
--top-module tb_channel_ber
./obj_dir/Vtb_channel_ber

echo ""
echo "[Eye Diagram]"
python3 scripts/eye_diagram.py

echo ""
echo "All simulations completed."