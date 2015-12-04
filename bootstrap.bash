#!/usr/bin/env bash

echo -e "\033[0;33m====================================================="
echo -e           "| Bootstraping dotfiles..."
echo -e           "=====================================================\033[0m"

pushd . > /dev/null
me="$HOME/.dotfiles"


# Update .dotfile repo
echo
printf "Updating .dotfiles repository..."
git pull > /dev/null 2>&1
echo " done."

############################
# Install / update bash-it #
############################

# Files locations
bashit="$HOME/.bash_it"
bash_it_files="$me/bash_it"

aliases_bi="$bashit/aliases/custom.aliases.bash"
aliases_me="$bash_it_files/custom.aliases.bash"

echo
echo -e "\033[0;33m=====================================================\033[0m"
printf "\033[0;33m[BASH-IT]\033[0m "

# Bash it install
if [[ -d $bashit ]]; then

    echo "Already on computer... updating."
    cd $bashit
    git pull

else
    echo "Installing..."
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh
fi

# Copy custom files in bash-it
echo
echo "Setting custom files..."
cd $bash_it_files

if [[ ! -d $bash_it_files ]]; then
    echo "Couldn't find custom files... exiting."
    exit 1;
fi

# aliases
printf "   * [ALIASES] "
if [[ -f $aliases_bi ]]; then 
    echo "File found... backing up and creating symlink."
    mv $aliases_bi "$aliases_bi".bak

elif [[ -L $aliases_bi ]]; then 
    echo "Symlink found... backing up and creating symlink."
    mv $aliases_bi "$aliases_bi".bak

else
    echo "Creating symlink..."
fi
ln -s $aliases_me $aliases_bi


###############################
# Install / update VIM config #
###############################

# Files locations...
vimrc="$HOME/.vimrc"
vimrc_me="$me/vim/.vimrc"

vim="$HOME/.vim"
vim_me="$me/vim/.vim"
bundle_me="$vim_me/bundle"

echo
echo -e "\033[0;33m=====================================================\033[0m"
printf "\033[0;33m[VIM CONFIG]\033[0m "

# config .vimrc install
if [[ -f $vimrc ]] || [[ -L $vimrc ]]; then
    echo "Already on computer... backing up and creating symlink."
    mv $vimrc $vimrc.bak

else
    echo "Installing..."
fi
ln -s $vimrc_me $vimrc

# bundles .vim install
echo
echo "Installing bundles..."
cd $vim_me

# cheking for existing files
printf "   * [.vim] "
if [[ -d $vim ]]; then
    echo -n ".vim directory found. Import new .vim file? [y/n] "
    read import

    if [[ import == "y" ]] || [[ import == "yes" ]]; then
        echo "     Backing .vim files..."
        mv $vim $vim.bak
    fi
fi

# creating symlink
if [[ ! -d $vim ]] || [[ import == "y" ]] || [[ import == "yes" ]]; then
    echo "     Creating symlink..."
    ln -s $vim_me $vim
fi

# updating bundles
echo "   * [.vim/bundle] Updating..."
pushd . > /dev/null
cd $bundle_me > /dev/null

for bundle in $(ls $bundle_me)
do
    if [[ -d $bundle/.git ]]; then
        printf "     Updating bundle $bundle... "
        cd $bundle > /dev/null
        git pull > /dev/null 2>&1
        cd .. > /dev/null
        echo "done."
    fi
    
done

popd > /dev/null

###############################
popd > /dev/null
echo
echo -e "\033[0;33m[DONE]\033[0m"
