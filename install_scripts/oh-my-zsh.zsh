#!/usr/bin/env zsh

INSTALL_DIR=~/.oh-my-zsh

mkdir -p $(dirname $INSTALL_DIR)
git clone https://github.com/robbyrussell/oh-my-zsh.git "$INSTALL_DIR" || true
git clone [200~https://github.com/romkatv/powerlevel10k "$INSTALL_DIR"/custom/themes/powerlevel10k || true
git -C "$INSTALL_DIR" fetch
git -C "$INSTALL_DIR" reset --hard origin/master
