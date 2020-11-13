declare -a files=(.config/nvim/init.vim  .local/share/nvim/site/autoload/plug.vim .tmux.conf .inputrc .gitconfig)

mkdir -p ~/.config/nvim ~/.local/share/nvim/site/autoload

for file in "${files[@]}"
do
  mv ~/$file ~/${file}.bak
  ln -sr $file ~/$file
done
