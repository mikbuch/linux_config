#!/bin/bash

mon_num=$(xrandr -q | grep ' connected' | wc -l)

if [ $mon_num -eq 3 ]; then
    xrandr --output DP-2-3 --mode 1920x1080 --pos 0x0 --output DP-2-2 --mode 1920x1080 --pos 1920x0 --output eDP-1 --mode 1920x1080 --pos 3840x0
fi
