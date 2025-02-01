#!/bin/bash

DIR="../work"
NAME="mul_2x2_opt"

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

ghdl -s --workdir="$DIR" "$NAME.vhdl" && \
ghdl -a --workdir="$DIR" "$NAME.vhdl" && \
ghdl -s --workdir="$DIR" "${NAME}_tb.vhdl" && \
ghdl -a --workdir="$DIR" "${NAME}_tb.vhdl" && \
ghdl -e --workdir="$DIR" "${NAME}_tb" && \
ghdl -r --workdir="$DIR" "${NAME}_tb" --vcd="${NAME}.vcd" --stop-time=50ns && \

echo "${NAME}.vcd is ready"

if [ "$OPEN_GTKWAVE" == "yes" ]; then
    echo "Opening GTKWave..."
    gtkwave "${NAME}.vcd"
else
    echo "GTKWave will not be opened. To open it, run the script with 'yes' as an argument."
fi  