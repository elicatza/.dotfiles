#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

sync_list=("tmux" "xinit" "zsh" "xbindkeys" "alacritty" "bspwm" "nvim" "polybar" "sxhkd" "X11")


function link() {
    if [ -z "${3}" ]; then
        # no name arg given
        local dot_path="${1}"
        local sys_path="${2}"
    else
        local file_name="${1}"
        local dot_path="${2}"
        local sys_path="${3}"
    fi

    printf "Linking: %s\n     To: %s\n\n" "${dot_path}${file_name}" "${sys_path}${file_name}"
    mkdir -p "${sys_path}"
    ln -sf "${dot_path}${file_name}" "${sys_path}${file_name}"
}

# tmux
if [[ " ${sync_list[@]} " =~ " tmux " ]]; then
    file_name="tmux.conf"
    dot_path="${SCRIPT_DIR}/config/tmux/"
    sys_path="${HOME}/.config/tmux/"

    link $file_name $dot_path $sys_path
fi

# xinit
if [[ " ${sync_list[@]} " =~ " xinit " ]]; then
    file_name=".xinitrc"
    dot_path="${SCRIPT_DIR}/"
    sys_path="${HOME}/"

    link $file_name $dot_path $sys_path
fi

# zsh
if [[ " ${sync_list[@]} " =~ " zsh " ]]; then
    file_name=".zshrc"
    dot_path="${SCRIPT_DIR}/"
    sys_path="${HOME}/"

    link $file_name $dot_path $sys_path
fi

# xbindkeys
if [[ " ${sync_list[@]} " =~ " xbindkeys " ]]; then
    file_name=".xbindkeysrc"
    dot_path="${SCRIPT_DIR}/"
    sys_path="${HOME}/"

    link $file_name $dot_path $sys_path
fi

# alacritty
if [[ " ${sync_list[@]} " =~ " alacritty " ]]; then
    file_name="alacritty.yml"
    dot_path="${SCRIPT_DIR}/config/alacritty/"
    sys_path="${HOME}/.config/alacritty/"

    link $file_name $dot_path $sys_path
fi

# bspwm
if [[ " ${sync_list[@]} " =~ " bspwm " ]]; then
    file_name="bspwmrc"
    dot_path="${SCRIPT_DIR}/config/bspwm/"
    sys_path="${HOME}/.config/bspwm/"

    link $file_name $dot_path $sys_path
fi

# nvim
if [[ " ${sync_list[@]} " =~ " nvim " ]]; then
    file_name="init.vim"
    dot_path="${SCRIPT_DIR}/config/nvim/"
    sys_path="${HOME}/.config/nvim/"

    link $file_name $dot_path $sys_path

    file_name=""
    dot_path="${SCRIPT_DIR}/config/nvim/lua/elicatza/"
    sys_path="${HOME}/.config/nvim/lua/"

    link $file_name $dot_path $sys_path
fi

# polybar
if [[ " ${sync_list[@]} " =~ " polybar " ]]; then
    file_name=""
    dot_path="${SCRIPT_DIR}/config/polybar/"
    sys_path="${HOME}/.config/"

    link $file_name $dot_path $sys_path
fi

# sxhkd
if [[ " ${sync_list[@]} " =~ " sxhkd " ]]; then
    file_name="sxhkdrc"
    dot_path="${SCRIPT_DIR}/config/sxhkd/"
    sys_path="${HOME}/.config/sxhkd/"

    link $file_name $dot_path $sys_path
fi

# X11
if [[ " ${sync_list[@]} " =~ " X11 " ]]; then
    file_name="custom-dvorak-no"
    dot_path="${SCRIPT_DIR}/config/X11/"
    sys_path="${HOME}/.config/X11/"

    link $file_name $dot_path $sys_path
fi
