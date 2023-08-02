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
export TEXMFVAR="${XDG_CACHE_HOME}/texlive/texmf-var"
export PYTHONSTARTUP="/etc/python/pythonrc"

# Prefrences
export EDITOR=nvim
export PAGER=less
export PATH="${HOME}/.local/bin:${PATH}"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export PYTHONPATH="${HOME}/dev/coding/hades/lib/hades"
export LS_COLORS="di=34"

# Dark theme
export GTK_THEME="Adwaita:dark"
export GTK2_RC_FILES="/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc"
export QT_STYLE_OVERRIDE="adwaita-dark"

# Less theme
export LESS_TERMCAP_mb=$'\x1b[1;34m'
export LESS_TERMCAP_md=$'\x1b[1;34m'
export LESS_TERMCAP_me=$'\x1b[0m'
export LESS_TERMCAP_se=$'\x1b[0m'
export LESS_TERMCAP_so=$'\x1b[1;44;33m'
export LESS_TERMCAP_ue=$'\x1b[0m'
export LESS_TERMCAP_us=$'\x1b[1;35m'
export GROFF_NO_SGR=1
