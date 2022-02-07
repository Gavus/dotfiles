#!/bin/bash -e

version=v16.13.2
dirname=node-$version-linux-x64
installpath=/usr/local/$dirname
tarfile=$dirname.tar.xz
url=https://nodejs.org/dist/$version/$tarfile

if test -d "$installpath"; then
	echo "nodejs $version is already installed"
	exit 0
fi

if test ! -f ./$tarfile && test ! -d ./$dirname; then
	wget $url
	tar -xvf $tarfile
	rm $tarfile
fi

mv $dirname $installpath
ln -srf $installpath/bin/* /usr/local/bin/
