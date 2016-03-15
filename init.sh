#!/bin/bash

PLUGINS_DIR="./plugins"

# We make these vars accessible by all plugins
# TODO: let the user choose the wanted folder
export APP_DIR="$HOME/Documents/Apps"

# We create the plugins directory if it doesn't exists
if [ ! -d $PLUGINS_DIR ]
then
	echo "[ERROR] plugins folder doesn't exist"
	exit 0
fi

# We create the Apps directory if it doesn't exists, and all parents directory too.
if [ ! -d $APP_DIR ]
then
	mkdir -p $APP_DIR
fi

# We look through this directory and search for some files to run
# these files must be executable for security reasons;
FILES=$(ls $PLUGINS_DIR -1)
for file in $FILES; do
	if [ ! -e "$PLUGINS_DIR/$file" ] || [ ! -x "$PLUGINS_DIR/$file" ] || [ -d "$PLUGINS_DIR/$file" ]; then
		continue
	fi

	$SHELL "$PLUGINS_DIR/$file"

done

# We delete the exported vars
unset APP_DIR

exit 0
