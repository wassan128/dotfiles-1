export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "yous/vanilli.sh"

zplug "mollifier/anyframe"
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ":anyframe:selector:" use fzf

zplug "mollifier/cd-gitroot"

zplug "rupa/z", use:"*.sh"

zplug "b4b4r07/enhancd", use:init.sh
export ENHANCD_FILTER=fzy:fzf:peco

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", hook-build:"__zsh_version 4.3", defer:2, on:"zsh-users/zsh-syntax-highlighting"

zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zplug "aperezdc/zsh-fzy", as:command, use:fzy-tmux

for f in ~/dotfiles/zshrc.d/*.zsh; do
  source $f
done
# OS specific
for f in ~/dotfiles/zshrc.d.$(uname)/*.zsh; do
  source $f
done

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

bindkey -e
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export PATH="$HOME/.yarn/bin:$PATH"
