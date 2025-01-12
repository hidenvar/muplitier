#!/bin/bash

DIR="../work"

if [ ! -d "$DIR" ]; then
    mkdir "$DIR"
    echo "the 'work' directory has been created in the parent folder!"
fi

ghdl -s --workdir=../work mul_1x1.vhdl && \
ghdl -a --workdir=../work mul_1x1.vhdl && \
ghdl -s --workdir=../work mul_1x1_tb.vhdl && \
ghdl -a --workdir=../work mul_1x1_tb.vhdl && \
ghdl -e --workdir=../work mul_1x1_tb && \
ghdl -r --workdir=../work mul_1x1_tb --wave=mul_1x1.ghw --stop-time=50ns &&\

echo "mul_1x1.ghw is ready"