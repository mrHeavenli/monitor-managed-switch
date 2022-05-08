#!/bin/sh
HELP="--help"
# for interface in $(ip link show | grep --colour=never -Eo "[a-z0-9]{2,}:")
if [ $1 = $HELP ]
then
	echo "$0 ADAPTER MODE"
	echo "Must be run with sudo in order to make changes"
	echo
	echo "Modes:"
	echo "1: Managed"
	echo "2: Monitor"
	echo 
	echo "Interfaces:"
	for interface in $(ip link show | grep --colour=never -Eo "[0-9]+: \w{2,}")
	do
		echo $interface | grep --colour=never -Eo "[a-z0-9]{2,}"
	done
else
	echo "Chosen adapter: $1"
	echo "Chosen mode: $2"

	echo "ifconfig $1 down"

	# Need to do this before switching	
	ifconfig $1 down 
	
	# Switches to selected mode
	if [ $2 = 1 ]
	then
		echo "iwconfig $1 mode managed"
		iwconfig $1 mode managed
	
	elif [ $2 = 2 ]
	then
		echo "iwconfig $1 mode monitor"
	        iwconfig $1 mode monitor
	
	else
		ifconfig $1 up
		exit
	fi	
	
	ifconfig $1 up 
	echo "Done!"
fi
