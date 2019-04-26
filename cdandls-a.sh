#!/bin/bash

# File: cdandls.sh
# Lang: Bash script
# Func: cd
# Desc: New function to replace old cd command to automatically
#	run ls command to list contents of a dir after cd'ing
#	into the dir.
# Inst: Add cdandls.sh to autoload script to load cd function

__version__=1.2
function cd(){
if [ $# == '0' ]; then
	builtin cd
#	echo -e "Function missing ARG\nRun with --help for more information";
elif [ $1 == '--help' ] || [ $1 == '-h' ] || [ $1 == '-?' ]; then
	echo -e """
CDANDLS Function:

The CDANDLS function is a small function that is meant to replace
the builtin cd command. It still does the same thing as the original
command, exept, this function will automatically perform the ls command
after changing into a different directory to list its contents.

More specifically, the function will perform the ls command with the
'--group-directories-first' option added, to make it easier to see
the sub-directories, and figure out which directory you need to go
into next.

"""
    read -n 1
elif [ $1 == '-v' ] || [ $1 == '--version' ]; then
	echo -e "CDANDLS v$__version__";
else
	DIRTOCD=$1
	builtin cd "$DIRTOCD";
	echo -e "\e[01;37m ";	# Line to make default text white
	\ls -aF --color=always --group-directories-first;
	# Uncomment line below to add extra line at the bottom
	# that displays current directory
# If you want to add a line that displays the current working
# dir, like the '\w' ps1 option, just uncomment the line below.
#echo -e "\n\e[01;05;33m[ 📁: `dirs` ]\e[m";
	echo -e "\e[m ";	# Line to reset default text color
	unset DIRTOCD
fi
}

# CHANGES
# v1.2 - 2019-04-25
#	- changed function with $# to run builtin cd alone
#	- updated the 'else' part of the function
#
# version 1.1
#	- added options: --help, -v
#
# version 1.0
#	- inital function

# TO DO
# 	- add install and remove option
