#!/usr/bin/env bash

# Exit if not running inteactively
[[ $- != *i* ]] && return

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/: on  \1/'
}

setopt PROMPT_SUBST
PROMPT='%F{blue}%~%F{reset_color}% $(parse_git_branch) $ %F{reset_color}'

set -o vi
alias startx='startx /home/eliza/.config/X11/xinitrc'
alias xsc='xclip -sel clip'
alias ls='ls --color=auto'


# Source: nvim $(find $fpath -name "edit-command-line" 2> /dev/null)
autoload -z edit-command-line
zle -N edit-command-line
bindkey -v  # zshzls(1)
bindkey "^X^E" edit-command-line

{
    fpath+=("${XDG_DATA_HOME}/zsh/site-functions")

    ## Completion
    zmodload zsh/complist

    bindkey '^N' complete-word
    bindkey '^P' reverse-menu-complete

    bindkey -M menuselect '^ ' accept-line
    bindkey -M menuselect '^e' undo
    bindkey -M menuselect 'h' vi-backward-char
    bindkey -M menuselect 'k' vi-up-line-or-history
    bindkey -M menuselect 'j' vi-down-line-or-history
    bindkey -M menuselect 'l' vi-forward-char

    autoload -Uz compinit; compinit
    _comp_options+=(globdots)  # Enable dotfile completion

    zstyle ':completion:*' complete true
    zstyle ':completion:*' complete-options true
    zstyle ':completion:*' completer _extensions _complete
    zstyle ':completion:*' keep-prefix true
    zstyle ':completion:*' menu select  # Enable menu selection
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
}
