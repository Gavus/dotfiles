#!/bin/bash -e

force=0
if test "$#" -eq 1; then
	if test "$1" == "--force"; then
		force=1
	fi
fi

install-nvim() {
	version=v0.6.1
	dirname=nvim-linux64
	installpath=$HOME/.local/$dirname
	tarfile=$dirname.tar.gz
	url=https://github.com/neovim/neovim/releases/download/$version/$tarfile
	binpath=$HOME/.local/bin
	
	mkdir -p $binpath
	
	if test -d "$installpath" && test "$force" -eq 0; then
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
	mkdir -p ~/.config
	rm -rf ~/.config/nvim ~/.local/nvim ~/.cache/nvim
	git clone https://github.com/kabinspace/AstroVim ~/.config/nvim
	ln -srf ./astrovim ~/.config/nvim/lua/user
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	nvim --headless -c 'TSInstallSync maintained' -c q
	nvim --headless -c 'LspInstall --sync bashls clangd gopls pyright remark_ls sumneko_lua vimls yamlls' -c q
}

install-dependencies-ubuntu() {
	sudo apt install -y python3-pip clangd gcc unzip
	pip3 install pynvim
}

install-nvim
install-astrovim
