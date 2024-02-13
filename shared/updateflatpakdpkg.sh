#!/bin/bash

# Check if the user has sudo privileges
if sudo -l &> /dev/null; then
    echo "User has sudo privileges. Running 'sudo apt dist-upgrade --auto-remove'."
    sudo apt dist-upgrade --auto-remove
else
    echo "User does not have sudo privileges. Skipping 'sudo apt dist-upgrade --auto-remove'."
fi

# Run flatpak update for user
echo "Running 'flatpak update --user'."
flatpak update --user
