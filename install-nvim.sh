#!/bin/bash -e

version=v0.6.1
dirname=nvim-linux64
installpath=$HOME/.local/$dirname
tarfile=$dirname.tar.gz
url=https://github.com/neovim/neovim/releases/download/$version/$tarfile
binpath=$HOME/.local/bin

mkdir -p $binpath

if test -d "$installpath"; then
	echo "nvim $version is already installed"
	exit 0
fi

if test ! -d "$dirname"; then
	if [ ! -f "$tarfile" ]; then
		wget $url
	fi
	tar -xzvf $tarfile
	rm $tarfile
fi

mv $dirname $installpath
ln -srf $installpath/bin/* $binpath
