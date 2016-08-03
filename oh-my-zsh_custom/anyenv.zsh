export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - --no-rehash)"
# pyenv
eval "$(pyenv virtualenv-init - --no-rehash)" 2> /dev/null
# phpenv
export PHP_BUILD_CONFIGURE_OPTS="--with-openssl=/usr/local/opt/openssl --with-libxml-dir=/usr/local/opt/libxml2"
export PHP_BUILD_EXTRA_MAKE_ARGUMENTS=-j4
