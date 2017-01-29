export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

bindkey -e

zplug "yous/vanilli.sh"

zplug "mollifier/anyframe"
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ":anyframe:selector:" use fzf

zplug "mollifier/cd-gitroot"

zplug "rupa/z", use:"*.sh"

zplug "b4b4r07/enhancd", use:init.sh
export ENHANCD_COMMAND=ed
export ENHANCD_FILTER=ENHANCD_FILTER=fzy:fzf:peco

zplug "zsh-users/zsh-history-substring-search", hook-build:"__zsh_version 4.3", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"

zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zplug "yous/lime"
export LIME_DIR_DISPLAY_COMPONENTS=2

# zplug "~/dotfiles/zshrc.d", from:local
for f in ~/dotfiles/zshrc.d/*.zsh; do
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
