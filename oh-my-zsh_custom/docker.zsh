eval "$(docker-machine env default)"
dsh() {
    docker exec -it "${@:-$(docker ps -qla)}" /bin/bash
}
alias dps='docker ps'
