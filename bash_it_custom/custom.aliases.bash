##################################
# BASH-IT custom config: aliases #
##################################

### REDEFINED FUNCTIONS
alias grep='function _grep { grep -rn --color=auto . -e "$1"; }; _grep'
alias cd='function _cd { cd "$1" && la; }; _cd'
alias mkd='function _mkd { mkdir "$@" && cd "$@"; }; _mkd'

### UTILITIES 
# LOCKING THE SCREEN
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# Eject mounted disk
alias ej='function _ej { diskutil unmountDisk /dev/disk"$1"; }; _ej'

### LAUNCH APPLICATIONS
alias clsvis="sh /Applications/ClassVisualizer/clsvis.sh &"
alias ltsa="open /Applications/ltsatool/ltsa.jar &"
alias antlr4='java -jar /usr/local/lib/antlr-4.5.1-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

### SHORTCUTS
alias leds='cd ~/Projects/LEDS/Champylight'
alias api='cd ~/Projects/SelfieHunter/api/serverFiles/SelfieHunter'
alias y='cd ~/Google\ Drive/Imperial/Work/Year2'
alias wacc='cd ~/Google\ Drive/Imperial/Work/Year2/261\ -\ Labs/wacc_08'
alias min='export PS1="$ "'

