#!/bin/bash -e

toplevel="$(git rev-parse --show-toplevel)"

echo "Creating syslinks"
ln -srf "$toplevel/.bashrc" "$HOME/"
ln -srf "$toplevel/.bashrc.d" "$HOME/"
ln -srf "$toplevel/.inputrc" "$HOME/"
ln -srf "$toplevel/.tmux.conf" "$HOME/"
ln -srf "$toplevel/.gdbinit" "$HOME/"

mkdir -p "$HOME/.local/bin"
ln -srf "$toplevel/bin/"* "$HOME/.local/bin/"

if test ! -d "$HOME/.tmux/plugins/tpm"; then
	echo "Cloning tmux plugin manager"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Done"
