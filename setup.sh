#!/bin/bash

git submodule update --remote

[[ -d "${HOME}/.config" ]] || mkdir "${HOME}/.config"

files="$(ls -d .* .config/*)"
ignores=(
  "."
  ".."
  ".git"
  ".DS_Store"
  ".gitignore"
  ".gitmodules"
  ".config"
)

for file in ${files}
do
  filepath="${PWD}/${file}"
  homefile="${HOME}/${file}"

  # ignores は省略
  for ignore in ${ignores[@]}
  do
    [[ "${file}" = "${ignore}" ]] && continue 2
  done

  # .hogehogeが存在しなければ、シンボリックリンクを作成
  if [[ ! -e "${homefile}" ]]
  then
    echo "${file} not exist, make symbolic link to ${homefile}"
    ln -s "${filepath}" "${homefile}"
  elif [[ ! -L "${homefile}" ]]
  then
    echo "${homefile} exists, but it's not symbolic link. DELETE this. Ignoring..."
  fi
done

# oh-my-zsh-*/を.oh-my-zsh/以下にシンボリックリンク
ln -s ${PWD}/oh-my-zsh_custom/*.zsh "${HOME}/dotfiles/.oh-my-zsh/custom/" 2> /dev/null
ln -s ${PWD}/oh-my-zsh_custom/*.zsh-theme "${HOME}/dotfiles/.oh-my-zsh/custom/" 2> /dev/null
# リンク切れのシンボリックリンクを削除
find -L "${HOME}"/dotfiles/.oh-my-zsh/custom -type l -exec unlink {} \;
[[ -f com.googlecode.iterm2.plist && ! -L com.googlecode.iterm2.plist ]] || mv -f com.googlecode.iterm2.plist{,.$(uname -n)}
[[ -f com.googlecode.iterm2.plist ]] || ln com.googlecode.iterm2.plist{.$(uname -n),}
