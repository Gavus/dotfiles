#!/bin/bash

declare -a symlinks=(\
	.bashrc \
	.bashrc.d \
	.inputrc \
	.tmux.conf \
)

for file in "${symlinks[@]}"; do
	mv ~/$file ~/${file}.bak; true
	ln -sr $file ~/$file
done

if test ! -d "~/.tmux/plugins/tpm"; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
