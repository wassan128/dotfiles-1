unset DYLD_INSERT_LIBRARIES
launchctl setenv GOPATH $HOME
launchctl setenv GOROOT /usr/local/opt/go/libexec
export GOPATH=$HOME
export GOROOT=/usr/local/opt/go/libexec
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
