#!/bin/bash

# convert hex to rgb
hex_to_rgb() {
	hex=${1#\#}
	local -a rgb=(0 0 0)
	for i in {0..4..2}; do
		echo "i: $i"
		echo "hex: ${hex:i:2}"
		printf -v rgb[i/2] "%d" $((16#${hex:i:2}))
	done
	printf "%s\n" ${rgb[@]}
}

hex_to_rgb $1
