fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit -C
. /usr/local/share/zsh/site-functions/*
