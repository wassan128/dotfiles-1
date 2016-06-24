# https://github.com/korin/dotfiles/blob/master/.oh-my-zsh-custom/aliases.zsh
if [ -d /usr/local/opt/coreutils/libexec/gnubin ]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
  alias ls='ls -F --color=tty' #regular ls
  alias l.='ls -dF .[a-zA-Z0-9]* --color=tty' #only show dotfiles
  alias ll='ls -lhF --color=tty' #long listing
  alias lsa='ls -lah --color=tty'
  alias la='ls -A --color=tty'
  alias l='ls -CF --color=tty'
  alias sl='ls' # often screw this up
else
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias ls='ls -G'
  alias ls='ls -FG' #regular ls
  alias l.='ls -dFG .[a-zA-Z0-9]*' #only show dotfiles
  alias ll='ls -lhFG' #long listing
  alias lsa='ls -lahG'
  alias la='ls -AG'
  alias l='ls -CFG'
  alias sl='ls' # often screw this up
fi

