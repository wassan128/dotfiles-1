# http://yonchu.hatenablog.com/entry/20120415/1334506855
## 重複パスを登録しない
# fpath=(/usr/local/share/zsh/site-functions /usr/local/share/zsh-completions $fpath)
# typeset -x path cdpath fpath manpath PATH

## 重複パスを登録しない
typeset -U path cdpath fpath manpath

## sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

## pathを設定
path=(~/bin(N-/) /usr/local/bin(N-/) ${path})

autoload -Uz compinit
compinit -Cu
