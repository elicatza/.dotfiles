#!/bin/sh


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# FIX: Super slow
# betterlockscreen -u "/home/eliza/.local/share/betterlockscreen-wallpapers/"

setxkbmap -layout "us(intl)" # Need variant to be intl for ISO_Level_3_Shift to work
xmodmap $HOME/.config/X11/custom-dvorak-no
xinput --set-prop 13 'libinput Accel Speed' -1
exec bspwm
