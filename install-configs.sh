#!/usr/bin/env bash

declare -a files=(\
  .config/nvim \
  .vimrc \
  .vim \
  .tmux.conf \
  .inputrc \
  .gitconfig \
  .bashrc \
)

mkdir -p ~/.config/nvim/lua

for file in "${files[@]}"
do
  mv ~/$file ~/${file}.bak
  ln -sr $file ~/$file
done
