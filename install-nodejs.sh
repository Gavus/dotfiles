#!/bin/bash -e

version=v16.13.1
dirname=node-$version-linux-x64
maindir=.nodejs
tarfile=$dirname.tar.xz
url=https://nodejs.org/dist/$version/$tarfile
installpath=~/$maindir/$dirname

if test -d "$installpath"; then
	echo "nodejs $version is already installed"
	exit 0
fi

if test ! -f ./$tarfile && test ! -d ./$dirname; then
	wget $url
	tar -xvf ./$tarfile
	rm ./$tarfile
fi

mkdir -p ~/.nodejs ~/bin
mv ./$dirname ~/$maindir/
ln -srf ~/$maindir/$dirname/bin/* ~/bin/
