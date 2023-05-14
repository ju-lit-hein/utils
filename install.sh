#!/bin/bash
#
# Install script for i3config
# Author: @ju-lit-hein
# Date: 14-05-2023

# Checking if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Asking if user want to install bashrc
read -p "Do you want to install bashrc? (y/n) " install_bashrc -n 1 -r
if [[ $install_bashrc =~ ^[Yy]$ ]]
then
    echo "Installing bashrc..."
    cp bashrc ~/.bashrc
    echo "Done!"
fi

# Asking if user want to install i3config
read -p "Do you want to install i3config? (y/n) " install_i3config -n 1 -r
if [[ $install_i3config =~ ^[Yy]$ ]]
then
    echo "Installing i3config..."
    cp i3config ~/.config/i3/config
    echo "Done!"
fi

# Asking if user want to install i3status.conf
read -p "Do you want to install i3status.conf? (y/n) " install_i3status -n 1 -r
if [[ $install_i3status =~ ^[Yy]$ ]]
then
    echo "Installing i3status.conf..."
    cp i3status.conf ~/.config/i3status/config
    echo "Done!"
fi

# Asking if user want to install init.vim for neovim
read -p "Do you want to install init.vim for neovim ? (y/n) " install_init -n 1 -r
if [[ $install_init =~ ^[Yy]$ ]]
then
    echo "Installing vimrc..."
    cp init.vim ~/.config/nvim/init.vim
    echo "Done!"
fi

# Asking if user want to install slock
read -p "Do you want to install slock? (y/n) " install_slock -n 1 -r
if [[ $install_slock =~ ^[Yy]$ ]]
then
    echo "Installing slock..."
    cp slock/slock /usr/bin/slock
    chmod +x /usr/bin/slock
    echo "Done!"
fi

# Echoing that script is done
echo "Script done! Everithing wanted is installed and ready to use!"

