#!/bin/bash -e

toplevel="$(git rev-parse --show-toplevel)"
bashdir="$HOME/.bashrc.d"
bindir="$HOME/.local/bin"

# Remove symlink if any.
if [[ -L "$bashdir" ]]; then
    rm "$bashdir"
fi

mkdir -p "$bashdir" "$HOME/.config/zellij"
ln -srf "$toplevel/bashrc" "$HOME/.bashrc"
ln -srf "$toplevel/bashrc.d/"* "$bashdir/"
ln -srf "$toplevel/inputrc" "$HOME/.inputrc"
ln -srf "$toplevel/zellij.kdl" "$HOME/.config/zellij/config.kdl"
ln -srf "$toplevel/kitty" "$HOME/.config/kitty"

mkdir -p "$bindir"
ln -srf "$toplevel/bin/"* "$bindir/"

echo "Done"
