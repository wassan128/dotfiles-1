alias brew-cask-upgrade='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

unset DYLD_INSERT_LIBRARIES
alias dsh='boot2docker ssh -t ". /home/docker/.profile; sudo docker-enter"'

