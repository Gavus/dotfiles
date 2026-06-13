#!/bin/bash -e

FLATHUB_URL="https://flathub.org/repo/flathub.flatpakrepo"

if [[ ! $(command -v flatpak) ]]; then
  echo "Flatpak is not found, you have to install it manually!"
  exit 1
fi

if ! flatpak remote-list | grep -q flathub; then
  echo "Adding flathub registry"
  flatpak remote-add --if-not-exists flathub $FLATHUB_URL --user
fi

flatpak install flathub --user \
  com.github.tchx84.Flatseal \
  com.vivaldi.Vivaldi \
  org.kde.krita \
  org.signal.Signal \
  org.surge_synth_team.surge-xt \
  -y

echo "Done"
