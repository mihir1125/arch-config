#!/bin/bash

wl-copy $1
if [[ "$1" -eq 1 ]]; then
	grim - | tee "$HOME/Pictures/Screenshots/Screenshot-$(date +%F_%T).png" | wl-copy && dunstify "Screenshot of the region taken" -t 2000
	exit 0
fi

points="$(slurp)"
if [[ -z "$points" ]]; then
	exit 1
fi

grim -g "$points" - | tee "$HOME/Pictures/Screenshots/Screenshot-$(date +%F_%T).png" | wl-copy && dunstify "Screenshot of the region taken" -t 2000
exit 0
