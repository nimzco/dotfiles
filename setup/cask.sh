#!/bin/bash

# Install brew-cask
brew tap phinze/homebrew-cask
brew install brew-cask || brew upgrade brew-cask

# Prepare brew-cask for multi-users setup
if ! sudo dscl . read /Groups/brew &> /dev/null
then
	echo "Now let's make brew useful for all users."
	echo "Create a 'brew' group"
	sudo dscl . create /Groups/brew
	sudo dscl . create /Groups/brew RealName "Homebrew group"
	sudo dscl . create /Groups/brew gid 400
	sudo dscl . create /Groups/brew GroupMembership `whoami`
fi

echo -n "Change the group of homebrew installation directory…"
sudo chgrp -R brew /usr/local
sudo chgrp -R brew /opt/homebrew-cask/ # no such file or directory
echo "done"

echo -n "Allow group members to write inside this directory…"
sudo chmod -R g+w /usr/local
sudo chmod -R g+w /opt/homebrew-cask/  # no such file or directory
echo "done"

