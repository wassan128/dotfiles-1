if [[ -f ~/.nodebrew/nodebrew ]]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
    nodebrew use latest > /dev/null
fi
