eval "$(docker-machine env default 2> /dev/null)"
alias d='docker'
dsh() {
    docker exec -it "${@:-$(docker ps -qla)}" bash
}
alias dps='docker ps'
