#!/bin/bash

username=$USER
if [ "$username" == "root" ]
then
	echo "Run this script without sudo..."
	exit 1
fi

sudo apt update
sudo apt install -y \
	i3
	python3 \
	python3-pip \
	py3status \
	feh \
	fonts-font-awesome \
	flameshot \
	redshift \
	scrot \
	compton
sudo pip3 install \
	git+https://github.com/enkore/i3pystatus.git \
	i3ipc

# Brightness
sudo wget -O light_amd64.deb https://github.com/haikarainen/light/releases/download/v1.2/light_1.2_amd64.deb
sudo dpkg -i light_amd64.deb
sudo rm light_amd64.deb
sudo light -N 11
cat << EOF | sudo tee -a /etc/sudoers

# i3wm config for $username
$username ALL=(ALL:ALL) NOPASSWD: /usr/bin/light
$username ALL=(ALL:ALL) NOPASSWD: /home/$username/.config/i3/exit.sh
EOF

# Fonts
# mkdir -p ~/.fonts
# wget https://use.fontawesome.com/releases/v5.8.2/fontawesome-free-5.8.2-desktop.zip
# unzip fontawesome-free-5.8.2-desktop.zip
# rm fontawesome-free-5.8.2-desktop.zip
# cp fontawesome-free-5.8.2-desktop/otfs/*.otf ~/.fonts
# rm -rf fontawesome-free-5.8.2-desktop/

echo "Done. Restart is required."
