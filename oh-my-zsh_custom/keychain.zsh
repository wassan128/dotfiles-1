eval $(ssh-agent) > /dev/null

function cleanup {
    echo "Killing SSH-Agent"
    kill -9 $SSH_AGENT_PID
}

trap cleanup EXIT
