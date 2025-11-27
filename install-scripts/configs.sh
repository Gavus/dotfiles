#!/bin/bash -e

toplevel="$(git rev-parse --show-toplevel)"

mkdir -p "$HOME/.bashrc.d"
cp --remove-destination "$toplevel/bashrc" "$HOME/.bashrc"
cp --remove-destination "$toplevel/bashrc.d/"* "$HOME/.bashrc.d/"
cp --remove-destination "$toplevel/inputrc" "$HOME/.inputrc"
cp --remove-destination "$toplevel/tmux.conf" "$HOME/.tmux.conf"

mkdir -p "$HOME/.local/bin"
cp --remove-destination "$toplevel/bin/"* "$HOME/.local/bin/"

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    echo "Cloning tmux plugin manager"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

echo "Done"
