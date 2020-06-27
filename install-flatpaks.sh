#!/usr/bin/env bash

echoerr() { echo "$@" 1>&2; }

setup() {
  echo "Starting setup"
  if [[ ! -f $(which flatpak) ]]; then
      echoerr "Flatpak is not found, you have to install it manually!"
      exit 1
  else
      echo "Flatpak is installed."
  fi

  flatpak remote-list | grep -q flathub
  if [ $? -ne 0 ]; then
    echo "Adding flathub registry"
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user
  else 
    echo "flathub already included."
  fi

  echo "Setup is done."
}

# Main
setup
echo "Installing flatpaks"
flatpak install flathub \
	com.spotify.Client \
	com.valvesoftware.Steam \
	org.gimp.GIMP \
	org.sugarlabs.FotoToon \
	org.telegram.desktop \
	-y

echo "Done"
