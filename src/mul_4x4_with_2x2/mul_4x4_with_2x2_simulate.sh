#!/bin/bash

DIR="../work"
NAME="mul_4x4_with_2x2"

if [ -d "$DIR" ]; then
    rm -rf "$DIR"
    echo "The existing 'work' directory has been removed."
fi

mkdir "$DIR"
echo "A new 'work' directory has been created in the parent folder!"

OPEN_GTKWAVE="no"
if [ "$1" == "yes" ]; then
    OPEN_GTKWAVE="yes"
fi

ghdl -a --workdir="$DIR" "../full_adder/full_adder.vhdl" && \
echo "Analyzing full_adder..." && \

ghdl -a --workdir="$DIR" "../mul_2x2/mul_2x2.vhdl" && \
echo "Analyzing mul_2x2..." && \

ghdl -a --workdir="$DIR" "../adder_8bit/adder_8bit.vhdl" && \
echo "Analyzing adder_8bit..." && \

ghdl -a --workdir="$DIR" "../shift_left_4/shift_left_4.vhdl" && \
echo "Analyzing shift_left_4..." && \

ghdl -a --workdir="$DIR" "../shift_left_2/shift_left_2.vhdl" && \
echo "Analyzing shift_left_2..." && \

ghdl -a --workdir="$DIR" "../shift_left_0/shift_left_0.vhdl" && \
echo "Analyzing shift_left_0..." && \


ghdl -s --workdir="$DIR" "$NAME.vhdl" && \
ghdl -a --workdir="$DIR" "$NAME.vhdl" && \
ghdl -s --workdir="$DIR" "${NAME}_tb.vhdl" && \
ghdl -a --workdir="$DIR" "${NAME}_tb.vhdl" && \
ghdl -e --workdir="$DIR" "${NAME}_tb" && \
ghdl -r --workdir="$DIR" "${NAME}_tb" --vcd="${NAME}.vcd" --stop-time=500ns && \

echo "${NAME}.vcd is ready"

# Open GTKWave if requested
if [ "$OPEN_GTKWAVE" == "yes" ]; then
    echo "Opening GTKWave..."
    gtkwave "${NAME}.vcd"
else
    echo "GTKWave will not be opened. To open it, run the script with 'yes' as an argument."
fi