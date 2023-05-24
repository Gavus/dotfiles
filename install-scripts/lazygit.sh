#!/bin/bash

version="0.38.2"
installdir="$HOME/.local/bin"
url="https://github.com/jesseduffield/lazygit/releases/download/v${version}/lazygit_${version}_Linux_32-bit.tar.gz"

mkdir -p "$installdir"
wget -q -O- "$url" | tar -xzv lazygit
chmod +x lazygit
mv lazygit "$installdir"
