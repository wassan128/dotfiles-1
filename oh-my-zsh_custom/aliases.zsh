alias brew-cask-upgrade='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done'
alias brew-upgrade-all='brew update;  brew upgrade; brew-cask-upgrade; brew cleanup; brew cask cleanup'
alias rm='rm -i'
if which rmtrash > /dev/null; then alias rm='rmtrash'; fi
alias mv='mv -i'
alias cp='cp -i'

alias dsh='ssh coreos -t ". /home/core/.bashrc; sudo docker-enter"'
alias dps='docker ps'

p() { peco | while read LINE; do $@ $LINE; done }
alias o='git ls-files | p open'
alias e='ghq list -p | p cd'

alias ssheuc='TERM=xterm cocot -t UTF-8 -p EUC-JP ssh '
alias f='open .'

alias wconv='iconv -f UTF-8-MAC -t UTF-8'
alias pathconv="sed -r -e 's/^R:/\\/Volumes\\/system_public/' -e 's/^Y:/\\/Volumes\\/system/' -e 's/^P:/\\/Volumes\\/biz_public/' -e 's/^Q:/\\/Volumes\\/kanri_public/' -e 's/\\\\/\\//g' | wconv"

pbconv() {
    pbpaste | pathconv | pbcopy
    echo `pbpaste`
}
