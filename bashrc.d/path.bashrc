#!/bin/bash

if test -d "$HOME/bin"; then
	PATH="$HOME/bin:$PATH"
fi

if test -d "$HOME/.local/bin"; then
	PATH="$HOME/.local/bin:$PATH"
fi

export PATH
