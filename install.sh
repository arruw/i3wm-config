#!/bin/bash

apt install -y \
	python3 \
	python3-pip \
	py3status \
	feh \
	fonts-font-awesome \
	flameshot

pip3 install \
	git+https://github.com/enkore/i3pystatus.git \
	i3ipc

# Brightness
wget -O light_amd64.deb https://github.com/haikarainen/light/releases/download/v1.2/light_1.2_amd64.deb
dpkg -i light_amd64.deb
rm light_amd64.deb

usermod -a -G video $USER

light -N 11

echo "Done. Restart is required."
