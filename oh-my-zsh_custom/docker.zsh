dsh() {
  boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
  boot2docker ssh -o LogLevel=FATAL -t sudo /var/lib/boot2docker/docker-enter "$@"
}
alias dps='docker ps'
