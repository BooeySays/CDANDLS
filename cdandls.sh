#!/bin/bash

# File: cdandls.sh
# Lang: Bash script
# Func: cd
# Desc: New function to replace old cd command to automatically
#	run ls command to list contents of a dir after cd'ing
#	into the dir.
# Inst: Add cdandls.sh to autoload script to load cd function

__version__=1.2
function cdandls(){
if [ $# == '0' ]; then
	echo -e "Function missing ARG\nRun with --help for more information";
elif [ $1 == '--help' ] || [ $1 == '-h' ] || [ $1 == '-?' ]; then
	echo -e "HELP PAGE TO GO HERE"
elif [ $1 == '-v' ] || [ $1 == '--version' ]; then
	echo -e "CDANDLS v$__version__";
else
	builtin cd "$1";
	echo -e "\e[01;37m ";	# Line to make default text white
	ls -aF --color=always --group-directories-first;
	# Uncomment line below to add extra line at the bottom
	# that displays current directory
	#echo -e "\n\e[01;05;33m[ 📁: `dirs` ]\e[m\n";
	echo -e "\e[m ";	# Line to reset default text color
fi
}

alias cd='cdandls' 

# CHANGES
#
# version 1.2
# - changed function name from cd  to cdandls 
# - alias named cd that points to cdandls added 
#
# version 1.1
#	- added options: --help, -v
#
# version 1.0
#	- inital function

# TO DO
# 	- add install and remove option
