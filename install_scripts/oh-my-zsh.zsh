#!/usr/bin/env zsh

git_clone_latest() {
  mkdir -p $(dirname $2)
  git clone "$1" "$2" || true
  git -C "$2" fetch
  git -C "$2" reset --hard origin/master
}

git_clone_latest https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
git_clone_latest https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
git_clone_latest https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
