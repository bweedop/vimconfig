#!/bin/bash

# Initial setup after cloning repo

# Make undodir directory
mkdir ~/.vim/undodir/ -p

# Download Plug vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install the plugins in the vimrc
vim -c 'PlugInstall | quit' ~/.vim/vimrc

# Install all software needed for YouCompleteMe
sudo apt install build-essential cmake vim-nox python3-dev mono-complete golang nodejs default-jdk npm
# Go to YCM dir and install
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --all
# Go back to home directory
cd ~/
