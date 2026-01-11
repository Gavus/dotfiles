#!/bin/bash -e

toplevel="$(git rev-parse --show-toplevel)"
bashdir="$HOME/.bashrc.d"
bindir="$HOME/.local/bin"
tpmdir="$HOME/.tmux/plugins/tpm"
tpmurl="https://github.com/tmux-plugins/tpm"

# Remove symlink if any.
if [[ -L "$bashdir" ]]; then
    rm "$bashdir"
fi

mkdir -p "$bashdir"
cp --remove-destination "$toplevel/bashrc" "$HOME/.bashrc"
cp --remove-destination "$toplevel/bashrc.d/"* "$bashdir"
cp --remove-destination "$toplevel/inputrc" "$HOME/.inputrc"
cp --remove-destination "$toplevel/tmux.conf" "$HOME/.tmux.conf"

mkdir -p "$bindir"
cp --remove-destination "$toplevel/bin/"* "$bindir"

if [[ ! -d "$tpmdir" ]]; then
    mkdir -p "$(dirname "$tpmdir")"
    echo "Cloning tmux plugin manager"
    git clone "$tpmurl" --depth=1 "$tpmdir"
fi

echo "Done"
