#!/bin/bash

echoerr() { echo "$@" 1>&2; }

setup() {
  echo "Starting setup"
  if [[ ! -f /usr/bin/flatpak ]]; then
      echoerr "Flatpak is not found, you have to install it manually!"
      exit 1
  else
      echo "Flatpak is installed"
  fi

  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user

  echo "Setup is done."
}

install() {
  name=$1
  install=$2
  path=~/bin/$name

  flatpak install flathub $install -y >/dev/null
  printf "#!/bin/bash \nflatpak run $install \$@\n" > $path
  chmod +x $path
}

# Main
setup
echo "Installing flatpaks"
install moonlight com.moonlight_stream.Moonlight
install retroarch org.libretro.RetroArch
install spotify   com.spotify.Client
install steam     com.valvesoftware.Steam
install telegram  org.telegram.desktop
install vlc       org.videolan.VLC
install pycharm   com.jetbrains.PyCharm-Community
