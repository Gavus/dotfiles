#!/bin/bash -e

version=v0.6.1
dirname=nvim-linux64
installpath=/usr/local/$dirname
tarfile=$dirname.tar.gz
url=https://github.com/neovim/neovim/releases/download/$version/$tarfile

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
ln -srf $installpath/bin/* /usr/local/bin/
