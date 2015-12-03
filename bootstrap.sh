#!/usr/bin/env bash

echo "Bootstraping dotfiles..."

bashit="$HOME/.bash_it"
aliases_bi="$bashit/aliases/custom.aliases.bash"

bash_it_custom="bash_it_custom"
aliases_me="$bash_it_custom/custom.aliases.bash"

pushd .

echo "Installing files..."

# Install / update bash-it
if [[ -d $bashit ]]; then

    echo "[BASH-IT] Already on computer... updating."
    cd $bashit
    git pull

else
    echo "[BASH-IT] Installing..."
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh
fi

# Copy custom files in bash-it
if [[ ! -d $bash_it_custom ]]; then
    echo "Couldn't find custom files... exiting."
    exit 1;
fi

echo "[BASH-IT] Setting custom files..."
cd $bash_it_custom

# aliases
if [[ -f $aliases_bi ]]; then 
    echo "   * [ALIASES] Found... backing up and creating symlink."
    cp $aliases_bi "$aliases_bi.bak"

else
    echo "   * [ALIASES] Creating symlink..."
fi
ln -s $aliases_me $aliases_bi


# END
popd

echo "DONE."
