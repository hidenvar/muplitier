#!/bin/bash

DIR="../work"

if [ ! -d "$DIR" ]; then
    mkdir "$DIR"
    echo "the 'work' directory has been created in the parent folder!"
fi

ghdl -s --workdir=../work mul_4x4_with_1x1.vhdl && \
ghdl -a --workdir=../work mul_4x4_with_1x1.vhdl && \
ghdl -s --workdir=../work mul_4x4_with_1x1_tb.vhdl && \
ghdl -a --workdir=../work mul_4x4_with_1x1_tb.vhdl && \
ghdl -e --workdir=../work MitchellMultiplier_TB && \
ghdl -r --workdir=../work MitchellMultiplier_TB --vcd=mul_1x1.vcd &&\

echo "stimulation was successful."
