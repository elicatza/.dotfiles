#!/usr/bin/env sh

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

sync_list=("dunst" "zsh" "picom" "tmux" "xinit" "xbindkeys" "alacritty" "bspwm" "nvim" "polybar" "sxhkd" "X11" "neofetch")


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

for i in $(ls "${SCRIPT_DIR}/config"); do
    echo "$i"
done

# # dunst
# if [[ " ${sync_list[@]} " =~ " dunst " ]]; then
    # file_name=""
    # dot_path="${SCRIPT_DIR}/config/dunst/"
    # sys_path="${HOME}/.config/"
# 
    # link $file_name $dot_path $sys_path
# fi
# 
# # zsh
# if [[ " ${sync_list[@]} " =~ " zsh " ]]; then
    # file_name=""
    # dot_path="${SCRIPT_DIR}/config/zsh/"
    # sys_path="${HOME}/.config/"
# 
    # link $file_name $dot_path $sys_path
# fi
# 
# # picom
# if [[ " ${sync_list[@]} " =~ " picom " ]]; then
    # file_name=""
    # dot_path="${SCRIPT_DIR}/config/picom/"
    # sys_path="${HOME}/.config/"
# 
    # link $file_name $dot_path $sys_path
# fi
# 
# # tmux
# if [[ " ${sync_list[@]} " =~ " tmux " ]]; then
    # file_name=""
    # dot_path="${SCRIPT_DIR}/config/tmux/"
    # sys_path="${HOME}/.config/"
# 
    # link $file_name $dot_path $sys_path
# fi
# 
# # xbindkeys
# if [[ " ${sync_list[@]} " =~ " xbindkeys " ]]; then
    # file_name="config"
    # dot_path="${SCRIPT_DIR}/config/xbindkeys/"
    # sys_path="${HOME}/.config/xbindkeys/"
# 
    # link $file_name $dot_path $sys_path
# fi
# 
# # alacritty
# if [[ " ${sync_list[@]} " =~ " alacritty " ]]; then
    # file_name=""
    # dot_path="${SCRIPT_DIR}/config/alacritty/"
    # sys_path="${HOME}/.config/"
# 
    # link $file_name $dot_path $sys_path
# fi
# 
# # bspwm
# if [[ " ${sync_list[@]} " =~ " bspwm " ]]; then
    # file_name=""
    # dot_path="${SCRIPT_DIR}/config/bspwm/"
    # sys_path="${HOME}/.config/"
# 
    # link $file_name $dot_path $sys_path
# fi
# 
# # nvim
# if [[ " ${sync_list[@]} " =~ " nvim " ]]; then
    # file_name="init.lua"
    # dot_path="${SCRIPT_DIR}/config/nvim/"
    # sys_path="${HOME}/.config/nvim/"
# 
    # link $file_name $dot_path $sys_path
# 
    # file_name=""
    # dot_path="${SCRIPT_DIR}/config/nvim/lua/elicatza/"
    # sys_path="${HOME}/.config/nvim/lua/"
# 
    # link $file_name $dot_path $sys_path
# fi
# 
# # Awesome
# if [[ " ${sync_list[@]} " =~ " awesome " ]]; then
    # file_name=""
    # dot_path="${SCRIPT_DIR}/config/awesome/"
    # sys_path="${HOME}/.config/"
# 
    # link $file_name $dot_path $sys_path
# fi
# 
# # polybar
# if [[ " ${sync_list[@]} " =~ " polybar " ]]; then
    # file_name=""
    # dot_path="${SCRIPT_DIR}/config/polybar/"
    # sys_path="${HOME}/.config/"
# 
    # link $file_name $dot_path $sys_path
# fi
# 
# # sxhkd
# if [[ " ${sync_list[@]} " =~ " sxhkd " ]]; then
    # file_name=""
    # dot_path="${SCRIPT_DIR}/config/sxhkd/"
    # sys_path="${HOME}/.config/"
# 
    # link $file_name $dot_path $sys_path
# fi
# 
# # X11
# if [[ " ${sync_list[@]} " =~ " X11 " ]]; then
    # file_name=""
    # dot_path="${SCRIPT_DIR}/config/X11/"
    # sys_path="${HOME}/.config/"
# 
    # link $file_name $dot_path $sys_path
# fi
# 
# # neofetch
# if [[ " ${sync_list[@]} " =~ " neofetch " ]]; then
    # file_name=""
    # dot_path="${SCRIPT_DIR}/config/neofetch/"
    # sys_path="${HOME}/.config/"
# 
    # link $file_name $dot_path $sys_path
# fi
