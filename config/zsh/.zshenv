# XDG user directories
export XDG_DESKTOP_DIR="${HOME}/doc/desktop"
export XDG_DOCUMENTS_DIR="${HOME}/doc"
export XDG_DOWNLOAD_DIR="${HOME}/dl"
export XDG_MUSIC_DIR="${HOME}/media/music/misc"
export XDG_PICTURES_DIR="${HOME}/media/images"
export XDG_PUBLICSHARE_DIR="${HOME}/doc/public"
export XDG_TEMPLATES_DIR="${HOME}/doc/templates"
export XDG_VIDEOS_DIR="${HOME}/media/videos"

# XDG base directories
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

# Program data location definition
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export GOPATH="${XDG_DATA_HOME}/go"
export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"
export XCURSOR_PATH="/usr/share/icons:${XDG_DATA_HOME}/icons"
export XINITRC="${XDG_CONFIG_HOME}/X11/xinitrc"


# Prefrences
export EDITOR=nvim
export PATH="${HOME}/.local/bin:${PATH}"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export PYTHONPATH="${HOME}/dev/coding/hades/lib/hades"

