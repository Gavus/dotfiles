#!/bin/bash -e

install-nvim() {
	version=v0.6.1
	dirname=nvim-linux64
	installpath=$HOME/.local/$dirname
	tarfile=$dirname.tar.gz
	url=https://github.com/neovim/neovim/releases/download/$version/$tarfile
	binpath=$HOME/.local/bin
	
	mkdir -p $binpath
	
	if test -d "$installpath"; then
		echo "nvim $version is already installed"
		return
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
}

install-astrovim() {
  if test -d "~/.config/nvim"; then
    echo "a nvim configuration already exists."
    return
  fi

	git clone https://github.com/kabinspace/AstroVim ~/.config/nvim
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	mkdir -p ~/.config/nvim/lua/user
	ln -srf ./astrovim-config.lua ~/.config/nvim/lua/user/init.lua
}

install-nvim
install-astrovim
