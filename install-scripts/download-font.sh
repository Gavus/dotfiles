#!/bin/bash -e

mkdir -p fonts
cd fonts
if test ! -f SourceCodePro.zip; then
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip
fi
unzip -np SourceCodePro.zip Sauce\ Code\ Pro\ Bold\ Nerd\ Font\ Complete\ Mono.ttf > linux-bold.ttf
unzip -np SourceCodePro.zip Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono\ Windows\ Compatible.ttf > windows.ttf
rm SourceCodePro.zip

mkdir -p ~/.fonts
cp ./* ~/.fonts/
fc-cache -fv | grep home
fc-list | grep home

cd -

echo "Done."
