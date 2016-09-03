# eval $(ssh-agent) > /dev/null
# 
# function cleanup {
#     echo "Killing SSH-Agent"
#     kill -9 $SSH_AGENT_PID
# }
# 
# trap cleanup EXIT
# keychain --nogui -q $HOME/.ssh/{id_production_all,id_stg_all,id_rsa}(N) 2> /dev/null
# . $HOME/.keychain/$HOST-sh
