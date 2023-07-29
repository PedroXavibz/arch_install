#!/usr/bin/env bash

source './steps/first.sh'
source './steps/second.sh'
source './steps/third.sh'

source './utils/message_log.sh'

while [[ $# -gt 0 ]]; do
	case "$1" in
	--first)
		init_first
		;;
	--second)
		init_second
		;;
	--third)
		init_third
		;;

	*)
		echo "Invalid flag: $1"
		;;
	esac
	shift
done
