#!/bin/bash -e

toplevel="$(git rev-parse --show-toplevel)"
bashdir="$HOME/.bashrc.d"
bindir="$HOME/.local/bin"
tpmdir="$HOME/.tmux/plugins/tpm"
tpmurl="https://github.com/tmux-plugins/tpm"
vscodedir="$HOME/.config/Code/User"

# Remove symlink if any.
if [[ -L "$bashdir" ]]; then
    rm "$bashdir"
fi

mkdir -p "$bashdir"
ln -srf "$toplevel/bashrc" "$HOME/.bashrc"
ln -srf "$toplevel/bashrc.d/"* "$bashdir/"
ln -srf "$toplevel/inputrc" "$HOME/.inputrc"
ln -srf "$toplevel/tmux.conf" "$HOME/.tmux.conf"

mkdir -p "$bindir"
ln -srf "$toplevel/bin/"* "$bindir/"

if [[ ! -d "$tpmdir" ]]; then
    mkdir -p "$(dirname "$tpmdir")"
    echo "Cloning tmux plugin manager"
    git clone "$tpmurl" --depth=1 "$tpmdir"
fi

if [[ -d "$vscodedir" ]]; then
    ln -srf "$toplevel/vscode/"* "$vscodedir"
fi

echo "Done"
