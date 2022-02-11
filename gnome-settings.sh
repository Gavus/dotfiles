#!/bin/bash -e

# misc
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,close"
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.session idle-delay 0
#gsettings set org.gnome.desktop.interface scaling-factor 2
# set capslock to escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# interface
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface enable-animations false

# touchpad
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing false
