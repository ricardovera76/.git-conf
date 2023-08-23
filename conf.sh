#!/bin/bash
mkdir -p $HOME/.ssh

read -p "Set GitHub's Name : " name
read -p "Set GitHub's Email : " email
read -p "Enter a filename for the SSH key (e.g., id_ed25519): " key_filename
read -p "Enter a passphrase (or press Enter for no passphrase): " passphrase

ssh-keygen -t ed25519 -C "$email" -N "$passphrase" -f $HOME/.ssh/$key_filename

eval "$(ssh-agent -s)"

ssh-add $HOME/.ssh/$key_filename

echo "YOUR SYSTEM SSH KEY FOR GITHUB IS : "
cat $HOME/.ssh/${key_filename}.pub

git config --global user.email "$email"
git config --global user.name "$name"