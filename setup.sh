#!/bin/bash

# Initial setup after cloning repo

mkdir ~/.vim/undodir/ -p

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

