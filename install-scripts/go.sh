#!/bin/bash -e

version=1.21.3
installpath=~/.local/share/go${version}
tarfile=go${version}.linux-amd64.tar.gz

if test -d "$installpath"; then
	echo "go${version} is already installed"
else
	wget https://go.dev/dl/$tarfile
	tar -xzvf ./$tarfile
	rm $tarfile
	mv go $installpath
	ln -srf $installpath/bin/* ~/.local/bin/
fi
