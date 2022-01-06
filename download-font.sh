#!/bin/bash -e

mkdir -p fonts
cd fonts
if test ! -f SourceCodePro.zip; then
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip
fi
unzip -np SourceCodePro.zip Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf > linux.ttf
unzip -np SourceCodePro.zip Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Windows\ Compatible.ttf > windows.ttf

echo "Fonts downloaded. Remove 'fonts' directory when installed."
