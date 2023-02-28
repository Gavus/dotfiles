#!/bin/bash -e

#Keyd is used to remap capslock into esc when tapped and control when held.

git clone https://github.com/rvaiya/keyd
bash -c "cd keyd && make && sudo make install"
rm -rf keyd 
sudo systemctl enable keyd
sudo systemctl start keyd

sudo cat << EOF /etc/keyd/default.conf
[ids]

*

[main]

# Maps capslock to escape when pressed and control when held.
capslock = overload(control, esc)
EOF

sudo keyd reload
