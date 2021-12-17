#!/bin/sh


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# FIX: Super slow
# betterlockscreen -u "/home/eliza/.local/share/betterlockscreen-wallpapers/"

xmodmap $HOME/.config/X11/custom-dvorak-no
exec bspwm
