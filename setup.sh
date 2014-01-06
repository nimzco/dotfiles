#!/bin/bash

source="$(pwd)"

SETUP_DIR=$source/setup
DOTFILES_DIR=$source/dotfiles
BASH_DIR=$source/bash

if [ -d "$DOTFILES_DIR" ]; then
	for file in $(ls $DOTFILES_DIR); do
		ln -si "$DOTFILES_DIR/$file" $HOME/.$file && echo "Linked $DOTFILES_DIR/$file" 
	done
fi