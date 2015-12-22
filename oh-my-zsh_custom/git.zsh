export GIT_MERGE_AUTOEDIT=no

alias g='git'
alias -g R='`git remote | peco --prompt "GIT REMOTE>" | head -n 1`'
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
alias -g H='`curl -sL https://api.github.com/users/2k0ri/repos | jq -r ".[].full_name" | peco --prompt "GITHUB REPOS>" | head -n 1`'
alias -g LR='`git branch -a | peco --query "remotes/ " --prompt "GIT REMOTE BRANCH>" | head -n 1 | sed "s/remotes\/[^\/]*\/\(\S*\)/\1/"`'
alias gd='git diff'
alias gg='git log --graph'

. /usr/local/share/zsh/site-functions/git-flow-completion.zsh
