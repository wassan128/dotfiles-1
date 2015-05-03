export CFLAGS=-Wno-error=shorten-64-to-32
export RUBY_CONFIGURE_OPTS="--enable-shared --with-readline-dir=/usr/local/opt/readline --with-openssl-dir=/usr/local/opt/openssl --with-libyaml-dir=/usr/local/opt/libyaml"
#brew uninstall readline
#brew install https://raw.githubusercontent.com/Homebrew/homebrew/0181c8a1633353affefabe257c170edbd6d7c008/Library/Formula/readline.rb
#brew pin readline
