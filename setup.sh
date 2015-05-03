#!/bin/bash

git pull --recurse-submodules origin master

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
  if [ ! -e "${homefile}" ]
  then
    echo "${file} not exist, make symbolic link to ${homefile}"
    ln -s "${filepath}" "${homefile}"
  elif [ ! -L "${homefile}" ]
  then
    echo "${homefile} exists, but it's not symbolic link. DELETE this. Ignoring..."
  fi
done

# oh-my-zsh-*/を.oh-my-zsh/以下にシンボリックリンク
ln -s ${PWD}/oh-my-zsh_custom/*.zsh "${HOME}"/dotfiles/.oh-my-zsh/custom/ 2> /dev/null
# リンク切れのシンボリックリンクを削除
find -L "${HOME}"/dotfiles/.oh-my-zsh/custom -type l -exec unlink {} \;
