#!/bin/bash

DIR="../work"

if [ ! -d "$DIR" ]; then
    mkdir "$DIR"
    echo "the 'work' directory has been created in the parent folder!"
fi

ghdl -s -fsynopsys --workdir=../work mul_4x4_with_1x1.vhdl && \
ghdl -a -fsynopsys --workdir=../work mul_4x4_with_1x1.vhdl && \
ghdl -s -fsynopsys --workdir=../work 4-2_compressor.vhdl && \
ghdl -a -fsynopsys --workdir=../work 4-2_compressor.vhdl && \
ghdl -s -fsynopsys --workdir=../work mul_4x4_with_1x1_tb.vhdl && \
ghdl -a -fsynopsys --workdir=../work mul_4x4_with_1x1_tb.vhdl && \
ghdl -e -fsynopsys --workdir=../work tb_Multiplier4x4 && \
ghdl -r -fsynopsys --workdir=../work tb_Multiplier4x4 --vcd=mul_4x4_with_1x1.vcd &&\

echo "stimulation was successful."
