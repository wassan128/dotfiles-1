alias sudo='sudo -E ' # inrehit environments and aliases
alias brew-cask-upgrade='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done'
alias brew-cask-clean-outdated="for c in /opt/homebrew-cask/Caskroom/*; do IFS=\$'\t\n' vl=(\$(ls -t \$c)) && for v in \"\${vl[@]:1}\"; do echo \"\$c/\$v\"; rm \"\$c/\$v\"; done; done"
alias brew-upgrade-all='brew update;  brew upgrade; brew-cask-upgrade; brew cleanup; brew cask cleanup; brew-cask-clean-outdated'
alias rm='rm -i'
if type rmtrash > /dev/null; then alias rm='rmtrash'; fi
alias mv='mv -i'
alias cp='cp -i'
alias tree='tree -NC'
alias tailf='tail -f'
alias uu="cd ..; ls -l"

p() { peco | while read LINE; do $@ $LINE; done }
alias o='git ls-files | p open'
alias e='ghq list -p | p cd'

alias ssheuc='TERM=xterm cocot -t UTF-8 -p EUC-JP ssh '
alias f='open .'
alias be='bundle exec'

alias wconv='iconv -f UTF-8-MAC -t UTF-8'
alias pathconv="sed -r -e 's/^R:/\\/Volumes\\/system_public/' -e 's/^Y:/\\/Volumes\\/system/' -e 's/^P:/\\/Volumes\\/biz_public/' -e 's/^Q:/\\/Volumes\\/kanri_public/' -e 's/\\\\/\\//g' | wconv"

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

alias pexec='parallel -j 24 --no-notice ssh -i ~/.ssh/id_production_all -c arcfour -o MACs=hmac-sha1-96 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=FATAL -o PasswordAuthentication=no -o ConnectTimeout=10 -l root {}'
alias pexec_v='parallel -v -j 24 --no-notice ssh -i ~/.ssh/id_production_all -c arcfour -o MACs=hmac-sha1-96 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=FATAL -o PasswordAuthentication=no -o ConnectTimeout=10 -l root {}'
alias pexec_vv='parallel -vv -j 24 --no-notice ssh -i ~/.ssh/id_production_all -c arcfour -o MACs=hmac-sha1-96 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=FATAL -o PasswordAuthentication=no -o ConnectTimeout=10 -l root {}'

parallel_exec() {
    local _file=${1:?}
    shift
    pexec_vv "\"$*\"" :::: $_file
}

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

alias sshe="ssh -o IdentitiesOnly=yes -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=FATAL -l ec2-user"
alias sshc="ssh -o IdentitiesOnly=yes -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=FATAL -l centos"
alias sshu="ssh -o IdentitiesOnly=yes -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=FATAL -l ubuntu"

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
