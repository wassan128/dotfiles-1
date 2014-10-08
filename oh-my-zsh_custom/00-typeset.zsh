# http://yonchu.hatenablog.com/entry/20120415/1334506855
## 重複パスを登録しない
typeset -Uz path cdpath fpath manpath PATH compinit
compinit -u
