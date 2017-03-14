export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
alias ls='ls --color=tty' #regular ls
alias l='ls -CF'
alias ll='ls -lhF' #long listing
alias lla='ls -lahF' #long listing
alias lsa='ls -lah'
alias la='ls -lAFh'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
alias l.='ls -dFh .[a-zA-Z0-9]*' #only show dotfiles
alias ll.='ls -ldFh .[a-zA-Z0-9]*' #only show dotfiles
alias sl='ls' # often screw this up
