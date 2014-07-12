#!/bin/bash

git submodule update --init
git submodule foreach 'git checkout master && git pull origin master --ff'

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
  fi
done

# oh-my-zsh-*/を.oh-my-zsh/以下にシンボリックリンク
ln -s ${PWD}/oh-my-zsh_custom/* ~/.oh-my-zsh/custom 2> /dev/null
ln -s ${PWD}/oh-my-zsh_themes/* ~/.oh-my-zsh/themes 2> /dev/null
# リンク切れのシンボリックリンクを削除
for file in `find -L ~/.oh-my-zsh/custom ~/.oh-my-zsh/themes -type l`
do
  unlink $file
done
