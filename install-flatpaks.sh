#!/bin/bash

echoerr() { echo "$@" 1>&2; }

setup() {
  echo "Starting setup"
  if [[ ! -f /usr/bin/flatpak ]]; then
      echoerr "Flatpak is not found, you have to install it manually!"
      exit 1
  else
      echo "Flatpak is installed."
  fi

  flatpak remote-list | grep -q flathub
  if [ $? -ne 0 ]; then
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user
  else 
    echo "flathub already included."
  fi

  echo "Setup is done."
}

install() {
  install=$2

  echo "Installing $install..."
  flatpak install flathub $install -y
  echo "Done!"
}

# Main
setup
echo "Installing flatpaks"
install spotify   com.spotify.Client
install steam     com.valvesoftware.Steam
install telegram  org.telegram.desktop

echo "Finished installing flatpaks"
