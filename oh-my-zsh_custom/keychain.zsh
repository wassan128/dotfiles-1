# eval $(ssh-agent) > /dev/null
# 
# function cleanup {
#     echo "Killing SSH-Agent"
#     kill -9 $SSH_AGENT_PID
# }
# 
# trap cleanup EXIT
keychain --nogui -q $HOME/.ssh/{id_rsa,id_production_all,id_stg_all}(N)
. $HOME/.keychain/$HOST-sh
