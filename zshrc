is_rpi() {
  [[ $(hostname) =~ "k8s*" ]] && return 0 || return 1A
}

#
# Load Nix tools
#

export NIX_IGNORE_SYMLINK_STORE=1
[[ -L $HOME/.nix-profile ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh

#
# oh-my-zsh / powerlevel10k configuration
#

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
export ZSH_CUSTOM="$ZSH/custom"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git osx tmux docker kubectl)

# Theme, use a slimmer theme on RPI
if is_rpi; then
  ZSH_THEME=""
else
  ZSH_THEME="spaceship-prompt/spaceship"
fi

source $ZSH/oh-my-zsh.sh

if is_rpi; then
  fpath+=$HOME/.zsh/pure
  autoload -U promptinit
  promptinit
  prompt pure
fi

# User configuration

export EDITOR='vim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

#
# User configuration
#

# Import common configuration
source $HOME/.dotfiles/shell_common

# Import machine local configuration
if [[ -f $HOME/.zshrc.local ]]; then
  source $HOME/.zshrc.local
fi

