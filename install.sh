#!/bin/bash


if [ -d "$BOOEYSFUNCS" ]; then
	if [ ! -f "$BOOEYSFUNCS/cdandls.sh" ]; then
		cp ./cdandls.sh $BOOEYSFUNCS/;
	fi
fi



