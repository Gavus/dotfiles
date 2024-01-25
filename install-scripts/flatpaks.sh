#!/bin/bash -e

# shellcheck disable=2046

if test ! $(command -v flatpak); then
    echo "Flatpak is not found, you have to install it manually!"
    exit 1
fi

if test $(flatpak remote-list | grep -q flathub); then
    echo "Adding flathub registry"
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user
fi

flatpak install flathub --user \
    com.discordapp.Discord \
    com.microsoft.Teams \
    com.mojang.Minecraft \
    com.slack.Slack \
    com.spotify.Client \
    com.valvesoftware.Steam \
    com.valvesoftware.Steam.CompatibilityTool.Proton \
    com.valvesoftware.Steam.Utility.steamtinkerlaunch \
    org.freedesktop.Platform.ffmpeg-full \
    org.mozilla.firefox \
    org.remmina.Remmina \
    org.telegram.desktop \
    org.videolan.VLC \
    -y

echo "Done"
