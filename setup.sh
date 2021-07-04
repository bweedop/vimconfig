#!/bin/bash

# Initial setup after cloning repo

mkdir ~/.vim/undodir/ -p

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c 'PlugInstall | quit' ~/.vim/vimrc

sudo apt install build-essential cmake vim-nox python3-dev mono-complete golang nodejs default-jdk npm

cd ~/.vim/plugged/YouCompleteMe

python3 install.py --all

cd ~/
