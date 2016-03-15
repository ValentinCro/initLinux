#!/bin/bash

#Plugins list (true to install it, false to don't install it)
declare -A PLUGINS_LIST
PLUGINS_LIST["default.sh"]=true
PLUGINS_LIST["tomcat.sh"]=true
PLUGINS_LIST["zsh.sh"]=true

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

	fileName=$(echo $file | tr '[:upper:]' '[:lower:]')
	if [ ${PLUGINS_LIST[$fileName]} == true ]
	then
		$SHELL "$PLUGINS_DIR/$file"
	fi
done

# We delete the exported vars
unset APP_DIR

exit 0
