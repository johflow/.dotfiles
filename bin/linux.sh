#!/bin/bash

#Checks to see if the operating system is Linux and dumps errors if not so
if [[ "$(uname)" == "Linux" ]]; then
	mkdir -p ~/.TRASH
else
	echo "The operating system isn't Linux" >> linuxsetup.log
	exit
fi
#Checks if .nanorc exists and if it does it renames it and logs
if [[ -f "~/.nanorc" ]]; then
	mv ~/.nanorc ~/.bup_nanorc
	echo "The current .nanorc file was changed to .bup_nanorc" >> linuxsetup.log
fi
#Overrides the current .nanorc with the nanorc file in .dotfiles
cp ~/.dotfiles/etc/nanorc ~/.nanorc
#adds line to end of .bashrc file that shows it where the custom bashrc is
echo "source ~/.dotfiles/etc/bashrc_custom" >> ~/.bashrc
