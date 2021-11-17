declare -a files=(.config/nvim/init.vim .config/nvim/lua/init.lua .vimrc .vim .tmux.conf .inputrc .gitconfig .bashrc)

mkdir -p ~/.config/nvim/lua

for file in "${files[@]}"
do
  mv ~/$file ~/${file}.bak
  ln -sr $file ~/$file
done
