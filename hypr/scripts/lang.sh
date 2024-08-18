#!/bin/bash

# Get the current keyboard layout
current_layout=$(hyprctl getoption input:kb_layout | grep -oP '(?<=str: )\w+')

# Toggle between 'us' and 'il' (Hebrew)
if [ "$current_layout" = "us" ]; then
    new_layout="il"
    layout_name="Hebrew"
else
    new_layout="us"
    layout_name="English (US)"
fi

# Set the new layout
hyprctl keyword input:kb_layout $new_layout

# Notify the user
notify-send "Keyboard Layout" "Switched to $layout_name" -i input-keyboard -t 2000

echo "Switched to $layout_name layout"

