#!/bin/bash

DIR="../work"

if [ ! -d "$DIR" ]; then
    mkdir "$DIR"
    echo "The 'work' directory has been created in the parent folder!"
fi

ghdl -a --workdir=../work ../mul_2x2/mul_2x2.vhdl && \
echo "analyzing mul_2x2" &&\

ghdl -s -fsynopsys --workdir=../work mul_4x4_with_2x2.vhdl && \
ghdl -a -fsynopsys --workdir=../work mul_4x4_with_2x2.vhdl && \
ghdl -s -fsynopsys --workdir=../work mul_4x4_with_2x2_tb.vhdl && \
ghdl -a -fsynopsys --workdir=../work mul_4x4_with_2x2_tb.vhdl && \
ghdl -e -fsynopsys --workdir=../work mul_4x4_with_2x2_tb && \

ghdl -r -fsynopsys --workdir=../work mul_4x4_with_2x2_tb --vcd=mul_4x4.vcd --stop-time=500ns && \

echo "mul_4x4.vcd is ready"