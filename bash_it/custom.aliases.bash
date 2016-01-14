##################################
# BASH-IT custom config: aliases #
##################################

### REDEFINED FUNCTIONS
alias rm='rm -i'
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
alias sicstus="export PATH=${PATH}:/usr/local/sicstus4.3.2/bin > /dev/null; rlwrap sicstus"

### SHORTCUTS
alias leds='cd ~/Projects/LEDS/Champylight'
alias api='cd ~/Projects/SelfieHunter/api/serverFiles/SelfieHunter'
alias y='cd ~/Google\ Drive/Imperial/Work/Year2'
alias wacc='cd ~/Google\ Drive/Imperial/Work/Year2/261\ -\ Labs/wacc_08'
alias min='export PS1="$ "'

# Public ip, and local ip (without *.*.*.255 netmask) commands
alias publicip='curl ipecho.net/plain'
alias localip='ifconfig -a | \grep -o "192.168.[0-9]\+.[0-9]\+" | \grep -v "192.168.*255"'

# ssh
alias sshlabs='ssh lb3214@shell4.doc.ic.ac.uk'
alias sshpi='ip=`curl -X GET https://www.doc.ic.ac.uk/~lb3214/pi_ip/?ip_only`; ssh pi@$ip'
