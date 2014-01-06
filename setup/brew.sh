#!/bin/bash

# Install homebrew
if ! which brew &> /dev/null
then
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

# Prepare brew for multi-users setup
if ! sudo dscl . read /Groups/brew &> /dev/null
then
	echo "Now let's make brew useful for all users."
	echo "Create a 'brew' group"
	sudo dscl . create /Groups/brew
	sudo dscl . create /Groups/brew RealName "Homebrew group"
	sudo dscl . create /Groups/brew gid 400
	sudo dscl . create /Groups/brew GroupMembership `whoami`
fi

echo -n "Change the group of homebrew cache directory…"
sudo chgrp -R brew /Library/Caches/Homebrew
echo "done"

echo -n "Allow group members to write inside this directory…"
sudo chmod -R g+w /Library/Caches/Homebrew
echo "done"

