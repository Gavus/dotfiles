#!/bin/bash -e

version=v16.16.0
dirname=node-$version-linux-x64
installpath=$HOME/.local/share/$dirname
tarfile=$dirname.tar.xz
url=https://nodejs.org/dist/$version/$tarfile
binpath=$HOME/.local/bin

mkdir -p "$binpath"

if test -d "$installpath"; then
	echo "nodejs $version is already installed"
	exit 0
fi

if test ! -f ./$tarfile && test ! -d ./$dirname; then
	wget $url
	tar -xvf $tarfile
	rm $tarfile
fi

mv "$dirname" "$installpath"
ln -srf "$installpath/bin/"* "$binpath"