if [ -f $HOME/.phpenv/bin/phpenv ]; then
	export PATH=$HOME/.phpenv/shims:$PATH
	eval "$(phpenv init -)"
fi
