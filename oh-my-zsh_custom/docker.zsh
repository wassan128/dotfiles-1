eval "$(docker-machine env default 2> /dev/null)"
dsh() {
    docker exec -it "${@:-$(docker ps -qla)}" /bin/bash
}
alias dps='docker ps'
