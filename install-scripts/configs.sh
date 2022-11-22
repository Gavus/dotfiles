#!/bin/bash -e

toplevel="$(git rev-parse --show-toplevel)"

echo "Creating syslinks"
ln -srf "$toplevel/bashrc" "$HOME/.bashrc"
ln -srf "$toplevel/bashrc.d" "$HOME/.bashrc.d"
ln -srf "$toplevel/inputrc" "$HOME/.inputrc"
ln -srf "$toplevel/tmux.conf" "$HOME/.tmux.conf"
ln -srf "$toplevel/gdbinit" "$HOME/.gdbinit"

mkdir -p "$HOME/.local/bin"
ln -srf "$toplevel/bin/"* "$HOME/.local/bin/"

if test ! -d "$HOME/.tmux/plugins/tpm"; then
	echo "Cloning tmux plugin manager"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Done"
