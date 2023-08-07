#!/usr/bin/env bash

function set_timezone() {
	message "[ SET TIMEZONE ]"

	ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
	hwclock --systohc

	message_success "Sucessfull"
}

function set_location() {
	message "[ SET LOCATION ]"

	vim /etc/locale.gen

	locale-gen
	echo "LANG=pt_BR.UTF-8" >>/etc/locale.conf
	echo "KEYMAP=br-abnt2" >>/etc/vconsole.conf

	message_success "Sucessfull"
}

function set_network() {
	message "[ SET NETWORK ]"

	echo "archlinux" >>/etc/hostname
	echo "127.0.0.1        localhost
::1              localhost
127.0.1.1        archlinux" >>/etc/hosts
	message_success "Sucessfull"
}

function set_bootloader() {
	message "[ INSTALL & CONFIG BOOTLOADER ]"

	grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
	grub-mkconfig -o /boot/grub/grub.cfg

	message_success "Sucessfull"
}

function pac_install_softwares() {
	message "[ PACMAN INSTALL SOFTWARES ]"
	# TODO: chage pacman options and configure mirrors

	# TODO: search packages
	pacman -Sy python-pip firefox git keepassxc ranger \
		wget rust base-devel os-prober xorg-server xorg-apps \
		xorg-xinit neofetch fd picom bat ripgrep fzf sxhkd sxiv \
		exa xf86-video-amdgpu xf86-video-ati mesa zathura bluez bluez-utils \
    pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer \
    pulseaudio-jack pulseaudio-lirc networkmanager dhclient iwd \
    dnsmasq firewalld modemmanager nftables openresolv ppp --needed --noconfirm

	message_success "Sucessfull"
}

function create_user()  {
	message "Creating user Koeila"

	useradd -m -G adm,wheel,lp -s "$(which zsh)" koeila
	passwd koeila

	# Edit sudoers
	vim /etc/sudoers

	message_success "Sucessfull"
}

function init_second() {
	# 1
	set_timezone

	# 2
	set_location

	# 3
	set_network

	# 4
	message "[ SET INITCPIO ]"
	mkinitcpio -P
	message_success "Sucessfull"

	# 5
	message "[ SET ROOT PASSWORD ]"
	passwd
	message_success "Sucessfull"

	# 6
	set_bootloader

	# 7
	pac_install_softwares

	# 8
	create_user

	# Enable services
	systemctl enable NetworkManager.service --now

	message "_-_----__-_-_-___-_-----___- [ FINISH #2 ] _-_---__-_-_-___-_----__-"
}
