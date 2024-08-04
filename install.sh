#!/usr/bin/env sh

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# Remove name from list to avoid syncing directory
# Reset / Update list command: ls {dotfiles config dir path} | awk '{printf " \"%s\"", $0}'
sync_list=("alacritty" "dunst" "neofetch" "nvim" "tmux" "tridactyl" "xbindkeys" "zathura" "zsh" "sway" "tofi" "waybar")

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
    if [[ " ${sync_list[@]} " =~ " ${i} " ]]; then
        file_name=""
        dot_path="${SCRIPT_DIR}/config/${i}/"
        sys_path="${HOME}/.config/"

        link $file_name $dot_path $sys_path
    fi
done

