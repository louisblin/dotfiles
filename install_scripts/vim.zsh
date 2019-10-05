#!/usr/bin/env zsh

INSTALL_DIR=~/.vim/bundle/Vundle.vim

mkdir -p $(dirname $INSTALL_DIR)
git clone https://github.com/VundleVim/Vundle.vim.git "$INSTALL_DIR" || true
git -C "$INSTALL_DIR" fetch
git -C "$INSTALL_DIR" reset --hard origin/master

vim +PlugInstall +qall
