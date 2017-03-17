# the idea of this theme is to contain a lot of info in a small string, by
# compressing some parts and colorcoding, which bring useful visual cues,
# while limiting the amount of colors and such to keep it easy on the eyes.
# When a command exited >0, the timestamp will be in red and the exit code
# will be on the right edge.
# The exit code visual cues will only display once.
# (i.e. they will be reset, even if you hit enter a few times on empty command prompts)
autoload -Uz colors && colors
setopt prompt_subst
typeset -A host_repr
ZSH_THEME_GIT_PROMPT_DIRTY='*'

# translate hostnames into shortened, colorcoded strings
host_repr=('k-macos.local' "%{$fg[black]%}k" 'AFN-kori.local' "%{$fg[black]%}AFN" 'Arch' "%{$fg[cyan]%}Arch")

# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

# user part, color coded by privileges
user="%(!.%{$fg[blue]%}.%{$fg[blue]%})%n%{$reset_color%}"

# Hostname part.  compressed and colorcoded per host_repr array
# if not found, regular hostname in default color
host="${host_repr[$(hostname)]:-$(hostname)}%{$reset_color%}"

# Compacted $PWD
pwd="%{$fg[blue]%}%c%{$reset_color%}"

function _git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
  echo " ${ref/refs\/heads\//}$(parse_git_dirty)"
}

function _git_info() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    local FG_COLOR=green
    if [[ -n $(parse_git_dirty) ]]; then
      FG_COLOR=yellow
    else
        if [[ ! -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
            FG_COLOR=red
        fi
    fi
    echo "%{%F{$FG_COLOR}%}$(_git_prompt_info)%{$reset_color%}"
  fi
}

# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%?↵ %{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

#RPS1='${return_code}'

function accept-line-or-clear-warning () {
	if [[ -z $BUFFER ]]; then
		time=$time_disabled
		return_code=$return_code_disabled
	else
		time=$time_enabled
		return_code=$return_code_enabled
	fi
	zle accept-line
}
PROMPT='${time} ${host} ${pwd}$(_git_info) ${return_code}%(!.#.$) '
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning
unfunction git_compare_version
