alias sudo='sudo -E ' # inrehit environments and aliases
brew-cask-upgrade(){ for app in $(brew cask list); do local latest="$(brew cask info "${app}" | awk 'NR==1{print $2}')"; local versions=($(ls -1 "/usr/local/Caskroom/${app}/.metadata/")); local current=$(echo ${versions} | awk '{print $NF}'); if [[ "${latest}" = "latest" ]]; then echo "[!] ${app}: ${current} == ${latest}"; [[ "$1" = "-f" ]] && brew cask install "${app}" --force; continue; elif [[ "${current}" = "${latest}" ]]; then continue; fi; echo "[+] ${app}: ${current} -> ${latest}"; brew cask uninstall "${app}" --force; brew cask install "${app}"; done; }
alias brew-upgrade-all='brew update;  brew upgrade; brew-cask-upgrade; brew cleanup; brew cask cleanup'
alias rm='rm -i'
if type rmtrash > /dev/null; then alias rm='rmtrash'; fi
alias mv='mv -i'
alias cp='cp -i'
alias tree='tree -NC'
alias tailf='tail -f'
alias talif=tailf
alias uu="cd ..; ls -l"
alias shrestart="exec $SHELL -l"
alias mnt="/opt/iscsi.sh; /opt/nfs.sh"
mvnc() { MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none" mvn $@ -T24 }
p() { fzy | while read LINE; do $@ $LINE; done }
alias o='git ls-files | p open'
alias e='ghq list -p | p cd'
# alias e=anyframe-widget-cd-ghq-repository
alias ssheuc='TERM=xterm cocot -t UTF-8 -p EUC-JP ssh '
alias f='open .'
alias be='bundle exec'
kill-sessions() { echo $@ | tr ' ' '\n' | xargs -t -I{} tmux kill-session -t {} ; }
pbconv() {
    pbpaste | pathconv | pbcopy
    echo `pbpaste`
}
alias date8='date +%Y%m%d'
alias date6='date +%y%m%d'
alias dateT='date +%Y%m%d-%H-%M-%S'
alias datet='date +%y%m%d-%H-%M-%S'
alias dateI='date -Is 2> /dev/null || date +%FT%T%z'
alias apachesort="env LC_ALL=C sort -t '[' -k 2.8,2.11n -k 2.4,2.6M -k 2.1,2.2n -k 2.13,2.14n -k 2.16,2.17n -k 2.19,2.20n"
passgen() {
    while getopts l:ah OPT
    do
        case $OPT in
            a) local _type='[:alnum:]' ;;
            l) local _length=$OPTARG ;;
            h) echo "$0 [-a] [-l length]" 1>&2 ; return 1 ;;
        esac
    done
    cat /dev/urandom | LC_CTYPE=C tr -dc ${_type:-'[:print:]'} | head -c ${_length:-12}
}
alias dstat-full='dstat -Tclmdrn'
alias dstat-mem='dstat -Tclm'
alias dstat-cpu='dstat -Tclr'
alias dstat-net='dstat -Tclnd'
alias dstat-disk='dstat -Tcldr'
tarcp() {
    local dst=${@[$#]} # last argument
    if [[ ! -d "$dst" ]]; then
        echo "destination is not directory"
        return 1
    fi
    for src in "${@:1:${#}-1}" # arguments w/o last one
    do
        if [[ -f "$src" ]]; then
            pv "$src" > "$dst/${src##*/}"
            _exit=("${pipestatus[@]:-${PIPESTATUS[@]}}")
        elif [[ -d "$src" ]]; then
            # calculate size
            if [[ -z "$NOCALC" ]]; then
                local calc=" -s $(du -bs "$src" | awk '{print $1}')"
            fi

            mkdir "$dst/${src##*/}" 2> /dev/null
            (cd "$src" && tar cf - .) | eval "pv$calc" | (cd "$dst/${src##*/}" && tar xpf -)
            _exit=("${pipestatus[@]:-${PIPESTATUS[@]}}")
            unset calc
        fi

        # delete
        if [[ -n "$DELETE" ]]; then
            for i in "${_exit[@]}"
            do
                [[ $i -eq 0 ]] || _failed=1
            done
            if [[ -z "$_failed" ]]; then
                rm "$src" &
            else
                echo "$src failed" >&2
            fi
        fi
        unset _exit
    done
    wait
}
alias tarmv='DELETE=1 tarcp'
