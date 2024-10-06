#!/bin/bash

chosen=$(printf "Web Browser\nFile Manager\nTerminal\nPower Menu" | wofi --dmenu)
case "$chosen" in
    "Web Browser") firefox ;;
    "File Manager") nautilus ;;
    "Terminal") kitty ;;
    "Power Menu") wlogout ;;
esac

