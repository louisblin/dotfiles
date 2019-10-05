#!/usr/bin/env zsh

INSTALL_DIR=~/.oh-my-zsh

mkdir -p $(dirname $INSTALL_DIR)
git clone https://github.com/robbyrussell/oh-my-zsh.git "$INSTALL_DIR" || true
git clone https://github.com/bhilburn/powerlevel9k.git "$INSTALL_DIR"/custom/themes/powerlevel9k || true
git -C "$INSTALL_DIR" fetch
git -C "$INSTALL_DIR" reset --hard origin/master
