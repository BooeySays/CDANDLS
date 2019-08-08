#!/bin/bash

# File: cdandls.sh
# Lang: Bash script
# Func: cd
# Desc: New function to replace old cd command to automatically
#	run ls command to list contents of a dir after cd'ing
#	into the dir.
# Inst: Add cdandls.sh to autoload script to load cd function

__version__=2.0
function cd(){
	builtin cd $*
	\ls -Fa -C -w $COLUMNS --color=always --group-directories-first
}

