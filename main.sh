#!/usr/bin/env bash

source './utils.sh'

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

function main() {
  message "   [ 𝕎𝕖𝕝𝕔𝕠𝕞𝕖 𝕥𝕠 𝕒𝕣𝕔𝕙-𝕝𝕚𝕟𝕦𝕩 𝕚𝕟𝕤𝕥𝕒𝕝𝕝𝕖𝕣 ]"

  # Setting some configs
  set_default

	source './first.sh'
  first_init
}

# main
