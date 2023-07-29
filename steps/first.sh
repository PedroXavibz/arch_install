#!/usr/bin/env bash

# Declare partitions
declare -A partitions=(
	['boot']='/dev/sda1'
	['backup']='/dev/sda2'
	['root']='/dev/sda3'
	['home']='/dev/sda4'
)

function set_default() {
	# Set keymap
	message "[ loadkeys br-abnt2 ] Running command..."
	loadkeys br-abnt2
	message_success 'Keymap set to br-abnt2'

	# Update system clock
	message "[ timedatectl ] Running command..."
	timedatectl
	message_success 'Updated system clock'
}

# Format partitions
function format_partitions() {
	message "[ FORMATING PARTITIONS ]"

	mkfs.fat -F 32 "${partitions['boot']}"
	mkfs.ext4 "${partitions['root']}"
	mkfs.ext4 "${partitions['home']}"

	message_success "Formated
  * ${partitions['boot']}\n
  * ${partitions['root']}\n
  * ${partitions['home']}
  "
}

# Mount file systems
function mount_partitions() {
	message "[ MOUNT PARTITIONS ]"

	mount --mkdir "${partitions['root']}" /mnt/
	message_success "Mounted ROOT partition: /mnt/"

	mount --mkdir "${partitions['boot']}" /mnt/boot
	message_success "Mounted BOOT partition: /mnt/boot"

	mount --mkdir "${partitions['home']}" /mnt/home
	message_success "Mounted HOME partition: /mnt/home"

	mkdir -p /mnt/mnt/backup
	mount "${partitions['backup']}" /mnt/mnt/backup
	message_success "Mounted BACKUP partition: /mnt/backup"
	# /dev/disk/by-label/SHARED /mnt/SHARED auto nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=SHARED 0 0
}

# Install packages
function install_packages() {
	message "[ INSTALING WITH PACSTRAP ]"

	pacstrap -K /mnt base which linux linux-firmware sof-firmware \
		vim man-db man-pages texinfo gcc-libs mtools ntfs-3g \
		pacman-mirrorlist zsh alsa-lib alsa-utils amd-ucode \
		b43-fwcutter broadcom-wl btrfs-progs bzip2 curl device-mapper \
		efibootmgr dosfstools fuse3 fuse-common glib2 glibc gnu-netcat \
		gpart gzip lbzip2 python rsync usbutils tmux wpa_supplicant \
		wireless_tools sudo coreutils grub util-linux util-linux-libs

	message_success "PACSTRAP finished"
}

function generate_fstab() {
	message "[ GENFSTAB ]"
	genfstab -U /mnt >>/mnt/etc/fstab
	message_success "Generated fstab"
}

# Swapfile
function make_swapfile() {
	message "[ CREATING SWAPFILE ]"
	touch /mnt/swapfile
	dd if=/dev/zero of=/mnt/swapfile bs=1G count=2 status=progress

	chmod 0600 /mnt/swapfile
	mkswap -U clear /mnt/swapfile

	swapon /mnt/swapfile

	echo '/swapfile none swap defaults 0 0' >>/mnt/etc/fstab
	cat /mnt/etc/fstab
	message_success "Swapfile created"
}

function init_first() {
	message "   [ 𝕎𝕖𝕝𝕔𝕠𝕞𝕖 𝕥𝕠 𝕒𝕣𝕔𝕙-𝕝𝕚𝕟𝕦𝕩 𝕚𝕟𝕤𝕥𝕒𝕝𝕝𝕖𝕣 ]"

  # 1
  set_default

  # 2
	format_partitions

	# 3
	mount_partitions

	# 4
	install_packages

	# 5
	generate_fstab

	# 6
	make_swapfile

	message "_-_----__-_-_-___-_-----___- [ FINISH #1 ] _-_---__-_-_-___-_----__"
  message "send this folder to the /mnt/root directory, then Excute arch-chroot"
}
