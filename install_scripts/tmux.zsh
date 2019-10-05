#!/usr/bin/env zsh

INSTALL_DIR=~/.tmux/plugins/tpm

mkdir -p $(dirname $INSTALL_DIR)
git clone https://github.com/tmux-plugins/tpm "$INSTALL_DIR" || true
git -C "$INSTALL_DIR" fetch
git -C "$INSTALL_DIR" reset --hard origin/master

"$INSTALL_DIR"/scripts/install_plugins.sh
