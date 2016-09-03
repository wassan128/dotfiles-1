export PATH="$HOME/.anyenv/bin:$PATH"
# phpenv
export PHP_BUILD_CONFIGURE_OPTS="--with-openssl=/usr/local/opt/openssl --with-libxml-dir=/usr/local/opt/libxml2"
export PHP_BUILD_EXTRA_MAKE_ARGUMENTS=-j4

# eval "$(anyenv init - --no-rehash)"
# eval "$(pyenv virtualenv-init - --no-rehash)" 2> /dev/null
source "$HOME/.anyenv/libexec/../completions/anyenv.zsh"
anyenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi
  command anyenv "$command" "$@"
}
export CRENV_ROOT="$HOME/.anyenv/envs/crenv"
export PATH="$HOME/.anyenv/envs/crenv/bin:$PATH"
export PATH="$HOME/.anyenv/envs/crenv/shims:${PATH}"
export CRENV_SHELL=zsh
source "$HOME/.anyenv/envs/crenv/libexec/../completions/crenv.zsh"
crenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi
  case "$command" in
  rehash|shell)
    eval "`crenv "sh-$command" "$@"`";;
  *)
    command crenv "$command" "$@";;
  esac
}
export EXENV_ROOT="$HOME/.anyenv/envs/exenv"
export PATH="$HOME/.anyenv/envs/exenv/bin:$PATH"
export PATH="$HOME/.anyenv/envs/exenv/shims:${PATH}"
source "$HOME/.anyenv/envs/exenv/libexec/../completions/exenv.zsh"
exenv() {
  local command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  shell)
    eval `exenv "sh-$command" "$@"`;;
  *)
    command exenv "$command" "$@";;
  esac
}
export GOENV_ROOT="$HOME/.anyenv/envs/goenv"
export PATH="$HOME/.anyenv/envs/goenv/bin:$PATH"
export JENV_ROOT="$HOME/.anyenv/envs/jenv"
export PATH="$HOME/.anyenv/envs/jenv/bin:$PATH"
export PATH="$HOME/.anyenv/envs/jenv/shims:${PATH}"
source "$HOME/.anyenv/envs/jenv/libexec/../completions/jenv.zsh"
export JENV_LOADED=1
unset JAVA_HOME
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}
export NDENV_ROOT="$HOME/.anyenv/envs/ndenv"
export PATH="$HOME/.anyenv/envs/ndenv/bin:$PATH"
source "$HOME/.anyenv/envs/ndenv/libexec/../completions/ndenv.zsh"
ndenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "`ndenv "sh-$command" "$@"`";;
  *)
    command ndenv "$command" "$@";;
  esac
}
export PHPENV_ROOT="$HOME/.anyenv/envs/phpenv"
export PATH="$HOME/.anyenv/envs/phpenv/bin:$PATH"
export PHPENV_SHELL=zsh
phpenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "`phpenv "sh-$command" "$@"`";;
  *)
    command phpenv "$command" "$@";;
  esac
}
export PLENV_ROOT="$HOME/.anyenv/envs/plenv"
export PATH="$HOME/.anyenv/envs/plenv/bin:$PATH"
export PATH="$HOME/.anyenv/envs/plenv/shims:${PATH}"
export PLENV_SHELL=zsh
source "$HOME/.anyenv/envs/plenv/libexec/../completions/plenv.zsh"

plenv() {
  local command

  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "`plenv "sh-$command" "$@"`";;
  *)
    command plenv "$command" "$@";;
  esac
}
export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
export PATH="$HOME/.anyenv/envs/pyenv/bin:$PATH"
export PATH="$HOME/.anyenv/envs/pyenv/shims:${PATH}"
export PYENV_SHELL=zsh
source "$HOME/.anyenv/envs/pyenv/libexec/../completions/pyenv.zsh"
pyenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  activate|deactivate|rehash|shell|virtualenvwrapper|virtualenvwrapper_lazy)
    eval "$(pyenv "sh-$command" "$@")";;
  *)
    command pyenv "$command" "$@";;
  esac
}
export RBENV_ROOT="$HOME/.anyenv/envs/rbenv"
export PATH="$HOME/.anyenv/envs/rbenv/bin:$PATH"
export PATH="$HOME/.anyenv/envs/rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
source "$HOME/.anyenv/envs/rbenv/libexec/../completions/rbenv.zsh"
rbenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}
export SCALAENV_ROOT="$HOME/.anyenv/envs/scalaenv"
export PATH="$HOME/.anyenv/envs/scalaenv/bin:$PATH"
export SCALAENV_SHELL=zsh
source "$HOME/.anyenv/envs/scalaenv/libexec/../completions/scalaenv.zsh"
 scalaenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
    rehash|shell)
      eval "`scalaenv "sh-$command" "$@"`";;
    * )
      command scalaenv "$command" "$@";;
  esac
}

export PATH="$HOME/.anyenv/envs/pyenv/plugins/pyenv-virtualenv/shims:${PATH}";
export PYENV_VIRTUALENV_INIT=1;
_pyenv_virtualenv_hook() {
  local ret=$?
  if [ -n "$VIRTUAL_ENV" ]; then
    eval "$(pyenv sh-activate --quiet || pyenv sh-deactivate --quiet || true)" || true
  else
    eval "$(pyenv sh-activate --quiet || true)" || true
  fi
  return $ret
};
