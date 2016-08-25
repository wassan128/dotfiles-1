if [ -d /usr/local/opt/coreutils/libexec/gnubin ]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
  alias ls='ls --color=tty' #regular ls
  alias l='ls -CF'
  alias ll='ls -lhF' #long listing
  alias lsa='ls -lah'
  alias la='ls -lAFh'
  alias lS='ls -1FSsh'
  alias lart='ls -1Fcart'
  alias lrt='ls -1Fcrt'
  alias l.='ls -dFh .[a-zA-Z0-9]*' #only show dotfiles
  alias sl='ls' # often screw this up
else
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias ls='ls -FG' #regular ls
  alias l.='ls -dFG .[a-zA-Z0-9]*' #only show dotfiles
  alias ll='ls -lhFG' #long listing
  alias lsa='ls -lahG'
  alias la='ls -AG'
  alias l='ls -CFG'
  alias sl='ls' # often screw this up
fi

