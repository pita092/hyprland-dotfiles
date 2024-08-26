#!/bin/bash

# Gruvbox colors
colors=("#fb4934" "#fabd2f" "#b8bb26" "#8ec07c" "#83a598" "#d3869b")
num_colors=${#colors[@]}

# Reduce spread by increasing this number (e.g., 5, 10, 20)
spread_factor=10000000

color_index=0

while IFS= read -r line; do
    for ((i=0; i<${#line}; i++)); do
        char="${line:$i:1}"
        if ((i % spread_factor == 0)); then
            color_index=$((color_index % num_colors))
            current_color=${colors[$color_index]}
            color_index=$((color_index + 1))
        fi
        echo -ne "\e[38;2;$((16#${current_color:1:2}));$((16#${current_color:3:2}));$((16#${current_color:5:2}))m$char"
    done
    echo -e "\e[0m"
done

