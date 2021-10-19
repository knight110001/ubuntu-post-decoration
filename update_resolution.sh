#!/bin/bash
xrandr
cvt 1920 1080

sudo xrandr --newmode "1920x1080" 173.00   1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
sudo xrandr --addmode VGA-1 1920x1080
sudo xrandr --output VGA-1 --mode 1920x1080
