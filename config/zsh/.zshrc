#!/usr/bin/env bash

# If not running inteactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='%F{red}%*%F{reset_color}:%F{blue}%~ $ %F{reset_color}'
PS1='%F{red}%*%F{reset_color} %F{blue}$ %F{reset_color}'

set -o vi
alias startx='startx /home/eliza/.config/X11/xinitrc'

autoload -Uz compinit
compinit -D

bindkey -v

# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;34m") \
    LESS_TERMCAP_md=$(printf "\e[1;34m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;35m") \
    man "$@"
}

