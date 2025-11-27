#!/bin/bash -e

toplevel="$(git rev-parse --show-toplevel)"

mkdir -p "$HOME/.bashrc.d"
cp -f "$toplevel/bashrc" "$HOME/.bashrc"
cp -f "$toplevel/bashrc.d/"* "$HOME/.bashrc.d/"
cp -f "$toplevel/inputrc" "$HOME/.inputrc"
cp -f "$toplevel/tmux.conf" "$HOME/.tmux.conf"

mkdir -p "$HOME/.local/bin"
cp -f --remove-destination "$toplevel/bin/"* "$HOME/.local/bin/"

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    echo "Cloning tmux plugin manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Done"
