#!/bin/bash

git submodule init
git submodule update

files=.*
ignores=(
  "."
  ".."
  ".git"
  ".DS_Store"
  ".gitignore"
  ".gitmodules"
)


for file in ${files}
do
  filepath="${PWD}/${file}"
  homefile="${HOME}/${file}"

  # ignores は省略
  for ignore in ${ignores[@]}
  do
    test $file == ${ignore} && continue 2
  done

  # .hogehogeが存在しなければ、シンボリックリンクを作成
  if [ ! -e "${homefile}" ]; then
    echo "${file} not exist, make symbolic link to ${homefile}"
    ln -s "${filepath}" "${homefile}"
  else
    echo "${file} exist"
  fi
done

# oh-my-zsh-*/を.oh-my-zsh/以下にシンボリックリンク
ln -s oh-my-zsh_custom/* ~/.oh-my-zsh/custom/
ln -s oh-my-zsh_themes/* ~/.oh-my-zsh/themes/

