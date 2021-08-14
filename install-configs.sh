declare -a files=(.config/nvim/init.vim .vimrc .vim .tmux.conf .inputrc .gitconfig .bashrc)

mkdir -p ~/.config/nvim

for file in "${files[@]}"
do
  mv ~/$file ~/${file}.bak
  ln -sr $file ~/$file
done
