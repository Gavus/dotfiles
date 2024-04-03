#!/bin/bash
# shellcheck disable=1091,1090

# Always enter tmux if possible
if command -v tmux &> /dev/null \
    && [[ "$PS1" != "" ]] \
    && [[ ! "$TERM" =~ screen ]] \
    && [[ ! "$TERM" =~ tmux ]] \
    && [[ "$TMUX" = "" ]]; then
    tmux attach || exec tmux new-session && exit;
fi

# Source global definitions.
if [[ -f "/etc/bashrc" ]]; then
    source "/etc/bashrc"
fi


# User specific aliases and functions
if [[ -d "$HOME/.bashrc.d" ]]; then
    for rc in "$HOME/.bashrc.d/"*".bashrc"; do
        if [[ -f "$rc" ]]; then
            source "$rc"
        fi
    done
    unset rc
fi
