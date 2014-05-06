# https://github.com/korin/dotfiles/blob/master/.oh-my-zsh-custom/aliases.zsh
#Aliases for improved directory listings
#The --color=tty option shows items in different colors according to their type.
#For example, directories are blue, executable files are green, symlinks are cyan, etc.
#The -F option appends a symbol after entries to indicate their types.
#You might not like both options at the same time.
alias ls=' ls -F --color=tty' #regular ls
alias l.=' ls -dF .[a-zA-Z0-9]* --color=tty' #only show dotfiles
alias ll=' ls -lhF --color=tty' #long listing
alias lsa=' ls -lah'
alias la=' ls -A'
alias l=' ls -CF'
alias sl=' ls' # often screw this up
