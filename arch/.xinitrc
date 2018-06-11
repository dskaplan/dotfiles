#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

xrandr --auto --output DVI-1 --left-of HDMI-0

#. "~/.cache/wal/colors.sh"
wal -R
xrdb ~/.Xresources
xrdb -merge ~/.cache/wal/colors.Xresources 


xset r rate 400 50


xcape -e 'Caps_Lock=Control_L|A'
