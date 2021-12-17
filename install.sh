#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $SCRIPT_DIR

echo "Linking: ${SCRIPT_DIR}/config/tmux/tmux.conf with ~/.config/tmux/tmux.conf"
ln -sf $SCRIPT_DIR/config/tmux/tmux.conf ~/.config/tmux/tmux.conf

echo "Linking: ${SCRIPT_DIR}/xinitrc with ~/.xinitrc"
ln -sf ${SCRIPT_DIR}/xinitrc ~/.xinitrc

echo "Linking: ${SCRIPT_DIR}/zshrc with ~/.zshrc"
ln -sf ${SCRIPT_DIR}/zshrc ~/.zshrc

echo "Linking: ${SCRIPT_DIR}/xbindkeysrc with ~/.xbindkeysrc"
ln -sf ${SCRIPT_DIR}/xbindkeysrc ~/.xbindkeysrc

echo "Linking: ${SCRIPT_DIR}/config/alacritty/alacritty.yml with ~/.config/alacritty/alacritty.yml"
ln -sf ${SCRIPT_DIR}/config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

echo "Linking: ${SCRIPT_DIR}/config/bspwm/bspwmrc with ~/.config/bspwm/bspwmrc"
ln -sf ${SCRIPT_DIR}/config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc

echo "Linking: ${SCRIPT_DIR}/config/nvim/init.vim with ~/.config/nvim/init.vim"
ln -sf ${SCRIPT_DIR}/config/nvim/init.vim ~/.config/nvim/init.vim

echo "Linking: ${SCRIPT_DIR}/config/polybar/config with ~/.config/polybar/config"
ln -sf ${SCRIPT_DIR}/config/polybar/config ~/.config/polybar/config

echo "Linking: ${SCRIPT_DIR}/config/polybar/launch.sh with ~/.config/polybar/launch.sh"
ln -sf ${SCRIPT_DIR}/config/polybar/launch.sh ~/.config/polybar/launch.sh

echo "Linking: ${SCRIPT_DIR}/config/sxhkd/sxhkdrc with ~/.config/sxhkd/sxhkdrc"
ln -sf ${SCRIPT_DIR}/config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

echo "Linking: ${SCRIPT_DIR}/config/X11/custom-dvorak-no with ~/.config/X11/custom-dvorak-no"
ln -sf ${SCRIPT_DIR}/config/X11/custom-dvorak-no ~/.config/X11/custom-dvorak-no
