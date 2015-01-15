if [ -f $HOME/.phpenv/bin/phpenv ]; then
	export PATH=$HOME/.phpenv/shims:$PATH:$HOME/.phpenv/bin
	eval "$(phpenv init - --no-rehash)"
fi
