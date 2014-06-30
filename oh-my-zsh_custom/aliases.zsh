alias brew-cask-upgrade='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
docker-attach()
{
  id=`sudo docker ps -q --no-trunc $1`
  root=/var/lib/docker/execdriver/native/$id
  sudo sh -c "cd $root && $GOPATH/bin/nsinit exec $2"
}
