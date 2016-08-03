export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - --no-rehash)"
eval "$(pyenv virtualenv-init - --no-rehash)" 2> /dev/null
