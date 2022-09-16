#!/bin/bash -e

# Bluetooth pairing: Steam button + Y
# Bluetooth start: Steam button + B

# Udev rules for steam flatpak
mkdir steamcontroller
cd steamcontroller
wget https://gitlab.com/fabiscafe/game-devices-udev/-/archive/main/game-devices-udev-main.zip
unzip -np ./game-devices-udev-main.zip game-devices-udev-main/71-valve-controllers.rules > sc.rules
sudo cp ./sc.rules /etc/udev/rules.d/
sudo bash -c "echo 'uinput' > /etc/modules-load.d/uinput.conf"
cd ..
rm steamcontroller -rf

# reboot
