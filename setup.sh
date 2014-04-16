#!/bin/bash

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
    echo "${file} not exis, make symbolic link to ${homefile}"
    ln -s "${filepath}" "${homefile}"
  else
    echo "${file} exist"
  fi
done

git submodule init
git submodule update
