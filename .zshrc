#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='%F{red}%*%F{reset_color}:%F{blue}%~ $ %F{reset_color}'

set -o vi
