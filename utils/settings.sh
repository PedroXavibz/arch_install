#!/usr/bin/env bash

function set_numlock() {
	echo '#!/bin/bash

for tty in /dev/tty{1..6}
do
    /usr/bin/setleds -D +num < "$tty";
done' >>/usr/local/bin/numlock

	chmod +x /usr/local/bin/numlock

	echo '[Unit]
Description=numlock

[Service]
ExecStart=/usr/local/bin/numlock
StandardInput=tty
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target' >>/etc/systemd/system/numlock.service
}

function set_bluetooth() {
  # Maybe search for some UI
  systemctl enable bluetooth.service --now
}

function set_package_managers() {
	# Sdkman [ Java ]
	curl -s "https://get.sdkman.io" | bash

	# Nvm [ Node ]
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
}

function set_suckless() {
	git clone https://github.com/PedroXavibz/dwm "$HOME"/builds

	git clone https://github.com/PedroXavibz/st "$HOME"/builds

	git clone https://github.com/PedroXavibz/dmenu "$HOME"/builds

	git clone https://github.com/PedroXavibz/dwmblocks "$HOME"/builds
}
