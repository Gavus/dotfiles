#!/bin/bash

declare -a files=(\
  .bashrc \
  .bashrc.d \
  .gitconfig \
  .inputrc \
  .tmux.conf \
)

for file in "${files[@]}"
do
  mv ~/$file ~/${file}.bak
  ln -sr $file ~/$file
done

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
