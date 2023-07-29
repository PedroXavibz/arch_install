#!/usr/bin/env bash

function cargo_install() {
	cargo install tree-sitter-cli
	cargo install tre-command
	cargo install tlrc
}

function yay_install_softwares() {
	# Installing yay
	build_dir="$HOME"/builds
	mkdir "$build_dir"

	# Cloning
	git clone https://aur.archlinux.org/yay.git "$build_dir"

	# Building
	cd "$build_dir" && makepkg -si

	# Installing with sofwares
	yay -S oh-my-zsh-git wired

}

function set_communs() {
	echo "Configure"
	# oh-my-zsh-git

	# wired

	# Zathura Config

	# Pulseaudio [ Frontend ]

	# Keyboard
}

function init_third() {
  cargo_install
  
  yay_install_softwares

  set_communs
}
