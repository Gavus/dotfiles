#!/bin/bash -e

install-nvim() {
	version=v0.7.2
	dirname=nvim-linux64
	installpath=$HOME/.local/share/$dirname-$version
	tarfile=$dirname.tar.gz
	url=https://github.com/neovim/neovim/releases/download/$version/$tarfile
	binpath=$HOME/.local/bin
	
	mkdir -p "$binpath"
	
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
	
	mv "$dirname" "$installpath"
	ln -srf "$installpath/bin/"* "$binpath"
}

install-astrovim() {
	mkdir -p ~/.config
	rm -rf ~/.config/nvim ~/.local/nvim ~/.cache/nvim ~/.local/share/nvim
	git clone https://github.com/kabinspace/AstroNvim ~/.config/nvim
	ln -srf ./astronvim ~/.config/nvim/lua/user
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	nvim --headless -c 'TSInstallSync all' -c q
}

install-dependencies-ubuntu() {
	sudo apt install -y python3-pip clangd gcc unzip
	pip3 install pynvim
}

install-nvim
install-astrovim
