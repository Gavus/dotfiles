#!/bin/bash -e

version="3.2a"
url="https://github.com/nelsonenzo/tmux-appimage/releases/download/$version/tmux.appimage"
install_path="$HOME/.local/bin"

if command -v tmux; then
  if test "$(tmux -V | awk '{print $2}')" = "$version"; then
    echo "Tmux $version is already installed"
    exit 0
  fi
fi

if ! command -v fuse; then
  sudo apt install fuse -y
fi

if ! test -d "$install_path"; then
  mkdir "$install_path"
fi

wget "$url" 
chmod +x ./tmux.appimage
mv ./tmux.appimage "$install_path/tmux"
