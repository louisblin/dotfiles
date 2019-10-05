#!/usr/bin/env bash

# Import common configuration
source $HOME/.dotfiles/shell_common

# Import machine local configuration
if [[ -f $HOME/.bashrc.local ]]; then
  source $HOME/.bashrc.local
fi

#
# Bash specific config
#

# Docker
alias docker_init="eval \"\$(docker-machine env default)\""
