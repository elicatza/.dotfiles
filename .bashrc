#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\e[0;31m\t\e[0m:\e[0;34m\w $ \e[0m'

set -o vi
