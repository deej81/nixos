#!/bin/bash

# to execute on a fresh nixos install
# curl -L https://raw.githubusercontent.com/deej81/nixos/main/bootstrap.sh | bash

# Prompt for GitHub username
echo "Please enter your GitHub username:"
read GITHUB_USERNAME

# Store the username in a variable (already done by the read command)
echo "adding keys for: $GITHUB_USERNAME"
# Download and append the GitHub user's SSH keys to the authorized_keys
mkdir -p ~/.ssh
chmod 700 ~/.ssh
curl https://github.com/${GITHUB_USERNAME}.keys >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

echo "SSH keys for GitHub user ${GITHUB_USERNAME} have been added to authorized_keys."

# download our config
sudo curl -L https://raw.githubusercontent.com/deej81/nixos/main/bootstrap/bootstrap.nix -o /etc/nixos/bootstrap.nix

# rebuild
sudo nixos-rebuild switch

