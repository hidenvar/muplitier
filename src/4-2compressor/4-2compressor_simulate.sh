#!/bin/bash

DIR="../work"


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

ghdl -s --workdir="$DIR" 4-2compressor.vhdl && \
ghdl -a --workdir="$DIR" 4-2compressor.vhdl && \
ghdl -s --workdir="$DIR" 4-2compressor_tb.vhdl && \
ghdl -a --workdir="$DIR" 4-2compressor_tb.vhdl && \
ghdl -e --workdir="$DIR" compressor4_2_tb && \
ghdl -r --workdir="$DIR"  compressor4_2_tb --vcd=Compressor4_2_tb.vcd --stop-time=50ns && \

echo Compressor4_2_tb.vcd is ready

if [ "$OPEN_GTKWAVE" == "yes" ]; then
    echo "Opening GTKWave..."
    gtkwave Compressor4_2_tb.vcd
else
    echo "GTKWave will not be opened. To open it, run the script with 'yes' as an argument."
fi