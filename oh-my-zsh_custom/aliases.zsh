alias brew-cask-upgrade='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done'
alias brew-upgrade-all='brew update && brew upgrade && brew-cask-upgrade && brew cleanup && brew cask cleanup'
alias rm='rm -i'
if which rmtrash > /dev/null; then alias rm='rmtrash'; fi
alias mv='mv -i'
alias cp='cp -i'

alias dsh='ssh boot2docker -t ". /home/docker/.profile; sudo docker-enter"'
alias dps='docker ps'

p() { peco | while read LINE; do $@ $LINE; done }
alias o='git ls-files | p open'
alias e='ghq list -p | p cd'
