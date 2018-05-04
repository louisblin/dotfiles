#!/usr/bin/env bash

# DISCLAIMER
#   This is inspired by https://github.com/nicksp/dotfiles/blob/master/setup.sh


#
# Utils
#

[[ "$1" =~ ^-y*$  ]] && ANSWER_YES=YES || ANSWER_YES=NO 

answer_is_yes() {
    [[ "$REPLY" =~ ^[Yy]$  ]] \
        && return 0 \
        || return 1
}

ask_for_confirmation() {
    print_question "$1 (y/n) "
    if [ ${ANSWER_YES} == YES ]; then
        REPLY="y"
        printf " y\n"
    else
        read
        printf "\n"
    fi
}

execute() {
    eval ${1} &> /dev/null
    print_result $? "${2:-$1}"
}

print_error() {
    # Print output in red
    printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

print_info() {
    # Print output in purple
    printf "\n\e[0;35m $1\e[0m\n\n"
}

print_question() {
    # Print output in yellow
    printf "\e[0;33m  [?] $1\e[0m"
}

print_result() {
    [ $1 -eq 0  ] \
        && print_success "$2" \
        || print_error "$2"

    [[ "$3" == "true" ]] && [ $1 -ne 0 ] \
        && exit
}

print_success() {
    # Print output in green
    printf "\e[0;32m  [✔] $1\e[0m\n"
}

#
# Install components
#

repo_self_update() {
    # Updating this repository
    git pull > /dev/null 2>&1
    print_success "Updated dotfiles repository..."
}

install_oh_my_zsh() {

    ZSH="${ZSH:-$HOME/.oh-my-zsh}"
    ZSHRC="$DOTFILES/zsh/zshrc"

    print_info "====================================================="
    print_info "[ZSH]"

    # Install oh-my-zsh
    if [[ -d $ZSH ]]; then
        cd $ZSH
        git pull
        cd -
        print_success "$ZSH: updated existing copy."
    else
        ask_for_confirmation "oh-my-zsh not found, do you want to install it to '$ZSH'?"
        if answer_is_yes; then
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        else
            print_error "oh-my-zsh: uninstalled."
        fi
    fi
}

symlink_files() {

    declare -a FILES_TO_SYMLINK=(
        'configs/gitconfig'
        'configs/gitignore'
        'configs/tmux.conf'

        'shell/bash_profile'
        'shell/zshrc'
    )

    for i in ${FILES_TO_SYMLINK[@]}; do

        sourceFile="$(pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ ! -e "$targetFile" ]; then
            execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        elif [[ "$(readlink "$targetFile")" == "$sourceFile" ]]; then
            print_success "$targetFile → $sourceFile"
        else
            ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
            if answer_is_yes; then
                rm -rf "$targetFile"
                execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
            else
                print_error "$targetFile → $sourceFile"
            fi
        fi
    done

    unset FILES_TO_SYMLINK
}

#
# Entry point
#

# Save current wording directory
pushd . > /dev/null

print_info "====================================================="
print_info "| Bootstraping dotfiles..."
print_info "====================================================="

DOTFILES=${0:a:h}
cd "$DOTFILES"
print_success "Install directory: $DOTFILES"

repo_self_update
install_oh_my_zsh
symlink_files

# Back to caller directory
popd > /dev/null

zsh
