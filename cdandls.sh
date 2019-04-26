#!/bin/bash

# File: cdandls.sh
# Lang: Bash script
# Func: cd
# Desc: New function to replace old cd command to automatically
#	run ls command to list contents of a dir after cd'ing
#	into the dir.
# Inst: Add cdandls.sh to autoload script to load cd function

function cd(){
    DIRTOCD=$1
    builtin cd "$1"
    \ls -Fa --color=always --group-direcrtories-first
    echo
    unset DIRTOCD
    }
# CHANGES
#
# version 1.1
#	- added options: --help, -v
#
# version 1.0
#	- inital function

# TO DO
# 	- add install and remove option
