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
	com.discordapp.Discord \
	com.microsoft.Teams \
	com.mojang.Minecraft \
	com.slack.Slack \
	com.spotify.Client \
	com.valvesoftware.Steam \
	com.valvesoftware.Steam.CompatibilityTool.Proton \
	flathub org.gimp.GIMP \
	org.remmina.Remmina \
	org.telegram.desktop \
	-y
echo "Done"
