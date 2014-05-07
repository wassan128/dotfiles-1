if [ -f $HOME/.phpenv/bin/phpenv ]; then
	export PATH=$PATH:$HOME/.phpenv/bin
	eval "$(phpenv init -)"
fi
