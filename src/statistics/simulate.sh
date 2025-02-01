#!/bin/bash

DIR="../work"

if [ -d "$DIR" ]; then
    rm -rf "$DIR"
    echo "The existing 'work' directory has been removed."
fi

mkdir "$DIR"
echo "A new 'work' directory has been created in the parent folder!"

ghdl -a --workdir="$DIR" "../full_adder/full_adder.vhdl" && \
echo "Analyzing full_adder..." && \

ghdl -a --workdir="$DIR" "../mul_2x2_opt/mul_2x2_opt.vhdl" && \
echo "Analyzing mul_2x2..." && \

ghdl -a --workdir="$DIR" "../adder_8bit/adder_8bit.vhdl" && \
echo "Analyzing adder_8bit..." && \

ghdl -a --workdir="$DIR" "../shift_left_4/shift_left_4.vhdl" && \
echo "Analyzing shift_left_4..." && \

ghdl -a --workdir="$DIR" "../shift_left_2/shift_left_2.vhdl" && \
echo "Analyzing shift_left_2..." && \

ghdl -a --workdir="$DIR" "../shift_left_0/shift_left_0.vhdl" && \
echo "Analyzing shift_left_0..." && \

ghdl -a --workdir="$DIR" "../3-2compressor/3-2compressor.vhdl" && \
echo "Analyzing 3_2compressor..." && \

ghdl -a --workdir="$DIR" "../4-2compressor/4-2compressor.vhdl" && \
echo "Analyzing 4_2compressor..." && \


ghdl -s --workdir="$DIR" ../mul_4x4_with_2x2_opt/mul_4x4_with_2x2_opt.vhdl&& \
ghdl -a --workdir="$DIR" ../mul_4x4_with_2x2_opt/mul_4x4_with_2x2_opt.vhdl&& \
ghdl -s --workdir="$DIR" statistics_tb.vhdl && \
ghdl -a --workdir="$DIR" statistics_tb.vhdl && \
ghdl -e --workdir="$DIR" statistics_tb && \
ghdl -r --workdir="$DIR" statistics_tb --stop-time=5000ns && \

echo "done!"

