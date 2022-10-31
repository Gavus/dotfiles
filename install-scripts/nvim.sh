#!/bin/bash -e

install-nvim() {
	local version="v0.8.0"
	local dirname="nvim-linux64"
	local installpath="$HOME/.local/share/$dirname-$version"
	local tarfile="$dirname.tar.gz"
	local url="https://github.com/neovim/neovim/releases/download/$version/$tarfile"
	local binpath="$HOME/.local/bin"

	mkdir -p "$binpath"

	if test -d "$installpath"; then
		echo "nvim $version is already installed"
		ln -srf "$installpath/bin/"* "$binpath"
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
}

install-treesitters() {
	nvim --headless -c 'TSInstallSync all' -c q
}

install-mason-packages() {
	local packages=(\
		bash-language-server
		clangd
		codespell
		grammarly-languageserver
		misspell
		pyright
		shellcheck
		sourcery
	)

	for i in "${!packages[@]}"; do
	nvim --headless -c "MasonInstall ${packages[i]}" -c "qall"
	done
}

install-dependencies-ubuntu() {
	sudo apt install -y python3-pip clangd gcc unzip
	pip3 install pynvim
}

# Only run if executed, not sourced.
if test "$0" = "${BASH_SOURCE[0]}"; then
	cd "$(git rev-parse --show-toplevel)"
	install-nvim
	install-astrovim
	install-treesitters
	install-mason-packages
fi
