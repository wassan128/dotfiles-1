#!/bin/sh
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
_DATE=`date '+%Y%m%d%H%M%S'`

tmux capture-pane -S -7000
tmux show-buffer > /tmp/console-${_DATE}.log
cat /tmp/console-${_DATE}.log | grep -P '❯ |\[.+?\][#$] ' | pbcopy
tmux display-message "capture logged to /tmp/console-${_DATE}.log"
