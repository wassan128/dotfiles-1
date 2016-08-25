export LESS='-g -j10 -iMR --no-init --quit-if-one-screen'
export LESSCHARSET=utf-8
export LESSOPEN='| src-hilite-lesspipe.sh %s'
alias c='pygmentize -O style=monokai -f console256 -g'
