declare -a files=(.vim .vimrc .tmux.conf .inputrc .gitconfig)

for file in "${files[@]}"
do
  mv ~/$file ~/${file}.bak
  ln -sr $file ~/$file
done

echo 'export PS1="[\u@\h \w]$ "' >> ~/.bashrc
