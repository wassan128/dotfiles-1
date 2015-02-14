# http://yonchu.hatenablog.com/entry/20120415/1334506855
## 重複パスを登録しない
fpath=(/usr/local/share/zsh/site-functions /usr/local/share/zsh-completions $fpath)
typeset -x path cdpath fpath manpath PATH
autoload -Uz compinit
compinit -C
