#!/bin/sh

brew update
brew upgrade

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions
brew tap homebrew/binary
brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/versions
brew tap komagata/mycask
brew tap motemen/ghq
brew tap peco/peco
brew tap sanemat/font

brew install ansible
brew install bash
brew install bats
brew install cocot
brew install coreutils
brew install docker
brew install emacs --japanese --srgb --cocoa
brew install expect --enable-threads
brew install ffmpeg
brew install gh
brew install ghq
brew install gibo
brew install gnu-sed --default-names
brew install grep --default-names
brew install git
brew install git-flow
brew install go
brew install grep
brew install ievms
brew install imagemagick
brew install jq
brew install keychain
brew install lame
brew install less
brew install lv
brew install macvim --with-lua --with-luajit --with-python3 --override-system-vim
brew install ngrok
brew install nkf
brew install nmap
brew install nodebrew
brew install openssh --with-keychain-support --with-ldns
brew install openssl
brew install packer
brew install panamax
brew install parallel
brew install peco
brew install phpenv
brew install python
brew install python3
brew install rbenv
brew install reattach-to-user-namespace
brew install rename
brew install rmtrash
brew install rsync
brew install ruby-build
brew install scala
brew install ssh-copy-id
brew install sysbench
brew install the_silver_searcher
brew install tig
brew install tmux
brew install tree
brew install wget
brew install wine
brew install winetricks
brew install x264
brew install xclip
brew install zsh
brew install zsh-completions
brew install zsh-history-substring-search
brew install zsh-syntax-highlighting
brew install http://download.panamax.io/installer/brew/panamax.rb

brew install brew-cask

brew cask install xquartz
brew install ricty --patch-in-place --powerline --vim-powerline

brew cask install alfred
brew cask install bettertouchtool
brew cask install clipmenu
brew cask install cyberduck
brew cask install diffmerge
brew cask install dropbox
brew cask install filezilla
brew cask install firefox
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install google-chrome-dev
brew cask install google-japanese-ime
brew cask install hipchat
brew cask install hyperswitch
brew cask install intellij-idea-ultimate-eap
brew cask install iterm2-nightly
brew cask install java
brew cask install keyremap4macbook
brew cask install kobito
brew cask install mi
brew cask install mosh
brew cask install mou
brew cask install mysqlworkbench
brew cask install onyx
brew cask install owncloud
brew cask install pandoc
brew cask install phpstorm-eap
brew cask install sequel-pro
brew cask install serf
brew cask install skype
brew cask install sourcetree
brew cask install sublime-text3
brew cask install the-unarchiver
brew cask install vagrant
brew cask install virtualbox
brew cask install xtrafinder

brew cleanup
