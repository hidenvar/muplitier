#!/bin/bash

DIR="../work"

if [ ! -d "$DIR" ]; then
    mkdir "$DIR"
    echo "The 'work' directory has been created in the parent folder!"
fi

ghdl -s --workdir=../work mul_2x2.vhdl && \
ghdl -a --workdir=../work mul_2x2.vhdl && \
ghdl -s --workdir=../work mul_2x2_tb.vhdl && \
ghdl -a --workdir=../work mul_2x2_tb.vhdl && \
ghdl -e --workdir=../work mul_2x2_tb && \

ghdl -r --workdir=../work mul_2x2_tb --vcd=mul_2x2.vcd --stop-time=80ns && \

echo "mul_2x2.vcd is ready"