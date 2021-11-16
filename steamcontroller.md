## Bluetooth pairing
Steam button + Y

## Bluetooth start
Steam button + B

## Udev rules for steam flatpak
```
wget https://gitlab.com/fabiscafe/game-devices-udev/-/archive/main/game-devices-udev-main.zip
unzip ./game-devices-udev-main.zip
sudo cp ./game-devices-udev-main/*.rules /etc/udev/rules.d/
sudo bash -c "echo 'uinput' > /etc/modules-load.d/uinput.conf"
rm -rf ./game-devices-udev-main.zip ./game-devices-udev-main
```
Reboot
