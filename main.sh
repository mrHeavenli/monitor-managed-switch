#!/bin/sh
HELP="--help"
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
	ip link show
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
		# I used to have a error message here, but I kept on getting false errors
		ifconfig $1 up
		exit
	fi	
	
	ifconfig $1 up 
	echo "Done!"
fi
