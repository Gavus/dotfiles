#!/bin/bash

# Source global definitions.
if test -f "/etc/bashrc"; then
    source "/etc/bashrc"
fi

# User specific aliases and functions
if test -d "$HOME/.bashrc.d"; then
    for rc in "$HOME/.bashrc.d/"*".sh"; do
        if test -f "$rc"; then
            source "$rc"
        fi
    done
    unset rc
fi

