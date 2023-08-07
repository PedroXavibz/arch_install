#!/usr/bin/env bash

build_dir="$HOME"/builds

function yay_install_softwares() {
	message "[ YAY ]"

	# Cloning
	git clone https://aur.archlinux.org/yay.git "$build_dir/yay"

	# Building
	cd "$build_dir/yay" && makepkg -si

	# Installing with sofwares
	yay -S oh-my-zsh-git wired neovim-git 
}

function cargo_install() {
	message "[ RUST ]"

	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

	cargo install tree-sitter-cli
	cargo install tre-command
	cargo install tlrc
}

function set_communs() {
	echo "Configure"
	# oh-my-zsh-git

	# wired

	# Zathura Config

	# Pulseaudio [ Frontend ]

	# Keyboard
}

function install_suckless() {
	message "[ SUCKLESS ]"

	git clone https://git.suckless.org/dwm "$build_dir/suckless/dwm"

	git clone https://git.suckless.org/st "$build_dir/suckless/st"

	git clone https://git.suckless.org/dmenu "$build_dir/suckless/dmenu"
}

function init_third() {
	mkdir "$build_dir"

	install_suckless

  	yay_install_softwares

  	cargo_install

  # set_communs
}
