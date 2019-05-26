#!/bin/bash

if [ ! $BOOEYSAYS ] || [ ! $BOOEYSBIN ]; then
	function presentoption(){
		echo -e "This system is not been prep'd for any DX2DG's scripts.\n\nWould you like to:\n\n\t1)	Copy the script into the system's current bin directory and use it that way.\n\n\tor...\n\n2)	Prep the system and install the script the way it was meant to be installed.\n\n"
		read -p '[1/2] :  ' -n 1 -r installchoice
		case $installchoice in
		1)
			install_noprep
			;;
		2)
			prep_then_install
			;;
		*)
			echo -e "Error! Invalid option"
			unset installchoice
			presentoption
			;;
		esac
		unset installchoice
	}
	presentoption;
fi
