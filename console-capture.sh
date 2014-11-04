#!/bin/sh
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
_DATE=`date '+%Y%m%d%H%M%S'`

tmux capture-pane -S -7000
tmux show-buffer > /tmp/console-${_DATE}.log
cat /tmp/console-${_DATE}.log | nkf -wLux | grep -P '❯ |\[.+?\][#$] ' | /usr/local/bin/sed -e '/```/d' -e '1i\```' -e '$a\```' | pbcopy
tmux display-message "capture logged to /tmp/console-${_DATE}.log"
