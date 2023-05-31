#!/usr/bin/env bash

function install_yay() {
  # Yay
  build_dir="$HOME"/builds
  mkdir "$build_dir"
 
  # Cloning
  git clone https://aur.archlinux.org/yay.git "$build_dir"

  # Installing
  cd "$build_dir" &&  makepkg -si
}

function pac_install_softwares() {
  # NOTE: Search more packages
	pacman -S firefox git networkmanager keepassxc ranger \
      preload rust base-devel --needed

  # Bluetooth

  # ST - terminal

  # DWM
}

function yay_install_softwares() {
  yay -S oh-my-zsh-git
}
