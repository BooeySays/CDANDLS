#!/bin/bash

if [ -n "$BOOEYSFILES" ]; then
	if [ -d "$BOOEYSFILES" ]; then	
		if [ ! -f "$BOOEYSFILES/cdandls.sh" ]; then
			cp ./cdandls.sh $BOOEYSFILES/;
		fi
#	else
#		BOOEYSFILES="$HOME/.booeysays/files";
#		mkdir -p "$BOOEYSFILES";
#		cd $BOOEYSFILES;
#		git clone 
	fi
fi

if [ -f ~/.66mhzrc ]; then
	echo -e '''# CDANDLS #
\t. "$BOOEYSFILES/cdandls.sh";
# /CDANDLS #''' >> ~/.66mhzrc;
fi
