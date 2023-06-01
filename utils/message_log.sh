#!/usr/bin/env bash

function message() {
	GREEN='\033[0;32m'
	NC='\033[0m\n'
	printf "${GREEN}$1${NC}"
}

function message_success() {
  RED='\033[0;31m'
	NC='\033[0m\n'
	printf "${RED}[!] $1${NC}"
  echo ''
}
