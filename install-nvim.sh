#!/bin/bash -e
if [ ! -d "squashfs-root" ]; then
	if [ ! -f "nvim.appimage" ]; then
		wget https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage
	fi
	chmod +x ./nvim.appimage
	./nvim.appimage --appimage-extract
fi

sudo cp -r ./squashfs-root/usr /
rm -rf ./squashfs-root ./nvim.appimage
