#!/bin/bash -e

#Keyd is used to remap capslock into esc when tapped and control when held.

git clone https://github.com/rvaiya/keyd --depth 1 -b v2.4.3
bash -c "cd keyd && make && sudo make install" || true
rm -rf keyd 
sudo systemctl enable keyd
sudo systemctl start keyd

sudo cp ./install-scripts/keyd.conf /etc/keyd/default.conf
sudo keyd reload
