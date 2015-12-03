#!/usr/bin/env bash

echo
echo "Bootstraping dotfiles..."
echo

bashit="$HOME/.bash_it"
aliases_bi="$bashit/aliases/custom.aliases.bash"

me="$HOME/.dotfiles"
bash_it_custom="$me/bash_it_custom"
aliases_me="$bash_it_custom/custom.aliases.bash"

pushd . > /dev/null

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
echo
echo "[BASH-IT] Setting custom files..."
cd $bash_it_custom

if [[ ! -d $bash_it_custom ]]; then
    echo "Couldn't find custom files... exiting."
    exit 1;
fi

# aliases
if [[ -f $aliases_bi ]]; then 
    echo "   * [ALIASES] File found... backing up and creating symlink."
    mv $aliases_bi "$aliases_bi".bak

elif [[ -L $aliases_bi ]]; then 
    echo "   * [ALIASES] Symlink found... backing up and creating symlink."
    mv $aliases_bi "$aliases_bi".bak

else
    echo "   * [ALIASES] Creating symlink..."
fi
ln -s $aliases_me $aliases_bi


# END
popd > /dev/null
echo
echo "DONE."
