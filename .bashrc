#!/bin/bash

# Source global definitions.
if test -f /etc/bashrc; then
	source /etc/bashrc
fi

# User specific aliases and functions
if test -d "$HOME/.bashrc.d"; then
	for rc in "$HOME/.bashrc.d/"*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
