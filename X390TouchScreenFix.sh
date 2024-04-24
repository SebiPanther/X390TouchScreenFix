#!/bin/bash
echo "X390TouchScreenFix - Fixing Touch screen  on Lenovo Thinkpad X390 Yoga when several monitors attached"
displayName="eDP-1"
wacomDevices=("Wacom Pen and multitouch sensor Finger touch" "Wacom Pen and multitouch sensor Pen stylus")

xrandrOutput=$(xrandr | grep "${displayName}")

echo "Display Informations for ${displayName}: ${xrandrOutput}"
orientation=none
if [[ "$xrandrOutput" == *" left ("* ]]; then
	orientation=ccw
fi
if [[ "$xrandrOutput" == *" right ("* ]]; then
        orientation=cw
fi
if [[ "$xrandrOutput" == *" inverted ("* ]]; then
        orientation=half
fi
echo "New orientation: ${orientation}"

for ((i = 0; i < ${#wacomDevices[@]}; i++))
do
	wacomDevice="${wacomDevices[$i]}"
	echo "Fixing ${wacomDevice}..."
	xsetwacom --set "${wacomDevice}" MapToOutput "${displayName}"
	xsetwacom --set "${wacomDevice}" Rotate $orientation
done
echo "Done."
