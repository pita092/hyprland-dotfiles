#!/bin/bash

# Gruvbox colors
red='\e[38;2;251;73;52m'
yellow='\e[38;2;250;189;47m'
green='\e[38;2;184;187;38m'
aqua='\e[38;2;142;192;124m'
blue='\e[38;2;131;165;152m'
purple='\e[38;2;211;134;155m'
reset='\e[0m'

# Array of colors for the logo
logo_colors=("$red" "$yellow" "$green" "$aqua" "$blue" "$purple")

# Get Fastfetch output
fastfetch_output=$(fastfetch --pipe)

# Read logo and Fastfetch output line by line
logo_lines=()
while IFS= read -r line; do
    logo_lines+=("$line")
done < ~/.config/fastfetch/logo.txt

fastfetch_lines=()
while IFS= read -r line; do
    fastfetch_lines+=("$line")
done <<< "$fastfetch_output"

# Determine the number of lines to process
max_lines=$((${#logo_lines[@]} > ${#fastfetch_lines[@]} ? ${#logo_lines[@]} : ${#fastfetch_lines[@]}))

# Print logo and Fastfetch output side by side
for ((i=0; i<max_lines; i++)); do
    logo_color=${logo_colors[$((i % 6))]}
    logo_line="${logo_lines[$i]:-}"
    fastfetch_line="${fastfetch_lines[$i]:-}"
    printf "${logo_color}%-87s${reset}${blue}%s${reset}\n" "$logo_line" "$fastfetch_line"
done

