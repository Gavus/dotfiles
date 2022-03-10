#!/bin/bash

declare -a files=(\
  .bashrc \
  .bashrc.d \
  .config/nvim/init.vim \
  .config/nvim/lua/init.lua \
  .gitconfig \
  .inputrc \
  .tmux.conf \
  .vim \
  .vimrc \
)

mkdir -p ~/.config/nvim/lua

for file in "${files[@]}"
do
  mv ~/$file ~/${file}.bak
  ln -sr $file ~/$file
done

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
